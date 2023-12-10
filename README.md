#### EJ Best: Submission of Docker and Kubernetes Project

<pre>
1. Create a docker image with the following 
    a. Has Node JS and NPM installed  
    b. Has telnet, ping, wget, and curl installed 
    c. Has java 1.8 installed 
    d. All binaries should be reachable through /usr/bin and in default $PATH 

2. Run node app for "Hello William Hill" in container ]
    a. Pull and edit the repo or create your own  node app 
    b. The node app should say "Hello William Hill! This is <EJ>" c. Expose node app over port 80 within the Docker image created in step 1 

3. Run three "Hello William Hill" containers using kubernetes manifest 
    a. Run 3 replicas via kubernetes manifest of the container created in step 2 

4. Return the following: 
    a. src for your "Hello William Hill" node app 
    b. Dockerfile that runs the node app  
    c. Kubernetes manifest for 3 replicas of previous container 
    d. Readme that tells me how to build and deploy my image and replicas, and how to view my expected output

5. EXTRA CREDIT and TIME PERMITTING: 
    SEE BELOW 


The exercise results must be submitted no more than 60 mins after receiving the exercise.

Missed the 60 min by a mile and only hope you see diligence in the submission 
</pre>

#### Commnands to run and test

**Base Requirements**
 <br>
-  Mac workstation or Linux workstation/server to commandline control the testing exercise.
-  AWS Command Line and Account and authenticated<br>
    https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html<br>
-  Terraform v0.14.4<br>
    https://www.terraform.io/downloads.html
-  Git Client<br>
    https://git-scm.com

**Steps** 
1. Go to a command line of your workstation
- script was tested on Linux and Mac
- create and go to a folder of your choice for the test
<pre>
    mkdir mytestfolder
    cd mytestfolder
</pre>
2. Clone the files from git
<pre>
    git clone git@github.com:ejbest/wtest.git
</pre>
3. Go to the folder that was just created
<pre>
    cd wtest
    cd application
</pre>
4. Change Directory to the Terraform Folder and run the following commands
<pre>
    cd terraform
    terraform init
    terraform plan
    terraform apply
    # check for output for success or error messages
</pre>
5. Go to the Applcation Folder - start apps
<pre>
    cd ..
    cd application
    bash start-k8-app.sh 
    # this will setup a namespace called wtestnamespace
    # there will be a loadbalancer setup and a set of containers
    # the number of containers will be set per the replicas setup in the configuration
    # check for output for success or error messages
</pre>
6. It will take time to sync with Kubernetes / EKS / Nginx, use the below command to check.
<pre>
    kubectl get svc -n wtestnamespace
    # this will get the output of the environment
    # you will need to get the DNS name near the Load Balancer
</pre>
7. A DNS name like below (example) in the output, this will be the load balancer address.  This DNS name is key.
<pre>
    ad90a511ddb594a29beadcbe1efe67ad-594569592.us-east-1.elb.amazonaws.com 
</pre>
8. Perform a command "nslookup" passing the DNS name and ensure that it is only returning a positive non-failing return <br>
<pre>
    nslookup ad90a511ddb594a29beadcbe1efe67ad-594569592.us-east-1.elb.amazonaws.com 
</pre>
#####       A good output would look like below 
<pre>
    % nslookup ad90a511ddb594a29beadcbe1efe67ad-594569592.us-east-1.elb.amazonaws.com 
    Server:     209.18.47.61
    Address:    209.18.47.61#53
    Non-authoritative answer:
    Name:	ad90a511ddb594a29beadcbe1efe67ad-594569592.us-east-1.elb.amazonaws.com
    Address:    54.210.181.93
    Name:	ad90a511ddb594a29beadcbe1efe67ad-594569592.us-east-1.elb.amazonaws.com
    Address:    3.229.57.142
    %
</pre>
    Use the DNS name and copy/paste into a browser such a Chrome or Firefox.
    An IP address of the load balancer that is behind the browser.
    You can start browsers and see multiple browsers and see different Ip addresses used.
    The IP address that you see in the browser is the IP of the Pod that Nginx is serving from.

9. Two methods to scale up and down<br>
Command line 
<pre>
    kubectl scale deployment.apps/wtest --replicas=6 -n wtestnamespace
</pre>
You can also edit "replicas" in wtest-deployment.yaml choosing the desired numbers.  Invoke (after edit) by: 
<pre>
    kubectl apply -f wtest-deployment.yaml -n wtestnamespace
</pre>
10. How can you prove there is replicas running per the instructions. 
<pre>
    kubectl get pods -l app=wtest -n wtestnamespace \
    -o go-template='{{range .items}}{{.status.podIP}}{{"\n"}}{{end}}' \
    > static-file.txt && cat static-file.txt
</pre>
-------------------------------------------------
#### Bonus Items

##### Bonus #1 How you would expose this service publicly ?
This project was built on AWS EKS and exposed publicly just for example.

##### Bonus #2 How you would automate the scaling of it ?
Here is one example of a command that can be wrapped in a script or other procedure
<pre>
kubectl autoscale deployment wtest-deployment --cpu-percent=50 --min=1 --max=10 -n wtestnamespace
</pre>
The command would result in scaling up more servers as per the settings of the command.
<br>
<br>

Please let me know any questions; if any details are missing or if anything was interpreted incorrectly.

| Contact  | EJ Best
| ------------ | -------------------------------------
| Skype | erich.ej.best
| Email | reach me on linked in for phone / email
| Phone | reach me on linked in for phone / email
| LinkedIn | https://www.linkedin.com/in/ejbest
