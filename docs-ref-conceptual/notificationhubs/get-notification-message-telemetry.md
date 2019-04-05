---
title: "Get notification message telemetry"
ms.custom: ""
ms.date: "2019-04-05"
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

# Get notification message telemetry
This API provides additional telemetry on the finished states of outgoing push notifications. It is designed to help monitor push notifications sent from a hub. The Notification ID that this API uses can be retrieved from the HTTP Location header included in the response of the REST API used to send the notification.

This Per Message Telemetry feature is also available for [scheduled notifications](https://azure.microsoft.com/en-us/documentation/articles/notification-hubs-send-scheduled-notifications/).

This API is only available for [Standard tier notification hubs](https://azure.microsoft.com/pricing/details/notification-hubs/).

## Request

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Method</p></th>
<th><p>Request URI</p></th>
<th><p>HTTP version</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>GET</p></td>
<td><p>https://{namespace}.servicebus.windows.net/{NotificationHub}/messages/{notification message ID}?api-version=2016-07</p></td>
<td><p>HTTP/1.1</p></td>
</tr>
</tbody>
</table>


## Request Headers

The following table describes required and optional request headers.

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Request Header</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Authorization</p></td>
<td><p>Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS).</p></td>
</tr>
<tr class="even">
<td><p>x-ms-version</p></td>
<td><p><strong>2016-07</strong> (Supported by <strong>2015-01</strong> or later)</p></td>
</tr>
</tbody>
</table>


## Request Body

None.

## Response

The response includes an HTTP status code and a set of response headers. Response body is returned on success.

## Response Codes

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Code</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>200</p></td>
<td><p>The message telemetry was retrieved successfully. Telemetry data may be a partial response, depending on the number of devices targeted by the notification message that was sent.</p></td>
</tr>
<tr class="even">
<td><p>400</p></td>
<td><p>Message telemetry could not be retrieved because the request was malformed.</p></td>
</tr>
<tr class="odd">
<td><p>401</p></td>
<td><p>Authorization failure. The access key was incorrect.</p></td>
</tr>
<tr class="even">
<td><p>403</p></td>
<td><p>Request rejected because this feature is not enabled for your SKU. Upgrade to Standard.</p></td>
</tr>
<tr class="odd">
<td><p>404</p></td>
<td><p>Telemetry does not exist. This may be because the notification ID is invalid or because the message has not progressed far enough in processing. If you receive a 404 code, wait and try again after 10 seconds. This state can continue for up to 30 minutes.</p></td>
</tr>
</tbody>
</table>


For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/windowsazure/dd179357.aspx).

## Response Headers

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Response Header</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>Content-type</strong></p></td>
<td><p>application/xml; charset=utf-8</p></td>
</tr>
</tbody>
</table>


## Response Body

The response body will be a NotificationDetails document consisting of the following elements.

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Element</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>NotificationId</p></td>
<td><p>The ID passed to the request that identifies the notification message.</p></td>
</tr>
<tr class="even">
<td><p>Location</p></td>
<td><p>URI for the message</p></td>
</tr>
<tr class="odd">
<td><p>State</p></td>
<td><p>Indicates message progress. State may be one of the following values:</p>
<ul>
<li><p> <strong>Abandoned</strong>: Message processing has been abandoned. It will happen when<br />
the message could not be processed within the acceptable time window.<br />
By default, it's 30 minutes.</p></li>
<li><p><strong>Canceled</strong>: This scheduled message was canceled by user.</p></li>
<li><p><strong>Completed</strong>: Message processing has completed.</p></li>
<li><p><strong>Enqueued</strong>: Message has been accepted but processing has not yet begun.</p></li>
<li><p><strong>NoTargetFound</strong>: No devices were found to send this message.</p></li>
<li><p><strong>Processing</strong>: Message processing has started.</p></li>
<li><p><strong>Scheduled: Message is in queue and will be sent on the scheduled time.</p></li>
<li><p><strong>Unknown</strong>: Message processing is in an unknown state.</p></li>
</ul></td>
</tr>
<tr class="even">
<td><p>EnqueueTime</p></td>
<td><p>Indicates the time the message was accepted.</p></td>
</tr>
<tr class="odd">
<td><p>StartTime</p></td>
<td><p>Indicates when the notification hub service started work on the notification.</p></td>
</tr>
<tr class="even">
<td><p>EndTime</p></td>
<td><p>Indicates when the notification hub service finished work on the notification.</p></td>
</tr>
<tr class="odd">
<td><p>NotificationBody</p></td>
<td><p>Body of the original notification message.</p></td>
</tr>
<tr class="even">
<td><p>TargetPlatforms</p></td>
<td><p>Indicates which platforms are targeted by the notification. May contain<br />
the following values as a comma-delimited string:</p>
<ul>
<li><p>windows</p></li>
<li><p>apple</p></li>
<li><p>gcm</p></li>
<li><p>windows phone</p></li>
<li><p>adm</p></li>
<li><p>baidu</p></li>
<li><p>template</p></li>
<li><p>windows template</p></li>
<li><p>apple template</p></li>
<li><p>gcmtemplate</p></li>
<li><p>windowsphonetemplate</p></li>
<li><p>admtemplate</p></li>
<li><p>baidutemplate</p></li>
</ul></td>
</tr>
<tr class="odd">
<td><p>ApnsOutcomeCounts</p></td>
<td><p>This element will be present for notifications sent to Apple Push Notification Service.<br />
Contains a collection of Outcome instances.</p></td>
</tr>
<tr class="even">
<td><p>MpnsOutcomeCounts</p></td>
<td><p>This element will be present for notifications sent to Microsoft Push Notification Service.<br />
Contains a collection of Outcome instances.</p></td>
</tr>
<tr class="odd">
<td><p>WnsOutcomeCounts</p></td>
<td><p>This element will be present for notifications sent to Windows Notification Service.<br />
Contains a collection of Outcome instances.</p></td>
</tr>
<tr class="even">
<td><p>GcmOutcomeCounts</p></td>
<td><p>This element will be present for notifications sent to Google Cloud Messaging.<br />
Contains a collection of Outcome instances.</p></td>
</tr>
<tr class="odd">
<td><p>AdmOutcomeCounts</p></td>
<td><p>This element will be present for notifications sent to Amazon Device Messaging.<br />
Contains a collection of Outcome instances.</p></td>
</tr>
<tr class="even">
<td><p>Outcome</p></td>
<td><p>A collection of these instances make up the counts above for each platform notification service. Each outcome can be one of the following named counts.</p>
<div>
<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Name</p></th>
<th><p>Count Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>AbandonedNotificationMessages</p></td>
<td><p>Count of send requests to push service that were dropped because of a timeout.</p></td>
</tr>
<tr class="even">
<td><p>BadChannel</p></td>
<td><p>Communication to the push service failed because the channel was invalid.</p></td>
</tr>
<tr class="odd">
<td><p>ChannelDisconnected</p></td>
<td><p>Push service disconnected.</p></td>
</tr>
<tr class="even">
<td><p>ChannelThrottled</p></td>
<td><p>Push service denied access due to throttling.</p></td>
</tr>
<tr class="odd">
<td><p>Dropped</p></td>
<td><p>Push service indicates that the message was dropped.</p></td>
</tr>
<tr class="even">
<td><p>ExpiredChannel</p></td>
<td><p>Communication to the push service failed because the channel expired.</p></td>
</tr>
<tr class="odd">
<td><p>InvalidCredentials</p></td>
<td><p>Credentials used to authenticate to the push service failed.</p></td>
</tr>
<tr class="even">
<td><p>InvalidNotificationFormat</p></td>
<td><p>Push request was formatted incorrectly for the push service.</p></td>
</tr>
<tr class="odd">
<td><p>InvalidNotificationSize</p></td>
<td><p>Push request is too large.</p></td>
</tr>
<tr class="even">
<td><p>NoTargets</p></td>
<td><p>Count of requests that found nothing to send to.</p></td>
</tr>
<tr class="odd">
<td><p>PnsInterfaceError</p></td>
<td><p>Push service contract communication failed.</p></td>
</tr>
<tr class="even">
<td><p>PnsServerError</p></td>
<td><p>Push service indicated that an error happened on their side.</p></td>
</tr>
<tr class="odd">
<td><p>PnsUnavailable</p></td>
<td><p>Push service is not available.</p></td>
</tr>
<tr class="even">
<td><p>PnsUnreachable</p></td>
<td><p>Push service was unresponsive.</p></td>
</tr>
<tr class="odd">
<td><p>Skipped</p></td>
<td><p>Count of duplicate registrations (same PNS handle found, different registration ID).</p></td>
</tr>
<tr class="even">
<td><p>Success</p></td>
<td><p>Successfully sent the request to some number of devices.</p></td>
</tr>
<tr class="odd">
<td><p>Throttled</p></td>
<td><p>Push service denied access due to throttling.</p></td>
</tr>
<tr class="even">
<td><p>UnknownError</p></td>
<td><p>An unknown error happened.</p></td>
</tr>
<tr class="odd">
<td><p>WrongToken</p></td>
<td><p>The PNS handle was not recognized by the PNS as a valid handle.</p></td>
</tr>
</tbody>
</table>

</div></td>
</tr>
<tr class="odd">
<td><p>PnsErrorDetailsUri</p></td>
<td><p><em>Requires Api-Version 2016-07 and above used for this API and the API sending the notification message.</em></p>
<p>PNS Error details are only fully available after the associated send operation is complete.</p>
<p>Gets the URI to a blob containing errors returned by each PNS involved. If no errors were reported by a PNS, this member will not be included in the response. You can use the Azure Storage API to read the blob. For more information, see, <a href="https://azure.microsoft.com/documentation/articles/storage-dotnet-how-to-use-blobs/">Get started with Azure Blob storage using .NET</a> or <a href="https://msdn.microsoft.com/library/azure/dd179355.aspx">Azure Storage Services REST API Reference</a> Possible PNS errors include:</p>
<ul>
<li><p>Invalid PNS Credentials</p></li>
<li><p>PNS Unreachable</p></li>
<li><p>BadChannel</p></li>
<li><p>ExpiredChannel</p></li>
<li><p>PnsThrottled</p></li>
<li><p>InvalidToken</p></li>
<li><p>WrongToken</p></li>
<li><p>Dropped</p></li>
<li><p>WrongChannel</p></li>
</ul></td>
</tr>
</tbody>
</table>


Here is an example telemetry from sending a notification to WNS:

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

## See Also
[Send a template notification](send-template-notification.md)  
[Send an APNS native notification](send-apns-native-notification.md)  
[Send a GCM native notification](send-gcm-native-notification.md)  
[Send an MPNS native notification](send-mpns-native-notification.md)  
[Send a WNS native notification](send-wns-native-notification.md)


