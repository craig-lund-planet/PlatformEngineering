# Introduction 
Data and realtionships can be exported and maintained in target environments. Data can be downloaded and expanded into soudce control. Please follow any Data Management Policies required by your organization.    
## Work with Data using Microsoft.Xrm.Tooling.ConfigurationMigration RequiredVersion 1.0.0.61
```powershell
Connect-CrmOnline 
    
    -ServerUrl "https://$DomainName.$DomainSuffix/" 
    -ClientSecret $ClientSecret 
    -OAuthClientId $ClientID 

Export-CrmDataFile 
    
    -CrmConnection $_Connection 
    -SchemaFile $_schemaFilePath 
    -DataFile $_artifactFilePath

Import-CrmDataFile 
    
    -CrmConnection $_Connection 
    -DataFile $_dataFilePath
```
## Work with Data using Power Platform CLI
### Export data  
```azurecli
pac data export

  --schemaFile                Schema file name. It can be created using Configuration Migration Tool (alias: -sf)
  --dataFile                  File name for data zip file. Default data.zip (alias: -df)
  --overwrite                 Allow overwrite output data file if it already exists (alias: -o)
  --verbose                   Output more diagnostic information during data import/export (alias: -v)
  --environment               Environment (id, org id, url, unique name or partial name) (alias: -env)
```
### Import data  
```azurecli
pac data import

  --data                      Zip file or directory name with data for import (alias: -d)
  --verbose                   Output more diagnostic information during data import/export (alias: -v)
  --environment               Environment (id, org id, url, unique name or partial name) (alias: -env)
  --dataDirectory             (deprecated) Directory name with data for import (alias: -dd)
```
### Launch Configuration Migration Tool (CMT)  
```azurecli
pac tool cmt [--update] [--clear]

    cmt                       Launch Configuration Migration Tool (CMT)
  --update                    Update tool to latest available version from nuget.org (alias: -u)
  --clear                     Clear tool from local file cache (alias: -c)
```
### List available Dataverse applications from AppSource  
```azurecli
pac application list [--environment] [--output] [--installState] [--environment-id]

  --environment               List available Dataverse applications for given environment (by id or url); if not specified, list all applications in the tenant (alias: -env)
  --output                    Location of the JSON file to be created with list of the Dataverse applications from AppSource (alias: -o)
  --installState              Filter by application install state (alias: -s) Values: NotInstalled, Installed, All
```
### Installs Dataverse application to given environment  
```azurecli
pac application install [--environment] [--application-name] [--application-list] [--environment-id]

  --environment               List available Dataverse applications for given environment (by id or url); if not specified, list all applications in the tenant (alias: -env)
  --application-name          Unique name of the application that will be installed to target environment (alias: -an)
  --application-list          Location of the JSON file with list of the Dataverse applications from AppSource to be installed (alias: -al)
```
## Work with Data using Xrm.Framework.CI.PowerShell.Cmdlets RequiredVersion 9.1.0.1
```powershell

    # Enter the name of the data set.
    [Parameter(Mandatory)]
    [string]$DataSetName,
    # Enter the path to the source config folder. Assumes child folders or Schemas and Data.
    [Parameter()]
    [string]$ConfigFolderPath,
    # Enter the path to the artifacts folder.  
    [Parameter()]
    [string]$ArtifactFolderPath

$_artifactFilePath = $ArtifactFolderPath+"\data\"+$DataSetName+"_data.zip"
$_dataFolderPath = $ConfigFolderPath+"\data\"+$DataSetName+"\"

Expand-XrmCMData 
    
    -DataZip <string> $_artifactFilePath
    -Folder <string> $_dataFolderPath
    [-SplitDataXmlFile] True | False
    [-SortDataXmlFile] True | False
    [<CommonParameters>]

Compress-XrmCMData 
    
    -DataZip <string> $_artifactFilePath
    -Folder <string> $_dataFolderPath
    [-CombineDataXmlFile] True | False
    [<CommonParameters>]

```
- [XRM PowerShell](https://www.powershellgallery.com/packages/Microsoft.Xrm.Data.Powershell)
- [XRM Configuration Migration PowerShell](https://www.powershellgallery.com/packages/Microsoft.Xrm.Tooling.ConfigurationMigration)
- [XRM CI PowerShell](https://www.powershellgallery.com/packages/Xrm.Framework.CI.PowerShell.Cmdlets)
- [Power Platform CLI](https://docs.microsoft.com/en-us/power-platform/developer/cli/introduction)
- [Power Platform Build Tools](https://learn.microsoft.com/en-us/power-platform/alm/devops-build-tools)