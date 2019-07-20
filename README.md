# Setup Instructions

## Set up an Azure Kubernetes Service

In [Azure](https://azure.microsoft.com/en-gb/) log in, navigate to the **portal** and open up a new **cloud shell** instance. 

Create a new **resource group** named **LAFB**:

`az group create --name LAFB`

Create a new **Azure Kubernetes Service (AKS)** named **LAFB-AKS** with two nodes:

`az aks create --name LAFB-AKS -g LAFB--node-count 2`

Enable Kubernetes commands via **get-credentials**:

`az aks get-credentials --name LAFB-AKS-g LAFB`

## Clone this repository

In the cloud shell:

`git clone https://github.com/biomiller/LAFB.git`

Change directory into LAFB:

`cd LAFB`

## Start Kubernetes services

Change permisions on kubernetes.sh:

`chmod 710 ./scripts/kubernetes.sh`

Run kubernetes.sh:

`./scripts/kubernetes.sh`

Check all services are running (this may take a few minutes):

`kubectl get services`

Check all pods are running (this may take a few minutes):

`kubectl get pods`

## Find your website public IP

Find the public IP:

`kubectl get services | grep nginx | tr -s [:space:] | cut -d " " -f4`

Open up a web browser (eg Chrome), enter your copied public IP address into the address bar.

## Configure Jenkins

Shell into the Jenkins pod:

`kubectl exec -it jenkins bash`

