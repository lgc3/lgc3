<#
.SYNOPSIS

Vulnerability Discussion
    Use of weak or untested encryption algorithms undermines the purposes of utilizing encryption to protect data. 
    By default Windows uses ECC curves with shorter key lengths first. Requiring ECC curves with longer key lengths 
    to be prioritized first helps ensure more secure algorithms are used.

This PowerShell script configured windows 10 to priorize ECC Curves with longer key lengths first.

.NOTES
    Author          : Lauren Coste
    LinkedIn        : linkedin.com/in/lauren-coste
    GitHub          : github.com/lgc3
    Date Created    : 03/28/2025
    Last Modified   : 03/28/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000052

.TESTED ON
    Date(s) Tested  : 03/28/2025
    Tested By       : Lauren Coste
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : 5.1.19041.5607

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000052.ps1 
#>

# Set the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002\"
$valueName = "EccCurves"
$valueData = "NistP384", "NistP256"

# Create the key path if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

#Prioritize ECC Curves
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type MultiString

# Verify
Get-ItemProperty -Path $registryPath -Name $valueName
