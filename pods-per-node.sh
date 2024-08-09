#!/bin/bash

# Get the list of all nodes
nodes=$(kubectl get nodes -o jsonpath='{.items[*].metadata.name}')

# Iterate through each node and list the pods
for node in $nodes; do
  echo "Node: $node"
  POD_COUNT=$(kubectl get pods -o wide --all-namespaces --field-selector spec.nodeName=$node --no-headers | wc -l)
  echo "Total: $POD_COUNT"
  echo ""
  kubectl get pods -o wide --all-namespaces --field-selector spec.nodeName=$node
  echo ""
done
