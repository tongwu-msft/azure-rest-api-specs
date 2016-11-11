# VM configuration examples

## Create a VM from generalized user image

This shows an example of creating a VM from a generalized/sysprepped user image. The key things to notice are the value fromImage for the createOption property and image.uri and vhd.uri properties in the osDisk object. image.uri is the location of your image and vhd.uri is where that disk will be copied to and the VM be booted from.

```json
"osProfile": {
    "computerName": "contosoVM",
    "adminUsername": "contosouser",
    "adminPassword": "Contoso!pas1"
  },
  "storageProfile": {
    "osDisk": {
      "name": "osdisk",
      "osType": "<Windows or Linux>",
      "caching": "ReadWrite",
      "createOption": "FromImage",
      "image": {
        "uri": "http://storagename.blob.core.windows.net/vhds/VMImageName-osdisk.vhd"
      },
      "vhd": {
        "uri": "http://storagename.blob.core.windows.net/vhds/osdisk.vhd"
      }
    }
  },
"dataDisks": [
  {
    "name": "mydatadisk1",
    "diskSizeGB": "1",
    "lun": 0,
    "image": {
      "uri": "http://storagename.blob.core.windows.net/vhds/VMImageName-datadisk.vhd"
    },
    "vhd": {
      "uri": "http://mystorage.blob.core.windows.net/vhds/mydatadisk3.vhd"
    },
    "createOption": "fromImage"
  }
]
```

## Creating a VM from specialized VHD

This example shows how to create a VM from a specialized (non-sysprepped) VHD. The key things to notice are the value attach for the createOption property and vhd.uri properties in the osDisk object. image.uri isn't needed in this case since you are just attaching the vhd.uri and vm will be booted from it.

> Note: In this case osProfile is not needed since all OS properties such as username/password as persisted in the VHD when it is not generalized.

```
"storageProfile": {
  "osDisk": {
    "name": "osdisk",
    "osType": "<Windows or Linux>",
    "caching": "ReadWrite",
    "vhd": {
      "uri": "http://mystorage.blob.core.windows.net/vhds/mydatadisk3.vhd"
    },
    "createOption": "Attach"
  }
}
```

## Marketplace image

The following example shows the additional plan element that is required when you use a marketplace image:

```
{
  "id": "/subscriptions/{subscription-id/resourceGroups/myresourcegroup1/providers/Microsoft.Compute/virtualMachines/myvm1",
  "name": "myvm1",
  "type": "Microsoft.Compute/virtualMachines",
  "location": "westus",
  "tags": { 
    "department": "finance" 
   }, 
  "plan": {
    "name": "imageName",
    "publisher": "imagePublisher",
    "product": "imageProduct"
  },
  "properties": {
  ...
```

## Linux VM

The following example shows the linuxConfiguation element that is required when you are creating a Linux virtual machine.

```
"osProfile": {
  "computerName": "virtualMachineName",
  "adminUsername": "username",
  "adminPassword": "password",
  "customData": "", 
  "linuxConfiguration": { 
    "disablePasswordAuthentication": "true|false", 
    "ssh": { 
      "publicKeys": [ { 
        "path": "key-path-on-vm", 
        "keyData": "public-key" 
    } ] 
  } 
} 
...
```

## On-Premises License/Hybrid Use Benefit

The following example shows the licenseType element that is used when the image or disk was licensed on-premises.

```
"properties": {  
   "licenseType": "Windows_Server",
   "availabilitySet": {  
     "id":"/subscriptions/{subscription-id}/resourceGroups/myresourcegroup1/providers/Microsoft.Compute/availabilitySets/myav1"
   },
   ...
```