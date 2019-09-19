# Sample GemFire System with Spring Boot Servers

Sometimes the application would like more control over all aspects of a system.   Spring and GemFire embrace that concept.   This project will show how to create a basic spring project to start up the GemFire servers.

# How to deploy

The project was written with the idea that it would be run on some cloud somewhere.   In the `scripts` directory there is an `env.sh` file.    Just change the `env.sh` file to match your system

* `data_hosts` - this would be the hosts that will run the spring boot server(s) that will host the content that is stored in GemFire.   Recommend running 3 or more data hosts for data safety.
* `locator_hosts` -  Locators are a concept that allow GemFire components to each other.    As the spring boot GemFire servers come online they will announce thier connection details as well as retrive the list of other hosts.    Recommend running at least 2 for HA - 3 is always better for quorum. 
* `locators` - this is the internal address of the locators in a format that is friendly to GemFire applications. 

#  Lets get this example running

1) Configure [`env.sh`](scripts/env.sh)  to match your physical deployment
2) [Review the spring boot application code](src/main/java/com/example/demo/DemoApplication.java) 
3) [Review the spring boot application configuration](src/main/resources/application.yml)
4) Compile the spring boot application `./gradlew bootJar`
5) Install Java and GemFire on all systems [`./install_gemfire.sh`](scripts/install_gemfire.sh) 
6) Upload the spring boot GemFire server application on the data hosts [`./deploy_spring_app.sh`](scripts/deploy_spring_app.sh) 
7) Run it [`./start_gemfire.sh`](scripts/start_gemfire.sh) 

## What Now

Well there are ton of things that can be done.   This is just an example to help you getting started.

# NOTE

This is a spring boot GemFire server - so it is a little different in that your spring configuration is in control. 
