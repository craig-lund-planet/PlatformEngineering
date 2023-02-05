<# LICENSE ====================================================================
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in 
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
=============================================================================#>
#region PARAMETERS ============================================================
[CmdletBinding()]
param (
    # Enter the domain name of the environment to connect to. Example: For https://contoso.crm.dynamics.com/ the domain name would be contoso.
    [Parameter(Mandatory)]
    [string]$DomainName,
    # Enter the domain suffix of the environment to connect to. Example: For https://contoso.crm.dynamics.com/ the domain suffix would be crm.dynamics.com.
    [Parameter(Mandatory)]
    [string]$DomainSuffix,
    # If connecting with Service Principle, Enter the Client ID for the Service Principle as a string. Otherwise, leave blank.
    [Parameter(Mandatory)]
    [string]$ClientID,
    # If connecting with Service Principle, Enter the Client Secret for the Service Principle as a string. Otherwise, leave blank.
    [Parameter(Mandatory)]
    [string]$ClientSecret,
    # Enter the Tenant ID for the service principal as a string.
    [Parameter(Mandatory)]
    [string]$TenantID,
    # Enter the name of the solution to import.
    [Parameter(Mandatory)]
    [string]$SolutionName,
    # Enter the solution source path. $(System.DefaultWorkingDirectory)\solutionSrc or $(System.DefaultWorkingDirectory)\_release\solutionSrc
    [Parameter(Mandatory)]
    [string]$SolutionSrcFolderPath,   
    # Enter the path to the artifact folder. $(System.ArtifactsDirectory)
    [Parameter(Mandatory)]
    [string]$ArtifactPath
)
#endregion ====================================================================
#region FUNCTIONS =============================================================
function Convert-SolutionVersionPalm {
    param (
        [Parameter(Mandatory)][String] $Version
    )
    if ($null -eq $Version) {
        
        return $null
    }
    $_temp = $null
    $_major = $null
    $_minor = $null
    $_build = $null
    $_revision = $null
    $_versionArray = $null
    $_versionArray = $Version.ToCharArray()
    for ($i = 0; $i -lt $_versionArray.Count; $i++) {
        
        switch ($_versionArray[$i]) {

            '0' { 
        
                if ($null -eq $_temp) {
                        
                    $_temp = 0
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
                else {
                    
                    $_temp = ($_temp*10)+0
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
             }
            '1' { 
        
                if ($null -eq $_temp) {
                        
                    $_temp = 1
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
                else {
                    
                    $_temp = ($_temp*10)+1
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
             }
            '2' { 

                if ($null -eq $_temp) {
                        
                    $_temp = 2
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
                else {
                    
                    $_temp = ($_temp*10)+2
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
             }
            '3' { 

                if ($null -eq $_temp) {
                        
                    $_temp = 3
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
                else {
                    
                    $_temp = ($_temp*10)+3
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
             }
            '4' { 

                if ($null -eq $_temp) {
                        
                    $_temp = 4
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
                else {
                    
                    $_temp = ($_temp*10)+4
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
             }
            '5' { 

                if ($null -eq $_temp) {
                        
                    $_temp = 5
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
                else {
                    
                    $_temp = ($_temp*10)+5
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
             }
            '6' { 

                if ($null -eq $_temp) {
                        
                    $_temp = 6
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
                else {
                    
                    $_temp = ($_temp*10)+6
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
             }
            '7' { 

                if ($null -eq $_temp) {
                        
                    $_temp = 7
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
                else {
                    
                    $_temp = ($_temp*10)+7
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
             }
            '8' { 

                if ($null -eq $_temp) {
                        
                    $_temp = 8
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
                else {
                    
                    $_temp = ($_temp*10)+8
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
             }
            '9' { 

                if ($null -eq $_temp) {
                        
                    $_temp = 9
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
                else {
                    
                    $_temp = ($_temp*10)+9
                    if ($i -eq $_versionArray.Count-1) {
                    
                        $_revision = $_temp          
                    }
                }
             }
            '.' { 
        
                if ($null -eq $_major) {
                        
                    $_major = $_temp
                    $_temp = $null
                }
                if ($null -eq $_minor) {
                    
                    $_minor = $_temp
                    $_temp = $null
                }
                if ($null -eq $_build) {
                    
                    $_build = $_temp
                    $_temp = $null
                }
            }
        }
    }
    $_tempVersion = New-Object System.Object
    $_tempVersion | Add-Member -MemberType NoteProperty -Name "Major" -Value $_major
    $_tempVersion | Add-Member -MemberType NoteProperty -Name "Minor" -Value $_minor
    $_tempVersion | Add-Member -MemberType NoteProperty -Name "Build" -Value $_build
    $_tempVersion | Add-Member -MemberType NoteProperty -Name "Revision" -Value $_revision

    return $_tempVersion
}
#endregion ====================================================================
#region XRM POWERSHELL TOOL INSTALL ===========================================
Write-Host "Checking Install of Tools..."
if ($null -eq (Get-Package -Name Microsoft.Xrm.Data.Powershell -ErrorAction SilentlyContinue)) {

    Write-Host "Installing XRM Data PowerShell..."
    Install-Module -Name Microsoft.Xrm.Data.Powershell -Force -WarningAction:SilentlyContinue -InformationAction:SilentlyContinue
}
else {
    
    Write-Host "XRM Data PowerShell Installed."
}
#endregion ====================================================================
#region CREATE POWERSHELL CONNECTION ==========================================
Write-Host "Connecting to $DomainName..."
$_Connection = Connect-CrmOnline -ServerUrl "https://$DomainName.$DomainSuffix/" -ClientSecret "$ClientSecret" -OAuthClientId "$ClientID"
#endregion ====================================================================
Write-Host "Determining Import Type..."
#region GET SOURCE ============================================================
$_SrcSolutionfound = $false
$_SrcSolutionCurrent = $null
$_SrcSolutionVersion = $null
if (!(Test-Path $SolutionSrcFolderPath\$SolutionName)) {

    Write-Warning "No solution found at path $SolutionSrcFolderPath\$SolutionName!"
    $_SrcSolutionfound = $false
}
else {

    Write-Host "Solution Source Path "$SolutionSrcFolderPath\$SolutionName" found."
    $_SolutionXMLs = Get-ChildItem -Path $SolutionSrcFolderPath\$SolutionName\Other\Solution.xml -Force
    $_Count = $_SolutionXMLs.Count
    Write-Host "Source Solution Count $_Count"
    foreach ($_SolutionXML in $_SolutionXMLs) {

        $_srcSolution = $null
        [xml]$_srcSolution = Get-Content $_SolutionXML        
        if ($_srcSolution.ImportExportXml.SolutionManifest.UniqueName -eq $SolutionName) {
            
            $_SrcSolutionfound = $true
            $_SrcSolutionCurrent = $_srcSolution
            $_SrcSolutionVersion = Convert-SolutionVersionPalm -Version $_SrcSolutionCurrent.ImportExportXml.SolutionManifest.Version
        }
        Write-Host "Found source solution:"$_SrcSolutionCurrent.ImportExportXml.SolutionManifest.UniqueName", Version:"$_SrcSolutionVersion.Major"."$_SrcSolutionVersion.Minor"."$_SrcSolutionVersion.Build"."$_SrcSolutionVersion.Revision
    }
    
}
#endregion ====================================================================
#region GET ENVIRONMENT =======================================================
$_EnvSolutionFound = $false
$_EnvSolutionCurrent = $null
$_EnvSolutionVersion = $null
if ($null -eq $_Connection -or $_Connection.IsReady -eq $false) {
    
    Write-Error "Connection not ready!"
}
else {
    
    Write-Host "Getting Solution Version..."
    $_EnvSolutions = Get-CrmRecords -EntityLogicalName solution -FilterAttribute uniquename -FilterOperator eq -FilterValue $SolutionName -Fields version, ismanaged, uniquename -conn $_Connection -WarningAction:SilentlyContinue
    if ($null -ne $_EnvSolutions.Count -and $_EnvSolutions.Count -gt 0) {

        foreach ($_EnvSolution in $_EnvSolutions.CrmRecords) {
        
            if ($_EnvSolution.uniquename -eq $SolutionName) {
                
                $_EnvSolutionFound = $true
                $_EnvSolutionCurrent = $_EnvSolution
                $_EnvSolutionVersion = Convert-SolutionVersionPalm -Version $_EnvSolutionCurrent.version
            }
        }
        Write-Host "Found environment solution:"$_EnvSolutionCurrent.uniquename", Version: "$_EnvSolutionVersion.Major"."$_EnvSolutionVersion.Minor"."$_EnvSolutionVersion.Build"."$_EnvSolutionVersion.Revision
    }
    else {
    
        Write-Warning "No environment solutions found!"
        $_EnvSolutionFound = $false
    }
}
#endregion ====================================================================
#region SET IMPORT TYPE =======================================================
if ($_SrcSolutionfound -and $_EnvSolutionFound) {

    if ($_SrcSolutionVersion.Major -gt $_SrcSolutionVersion.Major -or $_SrcSolutionVersion.Minor -gt $_EnvSolutionVersion.Minor ) {
    
        Write-Host "Major or Minor Source version higher than target, perform upgrade."
        Write-Host "##vso[task.setvariable variable=SolutionImportType]Upgrade"
    }
    elseif ($_SrcSolutionVersion.Build -gt $_EnvSolutionVersion.Build -or $_SrcSolutionVersion.Revision -gt $_EnvSolutionVersion.Revision) {
        
        <#
        Write-Host "Build or Revision Source version higher than target, perform upgrade."
        Write-Host "##vso[task.setvariable variable=SolutionImportType]Upgrade"
        #>

        # CHANGE TO THIS WHEN DESIRING TO PERFORM PATHING OR A SOLUTION CLONEING MODEL.
        Write-Host "Build or Revision Source version higher than target, perform update."
        Write-Host "##vso[task.setvariable variable=SolutionImportType]Update"
        
    }
    else {
        
        Write-Host "Source version the same or lower than target, skip import."
        Write-Host "##vso[task.setvariable variable=SolutionImportType]Skip"
    }
}
else {

    if (!$_EnvSolutionFound) {
        
        Write-Host "Environment Solution not found, perform initial install"
        Write-Host "##vso[task.setvariable variable=SolutionImportType]Update"
    }
    else {
        
        Write-Host "Source Solution not found, skip import."
        Write-Host "##vso[task.setvariable variable=SolutionImportType]Skip"
    }
}
#endregion ====================================================================