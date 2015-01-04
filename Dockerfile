FROM ubuntu:14.04
MAINTAINER Pascal de Vink <pascal.de.vink@gmail.com>

RUN apt-get update && apt-get install -y pound
