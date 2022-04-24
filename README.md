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
 
