$global:github_user   = "xwang2713"  # hpcc-systems
$global:github_email  = "xiaoming.wang@lexisnexis.com"  # hpccbuild@hpccsystems.com
$global:github_repo   = "flux-hpcc-cluster"  # flux-hpcc-cluster
$global:github_branch = "master"
#$global:github_path   = "hpcc/local/localfile\,elastic/beats\,elastic/elasticsearch/local\,elastic/kibana"  # releases/local
$global:github_path   = "hpcc/local/localfile"  # releases/local
#$global:github_path   = "workloads"  # releases/local

Export-ModuleMember -Variable github_user,github_email,github_repo,github_branch,github_path
