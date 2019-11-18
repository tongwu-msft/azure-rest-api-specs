---
title: "Direct send"
ms.custom: ""
ms.date: 04/05/2019
ms.prod: "azure"
ms.reviewer: ""
ms.service: "notification-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
author: "spelluru"
ms.author: "spelluru"
manager: "timlt"

---

# Direct send
Sends a notification directly to a device handle (a valid token as expressed by the Notification type). Users of this API do not need to use Registrations or Installations. Instead, users of this API manage all devices on their own and use Azure Notification Hub solely as a pass through service to communicate with the various Push Notification Services.

>[!NOTE]
> We continue to support Google Cloud Messaging (GCM) as long as Google supports it via their [Firebase Cloud Messaging (FCM) legacy API](https://firebase.google.com/docs/cloud-messaging/http-server-ref). This API doesn't support Firebase Cloud Messaging (FCM) yet. 


## Request

| Method | Request URI | HTTP Version |
| ------ | ----------- | ------------ |
|  POST | `https://{namespace}.servicebus.windows.net/{NotificationHub}/messages/?direct&api-version=2015-04` | HTTP/1.1 |

## Request headers

The following table describes required and optional request headers.

| Request header | Description |
| -------------- | ----------- | 
| Authorization | Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). |
| Content-Type | Set the Content-Type header based on the target platform notification service below:<ul><li>WNS: Set to application/json;charset=utf-8 or application/xml. If the notification type (X-WNS-Type) is “wns/raw”, set to application/octet-stream.</li><li>GCM and APNS: Set to application/json;charset=utf-8.</li><li>MPNS: Set to application/xml;charset=utf-8.</li></ul> |
| ServiceBusNotification-DeviceHandle | The PNS device handle. |
| ServiceBusNotification-Tags | {single tag identifier} (optional) |
| ServiceBusNotification-Format | Set to one of the following valid PlatformType values: `windows`, `apple`, `gcm`, `windowsphone`, `adm`, `nokiax`, `baidu`
| x-ms-version | 2015-04 (Supported by 2015-01 and later) |

## Request body

Based on the platform type, the request body formats will change. Refer to the body formats for each individual platform in native Send REST APIs.

  - [Send an APNS native notification](send-apns-native-notification.md)
  - [Send a GCM native notification](send-gcm-native-notification.md)
  - [Send a MPNS native notification](send-mpns-native-notification.md)
  - [Send a WNS native notification](send-wns-native-notification.md)

## Response

The response includes an HTTP status code and a set of response headers. Response body is returned on success.

## Response codes
| Code | Description |
| ---- | ----------- | 
| 201 | Message successfully sent. |
| 400 | The request is malformed (for example, not valid routing headers, not valid content-type, message exceeds size, bad message format). |
| 401 | Authorization failure. The access key was incorrect. |
| 403 | Quota exceeded or message too large; message was rejected. |
| 404 | No message branch at the URI. |
| 413 | Requested entity too large. The message size cannot be over 64 Kb. |

For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes).

## Response headers
| Response header | Description |
| --------------- | ----------- | 
| Content-Type | `application/xml; charset=utf-8` | 
| Location | This header is only available for [Standard tier Notification Hubs](https://azure.microsoft.com/pricing/details/notification-hubs/).<p>This header will contain the Notification Message ID. It is used with Per Message Telemetry: Get Notification Message Telemetry and correlating [PNS Feedback](get-pns-feedback.md). The location header uses the following format:</p>`https://{your namespace}.servicebus.windows.net/{your hub name}/messages/{notification message id}?api-version=2015-04`

## Response body

None.

## See Also
[Direct batch send](direct-batch-send.md)  
[Send an APNS native notification](send-apns-native-notification.md)  
[Send a GCM native notification](send-gcm-native-notification.md)  
[Send an MPNS native notification](send-mpns-native-notification.md)  
[Send a WNS native notification](send-wns-native-notification.md)


