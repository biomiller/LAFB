# Setup Instructions

## Clone this repository to your new VM 

In the cloud shell:

`git clone https://github.com/biomiller/LAFB.git`

Change directory into LAFB:

`cd LAFB`

## Set up an Azure Kubernetes Service

In [Azure](https://azure.microsoft.com/en-gb/) log in, navigate to the **portal** and open up a new **cloud shell** instance. 

Create a new **resource group** named **LAFB**:

`az group create --name LAFB`

Create a new **Azure Kubernetes Service (AKS)** named **LAFB-AKS** with two nodes:

`az aks create --name LAFB-AKS -g LAFB --node-count 2`

Enable Kubernetes commands via **get-credentials**:

`az aks get-credentials --name LAFB-AKS -g LAFB`

Clone this repository down to the Azure shell with the above commands

## Start Kubernetes services

Change permissions on kubernetes.sh:

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

Open up a web browser (eg Chrome), copy the public IP address into the address bar.

## Configure Jenkins

Shell into the Jenkins pod:

`kubectl exec -it jenkins bash`

Log in to Docker (set up an account on [Docker Hub](https://hub.docker.com/) if not done so):

`sudo docker login`

**_All references to docker images in the yaml files will need to be changed to your dockerhub username._**

Add Jenkins to the Docker group:

`sudo usermod -aG docker jenkins`

Exit the Jenkins pod and return to the cloud shell:

`exit`

Restart the Jenkins container:

`docker restart jenkins`

## Set up a freestyle job in Jenkins
Access Jenkins through the websites public IP that you acquired in a previous section: 

`Public_IP/jenkins/`

To get started you will need to find the **administrative password** to get into Jenkins: 

`kubectl exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword`

Once you enter the password, follow the prompts to install all necessary plugins for Jenkins (this may take a few minutes).
After this you may choose to create a login account or continue as an administrator, for this tutorial we shall continue as an administrator with the following **login credentials**:
`Username: admin`
`Password: admin`

As the Jenkins home page loads, you will be prompted to create a new job, for this, we shall be going with a **freestyle job**, upon creating the job you shall be moved into the configuration page.
Inside this, there are several features that we would like to change, the first of which is the **source code management**.
For this example we are using a git repository selecting the git option you will be prompted to enter a git URL and specify which branch to look as shown in the image below

---------INSERT IMAGE--------

Enter the git URL for this repository as shown. When **specifying branches**, the master branch is added by default, however, this can be replaced with another branch that you are working on or other branches that you are developing on. 
Next, we want to tell Jenkins what to do when building the application, therefore we want to specify how we are going to build the job with a list of shell commands.

---------INSERT IMAGE--------

Select the option as in the image above and insert the build commands for the containerisation project you wish to deploy. Scripts for [docker-compose](https://github.com/biomiller/LAFB/blob/master/scripts/compose.sh), [docker swarm](https://github.com/biomiller/LAFB/blob/master/scripts/swarm.sh) and [Kuberntes](https://github.com/biomiller/LAFB/blob/master/scripts/kubernetes.sh) can be found in the links. 

Apply and save your changes to the configuration and now your job is ready to build. When you are returned to the home page for your job select the build now option and wait while your job builds (Note first-time builds will take significantly longer due download times compared than future builds).
**Congratulations** you have now built your first Jenkins job.

## Creating a Webhook for the Jenkins job

## Set up a pipeline job in Jenkins
