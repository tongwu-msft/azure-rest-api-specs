---
title: Azure App Service JSON examples
description: Learn how to create or update an app by running the Create Or Update API with a JSON example.
ms.service: azure
---
# App Service JSON examples

<a name="WebApps_CreateOrUpdate"></a>
## Create Or Update example

To create or update an app, run the [Create Or Update](/rest/api/appservice/webapps/createorupdate) API 
with a JSON like the following in the request body. Note that `serverFarmId` must point to an existing App Service plan.

```json
    {
        "name": "unique-app-name",
        "location": "West Europe",
        "properties": {
            "serverFarmId": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resource-group-name/providers/Microsoft.Web/serverfarms/plan-name"
        }
    }
```

<a name="WebApps_CreateOrUpdateConfiguration"></a>
## Create Or Update Configuration example

To update the PHP runtime version, run the [Create Or Update Configuration API](/rest/api/appservice/webapps/createorupdateconfiguration) or [Create Or Update Configuration Slot API](/rest/api/appservice/webapps/createorupdateconfigurationslot) with a JSON like the following in the request body:

```json
    {
        "properties": {
            "phpVersion": "5.6"
        }
    }
```

<a name="WebApps_CreateOrUpdateSourceControl"></a>
## Create Or Update Source Control example

To enable source control from GitHub, run the [Create Or Update Source Control API](/rest/api/appservice/webapps/createorupdatesourcecontrol) or [Create Or Update Source Control Slot API](/rest/api/appservice/webapps/createorupdatesourcecontrolslot) with a JSON like the following in the request body.
Note that `"isManualIntegration": true` turns off continuous integration, which is required if you are deploying from someone else's public repo, like an Azure sample.

```json
    {
        "properties": {
            "repoUrl": "https://github.com/Azure-Samples/app-service-web-html-get-started",
            "branch": "master",
            "isManualIntegration": true
        }
    }
```

<a name="WebApps_UpdateApplicationSettings"></a>
## Update Application Settings example

To update the app setting for your app, run the [Update Application Settings API](/rest/api/appservice/webapps/updateapplicationsettings) or [Update Application Settings Slot API](/rest/api/appservice/webapps/updateapplicationsettingsslot) with a JSON like the following in the request body. 
Note that it should include all app settings, not just the ones you want to update.

```json
    {
        "properties": {
            "WEBSITE_NODE_DEFAULT_VERSION": "4.2.3",
            "mysetting": "somevalue"
        }
    }
```

<a name="WebApps_UpdateConnectionStrings"></a>
## Update Connection Strings example

To update the connection strings for your app, run the [Update Connection Strings API](/rest/api/appservice/webapps/updateconnectionstrings) or [Update Connection Strings Slot API](/rest/api/appservice/webapps/updateconnectionstringsslot) with a JSON like the following in the request body. 
This code includes an example of each supported connection string type. Note that your request body should include all connection strings in your app, not just the ones you want to update.

```json
    {
        "properties": {
            "sqldbconn": {
                "value": "connection-string-value",
                "type": "SQLAzure"
            },
            "sqlserverconn": {
                "value": "connection-string-value",
                "type": "SQLServer"
            },
            "mysqlconn": {
                "value": "connection-string-value",
                "type": "MySql"
            },
            "customconn": {
                "value": "connection-string-value",
                "type": "Custom"
            }
        }
    }
```

<a name="WebApps_UpdateMetadata"></a>
## Update Metadata example

To update the metadata of your app, run the [Update Metadata API](/rest/api/appservice/webapps/updatemetadata) or [Update Metadata Slot API](/rest/api/appservice/webapps/updatemetadataslot) with a JSON like the following in the request body. 
Note that it should include all metadata in your app or slot, not just the ones you want to update.

```json
    {
        "properties": {
            "author": "cephalin",
            "license": "MIT"
        }
    }
```

<a name="WebApps_UpdateDiagnosticLogsConfig"></a>
## Update Diagnostic Logs Config example

To tun on application error logging, run the [Update Diagnostic Logs Config API](/rest/api/appservice/webapps/updatediagnosticlogsconfig) or [Update Diagnostic Logs Config Slot API](/rest/api/appservice/webapps/updatediagnosticlogsconfigslot) with a JSON like the following in the request body.

```json
    {
        "properties": {
            "applicationLogs": {
                "fileSystem": {
                    "level": "Error"
                }
            }
        }
    }
```

<a name="WebApps_CreateOrUpdateVnetConnectionGateway"></a>
## Create Or Update Vnet Connection Gateway example

To add a update a Virtual Network gateway, run one of the following APIs: 

- [Create Or Update Vnet Connection Gateway](/rest/api/appservice/webapps/createorupdatevnetconnectiongateway) 
- [Create Or Update Vnet Connection Gateway Slot](/rest/api/appservice/webapps/createorupdatevnetconnectiongatewayslot) 
- [Update Vnet Connection Gateway](/rest/api/appservice/webapps/updatevnetconnectiongateway)
- [Update Vnet Connection Gateway Slot](/rest/api/appservice/webapps/updatevnetconnectiongatewayslot)

with the a JSON like the following in the request body:

```json
    {
        "properties": {
            "vnetName": "{vnetName}"
        }
    }
```

<a name="WebApps_CreateOrUpdateVnetConnection"></a>
## Create Or Update Vnet Connection example

To add or update a Virtual Network connection, run one of the following APIs 

- [Create Or Update Vnet Connection](/rest/api/appservice/webapps/createorupdatevnetconnection)
- [Create Or Update Vnet Connection Slot](/rest/api/appservice/webapps/createorupdatevnetconnectionslot) 
- [Update Vnet Connection](/rest/api/appservice/webapps/updatevnetconnection)
- [Update Vnet Connection Slot](/rest/api/appservice/webapps/updatevnetconnectionslot)

with a JSON like the following in the request body:

```json
    {
        "properties": {
            "vnetResourceId": "/subscriptions/{subscription-Id}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/{vnetName}"
        }
    }
```

<a name="WebApps_SwapSlotSlot"></a>
## Swap Slot example

To swap a "staging" slot into the production slot, run the [Swap Slot Slot API](/rest/api/appservice/webapps/swapslotslot) with a JSON like the following in the request body to specify the production slot as the target slot.

```json
    {
        "targetSlot":"production"
    }
```

<a name="WebApps_GetSlotsDifferencesSlot"></a>
## Get Slots Differences example

To compare a "staging" slot with the production slot, run the [List Slots Differences Slot API](/rest/api/appservice/webapps/listslotdifferencesslot) with a JSON like the following in the request body to specify the production slot as the target slot.

```json
    {
        "targetSlot":"production"
    }
```

<a name="WebApps_ApplySlotConfigurationSlot"></a>
## Apply Slot Configuration example

To apply configuration settings from the production slot to a "staging" slot, run the [Apply Slot Configuration Slot API](/rest/api/appservice/webapps/applyslotconfigurationslot) with a JSON like the following in the request body to specify the production slot as the target slot.

```json
    {
        "targetSlot":"production"
    }
</code>
</example>
        public HttpResponseMessage ApplySlotConfiguration()
```

<a name="WebApps_UpdateSlotConfigurationNames"></a>
## Update Slot Configuration Names example

To specify a sticky "env" app setting for your app, run the [Update Slot Configuration Names API](/rest/api/appservice/webapps/updateslotconfigurationnames) with a JSON similar to the following in the request body. 
Note that it should include all sticky connection strings and app settings, not just the ones you want to update. To get a list of all existing sticky settings, run the [List Slot Configuration Names API](/rest/api/appservice/webapps/listslotconfigurationnames).

```json
    {
        "properties": {
            "connectionStringNames": [],
            "appSettingNames": [
                "env"
            ]
        }
    }
```
