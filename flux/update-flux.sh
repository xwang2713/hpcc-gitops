#!/bin/bash

binDir=$(dirname $0)

source ${binDir}/github

usage()
{
  cat << EOF
  ./update-flux.sh -f <flux name> -p <github path>
  github information should be set in github file.
EOF
}



github_path=""
flux_name="helm-operator"
while getopts “hf:p:” opt; do
  case $opt in
    f) flux_name=$OPTARG ;;
    p) github_path=$OPTARG ;;
    h) usage   ;;
  esac
done

github_variables=(
  'github_user'
  'github_email'
  'github_repo'
  'github_path'
)

github_missings=
for v in ${github_variables[@]}
do
  if [[ $(eval echo $v) == "" ]]
  then
    github_missings="$github_missings $v"

  fi
done
if [ -n "$github_missings" ]
then
  cat <<EOF

  Missing github information: ${github_missings}.
  Set missing values in bin/github and re-try.

EOF
fi

helm upgrade -i ${flux_name} fluxcd/flux \
  --set git.user=${github_user} \
  --set git.email=${github_email} \
  --set git.branch=${github_branch} \
  --set git.url=git@github.com:${github_user}/${github_repo} \
  --set git.path=${github_path} \
  --set syncGarbageCollection.enabled=true \
  -n flux
