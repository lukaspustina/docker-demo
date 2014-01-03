LOGDIR=logs
NUM_OF_SERVERS=100

all:
	@echo "make build -- build docker images"
	@echo "make run -- run container"
	@echo "make demo -- execute demo"

$(LOGDIR):
	@mkdir -p $@

build:
	@docker build -no-cache -rm -t docker-demo/python python
	@docker build -no-cache -rm -t docker-demo/webserver webserver 
	@docker images

run: $(LOGDIR)
	@echo "+++ Starting containers +++"
	@for i in `seq 1 $(NUM_OF_SERVERS)`; do \
		docker run -d -cidfile=$</webserver-$$i.cid -name webserver-$$i -v `pwd`/$<:/logs docker-demo/webserver:latest /opt/webserver/run.sh /logs ; \
	done
	@echo "+++ Running containers +++"
	@docker ps
	@sleep 1

demo:
	@echo "+++ Starting demo +++"
	@for i in `docker ps -q | xargs docker inspect | grep IPAddress | cut -d '"' -f 4`; do \
		/bin/echo -e 'GET /\n\n' | nc $$i 8080; \
	 done	


stop: $(LOGDIR)
	-@docker ps -q | xargs docker kill > /dev/null
	-@docker ps -a -q | xargs docker rm > /dev/null
	-@rm $</*.cid

clean: clean-logs clean-images

clean-logs:
	-@rm -rf $(LOGDIR)

clean-images:
	-@docker images -q | xargs docker rmi

