<#
.SYNOPSIS

Vulnerability Discussion
    Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot 
    service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs 
    are necessary to provide a trail of evidence in case the system or network is compromised.

This PowerShell script configure the systems to audit account management/User Account Management Failures

.NOTES
    Author          : Lauren Coste
    LinkedIn        : linkedin.com/in/lauren-coste
    GitHub          : github.com/lgc3
    Date Created    : 03/31/2025
    Last Modified   : 03/31/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000035 

.TESTED ON
    Date(s) Tested  : 03/31/2025
    Tested By       : Lauren Coste
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : 5.1.19041.5607

.USAGE
    PS C:\> .\STIG-ID-WN10-AU-000035 .ps1 
#>

# Configure the audit policy subcategory
auditpol /set /subcategory:"User Account Management" /failure:enable


# Verify
Write-Host "Audit Policy Configuration:"
auditpol /get /subcategory:"User Account Management"
