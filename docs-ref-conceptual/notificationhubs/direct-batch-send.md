---
title: "Send batches directly to a collection of device handles"
description: Use this API reference documentation to send a batch of notifications directly to a collection of device handles (a valid token as expressed by the Notification type).
ms.custom: ""
ms.date: "10/14/2019"
ms.reviewer: ""
ms.service: "notification-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
author: "sethmanheim"
ms.author: "sethm"
manager: "femila"

---

# Send batches directly to a collection of device handles

Sends a batch of notifications directly to a collection of device handles (a valid token as expressed by the Notification type). This API is available for [Basic and Standard tier Notification Hub namespaces](https://azure.microsoft.com/pricing/details/notification-hubs/). Users of this API do not need to use registrations or installations. Instead, users of this API manage all devices on their own and use a notification hub solely as a pass-through service to communicate with the various Push Notification Services.

At this time, Direct Batch Send supports up to 1000 devices per request.

>[!NOTE]
> We continue to support Google Cloud Messaging (GCM) as long as Google supports it via their [Firebase Cloud Messaging (FCM) legacy API](https://firebase.google.com/docs/cloud-messaging/http-server-ref). This API doesn't support Firebase Cloud Messaging (FCM) yet. 

## Request

| Method | Request URI | HTTP Version |
| ------ | ----------- | 
| POST | `https://{namespace}.servicebus.windows.net/{NotificationHub}/messages/$batch?direct&api-version=2015-08` | HTTP/1.1 |

## Request headers

The following table describes required and optional request headers.

| Request header | Description |
| -------------- | ----------- | 
| Authorization | Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). For more information, see [Common Concepts](common-concepts.md). |
| Content-Type | `multipart/mixed; boundary="boundary-string"` <br/><br/> The boundary string is used to separate each part according to the multipart content type defined in [RFC1341](https://www.w3.org/protocols/rfc1341/7_2_multipart.html). Each part starts with an encapsulation boundary, and then contains a body part consisting of header area, a blank line, and a body area. |
| ServiceBusNotification-Format | Set to one of the following valid PlatformType values: `windows`, `apple`, `gcm`, `windowsphone`, `adm`, `nokiax`, `baidu`. |
| x-ms-version | 2015-04 (Supported by 2015-01 and later) |


## Request body

The request body is multipart as defined in [RFC1341](https://www.w3.org/protocols/rfc1341/7_2_multipart.html). Each part starts with an encapsulation boundary, and then contains a body part consisting of header area, a blank line, and a body area. The blank link must not contain any whitespace. See the request examples below.

Based on the target platform type, the body format of a notification part will change to be compliant with each individual platform as covered in the native Send APIs below.

  - [Send an APNS Native Notification](send-apns-native-notification.md)
  - [Send a GCM Native Notification](send-gcm-native-notification.md)
  - [Send an MPNS Native Notification](send-mpns-native-notification.md)
  - [Send a WNS Native Notification](send-wns-native-notification.md)

The devices part of the request body must be a JSON array of the device handles that will receive the notification.

## Request examples

Here is a **WNS** example:

```shell
POST https://{namespace}.servicebus.windows.net/{Notification Hub}/messages/$batch?direct&api-version=2015-08 HTTP/1.1
Content-Type: multipart/mixed; boundary = "simple-boundary"
Authorization: SharedAccessSignature sr=https%3a%2f%2f{Namespace}.servicebus.windows.net%2f{Notification Hub}%2fmessages%2f%24batch%3fdirect%26api-version%3d2015-08&sig={Signature}&skn=DefaultFullSharedAccessSignature
ServiceBusNotification-Format: windows
X-WNS-Type: wns/toast
Host: {Namespace}.servicebus.windows.net
Content-Length: 514
Expect: 100-continue
Connection: Keep-Alive


--simple-boundary
Content-type: text/xml
Content-Disposition: inline; name=notification

<toast><visual><binding template="ToastText01"><text id="1">Hello there!</text></binding></visual></toast>
--simple-boundary
Content-type: application/json
Content-Disposition: inline; name=devices

['https://db5.notify.windows.com/?token={Token1}','https://db5.notify.windows.com/?token={Token2}','https://db5.notify.windows.com/?token={Token3}']
--simple-boundary--
```
  
Here is a **GCM** example:

```shell
POST https://{Namespace}.servicebus.windows.net/{Notification Hub}/messages/$batch?direct&api-version=2015-08 HTTP/1.1
Content-Type: multipart/mixed; boundary="simple-boundary"
Authorization: SharedAccessSignature sr=https%3a%2f%2f{Namespace}.servicebus.windows.net%2f{Notification Hub}%2fmessages%2f%24batch%3fdirect%26api-version%3d2015-08&sig={Signature}&skn=DefaultFullSharedAccessSignature
ServiceBusNotification-Format: gcm
Host: {Namespace}.servicebus.windows.net
Content-Length: 431
Expect: 100-continue
Connection: Keep-Alive


--simple-boundary
Content-Type: application/json
Content-Disposition: inline; name=notification

{"data":{"message":"Hello via Direct Batch Send!!!"}}
--simple-boundary
Content-Type: application/json
Content-Disposition: inline; name=devices

['Device Token1','Device Token2','Device Token3']
--simple-boundary--
```
  
The following is an **APNS** example:

```shell
POST https://{Namespace}.servicebus.windows.net/{Notification Hub}/messages/$batch?direct&api-version=2015-08 HTTP/1.1
Content-Type: multipart/mixed; boundary="simple-boundary"
Authorization: SharedAccessSignature sr=https%3a%2f%2f{Namespace}.servicebus.windows.net%2f{Notification Hub}%2fmessages%2f%24batch%3fdirect%26api-version%3d2015-08&sig={Signature}&skn=DefaultFullSharedAccessSignature
ServiceBusNotification-Format: apple
Host: {Namespace}.servicebus.windows.net
Content-Length: 511
Expect: 100-continue
Connection: Keep-Alive


--simple-boundary
Content-Type: application/json
Content-Disposition: inline; name=notification

{"aps":{"alert":"Hello using APNS via Direct Batch Send!!!"}}
--simple-boundary
Content-Type: application/json
Content-Disposition: inline; name=devices

['Device Token1','Device Token2','Device Token3']
--simple-boundary--
```

## Response

The response includes an HTTP status code and a set of response headers. No response body is returned on success.

## Response codes

| Code | Description |
| ---- | ----------- | 
| 201 | Created. |
| 400 | Could not find a part of the multipart content supplied. |
| 401 | Authorization failure. The access key was incorrect. |
| 403 | Quota exceeded or message too large; message was rejected. |
| 404 | No message branch at the URI. |
| 413 | Requested entity too large. The message size cannot be over 64 Kb. |

For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes).

## Response headers

| Response header | Description |
| --------------- | ----------- | 
 |Content-Type | application/xml; charset=utf-8 |
| Location | This header is only available for Standard tier Notification Hubs. <p>This header will contain the notification message ID. It is used with Per Message Telemetry: Get Notification Message Telemetry and correlating PNS Feedback. The location header uses the following format:</p>`https://{your namespace}.servicebus.windows.net/{your hub name}/messages/{notification message id}?api-version=2015-04`

## Response body

None

## See Also

[Direct send](direct-send.md)  
[Send an APNS native notification](send-apns-native-notification.md)  
[Send a GCM native notification](send-gcm-native-notification.md)  
[Send an MPNS native notification](send-mpns-native-notification.md)  
[Send a WNS native notification](send-wns-native-notification.md)

