---
title: "Get notification message telemetry"
description: Use this API reference documentation to provides additional telemetry on the finished states of outgoing push notifications.
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

# Get notification message telemetry
This API provides additional telemetry on the finished states of outgoing push notifications. It is designed to help monitor push notifications sent from a hub. The Notification ID that this API uses can be retrieved from the HTTP Location header included in the response of the REST API used to send the notification.

This Per Message Telemetry feature is also available for [scheduled notifications](https://azure.microsoft.com/documentation/articles/notification-hubs-send-scheduled-notifications/).

This API is only available for [Standard tier notification hubs](https://azure.microsoft.com/pricing/details/notification-hubs/).

## Request
| Method | Request URI | HTTP version |
| ------ | ----------- | ------------ | 
| GET | `https://{namespace}.servicebus.windows.net/{NotificationHub}/messages/{notification message ID}?api-version=2016-07` | HTTP/1.1 | 


## Request headers

The following table describes required and optional request headers.

| Request header | Description |
| -------------- | ----------- | 
| Authorization | Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). |
| x-ms-version | 2016-07 (Supported by 2015-01 or later) | 

## Request body

None.

## Response

The response includes an HTTP status code and a set of response headers. Response body is returned on success.

## Response codes
| Code | Description |
| ---- | ----------- | 
| 200 | The message telemetry was retrieved successfully. Telemetry data may be a partial response, depending on the number of devices targeted by the notification message that was sent. |
| 400 | Message telemetry could not be retrieved because the request was malformed. |
| 401 | Authorization failure. The access key was incorrect. |
| 403 | Request rejected because this feature is not enabled for your SKU. Upgrade to Standard. |
| 404 | Telemetry does not exist. This may be because the notification ID is invalid or because the message has not progressed far enough in processing. If you receive a 404 code, wait and try again after 10 seconds. This state can continue for up to 30 minutes. | 

For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes).

## Response headers

| Response header | Description |
| --------------- | ----------- |
| Content-type | `application/xml; charset=utf-8` |


## Response body
The response body will be a NotificationDetails document consisting of the following elements.

| Element | Description |
| ------- | ----------- | 
| NotificationId | The ID passed to the request that identifies the notification message. |
| Location | URI for the message |
| State | Indicates message progress. State may be one of the following values: <ul><li>**Abandoned**: Message processing has been abandoned. It will happen when the message could not be processed within the acceptable time window. By default, it's 30 minutes.</li><li>**Canceled**: This scheduled message was canceled by user.</li><li>**Completed**: Message processing has completed.</li><li>**Enqueued**: Message has been accepted but processing has not yet begun.</li><li>**NoTargetFound**: No devices were found to send this message.</li><li>**Processing**: Message processing has started.</li><li>**Scheduled**: Message is in queue and will be sent on the scheduled time.</li><li>**Unknown**: Message processing is in an unknown state.</li></ul> |
| EnqueueTime | Indicates the time the message was accepted. |
| StartTime | Indicates when the notification hub service started work on the notification. |
| EndTime | Indicates when the notification hub service finished work on the notification. |
| NotificationBody | Body of the original notification message. |
| TargetPlatforms | Indicates which platforms are targeted by the notification. May contain the following values as a comma-delimited string: <ul><li>`windows`</li><li>`apple`</li><li>`gcm`</li><li>`windowsphone`</li><li>`adm`</li><li>`baidu`</li><li>`template`</li><li>`windowstemplate`</li><li>`appletemplate`</li><li>`gcmtemplate`</li><li>`windowsphonetemplate`</li><li>`admtemplate`</li><li>`baidutemplate`</li> | 
| ApnsOutcomeCounts | This element will be present for notifications sent to Apple Push Notification Service. Contains a collection of Outcome instances. |
| MpnsOutcomeCounts | This element will be present for notifications sent to Microsoft Push Notification Service. Contains a collection of Outcome instances.| 
| WnsOutcomeCounts | This element will be present for notifications sent to Windows Notification Service. Contains a collection of Outcome instances. | 
| GcmOutcomeCounts | This element will be present for notifications sent to Google Cloud Messaging. Contains a collection of Outcome instances. |
| AdmOutcomeCounts | This element will be present for notifications sent to Amazon Device Messaging. Contains a collection of Outcome instances. |
| Outcome | A collection of these instances make up the counts above for each platform notification service. Each outcome can be one of the named counts mentioned in the [Outcomes](#outcomes) section. |
| PnsErrorDetailsUri | Requires Api-Version 2016-07 and above used for this API and the API sending the notification message.<p>PNS Error details are only fully available after the associated send operation is complete.</p>Gets the URI to a blob containing errors returned by each PNS involved. If no errors were reported by a PNS, this member will not be included in the response. You can use the Azure Storage API to read the blob. For more information, see, [Get started with Azure Blob storage using .NET](https://azure.microsoft.com/documentation/articles/storage-dotnet-how-to-use-blobs/) or [Azure Storage Services REST API Reference](/rest/api/storageservices/) Possible PNS errors include:<ul><li>Invalid PNS Credentials</li><li>PNS Unreachable</li><li>BadChannel</li><li>ExpiredChannel</li><li>PnsThrottled</li><li>InvalidToken</li><li>WrongToken</li><li>Dropped</li><li>WrongChannel</li></ul></p>

## Outcomes

| Name | Count description |
| ---- | ----------------- | 
| AbandonedNotificationMessages | Count of send requests to push service that were dropped because of a timeout. |
| BadChannel | Communication to the push service failed because the channel was invalid. |
| ChannelDisconnected | Push service disconnected. |
| ChannelThrottled | Push service denied access due to throttling. |
| Dropped | Push service indicates that the message was dropped. |
| ExpiredChannel | Communication to the push service failed because the channel expired. |
| InvalidCredentials | Credentials used to authenticate to the push service failed. |
| InvalidNotificationSize | Push request is too large. |
| NoTargets | Count of requests that found nothing to send to. |
| PnsInterfaceError | Push service contract communication failed. |
| PnsServerError | Push service indicated that an error happened on their side. |
| PnsUnavailable |Push service is not available. |
| PnsUnreachable | Push service was unresponsive. |
| Skipped | Count of duplicate registrations (same PNS handle found, different registration ID). |
| Success | Successfully sent the request to some number of devices. |
| Throttled | Push service denied access due to throttling. |
| UnknownError | An unknown error happened. |
| WrongToken | The PNS handle was not recognized by the PNS as a valid handle. |


Here is an example telemetry from sending a notification to WNS:

```xml
<NotificationDetails xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
  <NotificationId>{Your message id}</NotificationId>
  <Location>sb://{Your namespace}.servicebus.windows.net/{your hub name}/messages/{your message id}?api-version=2015-04</Location>
  <State>Completed</State>
  <EnqueueTime>2015-11-02T21:19:43Z</EnqueueTime>
  <StartTime>2015-11-02T21:19:43.9926996Z</StartTime>
  <EndTime>2015-11-02T21:19:43.9926996Z</EndTime>
  <NotificationBody>&lt;?xml version="1.0" encoding="utf-16"?&gt;&lt;toast&gt;&lt;visual&gt;&lt;binding template="ToastText01"&gt;&lt;text id="1"&gt;Hello from a .NET App!&lt;/text&gt;&lt;/binding&gt;&lt;/visual&gt;&lt;/toast&gt;</NotificationBody>
  <TargetPlatforms>windows</TargetPlatforms>
  <WnsOutcomeCounts>
    <Outcome>
      <Name>Success</Name>
      <Count>3</Count>
    </Outcome>
    <Outcome>
      <Name>WrongToken</Name>
      <Count>1</Count>
    </Outcome>
  </WnsOutcomeCounts>
  <PnsErrorDetailsUri>{Blob uri}</PnsErrorDetailsUri>
</NotificationDetails>
```

## See Also
[Send a template notification](send-template-notification.md)  
[Send an APNS native notification](send-apns-native-notification.md)  
[Send a GCM native notification](send-gcm-native-notification.md)  
[Send an MPNS native notification](send-mpns-native-notification.md)  
[Send a WNS native notification](send-wns-native-notification.md)


