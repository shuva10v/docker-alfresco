docker run --volumes-from alfrescodocker_datacontainer_1 -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /opt/alfresco/alf_data/contentstore
docker run -it --link postgres:db po -h db
