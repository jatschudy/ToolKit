#
# Module manifest for module 'HybridManagement'
#
# Generated by: Microsoft
#
# Generated on: 1/20/2020
#

@{

    # Script module or binary module file associated with this manifest.
    RootModule = 'AzFilesHybrid.psm1'
    
    # Version number of this module.
    ModuleVersion = '0.3.2.0'
    
    # Supported PSEditions
    CompatiblePSEditions = "Core", "Desktop"
    
    # ID used to uniquely identify this module
    GUID = '71b01ebd-3815-409f-9c24-6f10ef575705'
    
    # Author of this module
    Author = 'Microsoft Corporation'
    
    # Company or vendor of this module
    CompanyName = 'Microsoft Corporation'
    
    # Copyright statement for this module
    Copyright = '(c) 2020 Microsoft'
    
    # Description of the functionality provided by this module
    Description = 'The AzFilesHybrid PowerShell module provides cmdlets for deploying and configuring Azure Files. It offers cmdlets for domain joining storage accounts to your on-premises Active Directory, configuring your DNS servers, and troubleshooting  authentication issues.'
    
    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.1'
    
    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''
    
    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = '5.1'
    
    # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # DotNetFrameworkVersion = ''
    
    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # CLRVersion = ''
    
    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''
    
    # Modules that must be imported into the global environment prior to importing this module
    # RequiredModules = @()
    
    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()
    
    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()
    
    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()
    
    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()
    
    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    #NestedModules = 'HybridManagement.psm1'
    
    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = "Get-IsElevatedSession",
        "Assert-IsElevatedSession",
        "Get-OSPlatform",
        "Assert-IsWindows",
        "Get-IsDomainJoined",
        "Assert-IsDomainJoined",
        "Get-OSVersion",
        "Get-WindowsInstallationType",
        "Get-OSFeature",
        "Install-OSFeature",
        "Request-OSFeature",
        "Get-RandomString",
        "Assert-DotNetFrameworkVersion",
        "Register-OfflineMachine",
        "Join-OfflineMachine",
        "ConvertFrom-EncodedJson",
        "ConvertTo-EncodedJson",
        "New-RegistryItem",
        "New-RegistryItemProperty",

        # Azure Files AD domain join cmdlets
        "Get-AzStorageAccountADObject",
        "Get-AzStorageKerberosTicketStatus",
        "Test-AzStorageAccountADObjectPasswordIsKerbKey",
        "Update-AzStorageAccountADObjectPassword",
        "Join-AzStorageAccount", 
        "Invoke-AzStorageAccountADObjectPasswordRotation",
        "Update-AzStorageAccountAuthForAES256",

        # Azure Files debug cmdlets
        "Debug-AzStorageAccountAuth",
        "Debug-AzStorageAccountADDSAuth",
        "Debug-AzStorageAccountEntraKerbAuth",

        # General Azure cmdlets
        "Expand-AzResourceId",
        "Compress-AzResourceId",
        "Get-AzCurrentAzureADUser",
        "Test-AzPermission",
        "Assert-AzPermission",

        # DNS cmdlets
        "Confirm-AzDnsForwarderPreReqs",
        "Join-AzDnsForwarder",
        "Invoke-AzDnsForwarderDeployment",
        "Get-AzDnsForwarderIpAddress",
        "Update-AzVirtualNetworkDnsServers",
        "New-AzDnsForwarder",
        "New-AzDnsForwardingRuleSet",
        "Add-AzDnsForwardingRule",
        "Push-DnsServerConfiguration",

        #Share level permissions migration cmdlets
        "Move-OnPremSharePermissionsToAzureFileShare"
    
    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport = @()
    
    # Variables to export from this module
    VariablesToExport = '*'
    
    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = "*"
    
    # DSC resources to export from this module
    # DscResourcesToExport = @()
    
    # List of all modules packaged with this module
    # ModuleList = @()
    
    # List of all files packaged with this module
    # FileList = @()
    
    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{

        Config = @{
            AzurePrivateDnsIp = "168.63.129.16";
            DnsForwarderTemplateVersion = "0.1.0.0";
            DnsForwarderTemplate = "https://raw.githubusercontent.com/Azure-Samples/azure-files-samples/master/dns-forwarder/azuredeploy.json";
            SkipPowerShellGetCheck = $false;
            SkipAzPowerShellCheck = $false;
            SkipDotNetFrameworkCheck = $false
        };
    
        PSData = @{
    
            # Tags applied to this module. These help with module discovery in online galleries.
            # Tags = @()
    
            # A URL to the license for this module.
            # LicenseUri = ''
    
            # A URL to the main website for this project.
            # ProjectUri = ''
    
            # A URL to an icon representing this module.
            # IconUri = ''
    
            # ReleaseNotes of this module
            # ReleaseNotes = ''
    
        } # End of PSData hashtable
    
    } # End of PrivateData hashtable
    
    # HelpInfo URI of this module
    # HelpInfoURI = ''
    
    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''
    
    }
    
    

# SIG # Begin signature block
# MIIoRwYJKoZIhvcNAQcCoIIoODCCKDQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBGDhLm6x/mDF1/
# rnXupybbGPhYDyMLgApP6I/SBA5P9KCCDXYwggX0MIID3KADAgECAhMzAAADrzBA
# DkyjTQVBAAAAAAOvMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjMxMTE2MTkwOTAwWhcNMjQxMTE0MTkwOTAwWjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDOS8s1ra6f0YGtg0OhEaQa/t3Q+q1MEHhWJhqQVuO5amYXQpy8MDPNoJYk+FWA
# hePP5LxwcSge5aen+f5Q6WNPd6EDxGzotvVpNi5ve0H97S3F7C/axDfKxyNh21MG
# 0W8Sb0vxi/vorcLHOL9i+t2D6yvvDzLlEefUCbQV/zGCBjXGlYJcUj6RAzXyeNAN
# xSpKXAGd7Fh+ocGHPPphcD9LQTOJgG7Y7aYztHqBLJiQQ4eAgZNU4ac6+8LnEGAL
# go1ydC5BJEuJQjYKbNTy959HrKSu7LO3Ws0w8jw6pYdC1IMpdTkk2puTgY2PDNzB
# tLM4evG7FYer3WX+8t1UMYNTAgMBAAGjggFzMIIBbzAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQURxxxNPIEPGSO8kqz+bgCAQWGXsEw
# RQYDVR0RBD4wPKQ6MDgxHjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEW
# MBQGA1UEBRMNMjMwMDEyKzUwMTgyNjAfBgNVHSMEGDAWgBRIbmTlUAXTgqoXNzci
# tW2oynUClTBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpb3BzL2NybC9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3JsMGEG
# CCsGAQUFBwEBBFUwUzBRBggrBgEFBQcwAoZFaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9jZXJ0cy9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3J0
# MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggIBAISxFt/zR2frTFPB45Yd
# mhZpB2nNJoOoi+qlgcTlnO4QwlYN1w/vYwbDy/oFJolD5r6FMJd0RGcgEM8q9TgQ
# 2OC7gQEmhweVJ7yuKJlQBH7P7Pg5RiqgV3cSonJ+OM4kFHbP3gPLiyzssSQdRuPY
# 1mIWoGg9i7Y4ZC8ST7WhpSyc0pns2XsUe1XsIjaUcGu7zd7gg97eCUiLRdVklPmp
# XobH9CEAWakRUGNICYN2AgjhRTC4j3KJfqMkU04R6Toyh4/Toswm1uoDcGr5laYn
# TfcX3u5WnJqJLhuPe8Uj9kGAOcyo0O1mNwDa+LhFEzB6CB32+wfJMumfr6degvLT
# e8x55urQLeTjimBQgS49BSUkhFN7ois3cZyNpnrMca5AZaC7pLI72vuqSsSlLalG
# OcZmPHZGYJqZ0BacN274OZ80Q8B11iNokns9Od348bMb5Z4fihxaBWebl8kWEi2O
# PvQImOAeq3nt7UWJBzJYLAGEpfasaA3ZQgIcEXdD+uwo6ymMzDY6UamFOfYqYWXk
# ntxDGu7ngD2ugKUuccYKJJRiiz+LAUcj90BVcSHRLQop9N8zoALr/1sJuwPrVAtx
# HNEgSW+AKBqIxYWM4Ev32l6agSUAezLMbq5f3d8x9qzT031jMDT+sUAoCw0M5wVt
# CUQcqINPuYjbS1WgJyZIiEkBMIIHejCCBWKgAwIBAgIKYQ6Q0gAAAAAAAzANBgkq
# hkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5
# IDIwMTEwHhcNMTEwNzA4MjA1OTA5WhcNMjYwNzA4MjEwOTA5WjB+MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQg
# Q29kZSBTaWduaW5nIFBDQSAyMDExMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
# CgKCAgEAq/D6chAcLq3YbqqCEE00uvK2WCGfQhsqa+laUKq4BjgaBEm6f8MMHt03
# a8YS2AvwOMKZBrDIOdUBFDFC04kNeWSHfpRgJGyvnkmc6Whe0t+bU7IKLMOv2akr
# rnoJr9eWWcpgGgXpZnboMlImEi/nqwhQz7NEt13YxC4Ddato88tt8zpcoRb0Rrrg
# OGSsbmQ1eKagYw8t00CT+OPeBw3VXHmlSSnnDb6gE3e+lD3v++MrWhAfTVYoonpy
# 4BI6t0le2O3tQ5GD2Xuye4Yb2T6xjF3oiU+EGvKhL1nkkDstrjNYxbc+/jLTswM9
# sbKvkjh+0p2ALPVOVpEhNSXDOW5kf1O6nA+tGSOEy/S6A4aN91/w0FK/jJSHvMAh
# dCVfGCi2zCcoOCWYOUo2z3yxkq4cI6epZuxhH2rhKEmdX4jiJV3TIUs+UsS1Vz8k
# A/DRelsv1SPjcF0PUUZ3s/gA4bysAoJf28AVs70b1FVL5zmhD+kjSbwYuER8ReTB
# w3J64HLnJN+/RpnF78IcV9uDjexNSTCnq47f7Fufr/zdsGbiwZeBe+3W7UvnSSmn
# Eyimp31ngOaKYnhfsi+E11ecXL93KCjx7W3DKI8sj0A3T8HhhUSJxAlMxdSlQy90
# lfdu+HggWCwTXWCVmj5PM4TasIgX3p5O9JawvEagbJjS4NaIjAsCAwEAAaOCAe0w
# ggHpMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRIbmTlUAXTgqoXNzcitW2o
# ynUClTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYD
# VR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRyLToCMZBDuRQFTuHqp8cx0SOJNDBa
# BgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2Ny
# bC9wcm9kdWN0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3JsMF4GCCsG
# AQUFBwEBBFIwUDBOBggrBgEFBQcwAoZCaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraS9jZXJ0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3J0MIGfBgNV
# HSAEgZcwgZQwgZEGCSsGAQQBgjcuAzCBgzA/BggrBgEFBQcCARYzaHR0cDovL3d3
# dy5taWNyb3NvZnQuY29tL3BraW9wcy9kb2NzL3ByaW1hcnljcHMuaHRtMEAGCCsG
# AQUFBwICMDQeMiAdAEwAZQBnAGEAbABfAHAAbwBsAGkAYwB5AF8AcwB0AGEAdABl
# AG0AZQBuAHQALiAdMA0GCSqGSIb3DQEBCwUAA4ICAQBn8oalmOBUeRou09h0ZyKb
# C5YR4WOSmUKWfdJ5DJDBZV8uLD74w3LRbYP+vj/oCso7v0epo/Np22O/IjWll11l
# hJB9i0ZQVdgMknzSGksc8zxCi1LQsP1r4z4HLimb5j0bpdS1HXeUOeLpZMlEPXh6
# I/MTfaaQdION9MsmAkYqwooQu6SpBQyb7Wj6aC6VoCo/KmtYSWMfCWluWpiW5IP0
# wI/zRive/DvQvTXvbiWu5a8n7dDd8w6vmSiXmE0OPQvyCInWH8MyGOLwxS3OW560
# STkKxgrCxq2u5bLZ2xWIUUVYODJxJxp/sfQn+N4sOiBpmLJZiWhub6e3dMNABQam
# ASooPoI/E01mC8CzTfXhj38cbxV9Rad25UAqZaPDXVJihsMdYzaXht/a8/jyFqGa
# J+HNpZfQ7l1jQeNbB5yHPgZ3BtEGsXUfFL5hYbXw3MYbBL7fQccOKO7eZS/sl/ah
# XJbYANahRr1Z85elCUtIEJmAH9AAKcWxm6U/RXceNcbSoqKfenoi+kiVH6v7RyOA
# 9Z74v2u3S5fi63V4GuzqN5l5GEv/1rMjaHXmr/r8i+sLgOppO6/8MO0ETI7f33Vt
# Y5E90Z1WTk+/gFcioXgRMiF670EKsT/7qMykXcGhiJtXcVZOSEXAQsmbdlsKgEhr
# /Xmfwb1tbWrJUnMTDXpQzTGCGicwghojAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNp
# Z25pbmcgUENBIDIwMTECEzMAAAOvMEAOTKNNBUEAAAAAA68wDQYJYIZIAWUDBAIB
# BQCggbAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEO
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIDQrWOHE7zuV+X0yI69nvlvB
# nrfLfp3KdU5lO2pqPJeLMEQGCisGAQQBgjcCAQwxNjA0oBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEcgBpodHRwczovL3d3dy5taWNyb3NvZnQuY29tIDANBgkqhkiG9w0B
# AQEFAASCAQChXErGlawm/HrpdaWZs4C9mAZ5vx03jjsxygTQsBxm3ByO9xeqQAsc
# g9NGZGCov3xN/Ki6cjdEHUpjAbjAOihl0YAPNCPOGrsjkoc2ybmtTqHKTupVr/uI
# LexVkYyQeTTx0dEGhSgH+Ir4O1z5MRQBtcdPDHoPbi6dnHbtes67Z2MlJ/0U5GN1
# DV8sfCPvM2VcqGTye3vundPD67zmhqOB7O003ZOgk8EaMms7WaLIlmhrSRlLp+bS
# vsmNAde+NiqiSVZastgL0BRyFlcDfrzG3cZCmtEHlfamaJCQ6KtnO75b7UJ9Rxaq
# ZxVS65sIZ3b/8fYm64z99mG1wIPRelrqoYIXrzCCF6sGCisGAQQBgjcDAwExgheb
# MIIXlwYJKoZIhvcNAQcCoIIXiDCCF4QCAQMxDzANBglghkgBZQMEAgEFADCCAVoG
# CyqGSIb3DQEJEAEEoIIBSQSCAUUwggFBAgEBBgorBgEEAYRZCgMBMDEwDQYJYIZI
# AWUDBAIBBQAEILmJ0fOh3GBSjFaEKVg4QJzCzXi/IYfGgC0BXVj5r/xXAgZm63zi
# EuoYEzIwMjQxMDA0MjEzMDA1LjczMVowBIACAfSggdmkgdYwgdMxCzAJBgNVBAYT
# AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJ
# cmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMeblNoaWVsZCBUU1Mg
# RVNOOjZGMUEtMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFt
# cCBTZXJ2aWNloIIR/TCCBygwggUQoAMCAQICEzMAAAH8GKCvzGlahzoAAQAAAfww
# DQYJKoZIhvcNAQELBQAwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0
# b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
# dGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwHhcN
# MjQwNzI1MTgzMTE0WhcNMjUxMDIyMTgzMTE0WjCB0zELMAkGA1UEBhMCVVMxEzAR
# BgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
# Y3Jvc29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQg
# T3BlcmF0aW9ucyBMaW1pdGVkMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046NkYx
# QS0wNUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZp
# Y2UwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCnUMAovGltBw9Vg8eU
# kfJbtbmUFmMlZYOMx+XlbKG4DKU/8sObaFvjKZSZLKZXQQVFByYzwHKnCOFY/wXv
# HiI7zx370Zn0xCY2HeNIOiGFdeB/ys40QDJ8I9WYnMzvK2y6tn3Ghxu4Qvv4/sSQ
# jCg64wWVMXYb/O6rHUT7AA2yWk+o+lvw8LnoFDGAkIjUs4XmWTcB48nvw4vdrD81
# 2WS91WXdWAFI9fg1rC3dSBSh+4+f9yn2/AooHC4hZAQVnzfsZdchOyF3Yx+zqhh/
# FcS2aPZIEYSHFWzvERG5YZvRwrpp/LudoqRtkja/VSqzG5m33iuf97LbKe+6eXHR
# Hr9vqc2QLWs5MB9aWmwCP9CXPIzq5hNLFhkLZhbMtttGXSVG1LP7hN2lRT+gBlIH
# 5j6zXZGqaDOLtFXE1wjaWb/+wISboDrecIkKBi0z4st72lOyGX9Z/w4649BGID6y
# 1OyDz0E4b21uVrPaR946Rh/mF0fymEBu464NB+vqzlhrpb69nPoTRmx6fOLQ60x/
# lEJraEANhWBTEP6CsLwSm19Z5UBaBgJpAWF4039kY1AySTvxXrfKg8F98kQC74Hn
# GVM9iiKNR2j01ei8magZePpHxOCyj5A9oAYcrEJsdrVAv0BIwXc6zWOuiAIcaLKR
# +nV0oaeYDnAlPo3HsF52VIOwCQIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFJjxpSux
# RrOHEHIfv12GJAIv/tB2MB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1Gely
# MF8GA1UdHwRYMFYwVKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lv
# cHMvY3JsL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNy
# bDBsBggrBgEFBQcBAQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9z
# b2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBD
# QSUyMDIwMTAoMSkuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYB
# BQUHAwgwDgYDVR0PAQH/BAQDAgeAMA0GCSqGSIb3DQEBCwUAA4ICAQBPuyz9kBnR
# tNoWyuyIlh3/8tDoiYpv0llIqJHD3GzyHCTlj/vOKCf2Aa3B5EKELaUnwZVEeCsW
# QHEAKO64+mtLP9RhfufnbYkpy52da4h4TWnfQFmuo9M6exwP3wNmLpY1MDKadpLu
# K3moCA0iet4AltNTZwCiwmh5cAevnRiBIaWYkz5w3qZgsAvpNMUy0Vgmukr1MzlH
# KHl5mabpRMmcaDSO3WkX/a7w9J3Pd0PLsMXsoMlp3aofFk5G8zeT1Xxifckjlgs+
# 4uyjYnmzd+lfIJWBH+GrzqDnON31tFHLKILyIsib833mrodZWwJ7JJ62up+wPJhZ
# K3Av3qHLsMjIsvmKHxgUx3QB2a9NGjKWYAO4rATZNAJO8+eOcuTvKklbb23XtjJr
# hX4mXPniwGc9TuQh5hmy9RP5gqDKQ/VAH6n65R1Efp7v1VqLP6J7Basglni1eQMy
# YvbWeHSP7nwTV5wBgO9PoHjIUh6ifED/oaX1ezsktyI8IgLqEZ2WKIQGnJh5QXSi
# FkWfs0pC7zQhnSN3nXVYDZurrH1pSr/MXJ/wSDD526dSPUq02hamrtW4mpqlyRiy
# a+aZgdlcKMrUS6ztXUj5peOsFi6rIz1Cl4VlThTTVgbXm5bBQJqPS5mVqH9EZJgx
# 3zjL0MKo6l94oTo8syTuEueG9w5CufE/qTCCB3EwggVZoAMCAQICEzMAAAAVxedr
# ngKbSZkAAAAAABUwDQYJKoZIhvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRp
# ZmljYXRlIEF1dGhvcml0eSAyMDEwMB4XDTIxMDkzMDE4MjIyNVoXDTMwMDkzMDE4
# MzIyNVowfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQG
# A1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwggIiMA0GCSqGSIb3
# DQEBAQUAA4ICDwAwggIKAoICAQDk4aZM57RyIQt5osvXJHm9DtWC0/3unAcH0qls
# TnXIyjVX9gF/bErg4r25PhdgM/9cT8dm95VTcVrifkpa/rg2Z4VGIwy1jRPPdzLA
# EBjoYH1qUoNEt6aORmsHFPPFdvWGUNzBRMhxXFExN6AKOG6N7dcP2CZTfDlhAnrE
# qv1yaa8dq6z2Nr41JmTamDu6GnszrYBbfowQHJ1S/rboYiXcag/PXfT+jlPP1uyF
# Vk3v3byNpOORj7I5LFGc6XBpDco2LXCOMcg1KL3jtIckw+DJj361VI/c+gVVmG1o
# O5pGve2krnopN6zL64NF50ZuyjLVwIYwXE8s4mKyzbnijYjklqwBSru+cakXW2dg
# 3viSkR4dPf0gz3N9QZpGdc3EXzTdEonW/aUgfX782Z5F37ZyL9t9X4C626p+Nuw2
# TPYrbqgSUei/BQOj0XOmTTd0lBw0gg/wEPK3Rxjtp+iZfD9M269ewvPV2HM9Q07B
# MzlMjgK8QmguEOqEUUbi0b1qGFphAXPKZ6Je1yh2AuIzGHLXpyDwwvoSCtdjbwzJ
# NmSLW6CmgyFdXzB0kZSU2LlQ+QuJYfM2BjUYhEfb3BvR/bLUHMVr9lxSUV0S2yW6
# r1AFemzFER1y7435UsSFF5PAPBXbGjfHCBUYP3irRbb1Hode2o+eFnJpxq57t7c+
# auIurQIDAQABo4IB3TCCAdkwEgYJKwYBBAGCNxUBBAUCAwEAATAjBgkrBgEEAYI3
# FQIEFgQUKqdS/mTEmr6CkTxGNSnPEP8vBO4wHQYDVR0OBBYEFJ+nFV0AXmJdg/Tl
# 0mWnG1M1GelyMFwGA1UdIARVMFMwUQYMKwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUH
# AgEWM2h0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0
# b3J5Lmh0bTATBgNVHSUEDDAKBggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMA
# dQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAW
# gBTV9lbLj+iiXGJo0T2UkFvXzpoYxDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8v
# Y3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXRf
# MjAxMC0wNi0yMy5jcmwwWgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8yMDEw
# LTA2LTIzLmNydDANBgkqhkiG9w0BAQsFAAOCAgEAnVV9/Cqt4SwfZwExJFvhnnJL
# /Klv6lwUtj5OR2R4sQaTlz0xM7U518JxNj/aZGx80HU5bbsPMeTCj/ts0aGUGCLu
# 6WZnOlNN3Zi6th542DYunKmCVgADsAW+iehp4LoJ7nvfam++Kctu2D9IdQHZGN5t
# ggz1bSNU5HhTdSRXud2f8449xvNo32X2pFaq95W2KFUn0CS9QKC/GbYSEhFdPSfg
# QJY4rPf5KYnDvBewVIVCs/wMnosZiefwC2qBwoEZQhlSdYo2wh3DYXMuLGt7bj8s
# CXgU6ZGyqVvfSaN0DLzskYDSPeZKPmY7T7uG+jIa2Zb0j/aRAfbOxnT99kxybxCr
# dTDFNLB62FD+CljdQDzHVG2dY3RILLFORy3BFARxv2T5JL5zbcqOCb2zAVdJVGTZ
# c9d/HltEAY5aGZFrDZ+kKNxnGSgkujhLmm77IVRrakURR6nxt67I6IleT53S0Ex2
# tVdUCbFpAUR+fKFhbHP+CrvsQWY9af3LwUFJfn6Tvsv4O+S3Fb+0zj6lMVGEvL8C
# wYKiexcdFYmNcP7ntdAoGokLjzbaukz5m/8K6TT4JDVnK+ANuOaMmdbhIurwJ0I9
# JZTmdHRbatGePu1+oDEzfbzL6Xu/OHBE0ZDxyKs6ijoIYn/ZcGNTTY3ugm2lBRDB
# cQZqELQdVTNYs6FwZvKhggNYMIICQAIBATCCAQGhgdmkgdYwgdMxCzAJBgNVBAYT
# AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJ
# cmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMeblNoaWVsZCBUU1Mg
# RVNOOjZGMUEtMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFt
# cCBTZXJ2aWNloiMKAQEwBwYFKw4DAhoDFQBOQSklc5qojbB+oGzDg0tXCpiqqqCB
# gzCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
# VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAk
# BgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEB
# CwUAAgUA6qppvTAiGA8yMDI0MTAwNDEzMTg1M1oYDzIwMjQxMDA1MTMxODUzWjB2
# MDwGCisGAQQBhFkKBAExLjAsMAoCBQDqqmm9AgEAMAkCAQACARQCAf8wBwIBAAIC
# EywwCgIFAOqruz0CAQAwNgYKKwYBBAGEWQoEAjEoMCYwDAYKKwYBBAGEWQoDAqAK
# MAgCAQACAwehIKEKMAgCAQACAwGGoDANBgkqhkiG9w0BAQsFAAOCAQEAhlljo0Zj
# hnuspBPClrG+Lbmlp1eoFzpXaDqo+Fs3efO/rngNZ0fQJzG9bZ2Bd8ZH3S7iOY3u
# 7PnjyM0ZDiPetxlfBiOD4NAn4kL07p4qyXfVER/sG61WsgZ7toS0O1bMKemPgdCH
# 6bE9chWD9OfoUcfBqQPMv8gpES8biGZ/nYyg/lmd9Gc9NeQ2Tt6TnbhsAaosrQia
# 66cPrmlTH6ITaQ1/330OqqmErxHS5/BKAdzZMTGuTIQfwTR7PKrcVb5UYFsygFWY
# gd3IeLvC18KZWCeZkXCd4OgSNevEC14FZI0rU02UCiaT1n9LLHDRHYFOQxGzHKgB
# CZrCsnrjsiM+CzGCBA0wggQJAgEBMIGTMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBD
# QSAyMDEwAhMzAAAB/Bigr8xpWoc6AAEAAAH8MA0GCWCGSAFlAwQCAQUAoIIBSjAa
# BgkqhkiG9w0BCQMxDQYLKoZIhvcNAQkQAQQwLwYJKoZIhvcNAQkEMSIEIHvF7rqr
# LWzWEOz9HZTvQE3VXujoEoYjryYsAg7jRenAMIH6BgsqhkiG9w0BCRACLzGB6jCB
# 5zCB5DCBvQQglUKvkLvv4fwTlT+MMHlMGx7glIYfk+4at3eTAmjRLWIwgZgwgYCk
# fjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQD
# Ex1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAfwYoK/MaVqHOgAB
# AAAB/DAiBCDSCJLTnxllR8geH4qflpuwkuHL/HJnKws9RjK5OvTgnTANBgkqhkiG
# 9w0BAQsFAASCAgA2jIL8nl0UqosKRJ37zGz2nBm0xmA8TjBFwdJ0HWjffTrtvfQo
# tXWHF4J8FpBeT1y/4DNBcHvjLVHahSLqB/4WuT3/svNIzvmMaLTYY22IeUANNcyx
# BhYGwHPlXXJzwuua+3RT+rTpAq6wjOG1n22twjIO0EGdY9Nv2E4GmL3lqSlEFdHi
# YCIqXV2oOiqkfYr0XWKy2QnauYYpvkugoqKHNrZCZYz9rQBABmtX0Fzs7+id5NfI
# YVN2xuk64xmsvMs83bv5F/ABHwoICoezTFDNxD8gFVeWt/Q1t+6ULbZ8HXtaeKXB
# W+T9fA8vXng3CSTBzVmHalh5AZa/I99FzVbBu1bcMaewX4yUmGqHpFbnwaYGLCvk
# vhzblj50o3DrtH5PMTKnQb7fof8p6vp92tHi+OVub/gvYqGtPAnUxUQZRC/mY9U4
# JTckYgnhBa/TY76yQUUjk5fw6bRjQCUihtubatElD12fhhFnK0Qh4xVs4YYho2gl
# frzfMbFp1371rsRirkzd15oo9qDcS8UOkAoQjF3ftVyAceGJojI+QI8x1hxq0/X7
# txb2v93dzXOaAw7uvG0q0ra02G6dnPfvNUFYeLtQ34mCnBVt/++O89EnBjNx3Vno
# 5YGD3uF5y5tgp2sg7RLiv5XltHJEg4DfSqsle7CppLixJQV4bOF2qVlxXg==
# SIG # End signature block
