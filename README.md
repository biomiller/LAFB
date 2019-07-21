# Setup Instructions

## Clone this repository

In [Azure](https://azure.microsoft.com/en-gb/) log in, navigate to the **portal** and open up a new **cloud shell** instance.

Download this repository:

`git clone https://github.com/biomiller/LAFB.git`

Change directory into LAFB:

`cd LAFB`

## Set up an Azure Kubernetes Service

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

## Set up a freestyle job in Jenkins
Access Jenkins through the websites public IP that you acquired in a previous section: 

`Public_IP/jenkins/`

To get started you will need to find the **administrative password** to get into Jenkins: 

`kubectl exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword`

![admin_password](https://github.com/biomiller/LAFB/blob/readme/readme_images/admin_password.png)

Once you enter the password, follow the prompts to install all necessary plugins for Jenkins (this may take a few minutes).
After this you may choose to create a login account or continue as an administrator, for this tutorial we shall continue as an administrator with the following **login credentials**:

`Username: admin`
`Password: admin`

As the Jenkins home page loads, you will be prompted to create a new job, for this, we shall be going with a **freestyle job**, upon creating the job you shall be moved into the configuration page.

Inside this, there are several features that we would like to change, the first of which is the **source code management**.

For this example we are using a git repository selecting the git option you will be prompted to enter a git URL and specify which branch to look as shown in the image below

![source code management](https://github.com/biomiller/LAFB/blob/readme/readme_images/scm.png)

Enter the git URL for this repository as shown. When **specifying branches**, the master branch is added by default, however, this can be replaced with another branch that you are working on or other branches that you are developing on.

Next, we want to tell Jenkins what to do when building the application, therefore we want to specify how we are going to build the job with a list of shell commands.

![freestyle build steps](https://github.com/biomiller/LAFB/blob/readme/readme_images/build-step.png)

Select the option as in the image above and insert the build commands for the containerisation project you wish to deploy. Scripts for [docker-compose](https://github.com/biomiller/LAFB/blob/master/scripts/compose.sh), [docker swarm](https://github.com/biomiller/LAFB/blob/master/scripts/swarm.sh) and [Kuberntes](https://github.com/biomiller/LAFB/blob/master/scripts/kubernetes.sh) can be found in the links. 

Apply and save your changes to the configuration and now your job is ready to build. When you are returned to the home page for your job select the build now option and wait while your job builds (Note first-time builds will take significantly longer due download times compared than future builds).

**Congratulations** you have now built your first Jenkins job.

## Creating a Webhook for the Jenkins job

While Jenkins solves a lot of automation problems for developers, going into Jenkins and manually triggering a build takes just as much time as running a script locally every time a change is committed.

To automate this feature, even more, we can create something called a webhook, which will set up a way for your GitHub repository to talk to Jenkins and tell it when a change has been made on the branches specified in the previous step. When a change is notified Jenkins will begin to build the deployment with no prompting from the user.

To set up the webhook go back into the configuration for your job and go down to build triggers as shown below

![Webhook](https://github.com/biomiller/LAFB/blob/readme/readme_images/token.png)

Take note of the URL trigger under the input box:

`JENKINS_URL/job/ne/build?token=TOKEN_NAME`

This is the format in which you shall set up the webhook inside your git repository, where TOKEN_NAME is what you insert into the input box in the image above, qwerty for this example. The Jenkins URL has the form: 

`http://[username]:[password]@Vm_ip_address:8080/job/etc…`

Where the username and passwords are those for the current user, admin:admin as previously stated.
Before leaving Jenkins we would to change its security so that communication with the webhook can be allowed by following this path from the Jenkins home page: 

`Manage Jenkins > Configure Global security > disable CSRF protection`

Now, inside your git repository go into secutiry-webhooks to setup the webhook and insert the webhook as discussed into the input box. For this example and a build job with the name newJob the url would have the form: 

 `http://admin:admin@Vm_ip_address:8080/job/newJob/build?token=qwerty`

Now save this url and at the bottom of the page you will be able to deploy this webhook. Now head back over to Jenkins and if you have followed these steps the application should be building.


## Set up a pipeline job in Jenkins

While a **freestyle job** is good, a **pipeline job** is leaps and bounds better for automation of deployment. Inside a freestyle job should you wish to change something inside the building stage, you would need to go into Jenkins, configure the job, edit the build steps and then trigger a build. 

With a pipeline job, however, we create a document called a **Jenkinsfile** which contains the same commands as with the freestyle job however there is much more freedom assigned with this method. The most prominent of which is that the file exists in the **root directory** of the git repository so and changes made to it will trigger the build in Jenkins. 

Setting up a pipeline job is similar to the freestyle job except instead of build option we have an option called pipeline. In this we simply point to the git repositoy and branch where the Jenkinsfile is located for the build to run.

![pipeline](https://github.com/biomiller/LAFB/blob/readme/readme_images/pipeline.png)

This will point to the [Jenkinsfile](https://github.com/biomiller/LAFB/blob/master/Jenkinsfile) in this repository to trigger the build. With this, the pipeline job is fully setup and the **application is fully ready to be deployed**.

## Version switching

It is possible to switch between different implementations of the text generator, number generator and prize generator services by changing certain lines in the [Jenkinsfile](https://github.com/biomiller/LAFB/blob/master/Jenkinsfile).

For example, by commenting out (by adding `//` to the start of the line) **line 126** and uncommenting (deleting the `//` at the start of the line) **line 127** the **prize generator** app will switch from issuing a *small reward* to issuing a *big reward*.

## Scale a deployment

Scale up or down a deployment by specifying the number of replicas:

`kubectl scale --replicas=3 deployment/server`

`kubectl scale --replicas=2 deployment/number-generator`
`kubectl scale --replicas=1 deployment/number-generator`

Confirm a scale command has worked by viewing the active pods:

`kubectl get pods`
