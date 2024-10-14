#!/bin/bash

# Function to get running pod count for a namespace
get_running_pod_count() {
    local namespace=$1
    local running_pods=$(kubectl get pods -n "$namespace" --field-selector=status.phase=Running --no-headers | wc -l)
    echo "$namespace $running_pods"
}

# Get all namespaces
#namespaces=$(kubectl get namespaces -o jsonpath='{.items[*].metadata.name}')
namespaces=("okteto" "kube-system" "gmp-system")

# Print header
echo "Namespace Running Pods"
echo "--------- ------------"

# Variable for grand total
total_running=0

# Loop through each namespace and get running pod count
for ns in "${namespaces[@]}"; do
    read -r namespace running <<< $(get_running_pod_count "$ns")
    printf "%-9s %12d\n" "$namespace" "$running"
    
    # Add to grand total
    total_running=$((total_running + running))
done

# Print grand total
echo "--------- ------------"
printf "%-9s %12d\n" "Total:" "$total_running"