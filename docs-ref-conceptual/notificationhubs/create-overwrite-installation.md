---
title: "Create or overwrite an installation"
description: Use this API reference documentation to create or overwrite an installation.
ms.custom: ""
ms.date: 04/05/2019
ms.reviewer: ""
ms.service: "notification-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
author: "spelluru"
ms.author: "spelluru"
manager: "timlt"

---

# Create or overwrite an installation
This method creates or overwrites an installation.

## Request

| Method | Request URI | HTTP version | 
| ------ | ----------- | ------------ | 
| PUT | `https://{namespace}.servicebus.windows.net/{NotificationHub}/installations/{id}?api-version=2015-01` | HTTP/1.1 |

## Request headers

The following table describes required and optional request headers.

| Request header | Description | 
| -------------- | ----------- | 
| Content-Type | application/json |
| Authorization | Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). |
| x-ms-version | 2015-01 |

## Request body

The following table describes the properties of the JSON request body for installations:

| Name | Type | Required | Read-only | Description | 
| ---- | ---- | -------- | --------- | ----------- |
| installationId | String | Yes | No | Globally unique identifier string |
| userID | String | No | No | Custom string containing a combination of alphanumeric characters and -_@#.:=\. There is a one to many relationship between UserID and Installation ID (i.e one User ID can be associated with multiple installations)  |
| lastActiveOn | String | No | Yes | The date when the installation was made inactivate by the PNS. | 
| expirationTime | String | No | Yes | A string containing the date and time in W3C DTF, YYYY-MM-DDThh:mmTZD (for example, 1997-07-16T19:20+01:00)) in which the registration will expire. The value can be set at the hub level on create or update, and will default to never expire (9999-12-31T23:59:59). | 
| lastUpdate | String | Ignored when updating. Returned when reading. | Yes | Date in W3C format of last update to this installation. | 
| platform | String | Yes | No | Can be {APNS, WNS, MPNS, ADM, GCM}. |
| pushChannel | String | Yes | No | The PNS handle for this installation (in case of WNS the ChannelUri of the ApplicationTile). | 
 | expiredPushChannel | Boolean | Ignored when updating. Returned when reading. | Yes | This is true if the PNS expired the channel. | 
 | tags | Array of strings | No | No | An array of tags. Tags are strings as defined in hub specs. |
| templates | JSON object | No | No | A JSON object representing a dictionary of templateNames to template description. |
 | templates.{name} | String | No  | No | JSON object representing a template. | 
| templates.{name}.body | String | Yes, if template present | No | Template for the body of notification payload. | 
 | templates.{name}.headers | JSON object | No. Can be present only if platform is WNS or MPNS. | No | JSON object where each property is a header name and value is a template expression. | 
 | templates.{name}.expiry | String | No. Can be present only if platform is apns | No | Template expression evaluating in W3D date format. |
 | templates.{name}.tags | Array of strings | No | No | Array of tags for this template. |
| secondaryTiles | JSON object | No. Can be present only if platform is wns. | No | JSON object containing a dictionary of tileId and secondaryTiles objects. | 
 | secondaryTile.{tileId} | JSON object | No | No | JSON object with push properties for secondary tiles. | 
| secondaryTile.{tileId}.pushChannel | String | Yes, if tileId is present | No | ChannelUri for secondary tile. |
 | secondaryTile.{tileId}.tags | Array of strings | No | No | Tags for native notifications to secondary tile. |
| secondaryTile.{tileId}.templates | JSON object | No | No | Same as templates property but for each secondary tile. | 


Note the following points: 

  - In JSON, the order of elements is not important.
  - Template body has to be JSON for APNS, GCM, ADM.
  - Template body must be XML for WNS and MPNS (except when raw).
  - Templates for WNS must include X-WNS-Type header.
  - Templates for MPNS must have compatible headers as mentioned in [Sending push notifications for Windows Phone 8](https://docs.microsoft.com/azure/notification-hubs/notification-hubs-windows-mobile-push-notifications-mpns).

Some JSON examples follow.

Example to register with APNS:

``` json
{ 
    "installationId": "12234", 
    "userID": "MyAmazingUser",
    "tags": ["foo", "bar"], 
    "platform": "apns", 
    "pushChannel": "ABCDEF-123456-…" 
}  
```


> [!NOTE]
> <P>The Tags element is optional.</P>



Example to register natively with WNS including a template and no tags:

``` json
{ 
    "installationId": "12234", 
    "userID": "MyAmazingUser",
    "platform": "wns", 
    "pushChannel": "https://db3...", 
    "templates": { 
        "myTemplate" : { 
            body : '<toast><visual lang="en-US"><binding template="ToastTest01"><text id="1">$myTextProp1</text></binding></visual></tile>',
            headers: { "X-WNS-Type": "wns/toast" }, 
            "tags": ["foo", "bar"] 
            } 

        } 
}  
```

A skeleton listing of many possible elements

``` json
{ 
    installationId: "", 
    userID: "",
    expirationTime: "", 
    tags: ["foo", "bar"],
    lastUpdate: “”, 
    user: "", 
    advertisingId: "", 
    appId: "" 
    platform: "", 
    pushChannel: "", 

    templates: { 
        "templateName1" : { 
            body: "", 
            headers: { "X-WNS-Type": "wns/tile" }, 
            expiration: "",
            tags: ["foo", "bar"] 
            } 
        } 

    secondaryTiles: { 
        "tileId1": { 
            pushChannel: "", 
            tags: ["foo", "bar"], 

            templates: { 
                "otherTemplate": { 
                    bodyTemplate: "", 
                    headers: { ... }, 
                    tags: ["foo"] 
                    } 
                } 
            } 
        }
}  
```

## Response

The response includes an HTTP status code and a set of response headers.

## Response codes
| Code | Description | 
| ---- | ----------- |
| 200 | The installation was queued successfully and will be processed in the background.. |
| 400 | The installation could not be created/overwritten because the request was malformed. | 
| 401 | Authorization failure. The access key was incorrect. | 
| 403 | Too many installations in this namespace - Installations not created. |

For information about status codes, see [Status and Error Codes](https://msdn.microsoft.com/library/windowsazure/dd179357.aspx).

## Response headers

| Response header | Description | 
| --------------- | ----------- | 
| Content-type | application/json | 
| Content-Location | The location of the installation in the format: `https://{namespace}.servicebus.windows.net/{NotificationHub}/installations/<installationId>` |

## Response body

None.

## See Also

[Read an installation](read-installation.md)  
[Update an installation by Installation ID](update-installation.md)  
[Delete an installation](delete-installation.md)

