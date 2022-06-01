---
title: "Send a Windows Push Notification Services (WNS) native notification"
itle: "Send a template notification"
description: Use this API reference documentation to send a WNS native notification through a notification hub.
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


# Send a Windows Push Notification Service (WNS) native notification
Sends a WNS native notification through a notification hub.

## Request

| Method | Request URI | HTTP version |
| ------ | ----------- | ------------ |
| POST | `https://{namespace}.servicebus.windows.net/{NotificationHub}/messages/?api-version=2015-01` | HTTP/1.1 |

## Request headers

The following table describes required and optional request headers.

| Request header | Description |
| -------------- | ----------- |
| Authorization | Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). |
| Content-Type | Set to `application/json;charset=utf-8` or `application/xml`. If the notification type (`X-WNS-Type`) is `wns/raw`, set to `application/octet-stream`. |
| ServiceBusNotification-Tags | `{single tag identifier}` (optional) |
| ServiceBusNotification-Format | Set to `windows` |
| X-WNS- | All headers starting with X-WNS will be forwarded to WNS. |

## Request body

The request body is an XML document as [specified by WNS](https://msdn.microsoft.com/library/windows/apps/hh465460.aspx). If the notification is of type “wns/raw”, the body is any text up to 5 Kb. For example:

``` xml
<?xml version="1.0" encoding="utf-8" ?>
<toast>
    <visual lang="en-US">
        <binding template="ToastText01">
            <text id="1”>
                This is my toast message for Win8!
            </text>
        </binding>
    </visual>
</toast>
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
| Location | This header is only available for [Standard tier Notification Hubs](https://azure.microsoft.com/pricing/details/notification-hubs/).<p>This header will contain the Notification Message ID. It's used with [per message telemetry](get-notification-message-telemetry.md) and correlating [PNS Feedback](get-pns-feedback.md). The location header uses the following format:</p>`https://{your namespace}.servicebus.windows.net/{your hub name}/messages/{notification message id}?api-version=2015-04` |


## Response body

None.

## See Also

- [Direct send](direct-send.md)  
- [Send an APNS native notification](send-apns-native-notification.md)  
- [Send an GCM native notification](send-gcm-native-notification.md)  
- [Send an MPNS native notification](send-mpns-native-notification.md)  
- [Send a template notification](send-template-notification.md)  

