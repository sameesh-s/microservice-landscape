
|Design Pattern | Spring Boot | Spring Cloud | Kubernetes |Istio |
|---------------|-------------|--------------|------------|------|
|Service discovery ||Netflix Eureka and Spring Cloud LoadBalancer|Kubernetes kube-proxy and service resources||
|<b>Edge Server</b>||Spring Cloud and Spring Security OAuth| Kubernetes Ingress controller|Istio ingress gateway|
|<b>Reactive microservices</b>|Project Reactor and Spring WebFlux||||
|<b>Central configuration</b>||Spring Config Server|Kubernetes ConfigMaps and Secrets||
|<b>Centralized log analysis</b>|||Elasticsearch, Fluentd and Kibana (Not part of Kubernetes, but can easily be deployed and configured together with Kubernetes||
|<b>Distibuted tracing</b>||Resilience4j||Outlier detection|
|<b>Control loop</b>|||Kubernetes controller managers||
|<b>Centralized monitoring and alarms</b>||||Kiali, Grafana and Prometheus|


Creation of full microservice landscape using spring ecosystem and shell scripts.

Installation  
------------   
1. spring command line tool : https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#getting-started.installing.cli  


Starting  
--------  
To generate spring boot projects from scratch use the create-projects.bash  
For each project we can list the created files.  
```  
find microservices/product-service -type f   
```

to build the gradle projects use the below commands  
```
cd microservices/product-service; ./gradlew build; cd -; \
....  
```  

Gradle multi-project setup : not prefered for devops pipeline, for dev only  
1. create setting.gradle in root directroy  
```
include ':microservices:product-service'
include ':microservices:review-service'
...
```
2. Copy gradle executable files in the root directory
```
cp -r microservices/product-services/grdle .
cp microservices/product-service/gradlew .
cp microservices/product-service/gradlew.bat .
cp microservices/product-service/.gitignore .
```
3. no longer needt he generated gradle file for each project
```
find microservices -depth -name "gradle" -exec rm -rfv "{}" \;
find microservices -depth -name "gradlew*" -exec rm -fv "{}" \;
```
4. build the microservices with one command  
```
./gradlew build
```


Using Resilience4j for improved resilience    
------------------------------------------   
In a fairly large-scaled system landscape of cooperating micorservices, we must assume that there is something going wrong all of the time. Failures must be seen as a normal state, and the system landscape must be designed to handle it.  this project prefer Resilience4j over Netflix Hystrix.
* Circuit breaker is used to prevent a chain of failure reaction if a remote service stops responding. 
* Rate limiter is used to limit the number of requests to a service during a specefied time period.  
* Bulkhead is used to limit the number of concurrent requests to a service.  
* Retries are used to handle random errors that might happen from time to time.  
* Time limiter is used to avoid waiting too long for a response from a slow or not responding service.   

State transition of Cicuit breaker   
----------------------------------  
1. A circuit breaker starts as Closed, allowing requests to be processed.  
2. As long as the requests are processed successfully, it stays in the Closed state.  
3. If failures start to happen, a counter starts to count up.  
4. If a threshold of failures is reached within a specified period of time, the circuit breaker will trip, that is, go to the Open state, not allowing further requests to be processed. Both the threshold of failures and the period of time are configurable.  
5. Instead, a request will Fast Fail, meaning it will return immediately with an exception. 
6. After a configurable period of time, the circuit breaker will enter a Half Open state and allow one request to go throug, as a probe, to see whether the failure has been resolved.  
7. If the probe request fails, the circuit breaker goes back to the Open state. 
8. If the probe request succeeds, the circuit breaker goes to the initial Closed state, allowing new requests to be processed.  
for monitoring circuit breaker we can use the acutator health end point. 
```
curl $HOST:$PORT/actuator/health -s | jq .components.circuitBreakers  
```


Using Spring Cloud Sleuth and Zipkin for distributed tracing  
------------------------------------------------------------  
To understand what is going on in a distributed system such as a system landsscape of cooperating microservices, it is crucial to be able to track and visualize how requests and messages flow between mciroservices when processing an external call to the sytem landscape.  
Spring Cloud comes with Spring Cloud Sleuth, which can mark requests and messages/events that are part of the same processing flow with a common correleation ID.  
Zipking is a distributed tracing system that Spring Cloud Sleuth can send tracing data to for storage and visualization.  
The infrastructure for handling distributed tracing information in Spring Cloud Sleuth and Zipking is based on Google Dapper.(Trace tree, spans, Traceid, SpandId)

   
