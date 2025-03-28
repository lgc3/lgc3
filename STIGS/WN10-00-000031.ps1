<#
.SYNOPSIS

Vulnerability Discussion
    If data at rest is unencrypted, it is vulnerable to disclosure. Even if the operating system enforces permissions on 
    data access, an adversary can remove non-volatile memory and read it directly, thereby circumventing operating system
    controls. Encrypting the data ensures that confidentiality is protected even when the operating system is not running.
    Pre-boot authentication prevents unauthorized users from accessing encrypted drives.

This PowerShell script configured the BitLocker to require additional such as TPM PIN/key, and to use advadce startup  .

.NOTES
    Author          : Lauren Coste
    LinkedIn        : linkedin.com/in/lauren-coste
    GitHub          : github.com/lgc3
    Date Created    : 03/28/2025
    Last Modified   : 03/28/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000031

.TESTED ON
    Date(s) Tested  : 03/28/2025
    Tested By       : Lauren Coste
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : 5.1.19041.5607

.USAGE
    PS C:\> .\STIG-ID-WN10-00-000031.ps1 
#>

# Set the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"

# Create the key path if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

#Set UseAdvancedStartup to 1
Set-ItemProperty -Path $registryPath -Name "UseAdvancedStartup" -Value 1 -Type DWord


# Set UseTPMPIN to 1 
Set-ItemProperty -Path $registryPath  -Name "UseTPMPIN" -Value 1 -Type DWord

# Set UseTPMKeyPIN to 1 
Set-ItemProperty -Path $registryPath  -Name "UseTPMKeyPIN" -Value 1 -Type DWord

# Verify
Get-ItemProperty -Path $registryPath -Name "UseAdvancedStartup", "UseTPMPIN", "UseTPMKeyPIN"
