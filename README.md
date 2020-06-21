# DAAS

 DAAS platform (Data as a service) is a no code platform which has visual IDE for business users to build applications. Applications will have entities, services, and datasources. it will have capabilities to create multi channel apps and integrate them with services. Customizations can be provided easily as upgrades to the application deployed on AWS.  The applications can be customized with different themes and User interface will have search, filter, export and import capabilties. This platform will work with nosql database MongoDB.

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

6. Start Mongodb first and then tomcat. 

7. Import the json files from mongodb folder into mongodb database name : "DAAS".

8. You can access: http://localhost:8080/PatientAid-0.0.1/

9. You can login with username  and password mentioned in mongodb/user.json



