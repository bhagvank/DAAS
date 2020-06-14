# DAAS
Data as a service


## Prerequisites for DAAS

1. Ensure that  java8, Tomcat9, MongoDB, Maven is installed.
  
  
2. Git clone this repository
```
git clone https://github.com/bhagvank/DAAS.git

```
3. mvn install : install the repos
```
mvn install
```

4. mvn package : create the war
```
mvn package
```
5. Deploy the war file located in Target to apachetomcat/webapps

6. Start Mongodb first and then tomcat. access: http://localhost:8080/PatientAid-0.0.1/



