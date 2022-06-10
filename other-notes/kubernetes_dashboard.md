Docker Desktop's Kubernetes Dashboard

This note is for students using Docker Desktop's built-in Kubernetes. If you are using Minikube, the setup here does not apply to you and can be skipped.

If you are using Docker Desktop's built-in Kubernetes, setting up the admin dashboard is going to take a little more work.  

**1\. Grab the most current script from the install instructions:  
**[https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/#deploying-the-dashboard-ui](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/#deploying-the-dashboard-ui)  
eg:  
As of today, the kubectl apply command looks like this:  
`kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.5.0/aio/deploy/recommended.yaml`

**2\. Create a dash-admin-user.yaml file and paste the following:**

1.  apiVersion: v1
2.  kind: ServiceAccount
3.  metadata:
4.    name: admin\-user
5.    namespace: kubernetes\-dashboard

**3\. Apply the dash-admin-user configuration:**  
`kubectl apply -f dash-admin-user.yaml`

**4\. Create dash-clusterrole-yaml file and paste the following:**

1.  apiVersion: rbac.authorization.k8s.io/v1
2.  kind: ClusterRoleBinding
3.  metadata:
4.    name: admin\-user
5.  roleRef:
6.    apiGroup: rbac.authorization.k8s.io
7.    kind: ClusterRole
8.    name: cluster\-admin
9.  subjects:
10.    \- kind: ServiceAccount
11.      name: admin\-user
12.      namespace: kubernetes\-dashboard

**5\. Apply the ClusterRole configuration:  
**`kubectl apply -f dash-clusterrole.yaml`

**6\. In the terminal, run** `**kubectl proxy**`

**7\. Visit the following URL in your browser to access your Dashboard:**  
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

**8\. Obtain the token for this user by running the following in your terminal:**

First, run `kubectl version` in your terminal.

If your Kubernetes server version is v1.24 or higher you must run the following command:

`kubectl -n kubernetes-dashboard create token admin-user`

If your Kubernetes server version is older than v1.24 you must run the following command:  
`kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"`

**9\. Copy the token from the above output and use it to log in at the dashboard.**  
Be careful not to copy any extra spaces or output such as the trailing **%** you may see in your terminal.

**10\. After a successful login, you should now be redirected to the Kubernetes Dashboard.**

The above steps can be found in the official documentation:

[https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md)