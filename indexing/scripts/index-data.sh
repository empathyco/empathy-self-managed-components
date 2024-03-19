#!/bin/bash
# The usage is: index-data.sh {COLLECTION_FILES_PATH}
if [[ $# -ne 1 ]]
then
  echo "Error - This script has to be called, using the following command: index-data.sh {COLLECTION_FILES_PATH}"
  exit 1;
fi

elasticsearch="http://docker.for.mac.localhost:9200"
basePath="$1"

function index_all() {
 for path in $basePath/*; do
   INDEX_TYPE=$(basename $path)
   echo "Processing: $INDEX_TYPE"

   if [[ $(find $path -maxdepth 1 -type d | wc -l) -gt 1  ]] #The first line is $path directory
   then
     echo "Processing langs"
     for LANG_PATH in $path/*; do
      LANG=$(basename $LANG_PATH)
      echo "Processing lang: $LANG"
      index $INDEX_TYPE "imdb-$INDEX_TYPE-$LANG" "$basePath/$INDEX_TYPE/$LANG"
     done
   else
     echo "Indexing the feed"
     index $INDEX_TYPE "imdb-$INDEX_TYPE" "$basePath/$INDEX_TYPE"
   fi
 done
}

function index() {
  INDEX_TYPE=$1
  ALIAS=$2
  FILES_BASE_PATH=$3
  MAPPING_FILE="$FILES_BASE_PATH/mapping.json"
  DATA_FILE="$FILES_BASE_PATH/data.json"

  TIMESTAMP=$(date +%s)

  INDEX="$ALIAS-$TIMESTAMP"

  echo "Create collection"
  create_collection $INDEX $MAPPING_FILE
  echo "Index content"
  index_content $INDEX $DATA_FILE
  echo "Set alias"
  set_alias $INDEX $ALIAS
}

function create_collection() {
  INDEX=$1
  MAPPINGFILE=$2

  echo "Creating collection for $INDEX"

  status_code=$(curl -XPUT "$elasticsearch/$INDEX" -H 'Content-Type: application/json' --data-binary @$MAPPINGFILE --write-out %{http_code} --silent --output /dev/null)

  if [ $status_code -ne "200" ]
  then
    curl -XPUT "$elasticsearch/$INDEX" -H 'Content-Type: application/json' --data-binary @$MAPPINGFILE
    exit 1
  fi

  curl -XGET "$elasticsearch/_cluster/health/$INDEX?wait_for_status=green&timeout=60s" --silent --output /dev/null

  echo "Finished creating collection for $INDEX"
}

function index_content() {
  INDEX=$1
  DATAFILE=$2

  echo "Indexing data for $INDEX"

  jq --compact-output '.hits.hits[]._source | {"index":{}},.' $DATAFILE > formatted-data.json

  cat formatted-data.json

  status_code=$(curl -XPOST "$elasticsearch/$INDEX/_doc/_bulk" -H 'Content-Type: application/x-ndjson' --data-binary @formatted-data.json --write-out %{http_code} --silent --output /dev/null)

  if [ $status_code -ne "200" ]
  then
    curl -XPOST "$elasticsearch/$INDEX/_doc/_bulk" -H 'Content-Type: application/x-ndjson' --data-binary @formatted-data.json
    rm formatted-data.json
    exit 1
  fi

  rm formatted-data.json

  echo "Finished indexing data for $INDEX"

}

function set_alias() {
    INDEX=$1
    ALIAS=$2

    echo "Creating alias for $INDEX"
    curl -XPUT "$elasticsearch/$INDEX/_alias/$ALIAS"
    echo ""
    echo "Finished creating alias for $INDEX"
}

function wait_for_elastic() {
      status_code=$(curl -XGET "$elasticsearch/_cluster/health" --write-out %{http_code} --silent --output /dev/null)

      while [ $status_code -ne "200" ]
      do
        echo "Waiting for $elasticsearch to be ready";
        sleep 15s
        status_code=$(curl -XGET "$elasticsearch/_cluster/health" --write-out %{http_code} --silent --output /dev/null)
      done
}

function refresh_indexes() {
  echo "Refresh indexes"
  curl -XPOST "$elasticsearch/_refresh"
}

echo "Start Script";
wait_for_elastic;
index_all
refresh_indexes
echo "Finish Script";
exit 0;