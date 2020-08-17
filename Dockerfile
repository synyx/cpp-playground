FROM ubuntu:bionic
RUN apt-get update --fix-missing
RUN apt-get install -y build-essential cmake curl unzip lcov