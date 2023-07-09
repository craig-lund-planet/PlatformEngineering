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
    # Enter the domain suffix of the environment to connect to. Example: For https://contoso.crm.dynamics.com/ the domain name would be crm.dynamics.com.
    [Parameter()]
    [string]$DomainSuffix,
    # If connecting with Service Principle, Enter the Client ID for the Service Principle as a string. Otherwise, leave blank.
    [Parameter()]
    [string]$ClientID,
    # If connecting with Service Principle, Enter the Client Secret for the Service Principle as a string.
    [Parameter()]
    [string]$ClientSecret,
    # Enter the Tenant ID for the service principal as a string.
    [Parameter()]
    [string]$TenantID,
    # Enter the name of the solution to import.
    [Parameter()]
    [string]$SolutionName,
    # Enter the type of solution to work with. Unmanaged | Managed
    [Parameter()]
    [string]$SolutionPackageType = "Managed",
    # Enter the type of solution import. Update | Upgrade.
    [Parameter()]
    [string]$SolutionImportType = "Update",
    # Enter the value for Overwriting of unamanged layers. True | False.
    [Parameter()]
    [string]$ForceOverwrite = "True",
    # Enter the value for convery unmanaged component to managed. True | False.
    [Parameter()]
    [string]$ConvertToManaged = "False",
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
#endregion
#region enable Telemetry
pac telemetry enable
#endregion
#region Create Power Platform CLI Profile
pac auth create --name $DomainName --url "https://$DomainName.$DomainSuffix/" --applicationId "$ClientId" --clientSecret "$ClientSecret" --tenant "$TenantId"
#endregion
#region Pack & Import Solution
if ($SolutionPackageType.ToLower() -eq "unmanaged") {

    Write-Host "Packing Unmanaged Solution..."
    pac solution pack --zipfile "$ArtifactPath\Solutions\$_UnmanagedSolutionZipFileName" --folder "$SourcePath\solutionSrc\$SolutionName" --packagetype Unmanaged --allowDelete true --allowWrite true --clobber true --processCanvasApps false
    Write-Host "Prepairing Solution Import..."
    pac solution import --path "$ArtifactPath\Solutions\$_UnmanagedSolutionZipFileName" --activate-plugins true --force-overwrite "$ForceOverwrite".ToLower() --settings-file "$SourcePath\config\deployment-settings\$DomainName.settings.$SolutionName.json" --async true 
    pac solution publish --async true
}
elseif ($SolutionPackageType.ToLower() -eq "managed") {
    
    Write-Host "Packing Managed Solution..."
    pac solution pack --zipfile "$ArtifactPath\Solutions\$_ManagedSolutionZipFileName" --folder "$SourcePath\solutionSrc\$SolutionName" --packagetype Managed --allowDelete true --allowWrite true --clobber true --processCanvasApps false

    if ($SolutionImportType.ToLower() -eq "upgrade") {
        
        Write-Host "Importing Holding Solution..."
        pac solution import --path "$ArtifactPath\Solutions\$_ManagedSolutionZipFileName" --activate-plugins true --force-overwrite "$ForceOverwrite".ToLower() --convert-to-managed "$ConvertToManaged".ToLower() --settings-file "$SourcePath\config\deployment-settings\$DomainName.settings.$SolutionName.json" --async true --import-as-holding true
        Write-Host "Upgrading Solution..."
        pac solution upgrade --solution-name "$SolutionName" --async true
    }
    elseif($SolutionImportType.ToLower() -eq "update") {
        
        Write-Host "Importing Solution..."
        pac solution import --path "$ArtifactPath\Solutions\$_ManagedSolutionZipFileName" --activate-plugins true --force-overwrite "$ForceOverwrite".ToLower() --convert-to-managed "$ConvertToManaged".ToLower() --settings-file "$SourcePath\config\deployment-settings\$DomainName.settings.$SolutionName.json" --async true
    }
    else {
        
        Write-Error "Unknown Import Type!"
    }
}
else {
    
    Write-Error "Unknown Package Type!"
}
#endregion
#region Clear Profiles
pac auth clear
#endregion #>