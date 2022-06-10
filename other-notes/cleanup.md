
# Local Environment Cleanup

You might want to also clean up some of the work you did on your local machine. Remember, we have a running Kubernetes cluster, and we have also built a ton of images.

**Deleting Pods, Deployments, Services from the Multi K8's project**

In the root project directory, run `kubectl delete -f k8s/`

**Stopping Minikube**

To stop Minikube, and the VM that it runs, run `minikube stop` .  You can bring your local cluster back online at any time by running `minikube start`

To fully delete the cluster, run `minikube delete`

**Stopping Running Containers**

You might still have some containers running on your machine.  Try a `docker ps` .  You can then run `docker stop <container_id>` to clean up any running containers

**Clearing the Build Cache**

All the images that we built and ran during the course are cached on your local machine - they might be taking up to around 1GB of space.  You can clean these up by running `docker system prune`
