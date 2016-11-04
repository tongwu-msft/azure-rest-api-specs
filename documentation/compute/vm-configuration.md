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