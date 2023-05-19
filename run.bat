@ECHO OFF

docker container run -d --rm -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_USER=mysql -e MYSQL_PASSWORD=mysql -e MYSQL_DATABASE=scc -v "C:/docker-data/mysql:/var/lib/mysql" --name mysql mysql:latest

TIMEOUT 10

CALL mvn clean package
CD target
java -jar -Dspring.profiles.active=jdbc Spring-Cloud-Config-Server-Demo-JDBC-1.0.0.jar

PAUSE