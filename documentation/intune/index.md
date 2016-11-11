---
ms.assetid: 3c9be37f-e505-4975-a5bd-0d34decab288
ms.title: Azure Intune REST API reference
ms.service: intune
author: steved0x
ms.author: sdanie
ms.manager: douge
---

# Azure Intune REST API reference

Azure Intune provides mobile device management, mobile application management, and PC management capabilities from the cloud. The Azure Intune REST API provides the following REST operations groups.



## REST operation groups

| Operation group                                                                           | Description                                                |
|-------------------------------------------------------------------------------------------|------------------------------------------------------------|
| [Android](~/api-ref/intune/android.json)                                                  | Provides operations for managing Android MAM policies.     |
| [Get Apps](~/api-ref/intune/getapps.json)                                                 | Returns a list of Intune manageable apps.                  |
| [Get Location By Host Name](~/api-ref/intune/getlocationbyhostname.json)                  | Returns location for a given tenant.                       |
| [Get Locations](~/api-ref/intune/getlocations.json)                                       | Returns locations for a user tenant.                       |
| [Get MAM Flagged User By Name](~/api-ref/intune/getmamflaggeduserbyname.json)             | Returns Intune flagged user details.                       |
| [Get MAM Flagged Users](~/api-ref/intune/getmamflaggedusers.json)                         | Returns Intune flagged user collection.                    |
| [Get MAM Statuses](~/api-ref/intune/getmamstatuses.json)                                  | Returns Intune Tenant level statuses.                      |
| [Get MAM User Device By Device Name](~/api-ref/intune/getmamuserdevicebydevicename.json)  | Gets a unique device for a user.                           |
| [Get MAM User Devices](~/api-ref/intune/getmamuserdevices.json)                           | Gets devices for a user.                                   |
| [Get MAM User Flagged Enrolled Apps](~/api-ref/intune/getmamuserflaggedenrolledapps.json) | Returns Intune flagged enrolled app collection for a user. |
| [Get Operation Results](~/api-ref/intune/getoperationresults.json)                        | Returns operation results.                                 |
| [Ios](~/api-ref/intune/ios.json)                                                          | Provides operations for managing IOS MAM policies.         |
| [Wipe MAM User Device](~/api-ref/intune/wipemamuserdevice.json)                           | Wipes a device for a user.                                 |

## See also

- [Microsoft Intune](https://azure.microsoft.com/marketplace/partners/microsoft-corporation/microsoftintunemdm/)
- [Learn how to get your application certified](https://azure.microsoft.com/marketplace/programs/certified/intune/)