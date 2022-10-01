param(
    
    [Parameter(Mandatory = $true)]
    [string]$sql_server_hostname,

    [Parameter(Mandatory = $false)]
    [string]$sa_password,

    [Parameter(Mandatory = $false)]
    [string]$ACCEPT_EULA,

    [Parameter(Mandatory = $false)]
    [string]$attach_dbs,
    
    [Parameter(Mandatory = $true)]
    [string]$pbirs_user,

    [Parameter(Mandatory = $true)]
    [string]$pbirs_password
    
)

    
.\sqlstart -sql_server_hostname $env:sql_server_hostname -sa_password $sa_password -ACCEPT_EULA $ACCEPT_EULA -attach_dbs \"$attach_dbs\" -Verbose


Write-Verbose "PBIRS Config"
.\configurePBIRS -Verbose

.\newadmin -username $pbirs_user -password $pbirs_password -Verbose

$lastCheck = (Get-Date).AddSeconds(-2) 
while ($true) { 
    Get-EventLog -LogName Application -Source "MSSQL*" -After $lastCheck | Select-Object TimeGenerated, EntryType, Message	 
   
    $lastCheck = Get-Date
    Start-Sleep -Seconds 2 
}
