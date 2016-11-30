# App Service JSON examples

<a name="WebApps_CreateOrUpdate"></a>
## Create Or Update example

To create or update an app, run the [Create Or Update](/rest/api/appservice/webapps#WebApps_CreateOrUpdate) API 
with a JSON like the following in the request body. Note that `serverFarmId` must point to an existing App Service plan.

    {
        "name": "unique-app-name",
        "location": "West Europe",
        "properties": {
            "serverFarmId": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resource-group-name/providers/Microsoft.Web/serverfarms/plan-name"
        }
    }

<a name="WebApps_CreateOrUpdateConfiguration"></a>
## Create Or Update Configuration example

To update the PHP runtime version, run the [Create Or Update Configuration API](/rest/api/appservice/webapps#WebApps_CreateOrUpdateConfiguration) or [Create Or Update Configuration Slot API](/rest/api/appservice/webapps#WebApps_CreateOrUpdateConfigurationSlot) with a JSON like the following in the request body:

    {
        "properties": {
            "phpVersion": "5.6"
        }
    }

<a name="WebApps_CreateOrUpdateSourceControl"></a>
## Create Or Update Source Control example

To enable source control from GitHub, run the [Create Or Update Source Control API](/rest/api/appservice/webapps#WebApps_CreateOrUpdateSourceControl) or [Create Or Update Source Control Slot API](/rest/api/appservice/webapps#WebApps_CreateOrUpdateSourceControlSlot) with a JSON like the following in the request body.
Note that `"isManualIntegration": true` turns off continuous integration, which is required if you are deploying from someone else's public repo, like an Azure sample.

    {
        "properties": {
            "repoUrl": "https://github.com/Azure-Samples/app-service-web-html-get-started",
            "branch": "master",
            "isManualIntegration": true
        }
    }

<a name="WebApps_UpdateApplicationSettings"></a>
## Update Application Settings example

To update the app setting for your app, run the [Update Application Settings API](/rest/api/appservice/webapps#WebApps_UpdateApplicationSettings) or [Update Application Settings Slot API](/rest/api/appservice/webapps#WebApps_UpdateApplicationSettingsSlot) with a JSON like the following in the request body. 
Note that it should include all app settings, not just the ones you want to update.

    {
        "properties": {
            "WEBSITE_NODE_DEFAULT_VERSION": "4.2.3",
            "mysetting": "somevalue"
        }
    }

<a name="WebApps_UpdateConnectionStrings"></a>
## Update Connection Strings example

To update the connection strings for your app, run the [Update Connection Strings API](/rest/api/appservice/webapps#WebApps_UpdateConnectionStrings) or [Update Connection Strings Slot API](/rest/api/appservice/webapps#WebApps_UpdateConnectionStringsSlot) with a JSON like the following in the request body. 
This code includes an example of each supported connection string type. Note that your request body should include all connection strings in your app, not just the ones you want to update.

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

<a name="WebApps_UpdateMetadata"></a>
## Update Metadata example

To update the metadata of your app, run the [Update Metadata API](/rest/api/appservice/webapps#WebApps_UpdateMetadata) or [Update Metadata Slot API](/rest/api/appservice/webapps#WebApps_UpdateMetadataSlot) with a JSON like the following in the request body. 
Note that it should include all metadata in your app or slot, not just the ones you want to update.

    {
        "properties": {
            "author": "cephalin",
            "license": "MIT"
        }
    }

<a name="WebApps_UpdateDiagnosticLogsConfig"></a>
## Update Diagnostic Logs Config example

To tun on application error logging, run the [Update Diagnostic Logs Config API](/rest/api/appservice/webapps#WebApps_UpdateDiagnosticLogsConfig) or [Update Diagnostic Logs Config Slot API](/rest/api/appservice/webapps#WebApps_UpdateDiagnosticLogsConfigSlot) with a JSON like the following in the request body.

    {
        "properties": {
            "applicationLogs": {
                "fileSystem": {
                    "level": "Error"
                }
            }
        }
    }

<a name="WebApps_CreateOrUpdateVnetConnectionGateway"></a>
## Create Or Update Vnet Connection Gateway example

To add a update a Virtual Network gateway, run one of the following APIs: 

- [Create Or Update Vnet Connection Gateway](/rest/api/appservice/webapps#WebApps_CreateOrUpdateVnetConnectionGateway) 
- [Create Or Update Vnet Connection Gateway Slot](/rest/api/appservice/webapps#WebApps_CreateOrUpdateVnetConnectionGatewaySlot) 
- [Update Vnet Connection Gateway](/rest/api/appservice/webapps#WebApps_UpdateVnetConnectionGateway)
- [Update Vnet Connection Gateway Slot](/rest/api/appservice/webapps#WebApps_UpdateVnetConnectionGatewaySlot)

with the a JSON like the following in the request body:

    {
        "properties": {
            "vnetName": "{vnetName}"
        }
    }

<a name="WebApps_CreateOrUpdateVnetConnection"></a>
## Create Or Update Vnet Connection example

To add or update a Virtual Network connection, run one of the following APIs 

- [Create Or Update Vnet Connection](/rest/api/appservice/webapps#WebApps_CreateOrUpdateVnetConnection)
- [Create Or Update Vnet Connection Slot](/rest/api/appservice/webapps#WebApps_CreateOrUpdateVnetConnectionSlot) 
- [Update Vnet Connection](/rest/api/appservice/webapps#WebApps_UpdateVnetConnection)
- [Update Vnet Connection Slot](/rest/api/appservice/webapps#WebApps_UpdateVnetConnectionSlot)

with a JSON like the following in the request body:

    {
        "properties": {
            "vnetResourceId": "/subscriptions/{subscription-Id}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/{vnetName}"
        }
    }

<a name="WebApps_SwapSlotSlot"></a>
## Swap Slot example

To swap a "staging" slot into the production slot, run the [Swap Slot Slot API](/rest/api/appservice/webapps#WebApps_SwapSlotSlot) with a JSON like the following in the request body to specify the production slot as the target slot.

    {
        "targetSlot":"production"
    }

<a name="WebApps_GetSlotsDifferencesSlot"></a>
## Get Slots Differences example

To compare a "staging" slot with the production slot, run the [Get Slots Differences Slot API](/rest/api/appservice/webapps#WebApps_GetSlotsDifferencesSlot) with a JSON like the following in the request body to specify the production slot as the target slot.

    {
        "targetSlot":"production"
    }

<a name="WebApps_ApplySlotConfigurationSlot"></a>
## Apply Slot Configuration example

To apply configuration settings from the production slot to a "staging" slot, run the [Apply Slot Configuration Slot API](/rest/api/appservice/webapps#WebApps_ApplySlotConfigurationSlot) with a JSON like the following in the request body to specify the production slot as the target slot.

    {
        "targetSlot":"production"
    }
</code>
</example>
        public HttpResponseMessage ApplySlotConfiguration()

<a name="WebApps_UpdateSlotConfigurationNames"></a>
## Update Slot Configuration Names example

To specify a sticky "env" app setting for your app, run the [Update Slot Configuration Names API](/rest/api/appservice/webapps#WebApps_UpdateSlotConfigurationNames) with a JSON similar to the following in the request body. 
Note that it should include all sticky connection strings and app settings, not just the ones you want to update. To get a list of all existing sticky settings, run the [List Slot Configuration Names API](/rest/api/appservice/webapps#WebApps_ListSlotConfigurationNames).

    {
        "properties": {
            "connectionStringNames": [],
            "appSettingNames": [
                "env"
            ]
        }
    }

