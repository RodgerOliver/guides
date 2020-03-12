# DevOps

DevOps is a culture to join the dev team (developers) with the operation
team (sysadmins and infrastructure) in order to improve the speed of development,
deployment and management of the software.

DevOps is NOT tools, but they are used to apply the culture. There is no standards, there is the best way that your teams communicate and work together.

This culture grew out of the Agile software development movement. Agile seeks to develop software in small, frequent cycles.

## Culture

DevOps comes to join two opposite teams, developers ans operators.

Developers aim to deliver new functionality with frequency and speed, while operators want to keep the server stable and steady.

In DevOps, both teams have the same goals that include:
- Fast time-to-market (TTM)
  - time to put a developed feature into production
- Few production failures
- Immediate recover from failure

### Process

- Dev team develop a new feature
  - Dev send to QA for testing
  - Code works for Devs but not for Ops
- QA tests the code
  - QA returns the code to Dev because of a bug
- Ops try the code in the server
  - Ops return the code to Dev because it cause a bug on the deploy setup

Without DevOps, any problem in these steps result in finger pointing, no one gets the responsibility and TTM is increased significantly.

- Dev team develop a new feature
  - When code is finished it triggers automatic tests
- QA tests the code
  - After the tests the code is deploy for more testing
- Ops try the code in the server
  - With the code okay, it is deployed to production automatically

This way every step is automated and can be seen by anyone. If an error is detected by the monitoring system, a previous version can be deployed quickly while Devs work on a solution, and when it is done, the process keeps going till deployment again.

## Practices

### Build Automation

Build Automation is automating the process of preparing the code to be deployed to a live environment. For example: compile, lint and minify the code before it is deployed. All this automated process is made by scripts.

### Continuous Integration (CI)

CI is the practice of frequently merging code made by developers, and maybe deploy to a QA server.

This way all the code developed can be tested and verified all together.

In CI there is usually a server that does it and integrates with Source Control. Each change in the repository triggers the CI server that runs Build Automation tools to the code and maybe generate artifacts.

If a problem is found by the CI system, the developer is notified to rollback and repair the code.

### Continuous Delivery / Deployment (CD)

Continuous delivery is the practice of maintaining the code in a deployable state. This is used on web application for example, where there is no need to maintain multiple version of the software into production.

Continuous deployment is the practice of frequently deploying small changes to production

Each version of the code goes through a series of tests and builds to ensure that the code can be deployed. The result is an artifact or a package that can be automatically deployed into production.

### Infrastructure as Code (IaC)

IaC is a concept that aims to manage and provision infrastructure using code and automation. In other words, use configuration files to configure the server, and version them with a VCS (Version Control System) like git.

Using IaC, instead of doing things manually, automation and code is used to create and change:
- Server
- Instances
- Environments
- Containers
- Other infrastructures

Without IaC changes must be done by sshing into the server and running commands to achieve the result.

With IaC changes are made and committed in config files that are watched by an automation tool to perform changes.

IaC is good because you get **consistency** in the management of resources, **reusability** to use the same changes in other servers, **scalability** to take everything from one server and start right away a new server with all the configuration done and **self-documented** because all changes are committed to the VCS, keeping all the history.

### Configuration Management

Configuration Management is the ability to maintain pieces of infrastructures in a consistent way.

Is the management of different servers following the IaC principle.

### Orchestration

Automating the process to provide and manage resources. This way Ops can change system's resources, like processing, more easily, without the need to make it manually, the Orchestration Tool automatically does that.

### Monitoring

Monitoring is the collection of data about the performance of services and infrastructures. This data can be cpu usage, memory usage, disk i/o, etc.

This is used to monitor real-time usage, to notofy when the resource usage is high, or for postmortem analysis to see what went wrong with the deploy that failed.

**Aggregation** and **analytics** are about displaying the data collected.

### Microservices

Microservices breaks down an application into smaller services. Opposite from a **Monolithic** application, where the software is one whole entity.

Each microservice implements only a small part of an application functionality. They can also interact with each other using APIs.

An example is an application that handles payment, user info, inventory and authentication. These all can be individual microservice and can de joint together by another service.

This provides **modularity** because each microservice has its own test and build. They can be used in other applications and are easier to manage and maintain, because everything is divided into pieces. The microservice can be developed in different languages, because each one of them communicate with standardize APIs.

## Tools

Tools are important because they help to i.plement all the DevOps culture.

A nice list of them can be found in [XebiaLabs](https://xebialabs.com/periodic-table-of-devops-tools)

### Build Automation and CI

For Build Automation it depends on the language, some are listed below:
- Java: ant, maven, gradle
- JavaScript: npm, grunt, gulp
- Make: Unix systems
- Patcher: build VM and containers

For CI there are:
- Jenkins
- Travis CI
- Bamboo (Proprietary)

### Configuration Management

For CM there are:
- Ansible
- Puppet
- Chef
- Salt

### Virtualization and Containerization

For VM there are:
- VMWare ESX
- Microsoft Hyper-V
- Citrix XenServ

For Continers there are:
- Docker

### Monitoring

There are tools for **infrastructure** and **application** monitoring.

For Infra Monitoring there are:
- SenSu
- NewRelic

For App Monitoring there are:
- AppDynamics
- NewRelic

Showing data:
- Elastic Stack

### Orchestration

For orchestration there are:
- Docker Swarm
- Kubernetes
- Zookeeper
- Terraform (IaC or CM)

## Cloud

### Traditional Stack

Self-hosted data center:
- Applications
- Data
- Runtime
- Middleware
- OS
- Virtualization
- Servers
- Storage
- Networking

### Cloud Stack

#### Infrastructure as a Service (IaaS)

An bare OS is provided by the cloud that must be configured by the company. It covers all layers till **OS**.

Some examples are:
- AWS EC2
- MS Azure
- Google Compute Engine

#### Platform as a Service (PaaS)

An standardize OS is provided by the cloud, the onlu thing needed is to deploy the application. It covers all layers till **Runtime**.

Some examples are:
- AWS Elastic Beanstalk
- Heroku
- Google App Engine

#### Software as a Service (SaaS)

A whole application is provided by the cloud. It covers all layers. The intention is only to use the application.

Some examples are:
- Gmail
- MS Office 365
- Adobe CC

#### Function as a Service (FaaS) / Serverless

Everything is abstract. Only simple and small functions are deployed and there is no need to think about the server.

Some examples are:
- AWS Lambda / AWS Serverless Plataform
- Azure Functions
- Google Cloud Functions
