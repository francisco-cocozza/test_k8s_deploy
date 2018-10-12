#!/bin/bash

kubectl version --short=true
echo 'SERVER_VERSION=$(kubectl version --short=true | grep -i server | cut -c18-20 | tr -d .) ==>'
kubectl version --short=true | grep -i server | cut -c18-20 | tr -d .
SERVER_VERSION=$(kubectl version --short=true | grep -i server | cut -c18-20 | tr -d .)
if (( "$SERVER_VERSION" <= "16" )); then echo-using-kubectl-v1.6; else echo using-$SERVER_VERSION; fi
