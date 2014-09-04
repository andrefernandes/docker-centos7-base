# Base CentOS 7 with a few perks
# Includes epel repo

FROM centos:centos7

MAINTAINER Andre Fernandes

# You can edit the repo file and uncomment the lines below
# in order to use a local CentOS-Base mirror (if you have one).
# This is HIGHLY recommended if you plan to build
# images locally.

# ADD CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo

# Disabling the fastest mirror plugin is also a good
# idea if you have a local mirror.

# RUN sed -i 's/enabled=1/enabled=0/' /etc/yum/pluginconf.d/fastestmirror.conf

RUN yum update -y && yum install net-tools tar wget unzip -y && yum clean all && \
    wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-1.noarch.rpm -q && \
    yum localinstall epel-release-7-1.noarch.rpm -y && \
    rm epel-release-7-1.noarch.rpm && \
    yum update -y && yum clean all

RUN yum -y install pwgen && yum clean all

