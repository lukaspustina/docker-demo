# Docker Demo #

This demo gives a brief introduction into [Docker][docker]. Please see my [blog post][cc-blog] for details. The demo starts 10 Python web servers as individual containers and then connects to each of them querying the index page. These containers are completely isolated from each other and run, like virtual machines, with their own file systems and IP address.

The demo is controlled by a `Makefile`. Please have a look at this `Makefile` to see the different Docker commands used. Also have a look at the `Dockerfile`s used to build the Docker images in `python/Dockerfile` and `webserver/Dockerfile`.

Have fun with lightweight virtual machines made simple with Docker and
 feel free to contact me.

## Prerequisites ##

Docker builds upon [Linux Containers][lxc] (LXC) and thus, only runs on Linux. In order to allow you to also play with Docker on non-Linux machines, there are two ways to run this demo, i.e., inside a [Vagrant Box][vagrant] or directly on Linux. Please see the respective subsections below.

### Vagrant Box ###

If you decide to run the demo inside a Vagrant box, please install Vagrant accordingly. The supplied Vagrantfile requires Vagrant version 1.4.0 or higher, because starting from that version Docker can be automatically installed. Once Vagrant is installed, just run
> `vagrant up; vagrant ssh`   
> `cd /vagrant`

in the root directory. Then follow the same instructions as for native Linux.

### Native Linux  ###

If you decide to run the demo on a native Linux, please install Docker according to your distribution. There are How-Tos for many different distributions in the Docker [documentation][docker-install-doc].

## Running the Demo ##

### 1. Build Images ###

In the first step, two Docker images are build. First, starting from an Ubuntu base image, Python is added. From this Python image, a python script comprising a simple web server is added to build the web server images. 
> `make build`

### 2. Starting containers ###

In the second step, a number of LXC containers is started; by default 10.
> `make run`

You can overwrite the number of server containers to start:
> `NUM_OF_SERVERS=20 make -e run`

### 3. Running Demo ###

In order to run the demo, querying the web server containers, run
> `make demo`

For each container you will get an output similar to this example, where three containers are queried from your host.
> Hello 172.17.42.1, I am 172.17.0.54.  
> Hello 172.17.42.1, I am 172.17.0.53.  
> Hello 172.17.42.1, I am 172.17.0.52. 

After running the demo once, log files from each conainter will be
stored in the directory `logs` where you can see, that each container
was accessed. The logs are generated from inside the containers, using
their individual IP address as log file name.

You can re-run the demo multiple times.

#### Show Running Containers ####

If you want to see the number of running containers, run
> `docker ps`  

### 4. Stopping containers ###

In order to stop all running containers, run 
> `make stop`

and to clean up run
> `make clean`

[docker]: http://docker.io
[cc-blog]: http://www.codecentric.de
[lxc]: http://linuxcontainers.org/
[vagrant]: http://www.vagrantup.com
[docker-install-doc]: http://docs.docker.io/en/latest/installation/

