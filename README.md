# Empathy Self Managed Components
On this repo we host the kit to deploy Empathy Platform components in any machine.

## How to deploy
On this section, we will write the instructions to execute this kit.

### Prerequisites
In order to run this kit, you need to have intalled the following technogies:
* [Docker](https://www.docker.com/) (It can be [Docker Desktop](https://www.docker.com/products/docker-desktop/))
* [Docker compose](https://docs.docker.com/compose/install/)

### How to run
Once you have the necessary stack you can execute everything with just one command:
    ```
    docker-compose up -d
    ```
Make sure you have root permises.

Once everything is up and ready (you can see it executing `docker ps` or seeing the status of containers in the Docker Desktop GUI). You can perform a search request like [http://localhost:8080/query/imdb/search?query=wonderland&lang=es](http://localhost:8080/query/imdb/search?query=wonderland&lang=es)

### What is happening?
Once you execute the containers, a search and elastic containers will initiate, but also an indexing job to insert the necessary collections into your elasticsearch, yo wait until it is finished and you will be able to start searching using a small version of the IMDB public catalog.