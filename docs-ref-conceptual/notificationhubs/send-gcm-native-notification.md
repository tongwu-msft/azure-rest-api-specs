---
title: "Send a Google Cloud Messaging (GCM) native notification"
description: Use this API reference documentation to send a GCM native notification through a notification hub. 
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


# Send a Google Cloud Messaging (GCM) native notification

 


Sends a GCM native notification through a notification hub.

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
| ServiceBusNotification-Format | Set to `gcm`. |


## Request body

The request body is a JSON object as [specified by Google](https://firebase.google.com/docs/cloud-messaging/http-server-ref) (without a **registration\_ids** property). For example:

```json
{ "collapse_key": "score_update",
  "time_to_live": 108,
  "delay_while_idle": true,
  "data": {
    "score": "4x8",
    "time": "15:16.2342"
  }
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
| Location | This header is only available for Standard tier Notification Hubs. <p> This header will contain the Notification Message ID. It's used with [Get Notification Message Telemetry](get-notification-message-telemetry.md) and correlating [PNS Feedback](get-pns-feedback.md). The location header uses the following format:</p> `https://{your namespace}.servicebus.windows.net/{your hub name}/messages/{notification message id}?api-version=2015-04`

## Response body

None.

## See Also
- [Direct send](direct-send.md)  
- [Send an APNS native notification](send-apns-native-notification.md)  
- [Send an MPNS native notification](send-mpns-native-notification.md)  
- [Send a WNS native notification](send-wns-native-notification.md)
- [Send a template notification](send-template-notification.md)  
