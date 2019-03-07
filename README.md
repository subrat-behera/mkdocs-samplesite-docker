# mkdocs-samplesite-docker

## Overview
- This repository contains the setup required to produce a mkdocs project and also to run any existing mkdocs project.
  
## Pre-requisite
- Docker daemon running in the host machine
- Since the wrapper script is written in shell, This setup only supports Linux/Mac environments.

## Steps to bring up the application
1) Clone the master branch of the repository.
   ```    
      git clone https://github.com/suhasbagade/mkdocs-samplesite-docker.git
   ```
2) Navigate to the docker directory and build the Dockerfile. 
   ```
      cd docker
      docker build . -t mkdocs-samplesite-docker
   ```
    This builds an image by name "mkdocs-samplesite-docker" in the host machine.
    
3) Run the wrapper.sh file present in the root directory of this project.
   ```
   case # 1)  ./wrapper.sh -p <Absolute path of the directory containing yml config file of mkdocs project> -a <produce>
   ```
    Wrapper script will spin up a docker container and read the contents of the mkdocs project to produces a tar.gz archive of it in the same location
 
   ```
   case # 2)  ./wrapper.sh -p <Absolute path of the tar.gz archive file of a mkdocs project> -a <produce>                                      
   ```
    Wrapper script will spin up a docker container and serves the mkdocs project from within the container.
    Please find the mkdocs site at http://localhost:8000
  
