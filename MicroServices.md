
<h3>Design Patterns for microservices</h3>   
-------------------------------------------

* Service discovery  
  * Automatically register/unregister microservices and their instances as they come and go.  
  * The client must be able to make request to a logical engpoint for the microservice. The request will be routed to one of the available microservice instances.  
  * Requests to a microservice must be load-balanced over the available instances.  
  * Must be able to detect instances that currently are unhealthy, so that requests will not be routed to them.   
* Edge server  
  * Hide internal services that should not be exposed outside their context.  
  * Expose external services and protect them from malicious requests.  
* Reactive microservices  
  * Use non-blocking I/O to ensure that no threads are allocated while waiting for processing to occur in another service (database or another microservice)  
* Central configuraton  
  * Make it possible to store configuration information for a group of microservices in one place, with different settings for different environments(dev, test, qa and prod)   
* Centralized log analysis   
  * Detecting new microservice instances and collecting log events from them.  
  * interpreting and storing log events in a structured and searchable way in a central database.  
  * Providing APIs and graphical tools for querying and analyzing log events.  
* Distributed tracing  
* Circuit breaker  
* Control loop  
* Centralized monitoring and alarms  


