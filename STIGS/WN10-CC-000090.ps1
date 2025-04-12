<#
.SYNOPSIS 
    Vulnerability Discussion
        Enabling this setting and then selecting the "Process even if the Group Policy objects have not 
        changed" option ensures that the policies will be reprocessed even if none have been changed.

    This PowerShell script enables the reprocessed even if no changes to the group policy

.NOTES
    Author          : Lauren Coste
    LinkedIn        : linkedin.com/in/lauren-coste
    GitHub          : github.com/lgc3
    Date Created    : 04/11/2025
    Last Modified   : 04/11/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000090

.TESTED ON
    Date(s) Tested  : 04/11/2025
    Tested By       : Lauren Coste
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : 5.1.19041.5607

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000090.ps1 
#>

# Set the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"
$valueName = "NoGPOListChanges"
$valueData = 0

# Create the key path if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

#Verify
Write-Host "Registry Value '$valueName' set to '$valueData' at '$registryPath'."
