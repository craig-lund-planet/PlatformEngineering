# Introduction
Deployment Settings are used to set Envuronment Variables and Connection References in each environment per solution on deployment.

## Create a settings file from solution zip or solution folder.
```azurecli
pac solution create-settings [--solution-zip] [--solution-folder] [--settings-file]

  --solution-zip              Path to solution zip file. (alias: -z)
  --solution-folder           Path to the local, unpacked solution folder: either the root of the 'Other/Solution.xml' file or a folder with a .cdsproj file. (alias: -f)
  --settings-file             The .json file with the deployment settings for connection references and environment variables. (alias: -s)
```
### Example
```json
  {
    "EnvironmentVariables": [
      {
        "SchemaName": "tst_Deployment_env",
        "Value": "Test"
      }
    ],
    "ConnectionReferences": [
      {
        "LogicalName": "tst_sharedtst5fcreateuserandjob5ffeb85c4c63870282_b4cc7",
        "ConnectionId": "4445162937b84457a3465d2f0c2cab7e",
        "ConnectorId": "/providers/Microsoft.PowerApps/apis/shared_tst-5fcreateuserandjob-5ff805fab2693f57dc"
      }
    ]
  }
  ```

*Caution: Secrets, Passwords, and Keys added in clear text will be visible in source code if not blocked or removed from solutions. Environment Variables of type secret should be used for secret values. Best practice should be to never add to default value unless this value will seldom of never change.*