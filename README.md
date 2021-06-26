# infracloudio

### Part I Solution
1. docker run --name test infracloudio/csvserver
2. ./gencsv.sh
3. docker cp ./inputFile test:/csvserver/inputdata 
4. docker start test
5. docker ps
6. docker exec -it test   bash -c "netstat -plunt"
7. docker stop test
8. docker rm test
9. docker run -d -e CSVSERVER_BORDER=Orange --mount type=bind,source=$(pwd)/inputFile,target=/csvserver/inputdata --name test -p 9393:9300 infracloudio/csvserver
10. docker ps
12. curl -o ./part-1-output http://localhost:9393/raw
13. docker logs test >& part-1-logs
