#!/bin/bash
cf login -a api.run.pivotal.io -o mdidb-dev -s development
cf create-service p-circuit-breaker-dashboard trial circuit-breaker
cf create-service p-service-registry trial service-registry -c '{"count": 1}'
cf create-service p-config-server trial config-server -c '{"count": 1, "git": { "uri": "https://github.com/Delmonte3161/mdidb-config" }}'
cf create-service elephantsql turtle services-db
cf create-service elephantsql turtle geo-db
cf create-service elephantsql turtle auth-db
cf create-service cloudamqp lemur rabbit
cf target -s development
