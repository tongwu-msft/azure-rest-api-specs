---
title: Create or Update Namespace PNS Credentials
TOCTitle: Create or Update Namespace PNS Credentials
ms:assetid: 4e88e79d-8df0-4cee-9977-e8c7607e90f2
ms:mtpsurl: https://msdn.microsoft.com/en-us/library/Mt238294(v=Azure.100)
ms:contentKeyID: 65913460
ms.date: 08/18/2015
mtps_version: v=Azure.100
---

# Create or Update Namespace PNS Credentials

 


The namespace level Push Notification Services (PNS) APIs are designed for large apps that span across multiple hubs. They enable developers to easily read and update unified PNS settings for multiple hubs under the same namespace at once. When PNS credentials have been set at namespace level using this endpoint, all hubs in the namespace will use the credentials provided with the namespace settings. Hub creations in the namespace with PNS credentials won’t be allowed.

This topic is a reference for setting the unified PNS credentials for a namespace. When PNS credentials are set at hub level first, this endpoint will no longer be available.

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
<td><p>PUT</p></td>
<td><p>https://management.core.windows.net/{subscription ID}/services/ServiceBus/Namespaces/{namespace name}/NotificationHubPnsCredentials/?api-version=2015-01</p></td>
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
<td><p><strong>2015-01</strong></p></td>
</tr>
</tbody>
</table>


## Request Body

XML credentials to be used for all notification hubs in the namespace.

    <NotificationHubPnsCredentials xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">
    
    <ApnsCredential>
       <Properties>
          <Property>
             <Name>Endpoint</Name>
             <Value>gateway.push.apple.com</Value>
          </Property>
          <Property>
             <Name>ApnsCertificate</Name>
             <Value>{APNS certificate in Base64}</Value>
          </Property>
          <Property>
             <Name>CertificateKey</Name>
             <Value>{APNS certificate key}</Value>
          </Property>
       </Properties>
    </ApnsCredential>
    
    <RegistrationTtl>P39D</RegistrationTtl>
    
    <WnsCredential>
       <Properties>
          <Property>
             <Name>PackageSid</Name>
             <Value>{PackageSid}</Value>
          </Property>
          <Property>
             <Name>SecretKey</Name>
             <Value>{SecretKey}</Value>
          </Property>
       </Properties>
    </WnsCredential>
    
    <GcmCredential>
       <Properties>
          <Property>
             <Name>GoogleApiKey</Name>
             <Value>{ApiKey}</Value>
          </Property>
       </Properties>
    </GcmCredential>
    
    <MpnsCredential>
       <Properties>
          <Property>
             <Name>MpnsCertificate</Name>
             <Value>{MPNS certificate in Base64}</Value>
          </Property>
          <Property>
             <Name>CertificateKey</Name>
             <Value>{MPNS certificate key}</Value>
          </Property>
       </Properties>
    </MpnsCredential>
    
    </NotificationHubPnsCredentials>

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
<td><p>Credentials successfully set.</p></td>
</tr>
<tr class="even">
<td><p>400</p></td>
<td><p>Invalid request body. The settings could not be read because the request was malformed (or the validation failed).</p></td>
</tr>
<tr class="odd">
<td><p>401</p></td>
<td><p>Authorization failure. The access key was incorrect.</p></td>
</tr>
<tr class="even">
<td><p>403</p></td>
<td><p>Quota exceeded.</p></td>
</tr>
<tr class="odd">
<td><p>404</p></td>
<td><p>Namespace Not found.</p></td>
</tr>
</tbody>
</table>


For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/windowsazure/dd179357.aspx).

## Response Headers

None.

## Response Body

None.

## See Also

[Read Namespace PNS Credentials](mt238295\(v=azure.100\).md)  
[REST API Methods](dn495827\(v=azure.100\).md)

