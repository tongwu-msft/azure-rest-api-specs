---
title: PNS Feedback
TOCTitle: PNS Feedback
ms:assetid: 941bf4e1-644d-483e-ae5a-ebe776016184
ms:mtpsurl: https://msdn.microsoft.com/en-us/library/Mt705560(v=Azure.100)
ms:contentKeyID: 72915511
ms.date: 07/27/2016
mtps_version: v=Azure.100
---

# PNS Feedback

 


Retrieves an Azure Storage container URL. The container has feedback data for the notification hub. The caller can then use the [Azure Storage Services REST API](https://msdn.microsoft.com/library/azure/dd179355.aspx) to retrieve the contents of the container.

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
<td><p>https://{namespace}.servicebus.windows.net/{Notification Hub}/feedbackcontainer?api-version=2015-01</p></td>
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
<td><p>Content-Type</p></td>
<td><p>application/xml;type=entry;charset=utf-8</p></td>
</tr>
<tr class="even">
<td><p>Authorization</p></td>
<td><p>Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS).</p></td>
</tr>
<tr class="odd">
<td><p>x-ms-version</p></td>
<td><p><strong>2015-01</strong></p></td>
</tr>
</tbody>
</table>


## Request Body

None.

## Response

The response includes an HTTP status code and a set of response headers.

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
<td><p>Fetched the container URL.</p></td>
</tr>
<tr class="even">
<td><p>401</p></td>
<td><p>Authorization failure. The access key was incorrect.</p></td>
</tr>
<tr class="odd">
<td><p>403</p></td>
<td><p>Request rejected because feature is not enabled for your SKU. Upgrade to Standard.</p></td>
</tr>
</tbody>
</table>


For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/windowsazure/dd179357.aspx).

## Response Headers

None.

## Response Body

Upon success, an Azure Storage Container URL is returned, complete with authentication token.

For example:

    https://pushpnsfb5702abf7f71e31.blob.core.windows.net/00000000000297200840?sv=2014-02-14&sr=c&sig=YqBZlW14810z%2BYc%2BnFNeYjMZawnNHhqJRQGhhC1qdHU%3D&se=2015-05-01T00%3A00%3A22Z&sp=rl

The returned URL can then be used to navigate the container and fetch the contents using the [Azure Storage Services REST API](https://msdn.microsoft.com/library/azure/dd179355.aspx)

The following shows example PNS feedback which indicates WNS expired channels associated with two different notification message Ids:

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

## Example Code

Example code demonstrating this REST API is available in the [azure-notificationhubs-samples GitHub repository](https://github.com/azure/azure-notificationhubs-samples/blob/master/dotnet/sendrestexample/sendrestexample/program.cs).

