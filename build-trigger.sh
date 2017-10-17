#!/bin/bash

# Quick example of a Jenkins remote build trigger

# To get the API Token do the following:
# 1. Login into Jenkins
# 2. Click your username in the top right corner
# 3. Click Configure
# 4. Under the API Token, click "Show API Token"
# 5. Edit the API_TOKEN below with the token

API_TOKEN=REPLACEME
CRUMB=$(curl -s 'http://flux:flux@localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
curl -X POST -H "$CRUMB" http://flux:${API_TOKEN}@localhost:8080/job/fluxdemo-jenkins/build?token=fluxdemo

