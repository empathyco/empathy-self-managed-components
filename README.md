# Empathy Self Managed Components
On this repo we host the kit to deploy Empathy Platform components in any machine.

## How to deploy
On this section, we will write the instructions to execute this kit.

### Prerequisites
In order to run this kit, you need to have intalled the following technogies:
* [Docker](https://www.docker.com/) (It can be [Docker Desktop](https://www.docker.com/products/docker-desktop/))
* [Docker compose](https://docs.docker.com/compose/install/)
* Access to the search-service docker image

#### How to access the search-service docker image

If you don't have access to the private empathy repositories, we can give you a token to access it! 

Once you have contacted us and we sent the token, you can use it as a password for a user called **smcempathy** and you will be able to download all resources.

### How to run
Once you have the necessary stack you can execute everything with just one command:

    ```shell

    docker-compose up -d

    ```

Make sure you have root permises.

Once everything is up and ready (you can see it executing `docker ps` or seeing the status of containers in the Docker Desktop GUI). You can perform a search request like [http://localhost:8080/query/imdb/search?query=wonderland&lang=en](http://localhost:8080/query/imdb/search?query=wonderland&lang=en)

Our use the frontend on [http://localhost:8081](http://localhost:8081)

### What is happening?
Once you execute the containers, a search and elastic containers will initiate, but also an indexing job to insert the necessary collections into your elasticsearch, so wait until it is finished (takes 2-3 minutes) and you will be able to start searching using a small version of the IMDB public catalog.
