---
title: "Create a registration"
description: Use this API reference documentation to generate a registration ID, which you can subsequently use to retrieve, update, and delete this registration.
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


# Create a registration
Creates a new registration. This method generates a registration ID, which you can subsequently use to retrieve, update, and delete this registration.

## Request

| Method | Request URI | HTTP version | 
| ------ | ----------- | ------------ | 
 | POST | `https://{namespace}.servicebus.windows.net/{NotificationHub}/registrations/?api-version=2015-01` | HTTP/1.1 |

## Request headers
The following table describes required and optional request headers.

| Request header | Description | 
| -------------- | ----------- | 
| Content-Type | `application/atom+xml;type=entry;charset=utf-8` | 
| Authorization| Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). | 
| x-ms-version | 2015-01 |


## Request body

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
> The BodyTemplate element is mandatory, as is the X-WNS-Type header.



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
> The BodyTemplate element is mandatory. Expiry is optional.


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
> The Tags element is optional.



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
> The BodyTemplate element is mandatory.



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
> The Tags element is optional.



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
> The BodyTemplate element is mandatory, as is the X-WindowsPhone-Target header.



## Response

The response includes an HTTP status code and a set of response headers.

## Response codes

| Code | Description | 
| ---- | ----------- |
| 201 | Registration created successfully. |
| 400 | Invalid request body. The registration could not be created because the request was malformed. | 
 | 401 | Authorization failure. The access key was incorrect. |
| 403 | Quota exceeded; too many registrations in this namespace. Registration not created. | 
| 403 | Request rejected because registration operations rate is too high. | 

For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes).

## Response headers

| Response header | Description | 
| --------------- | ----------- | 
| Content-type | `application/atom+xml;type=entry;charset=utf-8` |
| ETag | {weak ETag} | 

## Response body

Upon success, a validated Atom entry is returned. It includes read-only elements such as ETag, RegistrationId, and ExpirationTime. For example:

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

