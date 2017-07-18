---
ms.assetid: 3c9be37f-e505-4975-a5bd-0d34decab288
ms.title: Azure Intune REST API reference
ms.service: intune
author: steved0x
ms.author: sdanie
ms.manager: douge
service_description: To be added
---

# Azure Intune REST API reference

Azure Intune provides mobile device management, mobile application management, and PC management capabilities from the cloud. The Azure Intune REST API provides the following REST operations groups.



## REST operation groups

| Operation group                                                                           | Description                                                |
|-------------------------------------------------------------------------------------------|------------------------------------------------------------|
| [Android](~/docs-ref-autogen/intune/android.json)                                                  | Provides operations for managing Android MAM policies.     |
| [Get Apps](~/docs-ref-autogen/intune/getapps.json)                                                 | Returns a list of Intune manageable apps.                  |
| [Get Location By Host Name](~/docs-ref-autogen/intune/getlocationbyhostname.json)                  | Returns location for a given tenant.                       |
| [Get Locations](~/docs-ref-autogen/intune/getlocations.json)                                       | Returns locations for a user tenant.                       |
| [Get MAM Flagged User By Name](~/docs-ref-autogen/intune/getmamflaggeduserbyname.json)             | Returns Intune flagged user details.                       |
| [Get MAM Flagged Users](~/docs-ref-autogen/intune/getmamflaggedusers.json)                         | Returns Intune flagged user collection.                    |
| [Get MAM Statuses](~/docs-ref-autogen/intune/getmamstatuses.json)                                  | Returns Intune Tenant level statuses.                      |
| [Get MAM User Device By Device Name](~/docs-ref-autogen/intune/getmamuserdevicebydevicename.json)  | Gets a unique device for a user.                           |
| [Get MAM User Devices](~/docs-ref-autogen/intune/getmamuserdevices.json)                           | Gets devices for a user.                                   |
| [Get MAM User Flagged Enrolled Apps](~/docs-ref-autogen/intune/getmamuserflaggedenrolledapps.json) | Returns Intune flagged enrolled app collection for a user. |
| [Get Operation Results](~/docs-ref-autogen/intune/getoperationresults.json)                        | Returns operation results.                                 |
| [Ios](~/docs-ref-autogen/intune/ios.json)                                                          | Provides operations for managing IOS MAM policies.         |
| [Wipe MAM User Device](~/docs-ref-autogen/intune/wipemamuserdevice.json)                           | Wipes a device for a user.                                 |

## See also

- [Microsoft Intune](https://azure.microsoft.com/marketplace/partners/microsoft-corporation/microsoftintunemdm/)
- [Learn how to get your application certified](https://azure.microsoft.com/marketplace/programs/certified/intune/)