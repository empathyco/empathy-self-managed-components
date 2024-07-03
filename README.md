# Empathy Self-managed Components
Welcome to the Empathy Platform Self-managed Components (SmC) repository! 

SmC is a set of the Empathy Platform's essential capabilities, features, and tools to get developers started with search and discovery experiences.

## How to deploy

> **Requirements**  
> Before you start, check you have installed/access the following:
> * [Docker](https://www.docker.com/) or [Docker Desktop](https://www.docker.com/products/docker-desktop/)
> * [Docker compose](https://docs.docker.com/compose/install/)
> * `search-service` docker image access

> **Access permissions**  
> To download the necessary resources to run the SmC package, you need access to the Empathy private repositories. Contact Empathy Platform [**First Line Support**](https://searchbroker.atlassian.net/servicedesk/customer/portal/1) or your Empathy representative to request your **access token**.  
> Use the **token provided as a password** for the `smcempathy` user to download all resources.

To deploy the SmC package on any machine, just **download** or **clone** the SmC repository to your local machine.

## How to run

> **Access permissions**  
> Make sure you have root permissions to run the SmC package. Otherwise, contact Empathy Platform [**First Line Support**](https://searchbroker.atlassian.net/servicedesk/customer/portal/1) or your **Empathy representative**.

Once you have the necessary stack, you execute the package from the root folder with the following command: `docker-compose up -d`. 

Check that everything is up and running by executing `docker ps` or checking the containers' status in the Docker Desktop GUI. 

When you execute the containers, a search and Elasticsearch containers start. Also, an indexing job starts to add the necessary collections to your Elasticsearch. Wait until all processes are completed (it takes 2-3 minutes) to start searching using the IMDB public catalogue lite version provided.

Now, you're ready to go and play with SmC! You can perform a search request like [http://localhost:8080/query/imdb/search?query=wonderland&lang=en](http://localhost:8080/query/imdb/search?query=wonderland&lang=en) or use the UI on [http://localhost:8081](http://localhost:8081)

### SmC ecosystem
The SmC package includes the following:
* An open-source sample catalogue with its corresponding indexing job
* A Docker image for Elasticsearch
* A Docker image of the Empathy Platform's Search service
* A UI built with Empathy Platform's open-source [Interface X archetype](https://github.com/empathyco/x-archetype).  

> Get to know more on the SmC archietcture on [Unveil the Self-managed Components ecosystem](https://docs.empathy.co/develop-empathy-platform/self-managed-components/smc-architecture.html).

## SmC documentation

You can check the SmC documentation on [Empathy Platform Docs](https://docs.empathy.co) portal:

* To learn about the Self-managed Components and their capabilities, check [**SmC overview**](https://docs.empathy.co/understand-empathy-platform/about-empathy-platform/self-managed-components-overview.html) <!-- URL to be confirmed -->
* To get detailed tehcnical information, check [**Try the SmC package**](https://docs.empathy.co/develop-empathy-platform/self-managed-components) guides.

<!-- section especially handy when opening the project to collaborators

## Contributors

<a href="https://github.com/empathyco/empathy-self-managed-components/graphs/contributors">SmC contributors
</a>

<!--we can include the image of the contributors here -->
<!--we can include code of conduct and guidelines to contrubute when open the project to collaborators -->
