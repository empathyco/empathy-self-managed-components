docker stop search-mongo-0 search-mongo-1 search-mongo-2
docker rm search-mongo-0 search-mongo-1 search-mongo-2

cd ./environment/mongo/mongo-config/

rm file.key

openssl rand -base64 756 > file.key
chmod 400 file.key