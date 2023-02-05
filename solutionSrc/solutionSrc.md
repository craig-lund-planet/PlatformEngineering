# Introduction
Exported and unpacked solutions will be in this folder.  

## Power Platform CLI Tools - Solution
### Usage: Work with Solutions
```powershell
pac solution [init] [add-reference] [list] [delete] [online-version] [version] [import] [export] [clone] [publish] [upgrade] [add-license] [check] [create-settings] [pack] [unpack]

  init                        Initializes a directory with a new Dataverse solution project
  add-reference               Adds a reference from the project in the current directory to the project at 'path'
  list                        List all Solutions from the current Dataverse Organization
  delete                      Delete Dataverse Solution from the current Dataverse Environment
  online-version              Sets version for solution loaded in Dataverse environment.
  version                     Update build or revision version for solution
  import                      Import the Dataverse Solution into the current Dataverse Environment
  export                      Export a Dataverse Solution from the current Dataverse Environment
  clone                       Create a solution project based on an existing solution in your Organization
  publish                     Publishes all customizations
  upgrade                     Option to stage the Dataverse solution for upgrade
  add-license                 Add license and plan info to solution
  check                       Upload a Dataverse Solution project to run against the PowerApps Checker Service
  create-settings             Create a settings file from solution zip or solution folder.
  pack                        Package solution components on local filesystem into solution.zip (SolutionPackager)
  unpack                      Extract solution components from solution.zip onto local filesystem (SolutionPackager)
  ```
**Export**
```powershell
pac solution export --path --name [--managed] [--include] [--async] [--max-async-wait-time] [--overwrite] [--targetversion]

  --path                      Path where the exported solution zip file will be written (alias: -p)
  --name                      The name of the solution to be exported (alias: -n)
  --managed                   Whether the solution should be exported as a managed solution (alias: -m)
  --include                   Which settings should be included in the solution being exported (alias: -i)
                              Values: autonumbering, calendar, customization, emailtracking, externalapplications, general, isvconfig, marketing, outlooksynchronization, relationshiproles, sales
  --async                     Exports solution asynchronously (alias: -a)
  --max-async-wait-time       Max asynchronous wait time in minutes. Default value is 60 minutes (alias: -wt)
  --overwrite                 The exported solution file can overwrite the solution zip file on the local file system. (alias: -ow)
  --targetversion             (deprecated) The version that the exported solution will support (alias: -v)
```
**Import**
```powershell
pac solution import [--path] [--activate-plugins] [--force-overwrite] [--skip-dependency-check] [--import-as-holding] [--publish-changes] [--convert-to-managed] [--async] [--max-async-wait-time] [--settings-file]

  --path                      Path to solution zip file. If not specified, assumes the current folder is a cdsproj project. (alias: -p)
  --activate-plugins          Activate plug-ins and workflows on the solution (alias: -ap)
  --force-overwrite           Force an overwrite of unmanaged customizations (alias: -f)
  --skip-dependency-check     Skip dependency check against dependencies flagged as product update (alias: -s)
  --import-as-holding         Import the solution as a holding solution (alias: -h)
  --publish-changes           Publish your changes upon a successful import (alias: -pc)
  --convert-to-managed        Convert as Managed Solution (alias: -cm)
  --async                     Imports solution asynchronously (alias: -a)
  --max-async-wait-time       Max asynchronous wait time in minutes. Default value is 60 minutes (alias: -wt)
  --settings-file             The .json file with the deployment settings for connection references and environment variables.
```
**Upgrade**
```powershell
pac solution upgrade --solution-name [--async] [--max-async-wait-time]

  --solution-name             Name of the solution (alias: -sn)
  --async                     Upgrades solution asynchronously (alias: -a)
  --max-async-wait-time       Max asynchronous wait time in minutes. Default value is 60 minutes (alias: -wt)
```
**Unpack**
```powershell
pac solution unpack --zipfile [--folder] [--packagetype] [--log] [--errorlevel] [--singleComponent] [--allowDelete] [--allowWrite] [--clobber] [--map] [--sourceLoc] [--localize] [--useLcid] [--useUnmanagedFileForMissingManaged] [--disablePluginRemap] [--processCanvasApps]

  --zipfile                   The full path to the solution ZIP file (alias: -z)
  --folder                    The path to the root folder on the local filesystem. When unpacking/extractins, this will be written to, when packing this will be read from. (alias: -f)
  --packagetype               When unpacking/extracting, use to specify dual Managed and Unmanaged operation. When packing, use to specify Managed or Unmanaged from a previous unpack 'Both'. Can be: 'Unmanaged', 'Managed' or 'Both'; default: 'Unmanaged' (alias: -p)
  --log                       The path to the log file. (alias: -l)
  --errorlevel                Minimum logging level for log output [Verbose|Info|Warning|Error|Off]; default: Info (alias: -e)
  --singleComponent           Only perform action on a single component type [WebResource|Plugin|Workflow|None]; default: None. (alias: -sc)
  --allowDelete               Dictates if delete operations may occur; default: false. (alias: -ad)
  --allowWrite                Dictates if write operations may occur; default: false. (alias: -aw)
  --clobber                   Enables that files marked read-only can be deleted or overwritten; default: false. (alias: -c)
  --map                       The full path to a mapping xml file from which to read component folders to pack. (alias: -m)
  --sourceLoc                 Generates a template resource file. Valid only on Extract. Possible Values are auto or an LCID/ISO code of the language you wish to export. When Present, this will extract the string resources from the given locale as a neutral .resx. If auto or just the long or short form of the switch is specified the base locale for the solution will be used. (alias: -src)
  --localize                  Extract or merge all string resources into .resx files. (alias: -loc)
  --useLcid                   Use LCIDs (1033) rather than ISO codes (en-US) for language files. (alias: -lcid)
  --useUnmanagedFileForMissingManagedUse the same XML source file when packaging for Managed and only Unmanaged XML file is found; applies to AppModuleSiteMap, AppModuleMap, FormXml files (alias: -same)
  --disablePluginRemap        Disabled plug-in fully qualified type name remapping. default: false (alias: -dpm)
  --processCanvasApps         (Preview) Pack/unpack any Canvas apps (.msapp) while processing the solution. default: false (alias: -pca)
```
**Pack**
```powershell
pac solution pack --zipfile [--folder] [--packagetype] [--log] [--errorlevel] [--singleComponent] [--allowDelete] [--allowWrite] [--clobber] [--map] [--sourceLoc] [--localize] [--useLcid] [--useUnmanagedFileForMissingManaged] [--disablePluginRemap] [--processCanvasApps]

  --zipfile                   The full path to the solution ZIP file (alias: -z)
  --folder                    The path to the root folder on the local filesystem. When unpacking/extractins, this will be written to, when packing this will be read from. (alias: -f)
  --packagetype               When unpacking/extracting, use to specify dual Managed and Unmanaged operation. When packing, use to specify Managed or Unmanaged from a previous unpack 'Both'. Can be: 'Unmanaged', 'Managed' or 'Both'; default: 'Unmanaged' (alias: -p)
  --log                       The path to the log file. (alias: -l)
  --errorlevel                Minimum logging level for log output [Verbose|Info|Warning|Error|Off]; default: Info (alias: -e)
  --singleComponent           Only perform action on a single component type [WebResource|Plugin|Workflow|None]; default: None. (alias: -sc)
  --allowDelete               Dictates if delete operations may occur; default: false. (alias: -ad)
  --allowWrite                Dictates if write operations may occur; default: false. (alias: -aw)
  --clobber                   Enables that files marked read-only can be deleted or overwritten; default: false. (alias: -c)
  --map                       The full path to a mapping xml file from which to read component folders to pack. (alias: -m)
  --sourceLoc                 Generates a template resource file. Valid only on Extract. Possible Values are auto or an LCID/ISO code of the language you wish to export. When Present, this will extract the string resources from the given locale as a neutral .resx. If auto or just the long or short form of the switch is specified the base locale for the solution will be used. (alias: -src)
  --localize                  Extract or merge all string resources into .resx files. (alias: -loc)
  --useLcid                   Use LCIDs (1033) rather than ISO codes (en-US) for language files. (alias: -lcid)
  --useUnmanagedFileForMissingManagedUse the same XML source file when packaging for Managed and only Unmanaged XML file is found; applies to AppModuleSiteMap, AppModuleMap, FormXml files (alias: -same)
  --disablePluginRemap        Disabled plug-in fully qualified type name remapping. default: false (alias: -dpm)
  --processCanvasApps         (Preview) Pack/unpack any Canvas apps (.msapp) while processing the solution. default: false (alias: -pca)
```
**Publish**
```powershell
pac solution publish [--async] [--max-async-wait-time]

  --async                     Publishes all customizations asynchronously (alias: -a)
  --max-async-wait-time       Max asynchronous wait time in minutes. Default value is 60 minutes (alias: -wt)
```
**Create Setings File**
```powershell
pac solution create-settings [--solution-zip] [--solution-folder] [--settings-file]

  --solution-zip              Path to solution zip file. (alias: -z)
  --solution-folder           Path to the local, unpacked solution folder: either the root of the 'Other/Solution.xml' file or a folder with a .cdsproj file. (alias: -f)
  --settings-file             The .json file with the deployment settings for connection references and environment variables. (alias: -s)
```
**Check**
```powershell
pac solution check [--path] [--solutionUrl] [--outputDirectory] [--geo] [--customEndpoint] [--ruleLevelOverride] [--ruleSet] [--excludedFiles]

  --path                      Path where the to-be-checked solution zip file(s) exist; path can contain glob/wildcard characters (alias: -p)
  --solutionUrl               SAS Uri pointing to solution.zip to be analyzed (alias: -u)
  --outputDirectory           Output directory (alias: -o)
  --geo                       Which geographical instance of the Power Apps Checker service to use. (alias: -g)
                              Values: PreviewUnitedStates, UnitedStates, Europe, Asia, Australia, Japan, India, Canada, SouthAmerica, UnitedKingdom, France, Germany, UnitedArabEmirates, Switzerland, USGovernment, USGovernmentL4, USGovernmentL5DoD, China
  --customEndpoint            Specify a custom URL as Power Apps Checker endpoint (alias: -ce)
  --ruleLevelOverride         Path to a file containing a JSON array rules and levels to override.  Accepted values for OverrideLevel are: Critical, High, Medium, Low, Informational. Example: [{"Id":"meta-remove-dup-reg","OverrideLevel":"Medium"},{"Id":"il-avoid-specialized-update-ops","OverrideLevel":"Medium"}] (alias: -rl)
  --ruleSet                   Select a rule set that will be executed as part of this build. Values: A valid Guid, "AppSource Certification", "Solution Checker" (default) (alias: -rs)
  --excludedFiles             Exclude Files from the Analysis. Pass as comma-separated values (alias: -ef)
```
## Azure DevOps Build Tools for the Power Platform (yaml)
**Export**
```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.export-solution.PowerPlatformExportSolution@0
  displayName: 'Export Solution'
  inputs:
    # PowerPlatformEnvironment for a username/password connection or PowerPlatformSPN for a Service Principal/client secret connection.
    authenticationType: PowerPlatformSPN | PowerPlatformEnvironment
    # The service endpoint that you want to import the solution into (e.g., https://contoso.crm.dynamics.com). Defined under Service Connections in Project Settings using the Power Platform connection type.
    PowerPlatformEnvironment: 'User Service Connection'
    # The service endpoint that you want to import the solution into (e.g., https://contoso.crm.dynamics.com). Defined under Service Connections in Project Settings using the Power Platform connection type.
    PowerPlatformSPN: 'SPN Service Connection'
    # (Required) The name of the solution to export. Always use the solution Name not its Display Name.
    SolutionName: 'Contoso'
    # (Required) The path and file name of the solution.zip file to export the source environment to (e.g., $(Build.ArtifactStagingDirectory)$(SolutionName).zip ).
Note: Variables give you a convenient way to get key bits of data into various parts of your pipeline.
    SolutionOutputFile: 'C:\Public\Contoso_managed.zip'
    # If selected (true), the export operation will be performed as an asynchronous batch job. Selecting asynchronous will poll and wait until MaxAsyncWaitTime has been reached.
    AsyncOperation: true | false
    # Maximum wait time in minutes for the asynchronous operation; default is 60 min (1 hr), same as Azure DevOps default for tasks.
    MaxAsyncWaitTime: 120
    # If selected (true), export the solution as a managed solution; otherwise export as an unmanaged solution.
    Managed: true | false
    # Export auto-numbering settings.
    ExportAutoNumberingSettings: true | false
    # Export calendar settings.
    ExportCalendarSettings: true | false
    # Export customization settings.
    ExportCustomizationSettings: true | false
    # Export email tracking settings.
    ExportEmailTrackingSettings: true | false
    # Export general settings.
    ExportGeneralSettings: true | false
    # Export ISV configuration.
    ExportIsvConfig: true | false
    # Export marketing settings.
    ExportMarketingSettings: true | false
    # Export Outlook synchronization settings
    ExportOutlookSynchronizationSettings: true | false
    # Export relationship roles.
    ExportRelationshipRoles: true | false
    # Exports sales.
    ExportSales: true | false
```
**Import**
```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.import-solution.PowerPlatformImportSolution@0
  displayName: 'Import Solution'
  inputs:
    # PowerPlatformEnvironment for a username/password connection or PowerPlatformSPN for a Service Principal/client secret connection.
    authenticationType: PowerPlatformSPN | PowerPlatformEnvironment
    # The service endpoint that you want to import the solution into (e.g., https://contoso.crm.dynamics.com). Defined under Service Connections in Project Settings using the Power Platform connection type.
    PowerPlatformEnvironment: 'User Service Connection'
    # The service endpoint that you want to import the solution into (e.g., https://contoso.crm.dynamics.com). Defined under Service Connections in Project Settings using the Power Platform connection type.
    PowerPlatformSPN: 'SPN Service Connection'
    # (Required) The path and file name of the solution .zip file to import into the target environment (e.g., $(Build.ArtifactStagingDirectory)$(SolutionName).zip).
    SolutionInputFile: 'C:\Public\Contoso_managed.zip'
    # If selected (true), the import operation will be performed asynchronously. This is recommended for larger solutions as this task will automatically timeout after 4 minutes otherwise. Selecting asynchronous will poll and wait until MaxAsyncWaitTime has been reached.
    AsyncOperation: true | false
    # Maximum wait time in minutes for the asynchronous operation; default is 60 min (1 hr), same as Azure DevOps default for tasks.
    MaxAsyncWaitTime: 60
    # Specify whether any processes (workflows) in the solution should be activated after import.
    PublishWorkflows: true | false
    # An advance parameter (true|false) used when a solution needs to be upgraded. This parameter hosts the solution in Dataverse but does not upgrade the solution until the Apply Solution Upgrade task is run.
    HoldingSolution: true | false
    # Specify whether to overwrite un-managed customizations.
    OverwriteUnmanagedCustomizations: true | false
    # Specify whether the enforcement of dependencies related to product updates should be skipped.
    SkipProductUpdateDependencies: true | false
    # Specify whether to import as a managed solution.
    ConvertToManaged: true | false
    # Connection references and environment variable values can be set using a deployment settings file. https://learn.microsoft.com/en-us/power-platform/alm/conn-ref-env-variables-build-tools#deployment-settings-file
    UseDeploymentSettingsFile: true | false
    # The path and file name of the deployment settings file. (Required when UseDeploymentSettingsFile=true).
    DeploymentSettingsFile: 'C:\settings\deploymentSettingsFile.json'
```
**Upgrade**
```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.apply-solution-upgrade.PowerPlatformApplySolutionUpgrade@0
  displayName: 'Apply Solution Upgrade '
  inputs:
    # PowerPlatformEnvironment for a username/password connection or PowerPlatformSPN for a Service Principal/client secret connection.
    authenticationType: PowerPlatformSPN | PowerPlatformEnvironment
    # The service endpoint that you want to import the solution into (e.g., https://contoso.crm.dynamics.com). Defined under Service Connections in Project Settings using the Power Platform connection type.
    PowerPlatformEnvironment: 'User Service Connection'
    # The service endpoint that you want to import the solution into (e.g., https://contoso.crm.dynamics.com). Defined under Service Connections in Project Settings using the Power Platform connection type.
    PowerPlatformSPN: 'SPN Service Connection'
    # (Required) The name of the solution to apply the upgrade. Always use the solution Name not its Display Name.
    SolutionName: 'Contoso'
    # If selected (true), the upgrade operation will be performed as an asynchronous batch job. Selecting asynchronous will poll and wait until MaxAsyncWaitTime has been reached.
    AsyncOperation: true | false
    # Maximum wait time in minutes for the asynchronous operation; default is 60 min (1 hr), same as Azure DevOps default for tasks.
    MaxAsyncWaitTime: 60
```
**Unpack**
```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.unpack-solution.PowerPlatformUnpackSolution@0
  displayName: 'Unpack Solution '
  inputs:
    # (Required) The path and file name of the solution.zip file to unpack.
    SolutionInputFile: 'C:\Public\Contoso_1_0_0_1_managed.zip'
    # (Required) The path and target folder you want to unpack the solution into.
    SolutionTargetFolder: 'C:\Public'
    # (Required) The type of solution you want to unpack. Options include: Unmanaged (recommended), Managed, and Both.
    SolutionType: Both | Unmanaged | Managed
```
**Pack**
```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.pack-solution.PowerPlatformPackSolution@0
  displayName: 'Pack Solution '
  inputs:
    # (Required) The path and file name of the solution.zip file to pack the solution into.
    SolutionSourceFolder: 'C:\Public'
    # (Required) The path and source folder of the solution to pack.
    SolutionOutputFile: 'Contoso_1_0_0_1_managed.zip'
    # (Required) The type of solution you want to pack. Options include: Managed (recommended), Unmanaged, and Both.
    SolutionType: Managed | Unmanaged | Both
```
**Publish**
```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.publish-customizations.PowerPlatformPublishCustomizations@0
  displayName: 'Publish Customizations '
  inputs:
    # PowerPlatformEnvironment for a username/password connection or PowerPlatformSPN for a Service Principal/client secret connection.
    authenticationType: PowerPlatformSPN | PowerPlatformEnvironment
    # The service endpoint that you want to import the solution into (e.g., https://contoso.crm.dynamics.com). Defined under Service Connections in Project Settings using the Power Platform connection type.
    PowerPlatformEnvironment: 'User Service Connection'
    # The service endpoint that you want to import the solution into (e.g., https://contoso.crm.dynamics.com). Defined under Service Connections in Project Settings using the Power Platform connection type.
    PowerPlatformSPN: 'SPN Service Connection'
```
**Check**
```yml
# Static analysis check of your solution
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.checker.PowerPlatformChecker@0
  displayName: 'Power Platform Checker '
  inputs:
    # (Required) A connection to a licensed Microsoft Power Platform environment is required to use the Power Platform checker. Service connections are defined in Service Connections under Project Settings using the Power Platform connection type. More information: see BuildTools.EnvironmentUrl under Power Platform Create Environment. Note, Service Principal is the only authentication method available for the checker task so if you are using username/password for all other tasks, you will have to create a separate connection to use with the checker task. For more information on how to configure service principals to be used with this task
    PowerPlatformSPN: 'Dataverse service connection'
    # By default (true), the geographic location of the checker service will use the same geography as the environment you connect to.
    UseDefaultPACheckerEndpoint: true | false
    # Required when UseDefaultPACheckerEndpoint is false. You have an option to specify another geo to use, for example https://japan.api.advisor.powerapps.com. For a list of available geographies, see https://learn.microsoft.com/en-us/powerapps/developer/common-data-service/checker/webapi/overview#determine-a-geography
    CustomPACheckerEndpoint: 'https://japan.api.advisor.powerapps.com/'
    # Required when referencing a file from a shared access signature (SAS) URL sasUriFile. Note, It is important to reference an exported solution file and not the unpacked source files in your repository. Both managed and unmanaged solution files can be analyzed.
    FileLocation: sasUriFile
    # Required when FileLocation is set to sasUriFile. Enter the SAS URI. You can add more than one SAS URI through a comma (,) or semi-colon (;) separated list.
    FilesToAnalyzeSasUri: 'SAS URI'
    # Required when SAS files are not analyzed. Specify the path and file name of the zip files to analyze. Wildcards can be used. For example, enter **\*.zip for all zip files in all subfolders.
    FilesToAnalyze: '**\*.zip'
    # Specify the names of files to be excluded from the analysis. If more than one, provide through a comma (,) or semi-colon (;) separated list. This list can include a full file name or a name with leading or trailing wildcards, such as *jquery or form.js
    FilesToExclude: '**\*.zip'
    # A JSON array containing rules and levels to override. Accepted values for OverrideLevel are: Critical, High, Medium, Low, Informational. Example: [{"Id":"meta-remove-dup-reg","OverrideLevel":"Medium"},{"Id":"il-avoid-specialized-update-ops","OverrideLevel":"Medium"}]
    RulesToOverride: 'JSON array'
    # (Required) Specify which rule set to apply. The following two rule sets are available. 
        # Solution checker; This is the same rule set that is run from the Power Apps maker portal. 
        # AppSource; This is the extended rule set that is used to certify an application before it can be published to AppSource.
    RuleSet: '0ad12346-e108-40b8-a956-9a8f95ea18c9'
    # Combined with the error threshold parameter defines the severity of errors and warnings that are allowed. Supported threshold values are <level>IssueCount where level=Critical, High, Medium, Low, and Informational.   
    ErrorLevel: High | Medium | Low | Informational
    # Defines the number of errors (>=0) of a specified level that are allowed for the checker to pass the solutions being checked
    ErrorThreshold: 5
    # When true, fail if the Power Apps Checker analysis is returned as Failed or FinishedWithErrors.
    FailOnPowerAppsCheckerAnalysisError: true | false
    # Specify the Azure DevOps artifacts name for the checker .sarif file.
    ArtifactDestinationName: 'CodeAnalysisLogs'
```
## GitHub Actions for the Power Platform
### **export-solution**
#### Exports a solution from a source environment.
|Parameter|Description
|--------------------:|:------------------------------------------------------|
|environment-url|(Required) The URL for the environment that you want to export the solution from (for example, https://YourOrg.crm.dynamics.com).|
|user-name|(Required) If you're using username/password authentication, the username of the account you're using to connect with.|
|password-secret|(Required) If you're using username/password authentication, the password for user-name. GitHub passwords are defined in Settings under Secrets. You can't retrieve a secret after it has been defined and saved.|
|app-id|The application ID to authenticate with. This parameter is required when authenticating with Service Principal credentials.|
|client-secret|The client secret used to authenticate the GitHub pipeline. This parameter is required when authenticating with Service Principal credentials.|
|tenant-id|The tenant ID when authenticating with app-id and client-secret.|
|solution-name|(Required) The name of the solution to export. Always use the solution's name, not its display name.|
|solution-output-file|(Required) The path and name of the solution.zip file to export the source environment to.|
|managed|(Required) Set to true to export as a managed solution; the default (false) is to export as an unmanaged solution.|
|
---
### **unpack-solution**
#### Takes a compressed solution file and decomposes it into multiple XML files so these files can be more easily read and managed by a source control system
|Parameter|Description
|--------------------:|:------------------------------------------------------|
solution-file|(Required) The path and file name of the solution.zip file to unpack.
solution-folder|(Required) The path and target folder you want to unpack the solution into.
solution-type|(Required) The type of solution you want to unpack. Options include Unmanaged (recommended), Managed, and Both.
|
---
### **pack-solution**
#### Packs a solution represented in source control into a solution.zip file that can be imported into another environment.
|Parameter|Description
|--------------------:|:------------------------------------------------------|
solution-file|(Required) The path and file name of the solution.zip file to pack the solution into (for example, out/CI/ALMLab.zip).
solution-folder|(Required) The path and source folder of the solution to pack.
solution-type|(Optional) The type of solution to pack. Options include Unmanaged (recommended), Managed, and Both.
|
---
**import-solution**
#### Imports a solution into a target environment.**
|Parameter|Description
|--------------------:|:------------------------------------------------------|
|environment-url|(Required) The URL for the target environment that you want to import the solution into (for example, https://YourOrg.crm.dynamics.com).
|user-name	|(Required) If you're using username/password authentication, the username of the account you're using to connect with.
password-secret	|(Required) If you're using username/password authentication, the password for the account you're using to connect with.
solution-file	|(Required) The path and name of the solution file you want to import.
app-id	|The application ID to authenticate with. This parameter is required when authenticating with Service Principal credentials.
client-secret	|The client secret used to authenticate the GitHub pipeline. This parameter is required when authenticating with Service Principal credentials.
tenant-id	|The tenant ID when authenticating with app-id and client-secret.|
|
**publish-solution**
#### Publishes the solution customizations.
|Parameter|Description
|--------------------:|:------------------------------------------------------|
|environment-url|(Required) The URL for the environment that you want to publish the solution into (for example, https://YourOrg.crm.dynamics.com).|
|user-name|(Required) If you're using username/password authentication, the username of the account you're using to connect with.|
|password-secret|(Required) If you're using username/password authentication, the password for the account you're using to connect with.|
|solution-file|(Required) The path and name of the solution file you want to import.|
|app-id|The application ID to authenticate with. This parameter is required when authenticating with Service Principal credentials.|
|client-secret|The client secret used to authenticate the GitHub pipeline. This parameter is required when authenticating with Service Principal credentials.|
|tenant-id|The tenant ID when authenticating with app-id and client-secret.|
|
---
**check-solution**
#### Checks the solution file to detect inconsistencies.
|Parameter|Description
|--------------------:|:------------------------------------------------------|
|environment-url|(Required) The URL for the environment that you want to clone the solution from (for example, https://YourOrg.crm.dynamics.com).|
|user-name|(Required) If you're using username/password authentication, the username of the account you're using to connect with.|
|password-secret|(Required) If you're using username/password authentication, the password for the account you're using to connect with.|
|app-id|The application ID to authenticate with. This parameter is required when authenticating with Service Principal credentials.|
|client-secret|The client secret used to authenticate the GitHub pipeline. This parameter is required when authenticating with Service Principal credentials.|
|tenant-id|The tenant ID when authenticating with app-id and client-secret.|
|path|(Required) The path and name of the solution file you want to check.|
|geo|Which geo location of the Microsoft Power Platform Checker service to use. Default value is 'united states'.|
|rule-level-override|	Path to file a containing a JSON array of rules and their levels. Accepted values are: Critical, High, Low, and Informational. Example: [{"Id":"meta-remove-dup-reg","OverrideLevel":"Medium"},{"Id":"il-avoid-specialized-update-ops","OverrideLevel":"Medium"}]|
|checker-logs-artifact-name|The name of the artifact folder for which Microsoft Power Platform checker logs will be uploaded. Default value is 'CheckSolutionLogs'.|
---
**upgrade-solution**
#### Provides the ability to upgrade the solution.
|Parameter|Description
|--------------------:|:------------------------------------------------------|
|environment-url|(Required) The URL for the environment that you want to clone the solution from (for example, https://YourOrg.crm.dynamics.com).|
|user-name|(Required) If you're using username/password authentication, the username of the account you're using to connect with.|
|password-secret|(Required) If you're using username/password authentication, the password for the account you're using to connect with.|
|solution-file|(Required) The path and name of the solution file you want to import.|
|app-id|The application ID to authenticate with. This parameter is required when authenticating with Service Principal credentials.|
|client-secret|The client secret used to authenticate the GitHub pipeline. This parameter is required when authenticating with Service Principal credentials.|
|tenant-id|The tenant ID when authenticating with app-id and client-secret.|
|solution-name|(Required) Name of the solution to upgrade.|
|async|Upgrades the solution asynchronously.|
|max-async-wait-time|Maximum asynchronous wait time in minutes. Default value is 60 minutes.|
---
---
**Apply**
|Parameter|Description
|--------------------:|:------------------------------------------------------|
|
---