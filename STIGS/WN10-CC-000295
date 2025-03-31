<#
.SYNOPSIS

Vulnerability Discussion
    Attachments from RSS feeds may not be secure. This setting 
    will prevent attachments from being downloaded from RSS feeds.

This PowerShell script disable downloads from RSS feeds

.NOTES
    Author          : Lauren Coste
    LinkedIn        : linkedin.com/in/lauren-coste
    GitHub          : github.com/lgc3
    Date Created    : 03/31/2025
    Last Modified   : 03/31/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000295

.TESTED ON
    Date(s) Tested  : 03/31/2025
    Tested By       : Lauren Coste
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : 5.1.19041.5607

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000295.ps1 
#>

# Set the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds\"
$valueName = "DisableEnclosureDownload"
$valueData = 1

# Create the key path if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

#Disable Encloseure Download
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Verify
Get-ItemProperty -Path $registryPath -Name $valueName
