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
