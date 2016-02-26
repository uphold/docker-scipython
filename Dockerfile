######################################################
# Dockerfile for scientific python projects
# Based on Debian
######################################################

# Set the base image to Debian
FROM python:3.5-slim

RUN apt-get update
RUN apt-get install -y gcc g++ libc6-dev --no-install-recommends
RUN apt-get install -y libhdf5-dev --no-install-recommends --fix-missing

ENV LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/hdf5/serial
ENV HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/serial

COPY requirements.txt /

RUN pip3 install -r requirements.txt
