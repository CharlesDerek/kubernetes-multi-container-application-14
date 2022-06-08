
# Kubernetes Multi-container Application Development 14

![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)
![Redis](https://img.shields.io/badge/redis-%23DD0031.svg?style=for-the-badge&logo=redis&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![MongoDB](https://img.shields.io/badge/MongoDB-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white)
![Express.js](https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB)
![React](https://img.shields.io/badge/react-%2320232a.svg?style=for-the-badge&logo=react&logoColor=%2361DAFB)
![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white)


Kubernetes is a powerful tool for managing containerized applications at scale. In this guide, we will use Kubernetes to deploy a React application and a backend service.

We will start by creating a Kubernetes cluster using Minikube. Then, we will deploy our React application to the cluster. Finally, we will deploy a backend service to provide data to our React application.

With Kubernetes, we can easily scale our application to handle more traffic. We can also use Kubernetes to roll out updates to our application with zero downtime.

**Note: This guide assumes that you have a basic understanding of Kubernetes, Docker, Networking, and the MERN Stack and containerized applications. **

## Requirements:

1. Install Docker on your local machine. You can find instructions for doing this here: https://docs.docker.com/install/

2. Install minikube. You can find instructions for doing this here: https://kubernetes.io/docs/tasks/tools/install-minikube/

3. Build a docker image for your React Application.

4. Run the docker image you created in step 3 using minikube.

5. Access your React Application at http://localhost:3000

## Instructions:

I. Install Docker on your local machine:
    - Follow the instructions on the provided path
        ||
    - Run the installation.sh script (Linux only at the current moment)
        $ ```sudo chmod +x installer.sh; ./installer.sh;```
    
