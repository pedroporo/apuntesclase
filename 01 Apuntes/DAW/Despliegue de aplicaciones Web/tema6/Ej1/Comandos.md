```
docker run -dp 8090:80 --name nginx-8090 nginx:latest

docker build -t ud06a01-pedro:v1 .

docker run -dp 8090:80 --name imaPer1 ud06a01-pedro:v1
```