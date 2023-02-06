# Introduction
Power Portal files will be store in a folder named for the 'Website' record in eh development environment. *Note: Webfiles are not uploading correctly and will need to move with data export and import.*  
## Work with Power Pages using Power Platform CLI Tools
**List**
```powershell
pac paportal list

    This command does not take any arguments.
```
**Download**
```powershell
pac paportal download --path --webSiteId [--includeEntities] [--excludeEntities] [--overwrite]

  --path                      Path where the website content will be downloaded (alias: -p)
  --webSiteId                 Power Pages website id to download (alias: -id)
  --includeEntities           Download only the entities specified for this argument in comma separated entity logical name (alias: -ie)
  --excludeEntities           Comma separated list of entity logical names to exclude downloading (alias: -xe)
  --overwrite                 Power Pages website content to overwrite (alias: -o)
```
**Upload**
```powershell
pac paportal upload --path [--deploymentProfile]

  --path                      Path from where the website content will be uploaded (alias: -p)
  --deploymentProfile         Deployment profile name to be used. Defaults to 'default' (alias: -dp)
```

TODO: Add links to pages  
Todo: build script to list WebSiteId by Site name  