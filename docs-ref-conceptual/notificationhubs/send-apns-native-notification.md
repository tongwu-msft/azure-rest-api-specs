---
title: "Send an Apple Platform Notification Services (APNS) notification"
description: Use this API reference documentation to send an APNS native notification through a notification hub.
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


# Send an Apple Platform Notification Services (APNS) native notification
Sends an APNS native notification through a notification hub.

## Request

| Method | Request URI | HTTP Version |
| ------ | ----------- | ------------ | 
| POST | `https://{namespace}.servicebus.windows.net/{NotificationHub}/messages/?api-version=2015-01` | HTTP/1.1 |

## Request headers

The following table describes required and optional request headers.

| Request header | Description |
| -------------- | ----------- | 
| Authorization | Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). |
| Content-Type | Set to `application/json;charset=utf-8`. |
| ServiceBusNotification-Tags | `{single tag identifier}` (optional) |
| ServiceBusNotification-Format | Set to `apple`. |
| ServiceBusNotification-Apns-Expiry | Apns expiry in W3C DTF, YYYY-MM-DDThh:mmTZD (for example, 1997-07-16T19:20+01:00). |


## Request body

The request body is an XML document as [specified by Apple](http://developer.apple.com/library/ios/#documentation/networkinginternet/conceptual/remotenotificationspg/applepushservice/applepushservice.html). For example:

```json
    { 
        "aps" : { 
            "alert" : " This is my toast message for iOS!", 
        }, 
    }
```
## Response

The response includes an HTTP status code and a set of response headers.

## Response codes

| Code | Description |
| ---- | ----------- | 
| 200 | Message successfully sent. |
| 400 | The request is malformed (for example, not valid routing headers, not valid content-type, message exceeds size, bad message format). |
| 401 | Authorization failure. The access key was incorrect. |
| 403 | Quota exceeded or message too large; message was rejected. |
| 404 | No message branch at the URI. |
| 413 | Requested entity too large. The message size cannot be over 64 Kb. |

For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes).

## Response headers

| Response header | Description |
| --------------- | ----------- | 
| Location | This header is only available for Standard tier Notification Hubs. <p>This header will contain the Notification Message ID. It's used with Per Message Telemetry: Get Notification Message Telemetry and correlating PNS Feedback. The location header uses the following format:</p>`https://{your namespace}.servicebus.windows.net/{your hub name}/messages/{notification message id}?api-version=2015-04`

## Response body

None.

## See Also
[Direct batch send](direct-batch-send.md)  
[Send an APNS native notification](send-apns-native-notification.md)  
[Send an MPNS native notification](send-mpns-native-notification.md)  
[Send a WNS native notification](send-wns-native-notification.md)
[Send a template notification](send-template-notification.md)  

