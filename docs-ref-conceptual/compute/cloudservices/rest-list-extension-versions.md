---
title: "Azure Cloud Services REST - List Extension Versions | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""

ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 0680f795-4ab2-423b-a179-bbda1c24a64f
caps.latest.revision: 8
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# List Extension Versions
The `List Extension Versions` operation lists the versions of an extension that are available to add to a cloud service. In Microsoft Azure, a process can run as an extension of a cloud service.  
  
## Request  
 The `List Extension Versions` request may be specified as follows. Replace `<subscription-id>` with your subscription ID, `<provider-namespace>` with the namespace of the extension, and `<type>` with the type of extension.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.core.windows.net/<subscription-id>/services/extensions/<provider-namespace>/<type>`|  
  
### URI Parameters  
 None.  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. This header should be set to `2013-03-01` or higher.|  
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code, a set of response headers, and a response body.  
  
### Status Code  
 A successful operation returns status code 200 (OK).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers.  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|A value that uniquely identifies a request made against the management service.|  
  
### Response Body  
 The following example shows the format of the response body:  
  
```  
  
<?xml version="1.0" encoding="utf-8"?>  
<ExtensionImages xmlns=”http://schemas.microsoft.com/windowsazure”>  
  <ExtensionImage>  
    <ProviderNameSpace>namespace-of-extension</ProviderNameSpace>  
    <Type>type-of-extension</Type>      
    <Version>version-of-extension</Version>  
    <Label>label-of-extension</Label>  
    <Description>description-of-extension</Description>  
    <HostingResources>role-type</HostingResources>  
    <ThumbprintAlgorithm>thumbprint-algorithm</ThumbprintAlgorithm>  
    <PublicConfigurationSchema>base-64-encoded-xsd-for-extension-settings</PublicConfigurationSchema>  
    <PrivateConfigurationSchema>base-64-encoded-xsd-for-extension-settings</PrivateConfigurationSchema>  
    <SampleConfig>base-64-encoded-sample-XML-for-extension</SampleConfig>  
    <ReplicationCompleted>indicator-of-replication-status</ReplicationCompleted>  
    <Eula> HYPERLINK "http://www.contoso.com/42588280809/eula%3c/Eula" eula-of-extension</Eula>  
    <PrivacyUri>privacy-policy-of-extension</PrivacyUri>  
    <HomepageUri>homepage-of-extension</HomepageUri>  
    <IsJsonExtension>indicator-of-JSON-support</IsJsonExtension>  
    <CompanyName>name-of-publishing-company</CompanyName>  
    <SupportedOS>supported-operating-system</SupportedOS>  
    <PublishedDate>publish-date-of-extension</PublishedDate>  
  </ExtensionImage>  
</ExtensionImages>  
  
```  
  
 The following table describes the elements of the response body.  
  
|Element name|Description|  
|------------------|-----------------|  
|ProviderNameSpace|Specifies the provider namespace of the extension. The provider namespace for Microsoft Azure extensions is `Microsoft.WindowsAzure.Extensions`.|  
|Type|Specifies the type of the extension.|  
|Version|Specifies the major version and minor version of the extension.|  
|Label|Specifies the label that is used to identify the extension.|  
|Description|Specifies the description of the extension.|  
|HostingResources|Specifies the type of resource that supports the extension. This value can be `WebRole`, `WorkerRole`, or `WebRole&#124;WorkerRole`.|  
|ThumbprintAlgorithm|Specifies the thumbprint algorithm of the certificate that is used for encryption.|  
|PublicConfigurationSchema|Specifies the base64-encoded schema of the public configuration.|  
|PrivateConfigurationSchema|Specifies the base64-encoded schema of the private configuration.|  
|SampleConfig|Specifies a sample configuration file for the resource extension.<br /><br /> The **SampleConfig** element is only available using version 2013-11-01 or higher.|  
|ReplicationCompleted|Indicates whether the version of the extension has been replicated to all regions.<br /><br /> Possible values are:<br /><br /> -   `true`<br />-   `false`<br /><br /> `true` if the extension version can be used to create or update a deployment; otherwise, `false` indicating that the version of the extension is not ready to be used in all regions.<br /><br /> The `ReplicationCompleted` element is only available using version 2014-04-01 or higher.|  
|Eula|Specifies a URI that points to the End User License Agreement (EULA) for the version of the extension.<br /><br /> The `Eula` element is only available using version 2014-04-01 or higher.|  
|PrivacyUri|Specifies a URI that points to the privacy statement for the version of extension.<br /><br /> The `PrivacyUri` element is only available using version 2014-04-01 or higher.|  
|HomepageUri|Specifies the URI that points to the homepage for the version of extension.<br /><br /> The `HomepageUri` element is only available using version 2014-04-01 or higher.|  
|IsJsonExtension|Indicates whether the version of the extension accepts a JSON based configuration.<br /><br /> Possible values are:<br /><br /> -   `true`<br />-   `false`<br /><br /> `true` if the extension accepts a JSON based configuration; otherwise, `false` and the extension accepts an XML based configuration.<br /><br /> The `IsJsonExtension` element is only available using version 2014-04-01 or higher.|  
|CompanyName|Specifies the name of the company that published the extension.<br /><br /> The `CompanyName` element is only available using version 2014-06-01 or higher.|  
|SupportedOS|Specifies the operating system that the extension runs on.<br /><br /> The `SupportedOS` element is only available using version 2014-06-01 or higher.|  
|PublishedDate|Specifies the date when the extension was published.<br /><br /> The `PublishedDate` element is only available using version 2014-06-01 or higher.|