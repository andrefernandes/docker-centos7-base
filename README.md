docker-centos7-base
===================

Base CentOS 7 image with a few perks. This is based on
the official CentOS 7 base image.

Building this results in an updated CentOS image with
a few extra packages:

* net-tools
* tar
* wget
* unzip
* EPEL repo
* pwgen (from EPEL)

### What is it for?

Most images we find at the public Docker Hub are Ubuntu-based.
Nothing against Ubuntu, but Redhat customers fell more at home
with CentOS.

A work is in progress to convert, migrate and adapt some useful
images around to CentOS-based distributions. The list below
will be updated accordingly.

* andrefernandes/docker-java7
* andrefernandes/docker-tomcat7
* andrefernandes/docker-mysql
* andrefernandes/docker-redis
* andrefernandes/docker-node

### But I need RHEL images!

Please note that nearly all images under my repository are derived from this one,
so it would be very easy to simply change the FROM clause in its own
Dockerfile in order to use the RHEL 7 official base image. Rebuilding
the derived images would be a piece of cake.

The RHEL 7 official base image can be downloaded from Redhat and
installed with "docker load" and tagged with whatever name you like.

As far as I know, RHEL 7 containers are covered by its RHEL 7 hosts'
license. Yum updating should work the same way it works on the host,
but I have not been able to play with RHEL 7 yet (blame my SysAdmins).

### Useful scripts

* **build.sh** : builds the image locally (docker build)
* **runbash.sh** : convenient way to run commands on a new
container (fast-food, auto-destroy) or even to just
open a bash shell to play.

#### Some nice tests:

Show CentOS version:

    ./runbash.sh cat /etc/redhat=release
    CentOS Linux release 7.0.1406 (Core)

Show files (ls):

    ./runbash.sh ls -l /opt/
    total 0 

### Using a local mirror (OPTIONAL)

If you plan to build a lot of images locally it may be a good idea
to setup a local mirror of a CentOS yum repository (by "local" I mean
somewhere in your LAN).
This is not a complicated task, but it takes some disk space and bandwidth (at least
on the first rsync).

Take your time, have some patience until you get the proper rsync
command that works with the mirror you are rsyncing from (make sure you
are syncing only x86_64 packages, for example). After syncing you'll
also want to serve these folders with a plain Apache - the URLs that
point to your local mirror are the ones you will put into the custom
repo file included in this project.

There is a line to uncomment at the Dockerfile that replaces the
standard repo file for the custom one that should be edited in order
to point to your local mirror.

So, in short: (1) pick an Apache server somewhere in your LAN,
(2) sync from another CentOS mirror (rsync or any equivalent
tool), (3) set a virtual path in your Apache in order to serve
these files, (4) edit the repo file properly, (5) uncomment
the proper lines in Dockerfile, (6) rebuild image.


