<#
.SYNOPSIS
Update flux 

.DESCRIPTION
Update flux with a new github path

Usage: update-flux.ps1 
	 -path <github path>
	 -interval <sync interval>
	 -flux-name <flux helm cluster name>


.EXAMPLE
Make sure set github information in github.psm1
./install-hpcc.ps1 -path hpcc/local-default

.NOTES

.LINK
https://github.com/xwang2713/hpcc-flux.git

#>

param(
  $path      = "",
  $flux_name          = "flux"
)

$bin_directory  = split-path $myInvocation.MyCommand.path
Import-Module  ${bin_directory}/github.psm1 -Force

if ($path  -ne "")
{
  $github_path = $path
}
$github_variables = ("github_user", "github_email", "github_repo", "github_path")
$github_missings = ""
foreach ($v in $github_variables)
{
    if ( !( get-variable $v -valueOnly ) )
    {
         $github_missings += " $v"
       
    }
}
if ($github_missings  -ne "")
{
   echo ""
   echo "Missing github information: $github_missings"
   echo "Please set them in file bin/github.psm1"
   echo ""
   exit 1
}

if ( ($github_branch -eq $null) -or ($github_branch -eq "") )
{
  $github_branch = "master"
}



helm upgrade -i ${flux_name} fluxcd/flux `
       --set git.user=${github_user} `
       --set git.email=${github_email} `
       --set git.branch=${github_branch} `
       --set git.url=git@github.com:${github_user}/${github_repo} `
       --set git.path="${github_path}" `
       --set syncGarbageCollection.enabled=true `
       -n flux
