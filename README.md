# Empathy Self Managed Components
On this repo we host the kit to deploy Empathy Platform components in any machine.

## How to deploy
On this section, we will write the instructions to execute this kit.

### Prerequisites
In order to run this kit, you need to have intalled the following technogies:
* [Docker](https://www.docker.com/) (It can be [Docker Desktop](https://www.docker.com/products/docker-desktop/))
* [Docker compose](https://docs.docker.com/compose/install/)

### Steps
Once you have the necessary stack, follow these three steps:
1. Go to the root of project and execute:

    ```
    ./start.sh
    ```
    Make sure you have root permises.

2. Once everything is up and ready (you can see it executing `docker ps` or seeing the status of containers in the Docker Desktop GUI) performs a **GET** request to [http://localhost:8080/plugins/empathy/reload](http://localhost:8080/plugins/empathy/reload)
3. Your search is running. You can perform a search request like [http://localhost:8080/query/empathy/search?query=shirt&lang=en&store=Store5](http://localhost:8080/query/empathy/search?query=shirt&lang=en&store=Store5)