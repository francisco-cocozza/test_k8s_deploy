#!/bin/bash

kubectl version --short=true
echo 'SERVER_VERSION=$(kubectl version --short=true | grep -i server | cut -c18-20 | tr -d .) ==>'
kubectl version --short=true | grep -i server | cut -c18-20 | tr -d .
SERVER_VERSION=$(kubectl version --short=true | grep -i server | cut -c18-20 | tr -d .)
echo "$SERVER_VERSION <= 16 ??"
if (( "$SERVER_VERSION" <= "16" )); then echo using-kubectl-v1.6; else echo using-$SERVER_VERSION; fi


kubectl version --short=true
echo 'SERVER_VERSION=$(kubectl version --short=true --context "${KUBECONTEXT}" | grep -i server | cut -d \':\' -f2 | cut -d \'.\' -f2 | sed \'s/[^0-9]*//g\') ==>'
kubectl version --short=true --context "${KUBECONTEXT}" | grep -i server | cut -d ':' -f2 | cut -d '.' -f2 | sed 's/[^0-9]*//g'
SERVER_VERSION=$(kubectl version --short=true --context "${KUBECONTEXT}" | grep -i server | cut -d ':' -f2 | cut -d '.' -f2 | sed 's/[^0-9]*//g')
echo "$SERVER_VERSION <= 6 ??"
if (( "$SERVER_VERSION" <= "6" )); then echo using-kubectl-v1.6; else echo using-$SERVER_VERSION; fi
