<#
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
#>
#region Parameters
[CmdletBinding()]
param (
    # Enter the domain name of the environment to connect to. Example: For https://contoso.crm.dynamics.com/ the domain name would be contoso.
    [Parameter()]
    [string]$DomainName,
    # Enter the domain suffix of the environment to connect to. Example: For https://contoso.crm.dynamics.com/ the domain suffix would be crm.dynamics.com.
    [Parameter()]
    [string]$DomainSuffix,
    # Enter the Client ID for the Service Principle as a string.
    [Parameter()]
    [string]$ClientID,
    # Enter the Client Secret for the Service Principle as a string.
    [Parameter()]
    [string]$ClientSecret,
    # Enter the Tenant ID for the service principal as a string.
    [Parameter()]
    [string]$TenantID,
    # Enter the name of the solution to export.
    [Parameter()]
    [string]$SolutionName,
    # Enter the path to the artifact folder. $(System.ArtifactsDirectory) 
    [Parameter()]
    [string]$ArtifactPath = "C:\Temp\",
    # Enter the source path to the solution source folder. $(System.DefaultWorkingDirectory)\ 
    [Parameter()]
    [string]$SourcePath = ".\"
)
#endregion
#region Install Power Platform CLI tools
    # Have Power Platform CLI installed local.
#endregion
#region Create Zip File Names
$_UnmanagedSolutionZipFileName = $SolutionName+".zip"
$_ManagedSolutionZipFileName = $SolutionName+"_managed.zip"
$_settingsFilename = $DomainName+".settings."+$SolutionName+".json"
#endregion
#region Install Power Platform PowerShell Tools
Write-Host "Checking Install of Tools..."
if ($null -eq (Get-Package -Name Microsoft.Xrm.Data.Powershell -ErrorAction SilentlyContinue)) {

    Write-Host "Installing XRM Data PowerShell..."
    Install-Module -Name Microsoft.Xrm.Data.Powershell -Force -WarningAction:SilentlyContinue -InformationAction:SilentlyContinue
}
else {

    Write-Host "XRM Data PowerShell Installed"
}
#endregion
#region Install Power Apps Administration Module
Write-Host "Checking Install of Tools..."
if ($null -eq (Get-Package -Name Microsoft.PowerApps.Administration.PowerShell -ErrorAction SilentlyContinue)) {

    Write-Host "Installing Power Platform Admin Tools..."
    Install-Module -Name Microsoft.PowerApps.Administration.PowerShell -Force -WarningAction:SilentlyContinue -InformationAction:SilentlyContinue
}   
else {
    
    Write-Host "Power Platform Admin Tools Installed."
}
#endregion
#region enable Telemetry
pac telemetry enable
#endregion
#region Create PowerShell Connection
Write-Host "Connecting to"$DomainName"..."
$_Connection = Connect-CrmOnline -ServerUrl "https://$DomainName.$DomainSuffix/" -ClientSecret "$ClientSecret" -OAuthClientId "$ClientID"
#endregion
#region Create Power Platform CLI Profile Public, UsGov, UsGovHigh, UsGovDod, China
pac auth create --name $DomainName --url "https://$DomainName.$DomainSuffix/" --applicationId "$ClientId" --clientSecret "$ClientSecret" --tenant "$TenantId" --Cloud "UsGov" # TODO: --cloud variable or discover
#endregion
#region Parse solution version 
if ($_Connection.IsReady -eq $true) {
    
    #>
    Write-Host "Getting Solution Version..."
    $_Solutions = Get-CrmRecords -EntityLogicalName solution -FilterAttribute uniquename -FilterOperator eq -FilterValue $SolutionName -Fields version -conn $_Connection
    #
    if ($_Solutions.Count -gt 0) {
    
        Write-Host "Parsing solution version..."
        $_Solutions.CrmRecords[0].version
        
        $versionArray = $_Solutions.CrmRecords[0].version.ToCharArray()
    
        $_temp = $null
        $_major = $null
        $_minor = $null
        $_build = $null
        $_revision = $null
    
        for ($i = 0; $i -lt $versionArray.Count; $i++) {
        
            switch ($versionArray[$i]) {
    
                '0' { 
            
                    if ($null -eq $_temp) {
                            
                        $_temp = 0
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                    else {
                        
                        $_temp = ($_temp*10)+0
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                 }
                '1' { 
            
                    if ($null -eq $_temp) {
                            
                        $_temp = 1
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                    else {
                        
                        $_temp = ($_temp*10)+1
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                 }
                '2' { 
    
                    if ($null -eq $_temp) {
                            
                        $_temp = 2
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                    else {
                        
                        $_temp = ($_temp*10)+2
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                 }
                '3' { 
    
                    if ($null -eq $_temp) {
                            
                        $_temp = 3
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                    else {
                        
                        $_temp = ($_temp*10)+3
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                 }
                '4' { 
    
                    if ($null -eq $_temp) {
                            
                        $_temp = 4
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                    else {
                        
                        $_temp = ($_temp*10)+4
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                 }
                '5' { 
    
                    if ($null -eq $_temp) {
                            
                        $_temp = 5
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                    else {
                        
                        $_temp = ($_temp*10)+5
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                 }
                '6' { 
    
                    if ($null -eq $_temp) {
                            
                        $_temp = 6
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                    else {
                        
                        $_temp = ($_temp*10)+6
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                 }
                '7' { 
    
                    if ($null -eq $_temp) {
                            
                        $_temp = 7
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                    else {
                        
                        $_temp = ($_temp*10)+7
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                 }
                '8' { 
    
                    if ($null -eq $_temp) {
                            
                        $_temp = 8
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                    else {
                        
                        $_temp = ($_temp*10)+8
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                 }
                '9' { 
    
                    if ($null -eq $_temp) {
                            
                        $_temp = 9
                        if ($i -eq $versionArray.Count-1) {
                        
                            $_revision = $_temp          
                        }
                    }
                    else {
                        
                        $_temp = ($_temp*10)+9
                        if ($i -eq $versionArray.Count-1) {
                        
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
        
        $_major += 0
        $_minor += 0
        $_build += 0
        $_revision += 1
    
        Write-Host $_major'.'$_minor'.'$_build'.'$_revision
        $_SolutionVersion = $_major.ToString()+"."+$_minor.ToString()+"."+$_build.ToString()+"."+$_revision.ToString()
        
    }
    else {
        
        Write-Error "No Solutions found!"
    }
}
else {
    
    Write-Error "Connection not ready!"
}
#endregion
#region Set Solution Version
Write-Host "Setting Solution Version..."
pac solution online-version --solution-name "$SolutionName" --solution-version "$_SolutionVersion"
#endregion#>
#region Publish Customizations
pac solution publish --async true
#endregion
#region Export Solution Unmanaged Values: autonumbering, calendar, customization, emailtracking, externalapplications, general, isvconfig, marketing, outlooksynchronization, relationshiproles, sales
Write-Host "Export Unmamaned Solution..."
pac solution export --path "$ArtifactPath\Solutions\$_UnmanagedSolutionZipFileName" --name "$SolutionName" --managed false --include "general,emailtracking,autonumbering,customization,outlooksynchronization".ToLower() --async true --overwrite true
#endregion
#region Export Solution Managed Values: autonumbering, calendar, customization, emailtracking, externalapplications, general, isvconfig, marketing, outlooksynchronization, relationshiproles, sales
Write-Host "Export Managed Solution..."
pac solution export --path "$ArtifactPath\Solutions\$_ManagedSolutionZipFileName" --name "$SolutionName" --managed true --include "general,emailtracking,autonumbering,customization,outlooksynchronization".ToLower() --async true --overwrite true
#endregion
#region Check Solutions PreviewUnitedStates, UnitedStates, Europe, Asia, Australia, Japan, India, Canada, SouthAmerica, UnitedKingdom, France, SouthAfrica, Germany, UnitedArabEmirates, Switzerland, Norway, Singapore, Korea, USGovernment, USGovernmentL4, USGovernmentL5DoD, China
Write-Host "Checking Solution..."
pac solution check --path "$ArtifactPath\Solutions\$_ManagedSolutionZipFileName" --outputDirectory "$ArtifactPath\PowerAppsChecker\" --geo "PreviewUnitedStates" # TODO: --geo variable or discover
#endregion
#region Create Settings file
pac solution create-settings --solution-zip "$ArtifactPath\Solutions\$_ManagedSolutionZipFileName" --settings-file "$SourcePath\config\deployment-settings\reference\$_settingsFilename"
#endregion
#region Unpack Solution
pac solution unpack --zipfile "$ArtifactPath\Solutions\$_UnmanagedSolutionZipFileName" --folder "$SourcePath\solutionSrc\$SolutionName" --packagetype Both --allowDelete true --allowWrite true --clobber true --processCanvasApps false
#endregion
#region Clear auth profiles
pac auth clear
$_Connection = $null
#endregion
