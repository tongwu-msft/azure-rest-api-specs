---
title: "Send Microsoft Push Notification Service (MPNS) notification"
description: Use this API reference documentation to send an MPNS native notification through a notification hub.
ms.custom: ""
ms.date: 08/05/2021
ms.reviewer: ""
ms.service: "notification-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
author: "sethmanheim"
ms.author: "sethm"
manager: "femila"

---


# Send a Microsoft Push Notification Service (MPNS) native notification

Sends an MPNS native notification through a notification hub.

> [!IMPORTANT]
> Microsoft Push Notification Service (MPNS) has been deprecated and is no longer supported.

## Request

| Method | Request URI | HTTP Version |
| ------ | ----------- | ------------ | 
| POST | `https://{namespace}.servicebus.windows.net/{NotificationHub}/messages/?api-version=2015-01` | HTTP/1.1 |

## Request headers

The following table describes required and optional request headers.

| Request header | Description | 
| -------------- | ----------- | 
| Authorization | Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). |
| Content-Type | Set to `application/xml;charset=utf-8`. |
| ServiceBusNotification-Tags | `{single tag identifier}` (optional) |
| ServiceBusNotification-Format | Set to `windowsphone` |
| X-* | All headers starting with X- will be forwarded to MPNS. See, [Push Notifications for Windows Phone 8](https://docs.microsoft.com/azure/notification-hubs/notification-hubs-windows-mobile-push-notifications-mpns).


## Request body

The request body is an XML document as [specified by MPNS](https://msdn.microsoft.com/library/windowsphone/develop/jj662933\(v=vs.105\).aspx). If the notification is a [raw notification](https://msdn.microsoft.com/library/windowsphone/develop/hh202977\(v=vs.105\).aspx), the body is any text up to 1 Kb. For example:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<wp:Notification xmlns:wp="WPNotification" Version="2.0">
  <wp:Tile Id="[Tile ID]" Template="IconicTile">
    <wp:SmallIconImage [Action="Clear"]>[small Tile size URI]</wp:SmallIconImage>
    <wp:IconImage Action="Clear">[medium/wide Tile size URI]</wp:IconImage>
    <wp:WideContent1 Action="Clear">[1st row of content]</wp:WideContent1>
    <wp:WideContent2 Action="Clear">[2nd row of content]</wp:WideContent2>
    <wp:WideContent3 Action="Clear">[3rd row of content]</wp:WideContent3>
    <wp:Count Action="Clear">[count]</wp:Count>
    <wp:Title Action="Clear">[title]</wp:Title>
    <wp:BackgroundColor Action="Clear">[hex ARGB format color]</wp:BackgroundColor>
  </wp:Tile>
</wp:Notification>
```

## Response

The response includes an HTTP status code and a set of response headers.

## Response codes

| Code | Description |
| ---- | ----------- | 
| 200 | Message successfully sent. |
| 400 | The request is malformed (for example, not valid routing headers, not valid content-type, message exceeds size, bad message format).|
| 401 | Authorization failure. The access key was incorrect. |
| 403 | Quota exceeded or message too large; message was rejected. |
| 404 | No message branch at the URI. |
| 413 | Requested entity too large. The message size cannot be over 64 Kb. |


For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes).

## Response headers

| Response header | Description |
| --------------- | ----------- |
| Location | This header is only available for Standard tier Notification Hubs.<p>This header will contain the Notification Message ID. It's used with [Get notification message telemetry](get-notification-message-telemetry.md) and correlating [PNS feedback](get-pns-feedback.md). The location header uses the following format:</p>`https://{your namespace}.servicebus.windows.net/{your hub name}/messages/{notification message id}?api-version=2015-04` |



## Response body

None.

## See Also
- [Direct send](direct-send.md)  
- [Send an APNS native notification](send-apns-native-notification.md)  
- [Send an GCM native notification](send-gcm-native-notification.md)  
- [Send a WNS native notification](send-wns-native-notification.md)
- [Send a template notification](send-template-notification.md)  

