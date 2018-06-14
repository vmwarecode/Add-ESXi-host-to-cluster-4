Function Add-ESXiToCluster {
    <#
    .SYNOPSIS
        Add ESXi host to Cluster
    .PARAMETER ESXiName
        Specifies the name (DNS or IP) of the ESXi host that you want to add to the cluster
    .PARAMETER ESXiUser
        Specifies the user name you want to use for authenticating with the ESXi.
    .PARAMETER ESXiPassword
        Specifies the password you want to use for authenticating with the ESXi.
    .PARAMETER ClusterName
        Specifies the name of the cluster that you want to add a ESXi
    .EXAMPLE
        Add-ESXiToCluster -ESXiName '10.20.30.40' -ESXiUser 'root' -ESXiPassword 'thePassword' -ClusterName 'theCluster'
    .NOTES
        Copyright VMware, Inc. 2013.  All Rights Reserved.
    #>

    Param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$ESXiName,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$ESXiUser,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$ESXiPassword,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$ClusterName
    )

    "Retrieve Cluster: $ClusterName"
    $Cluster = Get-Cluster -Name $ClusterName

    "Add ESXi $ESXiName to Cluster $Cluster.Name"
    Add-VMHost -Name $ESXiName -User $ESXiUser -Password $ESXiPassword -Location $Cluster.Name -Force
}