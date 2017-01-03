# Extension configuration examples

## Custom Script Public Storage

```
{ 
  "location": "eastus",
  "properties": {
    "publisher": "Microsoft.OSTCExtensions",
    "type": "CustomScriptForLinux",
    "typeHandlerVersion": "1.5",
    "autoUpgradeMinorVersion": true,
    "settings": {
       "fileUris": [ "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/dokku-vm/deploy_dokku.sh"],
       "commandToExecute": "sh deploy_dokku.sh 0.5.8"
    }
  }
}  
```

## Custom Script Azure Storage

```
{ 
  "location": "eastus",
  "properties": {
    "publisher": "Microsoft.OSTCExtensions",
    "type": "CustomScriptForLinux",
    "typeHandlerVersion": "1.5",
    "autoUpgradeMinorVersion": true,
    "settings": {
       "fileUris": [ "https://storageaccname.blob.core.windows.net/vhds/deploy_dokku.sh"],
       "commandToExecute": "sh deploy_dokku.sh 0.5.8"
    },
    "protectedSettings": {
      "storageAccountName": "storageaccname",
      "storageAccountKey": "adsa131fsf11wSPGiEV5wgL5reNNYIsdadbvcx797834512342bvxdadsa1114351131At"
    }
  }
}
```

## Custom Script Public Storage

```
{
  "properties": {
    "publisher": "Microsoft.OSTCExtensions",
    "type": "CustomScriptForLinux",
    "typeHandlerVersion": "1.5",
    "autoUpgradeMinorVersion": true,
    "settings": {"fileUris":["https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/dokku-vm/deploy_dokku.sh"],"commandToExecute":"sh deploy_dokku.sh 0.5.8"},
    "provisioningState": "Creating"
  },
  "id": "/subscriptions/<sub-id>/resourceGroups/<rg-name>/providers/Microsoft.Compute/virtualMachines/<vm-name>/extensions/dokku",
  "name": "dokku",
  "type": "Microsoft.Compute/virtualMachines/extensions",
  "location": "eastus"
}
```

## Custom Script Azure Storage

```
{
  "properties": {
    "publisher": "Microsoft.OSTCExtensions",
    "type": "CustomScriptForLinux",
    "typeHandlerVersion": "1.5",
    "autoUpgradeMinorVersion": true,
    "settings": {"fileUris":["https://storageaccname.blob.core.windows.net/vhds/deploy_dokku.sh"],"commandToExecute":"sh deploy_dokku.sh 0.5.8"},
    "provisioningState": "Creating"
  },
  "id": "/subscriptions/<sub-id>/resourceGroups/<rg-name>/providers/Microsoft.Compute/virtualMachines/<vm-name>/extensions/dokku",
  "name": "dokku",
  "type": "Microsoft.Compute/virtualMachines/extensions",
  "location": "eastus"
}
```