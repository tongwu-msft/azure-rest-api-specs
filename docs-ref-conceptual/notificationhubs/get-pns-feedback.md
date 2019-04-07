---
title: "Get Platform Notification Services (PNS) feedback"
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

# Get Platform Notification Services (PNS) feedback
Retrieves an Azure Storage container URL. The container has feedback data for the notification hub. The caller can then use the [Azure Storage Services REST API](/rest/api/storageservices/) to retrieve the contents of the container.

## Request

| Method | Request URI | HTTP version |
| ------ | ----------- | ------------ | 
| GET | `https://{namespace}.servicebus.windows.net/{Notification Hub}/feedbackcontainer?api-version=2015-01` | HTTP/1.1 |

## Request headers
The following table describes required and optional request headers.

| Request header | Description |
| -------------- | ----------- | 
| Content-Type | `application/xml;type=entry;charset=utf-8` |
| Authorization | Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). |
| x-ms-version | 2015-01 |

## Request body

None.

## Response

The response includes an HTTP status code and a set of response headers.

## Response codes

| Code | Description |
| ---- | ----------- | 
| 200 | Fetched the container URL. |
| 401 | Authorization failure. The access key was incorrect. |
| 403 | Request rejected because feature is not enabled for your SKU. Upgrade to Standard. |

For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes).

## Response headers

None.

## Response body

Upon success, an Azure Storage Container URL is returned, complete with authentication token.

For example:

```
https://pushpnsfb5702abf7f71e31.blob.core.windows.net/00000000000297200840?sv=2014-02-14&sr=c&sig=XXxxxxxxxxxxxxx%xxxx%2xxxxxxxxxxxxxxxxxxxxxxxxxx%3D&se=2015-05-01T00%3A00%3A22Z&sp=rl
```

The returned URL can then be used to navigate the container and fetch the contents using the [Azure Storage Services REST API](/rest/api/storageservices/)

The following shows example PNS feedback, which indicates WNS expired channels associated with two different notification message Ids:

```xml
<EnumerationResults ServiceEndpoint="---Removed---" ContainerName="00000000002001061088">
  <Blobs>
    <Blob>
      <Name>07272016</Name>
      <Properties>
        <Last-Modified>Wed, 27 Jul 2016 20:57:07 GMT</Last-Modified>
        <Etag>---Removed---</Etag>
        <Content-Length>7150</Content-Length>
        <Content-Type>application/octet-stream</Content-Type>
        <Content-Encoding />
        <Content-Language />
        <Content-MD5 />
        <Cache-Control />
        <Content-Disposition />
        <BlobType>BlockBlob</BlobType>
        <LeaseStatus>unlocked</LeaseStatus>
        <LeaseState>available</LeaseState>
      </Properties>
    </Blob>
  </Blobs>
  <NextMarker />
</EnumerationResults>

Get Blob named : 07272016

<?xml version="1.0" encoding="utf-16"?>
<PnsFeedback xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">
  <FeedbackTime>2016-07-27T20:47:10.8905532Z</FeedbackTime>
  <NotificationSystemError>ExpiredChannel</NotificationSystemError>
  <Platform>windows</Platform>
  <PnsHandle>---Removed---</PnsHandle>
  <NotificationId>215e3aba529b49da9b6d35c134147952-20160727204710-2001061088-1</NotificationId>
</PnsFeedback>

<?xml version="1.0" encoding="utf-16"?>
<PnsFeedback xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">
  <FeedbackTime>2016-07-27T20:56:34.1588971Z</FeedbackTime>
  <NotificationSystemError>ExpiredChannel</NotificationSystemError>
  <Platform>windows</Platform>
  <PnsHandle>---Removed---</PnsHandle>
  <NotificationId>82d1e0626bd14221be7298341ae9a7b3-20160727205634-2001061088-1</NotificationId>
</PnsFeedback>
```
## Example code

Example code demonstrating this REST API is available in the [azure-notificationhubs-samples GitHub repository](https://github.com/Azure/azure-notificationhubs-dotnet/tree/master/Samples/SendRestExample).

