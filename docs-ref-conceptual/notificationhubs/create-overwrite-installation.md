---
title: Create or Overwrite an Installation
TOCTitle: Create or Overwrite an Installation
ms:assetid: 67f998c8-c6af-4dbc-84dc-dadb37ff2de5
ms:mtpsurl: https://msdn.microsoft.com/en-us/library/Mt621153(v=Azure.100)
ms:contentKeyID: 71711299
ms.date: 04/11/2016
mtps_version: v=Azure.100
dev_langs:
- xml
---

# Create or Overwrite an Installation

 


Updated: March 11, 2016

Creates or overwrites an installation.

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
<td><p>https://{namespace}.servicebus.windows.net/{NotificationHub}/installations/{id}?api-version=2015-01</p></td>
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
<td><p>application/json</p></td>
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

The following table describes the properties of the JSON request body for installations:

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Name</p></th>
<th><p>Type</p></th>
<th><p>Required</p></th>
<th><p>Read-Only</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>installationId</p></td>
<td><p>String</p></td>
<td><p>Yes</p></td>
<td><p>No</p></td>
<td><p>Globally unique identifier string</p></td>
</tr>
<tr class="even">
<td><p>lastActiveOn</p></td>
<td><p>String</p></td>
<td><p>No</p></td>
<td><p>Yes</p></td>
<td><p>This is the date when the installation was made inactivate by the PNS.</p></td>
</tr>
<tr class="odd">
<td><p>expirationTime</p></td>
<td><p>String</p></td>
<td><p>No</p></td>
<td><p>Yes</p></td>
<td><p>This is a string containing the date and time in W3C DTF, YYYY-MM-DDThh:mmTZD (e.g. 1997-07-16T19:20+01:00)) in which the registration will expire. The value can be set at the hub level on create or update, and will default to never expire (9999-12-31T23:59:59).</p></td>
</tr>
<tr class="even">
<td><p>lastUpdate</p></td>
<td><p>String</p></td>
<td><p>Ignored when updating. Returned when reading.</p></td>
<td><p>Yes</p></td>
<td><p>Date in W3C format of last update to this installation.</p></td>
</tr>
<tr class="odd">
<td><p>platform</p></td>
<td><p>String</p></td>
<td><p>Yes</p></td>
<td><p>No</p></td>
<td><p>Can be {apns, wns, mpns, adm, gcm}.</p></td>
</tr>
<tr class="even">
<td><p>pushChannel</p></td>
<td><p>String</p></td>
<td><p>Yes</p></td>
<td><p>No</p></td>
<td><p>The PNS handle for this installation (in case of WNS the ChannelUri of the ApplicationTile).</p></td>
</tr>
<tr class="odd">
<td><p>expiredPushChannel</p></td>
<td><p>Boolean</p></td>
<td><p>Ignored when updating. Returned when reading.</p></td>
<td><p>Yes</p></td>
<td><p>This is true if the PNS expired the channel.</p></td>
</tr>
<tr class="even">
<td><p>tags</p></td>
<td><p>Array of strings</p></td>
<td><p>No</p></td>
<td><p>No</p></td>
<td><p>An array of tags. Tags are strings as defined in hub specs.</p></td>
</tr>
<tr class="odd">
<td><p>templates</p></td>
<td><p>JSON object</p></td>
<td><p>No</p></td>
<td><p>No</p></td>
<td><p>A JSON object representing a dictionary of templateNames to template description.</p></td>
</tr>
<tr class="even">
<td><p>templates.{name}</p></td>
<td><p>String</p></td>
<td><p>No</p></td>
<td><p>No</p></td>
<td><p>JSON object representing a template.</p></td>
</tr>
<tr class="odd">
<td><p>templates.{name}.body</p></td>
<td><p>String</p></td>
<td><p>Yes, if template present</p></td>
<td><p>No</p></td>
<td><p>Template for the body of notification payload.</p></td>
</tr>
<tr class="even">
<td><p>templates.{name}.headers</p></td>
<td><p>JSON object</p></td>
<td><p>No. Can be present only if platform is wns or mpns.</p></td>
<td><p>No</p></td>
<td><p>JSON object where each property is a header name and value is a template expression.</p></td>
</tr>
<tr class="odd">
<td><p>templates.{name}.expiry</p></td>
<td><p>String</p></td>
<td><p>No. Can be present only if platform is apns</p></td>
<td><p>No</p></td>
<td><p>Template expression evaluating in W3D date format.</p></td>
</tr>
<tr class="even">
<td><p>templates.{name}.tags</p></td>
<td><p>Array of strings</p></td>
<td><p>No</p></td>
<td><p>No</p></td>
<td><p>Array of tags for this template.</p></td>
</tr>
<tr class="odd">
<td><p>secondaryTiles</p></td>
<td><p>JSON object</p></td>
<td><p>No. Can be present only if platform is wns.</p></td>
<td><p>No</p></td>
<td><p>JSON object containing a dictionary of tileId and secondaryTiles objects.</p></td>
</tr>
<tr class="even">
<td><p>secondaryTile.{tileId}</p></td>
<td><p>JSON object</p></td>
<td><p>No</p></td>
<td><p>No</p></td>
<td><p>JSON object with push properties for secondary tiles.</p></td>
</tr>
<tr class="odd">
<td><p>secondaryTile.{tileId}.pushChannel</p></td>
<td><p>String</p></td>
<td><p>Yes, if tileId is present</p></td>
<td><p>No</p></td>
<td><p>ChannelUri for secondary tile.</p></td>
</tr>
<tr class="even">
<td><p>secondaryTile.{tileId}.tags</p></td>
<td><p>Array of strings</p></td>
<td><p>No</p></td>
<td><p>No</p></td>
<td><p>Tags for native notifications to secondary tile.</p></td>
</tr>
<tr class="odd">
<td><p>secondaryTile.{tileId}.templates</p></td>
<td><p>JSON object</p></td>
<td><p>No</p></td>
<td><p>No</p></td>
<td><p>Same as templates property but for each secondary tile.</p></td>
</tr>
</tbody>
</table>


  - In JSON, the order of elements is not important.

  - Template body has to be JSON for APNS, GCM, ADM.

  - Template body must be XML for WNS and MPNS (except when raw).

  - Templates for WNS must include X-WNS-Type header.

  - Templates for MPNS must have compatible headers as mentioned in [Sending push notifications for Windows Phone 8](http://msdn.microsoft.com/library/windowsphone/develop/hh202945.aspx).

Some JSON examples follow.

Example to register with APNS:

``` xml
{ 
    "installationId": "12234", 
    "tags": ["foo", "bar"], 
    "platform": "apns", 
    "pushChannel": "ABCDEF-123456-…" 
}  
```


> [!NOTE]
> <P>The Tags element is optional.</P>



Example to register natively with WNS including a template and no tags:

``` xml
{ 
    "installationId": "12234", 
    "platform": "wns", 
    "pushChannel": "https://db3...", 
    "templates": { 
        "myTemplate" : { 
            body : '<toast><visual lang="en-US"><binding template="ToastTest01"><text id="1">$myTextProp1</text></binding></visual></tile>',
            headers: { "X-WNS-Type": "wns/toast" }, 
            "tags": ["foo", "bar"] 
            } 

        } 
}  
```

A skeleton listing of many possible elements

``` xml
{ 
    installationId: "", 
    expirationTime: "", 
    tags: ["foo", "bar"],
    lastUpdate: “”, 
    user: "", 
    advertisingId: "", 
    appId: "" 
    platform: "", 
    pushChannel: "", 

    templates: { 
        "templateName1" : { 
            body: "", 
            headers: { "X-WNS-Type": "wns/tile" }, 
            expiration: "",
            tags: ["foo", "bar"] 
            } 
        } 

    secondaryTiles: { 
        "tileId1": { 
            pushChannel: "", 
            tags: ["foo", "bar"], 

            templates: { 
                "otherTemplate": { 
                    bodyTemplate: "", 
                    headers: { ... }, 
                    tags: ["foo"] 
                    } 
                } 
            } 
        }
}  
```

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
<td><p>The installation was created successfully.</p></td>
</tr>
<tr class="even">
<td><p>400</p></td>
<td><p>The installation could not be created/overwritten because the request was malformed.</p></td>
</tr>
<tr class="odd">
<td><p>401</p></td>
<td><p>Authorization failure. The access key was incorrect.</p></td>
</tr>
<tr class="even">
<td><p>403</p></td>
<td><p>Too many installations in this namespace - Installations not created .</p></td>
</tr>
<tr class="odd">
<td><p>403</p></td>
<td><p>Request rejected because API call rate is too high.</p></td>
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
<td><p>application/json</p></td>
</tr>
<tr class="even">
<td><p><strong>Content-Location</strong></p></td>
<td><p>The location of the installation in the format:</p>
<p>https://{namespace}.servicebus.windows.net/{NotificationHub}/installations/&lt;installationId&gt;</p></td>
</tr>
</tbody>
</table>


## Response Body

None.

## See Also

[Read Installation](mt621172\(v=azure.100\).md)  
[Update Installation by Installation ID](mt621169\(v=azure.100\).md)  
[Delete Installation](mt621170\(v=azure.100\).md)

