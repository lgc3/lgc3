<#
.SYNOPSIS
    Vulnerability Discussion
        Basic authentication uses plain text passwords that could be used to compromise a system.
    
    This PowerShell script disables the use of Basic Authentication for Windows Remote Management(WinRM)

.NOTES
    Author          : Lauren Coste
    LinkedIn        : linkedin.com/in/lauren-coste
    GitHub          : github.com/lgc3
    Date Created    : 04/01/2025
    Last Modified   : 04/01/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000345

.TESTED ON
    Date(s) Tested  : 04/01/2025
    Tested By       : Lauren Coste
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : 5.1.19041.5607

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000345.ps1 
#>

# Set the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer\"
$valueName = "AllowBasic"
$valueData = 0

# Create the key path if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

Write-Host "Registry Value '$valueName' set to '$valueData' at '$registryPath'."
