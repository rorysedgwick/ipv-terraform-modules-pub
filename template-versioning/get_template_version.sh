#!/bin/bash
## This module requires jq - please make sure jq is installed before trying to run this in.

# Exit if any of the intermediate steps fail
set -e

# jq will ensure that the values are properly quoted
# and escaped for consumption by the shell.
eval "$(jq -r '@sh "arg_bucket=\(.template_bucket) arg_object=\(.template_object) arg_version=\(.template_version)"')"


if [[ "${arg_version}" =~ ^[lL][aA][tT][eE][sS][tT]$ ]] ; then
  template_data=$(aws s3api head-object --bucket "${arg_bucket}" --key "${arg_object}")
else
  # get the version_id of the templates
  #template_list_versions=$(aws s3api list-object-versions --bucket "${arg_bucket}" --prefix "${arg_object}" --max-items 20)
  #for version_id in $(echo "${template_list_versions}"|jq .Versions[].VersionId); do

  for version_id in $(aws s3api list-object-versions --bucket "${arg_bucket}" --prefix "${arg_object}"|jq .Versions[].VersionId); do
    version_tag=$(aws s3api head-object --bucket "${arg_bucket}" --key "${arg_object}" --version-id "${version_id}" --query 'Metadata.version' --output text)
    [[ "${arg_version}" == "${version_tag}" ]] && break
  done

  [[ "${arg_version}" != "${version_tag}" ]] && exit 1

  template_data=$(aws s3api head-object --bucket "${arg_bucket}" --key "${arg_object}" --version-id="${version_id}")
fi


last_modified=$(echo $template_data | jq -r .LastModified)
etag=$(echo $template_data | jq -r .ETag | tr -d '"')
version_id=$(echo $template_data | jq -r .VersionId)
repo=$(echo $template_data | jq -r .Metadata.repository)
version=$(echo $template_data | jq -r .Metadata.version)
commit_sha=$(echo $template_data | jq -r .Metadata.commitsha)

# converting date-stamp unsure this will work on osx - does work on linux.
# date_stamp=$(date -ud ${last_modified} +'%Y-%m-%d.%H-%M-%S')
# echo "date_stamp = ${date_stamp}"

jq -n "{\"last_modified\":\"$last_modified\",
        \"etag\":\"$etag\",
        \"version_id\":\"$version_id\",
        \"repo\":\"$repo\",
        \"version\":\"$version\",
        \"commit_sha\":\"$commit_sha\"}"
