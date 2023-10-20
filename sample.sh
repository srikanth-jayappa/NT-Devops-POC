
#!/bin/bash

json_file="sample.json"

# Check if JSON file exists
if [ ! -f "$json_file" ]; then
    echo "JSON file '$json_file' not found."
    exit 1
fi

# Parse JSON and extract key-value pairs
blob=$(jq -r '.blob' "$json_file")
adls=$(jq -r '.adls' "$json_file")
azureml=$(jq -r '.azureml' "$json_file")
sql_server=$(jq -r '.sql_server' "$json_file")
snowflake=$(jq -r '.snowflake' "$json_file")
purview=$(jq -r '.purview' "$json_file")
synapse_spark=$(jq -r '.synapse_spark' "$json_file")
synapse_sql=$(jq -r '.synapse_sql' "$json_file")
databricks=$(jq -r '.databricks' "$json_file")
azure_vm=$(jq -r '.azure_vm' "$json_file")


node_size_family=$(jq -r '.synapse_spark_config.node_size_family' "$json_file")
node_size=$(jq -r '.synapse_spark_config.node_size' "$json_file")
spark_version=$(jq -r '.synapse_spark_config.spark_version' "$json_file")

node_type=$(jq -r '.databricks_config.node_type' "$json_file")
cluster_mode=$(jq -r '.databricks_config.cluster_mode' "$json_file")
spark_version=$(jq -r '.databricks_config.spark_version' "$json_file")
node_auto_termination=$(jq -r '.databricks_config.node_auto_termination' "$json_file")

resource_group_name=$(jq -r '.azure_vm_config.resource_group_name' "$json_file")
admin_password=$(jq -r '.azure_vm_config.admin_password' "$json_file")
admin_username=$(jq -r '.azure_vm_config.admin_username' "$json_file")
size=$(jq -r '.azure_vm_config.size' "$json_file")
sku=$(jq -r '.azure_vm_config.sku' "$json_file")
storage_account_type=$(jq -r '.azure_vm_config.storage_account_type' "$json_file")

# Echo the extracted key-value pairs
echo "::set-output name=BLOB:$blob"
echo "::set-output name=ADLS:$adls"
echo "::set-output name=AZUREML:$azureml"
echo "::set-output name=SQL_SERVE:$sql_server"
echo "::set-output name=SNOWFLAKE:$snowflake"
echo "::set-output name=PURVIEW:$purview"
echo "::set-output name=SYNAPSE_SPARK:$synapse_spark"
echo "::set-output name=SYNAPSE_SQL:$synapse_sql"
echo "::set-output name=DATABRICKS:$databricks"


# Echo the extracted sub-section key-value pairs individually
echo "::set-output name=NODE_SIZE_FAMILY:$node_size_family"
echo "::set-output name=NODE_SIZE:$node_size"
echo "::set-output name=SPARK_VERSION:$spark_version"
echo "::set-output name=NODE_TYPE:$node_type"
echo "::set-output name=CLUSTER_MODE:$cluster_mode"
echo "::set-output name=SPARK_VERSION:$spark_version"
echo "::set-output name=NODE_AUTO_TERMINATION:$node_auto_termination"
echo "{RESOURCE_GROUP_NAME}={$resource_group_name}" >> "$GITHUB_ENV"
echo "{ADMIN_PASSWORD}={$admin_password}" >> "$GITHUB_ENV"
echo "{ADMIN_USERNAME}={$admin_username}" >> "$GITHUB_ENV"
echo "{SIZE}={$size}" >> "$GITHUB_ENV"
echo "{SKU}={$sku}" >> "$GITHUB_ENV"
echo "{STORAGE_ACCOUNT_TYPE}={$storage_account_type}" >> "$GITHUB_ENV"


# terraform -chdir=config plan -var="resource_group_name=$resource_group_name" -var="admin_password=$admin_password" -var="admin_username=$admin_username" -var="size=$size" -var="sku=$sku" -var="storage_account_type=$storage_account_type"
