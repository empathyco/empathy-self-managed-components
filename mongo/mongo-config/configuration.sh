#!/bin/bash

mongo <<EOF
   var cfg = {
        "_id": "rs",
        "version": 1,
        "members": [
            {
                "_id": 0,
                "host": "search-mongo-0:27017",
                "priority": 3
            },
            {
                "_id": 1,
                "host": "search-mongo-1:27017",
                "priority": 2
            },
            {
                "_id": 2,
                "host": "search-mongo-2:27017",
                "priority": 1
            }
        ]
    };
    rs.initiate(cfg, { force: true });
    rs.status();
EOF

sleep 20

mongo <<EOF
   use admin;
   admin = db.getSiblingDB("admin");
   admin.createUser(
     {
	      user: "administrator",
        pwd: "pwd",
        roles: [ { role: "root", db: "admin" } ]
     }
   );
   db.getSiblingDB("admin").auth("administrator", "pwd");
   rs.status();
EOF

mongo --port 27017 -u "administrator" -p "pwd" --authenticationDatabase "admin" <<EOF
   use search-service;
   db.createUser(
     {
	      user: "search",
        pwd: "7G16WWzYdHhg6Iu0",
        roles: [ { role: "readWrite", db: "search-service" } ]
     }
   );
   rs.status();
EOF