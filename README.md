## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Update the path with the name of your diagram](Diagrams/HW13.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly Available, in addition to restricting Access to the network.
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?

A jumpbox ois a system on a network used to access and manage devices in a separate security zone.  Jump servers are typically placed between a secure zone and a DMZ to provide transparent management of devices on the DMZ once a management session has been established. The jump server acts as a single audit point for traffic and also a single place where user accounts can be managed. A prospective administrator must log into the jump server in order to gain access to the DMZ assets and all access can be logged for later audit.
A load balancer is a device that acts as a reverse proxy and distributes network or application traffic across a number of servers. Load balancers are used to increase capacity (concurrent users) and reliability and availability of applications.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the Log-Files and system Resouces.
- _TODO: What does Filebeat watch for?_ system logs and forward any changes to the Elasticsearch Host
- _TODO: What does Metricbeat record?_ collecting metrics and system resources usage for display in Elasticsearch

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name      | Function               | IP Address  | Operating System |
|-----------|------------------------|-------------|------------------|
| Jump Box  | Provisioning / Gateway | 10.1.0.4    | Ubuntu           |
| Web-1     | Web-Server             | 10.1.0.5    | Ubuntu           |
| Web-2     | Web-Server             | 10.1.0.6    | Ubuntu           |
| Web-3     | Web-Server             | 10.1.0.9    | Ubuntu           |
| ELK       | ElasticSearch Stack    | 10.3.0.4    | Ubuntu           |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jumpbox can accept connections from the Internet via SSH. Access to this machine is only allowed from the following IP addresses: [mypersonal-ip-address]

- _TODO: Add whitelisted IP addresses_

Machines within the network can only be accessed by Jumpbox Server.

- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?

JumpBoxProvisioner
Public IP address; 20.62.192.166
Private IP address; 10.1.0.4


A summary of the access policies in place can be found in the table below.

| Name          | Publicly Accessible | Allowed IP Addresses  |
|---------------|---------------------|-----------------------|
| Jump Box      | SSH - 22 - Yes      | MyPersonal IP Address |
| Web 1,2,3     | No                  | 10.1.0.4              |
| Load Balancer | HTTP - 80 - Yes     |                       |
| ELK           | Kibana - 5601 - Yes | MyPersonal IP Address |
| ELK           | HTTP - 9200 - Yes   | 10.1.0.0/16           |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_
The primary benefit of Ansible is it allows IT administrators to automate away the drudgery from their daily tasks... reduces configuration errors

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
Install Docker: Installs the core docker code to the remote server docker.io  
Install Python3_pip: Pip is an installation module that allows for additional docker modules to be installed easier
Docker Module: Tells the previous PIP module to install the necessary docker component modules
Increase Memory/Use More Memory: A common issue with the ELK Docker image is to little memory. This help fix the issue to allow the server to launch
Download and Launch ELK Container: This downloads the ELK docker container and initializes it with the specified ports being published

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.



![Update the path with the name of your screenshot of docker ps output](Images/DockerPs.jpg)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_
10.1.0.5
10.1.0.6 
10.1.0.9
10.3.0.4  

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_

Filebeat and Metricbeat installed on the following Systems: Web1, Web2, Web3

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc.



### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the Yaml file to /etc/ansible.
- Update the hosts file to include...groups of webservers (machines)
- Run the playbook, and navigate to Elk Server (Kibana) to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
install.elk.yml 
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on? 
Under the Hosts file... /etc/ansible .. groups - Webserves / Web1, Web 2, Web3  
- _Which URL do you navigate to in order to check that the ELK server is running?
http://[your_elk_server_ip]:5601/app/kibana
_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
