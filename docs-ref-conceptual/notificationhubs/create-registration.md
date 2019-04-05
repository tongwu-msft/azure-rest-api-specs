---
title: Create Registration
TOCTitle: Create Registration
ms:assetid: 04e526d3-b252-4d34-a421-8d485ec19a34
ms:mtpsurl: https://msdn.microsoft.com/en-us/library/Dn223265(v=Azure.100)
ms:contentKeyID: 54432110
ms.date: 08/13/2015
mtps_version: v=Azure.100
dev_langs:
- xml
---

# Create Registration

 


Creates a new registration. This method generates a registration ID, which you can subsequently use to retrieve, update, and delete this registration.

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
<td><p>POST</p></td>
<td><p>https://{namespace}.servicebus.windows.net/{NotificationHub}/registrations/?api-version=2015-01</p></td>
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
<td><p>application/atom+xml;type=entry;charset=utf-8</p></td>
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

Atom entry with the description embedded in the content. Some examples follow.

Native registration for Windows Notification Service:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<entry xmlns="http://www.w3.org/2005/Atom">
    <content type="application/xml">
        <WindowsRegistrationDescription xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">
            <Tags>myTag, myOtherTag</Tags>
            <ChannelUri>{ChannelUri}</ChannelUri>
        </WindowsRegistrationDescription>
    </content>
</entry>
```


> [!NOTE]
> <P>The Tags element is optional.</P>



Template registration for Windows Notification Service:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<entry xmlns="http://www.w3.org/2005/Atom">
    <content type="application/xml">
        <WindowsTemplateRegistrationDescription xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">
            <Tags>myTag, myOtherTag</Tags>
            <ChannelUri>{ChannelUri}</ChannelUri>
            <BodyTemplate><![CDATA[{Template for the body}]]></BodyTemplate>
            <WnsHeaders>
                <WnsHeader>
                    <Header>X-WNS-Type</Header>
                    <Value>wns/tile</Value>
                </WnsHeader>
                <WnsHeader>
                    <Header>X-WNS-Tag</Header>
                    <Value>myTag</Value>
                </WnsHeader>
            </WnsHeaders>
        </WindowsTemplateRegistrationDescription>
    </content>
</entry>
```


> [!NOTE]
> <P>The BodyTemplate element is mandatory, as is the X-WNS-Type header.</P>



Native registration for Apple Push Notification Service:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<entry xmlns="http://www.w3.org/2005/Atom">
    <content type="application/xml">
        <AppleRegistrationDescription xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">
            <Tags>myTag, myOtherTag</Tags>
            <DeviceToken>{DeviceToken}</DeviceToken> 
        </AppleRegistrationDescription>
    </content>
</entry>
```


> [!NOTE]
> <P>The Tags element is optional.</P>



Template registration for Apple Push Notification Service:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<entry xmlns="http://www.w3.org/2005/Atom">
    <content type="application/xml">
        <AppleTemplateRegistrationDescription xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">
            <Tags>myTag, myOtherTag</Tags>
            <DeviceToken>{DeviceToken}</DeviceToken>
            <BodyTemplate><![CDATA[{Template for the body}]]></BodyTemplate>
            <Expiry>{Template for Expiry in }</Expiry>
        </AppleTemplateRegistrationDescription>
    </content>
</entry>
```


> [!NOTE]
> <P>The BodyTemplate element is mandatory. Expiry is optional.</P>



Native registration for Google Cloud Messaging:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<entry xmlns="http://www.w3.org/2005/Atom">
    <content type="application/xml">
        <GcmRegistrationDescription xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">
            <Tags>myTag, myOtherTag</Tags>
            <GcmRegistrationId>{GCM Registration Id}</GcmRegistrationId> 
        </GcmRegistrationDescription>
    </content>
</entry>
```


> [!NOTE]
> <P>The Tags element is optional.</P>



Template registration for Google Cloud Messaging:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<entry xmlns="http://www.w3.org/2005/Atom">
    <content type="application/xml">
        <GcmTemplateRegistrationDescription xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">
            <Tags>myTag, myOtherTag</Tags>
            <GcmRegistrationId>{GCM Registration Id}</GcmRegistrationId> 
            <BodyTemplate><![CDATA[ {BodyTemplate}]]></BodyTemplate>
        </GcmTemplateRegistrationDescription>
    </content>
</entry>
```


> [!NOTE]
> <P>The BodyTemplate element is mandatory.</P>



Native registration for Microsoft Push Notification Service:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<entry xmlns="http://www.w3.org/2005/Atom">
    <content type="application/xml">
        <MpnsRegistrationDescription xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">
            <Tags>myTag, myOtherTag</Tags>
            <ChannelUri>{ChannelUri}</ChannelUri>
        </MpnsRegistrationDescription>
    </content>
</entry>
```


> [!NOTE]
> <P>The Tags element is optional.</P>



Template registration for Microsoft Push Notification Service:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<entry xmlns="http://www.w3.org/2005/Atom">
    <content type="application/xml">
        <MpnsTemplateRegistrationDescription xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">
            <Tags>myTag, myOtherTag</Tags>
            <ChannelUri>{ChannelUri}</ChannelUri>
            <BodyTemplate><![CDATA[{Template for the body}]]></BodyTemplate>
            <MpnsHeaders>
                <MpnsHeader>
                    <Header>X-WindowsPhone-Target</Header>
                    <Value>toast</Value>
                </MpnsHeader>
                <MpnsHeader>
                    <Header>X-NotificationClass</Header>
                    <Value>[batching interval]</Value>
                </MpnsHeader>
            </MpnsHeaders>
        </MpnsTemplateRegistrationDescription>
    </content>
</entry>
```


> [!NOTE]
> <P>The BodyTemplate element is mandatory, as is the X-WindowsPhone-Target header.</P>



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
<td><p>201</p></td>
<td><p>Registration created successfully.</p></td>
</tr>
<tr class="even">
<td><p>400</p></td>
<td><p>Invalid request body. The registration could not be created because the request was malformed.</p></td>
</tr>
<tr class="odd">
<td><p>401</p></td>
<td><p>Authorization failure. The access key was incorrect.</p></td>
</tr>
<tr class="even">
<td><p>403</p></td>
<td><p>Quota exceeded; too many registrations in this namespace. Registration not created.</p></td>
</tr>
<tr class="odd">
<td><p>403</p></td>
<td><p>Request rejected because registration operations rate is too high.</p></td>
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
<td><p>application/atom+xml;type=entry;charset=utf-8</p></td>
</tr>
<tr class="even">
<td><p><strong>ETag</strong></p></td>
<td><p>{weak ETag}</p></td>
</tr>
</tbody>
</table>


## Response Body

Upon success, a validated Atom entry is returned. This includes read-only elements such as ETag, RegistrationId, and ExpirationTime. For example:

``` xml
<entry>
    <id>https://{tenant}.servicebus.windows.net/{NotificationHub}/registrations/{registrationId}</id>
    <title type="text"> /{NotificationHub}/registrations/{registrationId}</title>
    <updated>2012-08-17T17:32:00Z</updated>
    <metadata:etag>{weak Etag}</metadata:etag>
    <content type="application/xml">
    <WindowsRegistrationDescription xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">
        <ETag>{ETag}</ETag>
        <ExpirationTime>2012-07-16T19:20+01:00</ExpirationTime>
        <RegistrationId>{RegistrationId}</RegistrationId>
            <Tags>myTag, myOtherTag</Tags>
            <ChannelUri>{ChannelUri}</ChannelUri>
        </WindowsRegistrationDescription>
    </content>
</entry>
```

