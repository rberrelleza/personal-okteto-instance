#!/bin/bash

# Array of namespaces to check
namespaces=("okteto" "kube-system" "gmp-system")

# Get all nodes in the cluster
nodes=$(kubectl get nodes -o jsonpath='{.items[*].metadata.name}')

# Create or overwrite the CSV file with headers
echo "node,$(IFS=,; echo "${namespaces[*]}"),total" > pod_counts.csv

for node in $nodes; do
    node_data="$node"
    node_total=0
    
    for namespace in "${namespaces[@]}"; do
        pod_count=$(kubectl get pods -n "$namespace" --field-selector spec.nodeName="$node",status.phase=Running -o name | wc -l)
        node_data="$node_data,$pod_count"
        node_total=$((node_total + pod_count))
    done
    
    # Append the node data and total to the CSV file
    echo "$node_data,$node_total" >> pod_counts.csv
done

echo "CSV file 'pod_counts.csv' has been created with the pod count data."