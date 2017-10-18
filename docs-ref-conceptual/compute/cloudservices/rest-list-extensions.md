---
title: "Azure Cloud Services REST - List Extensions | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cloud-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: f07dafc0-34a8-4950-a9ad-533172d5cbc5
caps.latest.revision: 8
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# List Extensions
The `List Extensions` operation lists all of the extensions that were added to a cloud service.  
  
## Request  
 The `List Extensions` request may be specified as follows. Replace `<subscription-id>` with your subscription ID and `<cloudservice-name>` with the name of the cloud service.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/extensions`|  
  
### URI Parameters  
 None.  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. The value of this header must be set to `2013-03-01` or higher.|  
  
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
 The following example shows the format of the request body:  
  
```  
  
<?xml version="1.0" encoding="utf-8"?>  
<Extensions xmlns=”http://schemas.microsoft.com/windowsazure”>  
  <Extension>  
    <ProviderNameSpace>namespace-of-extension</ProviderNameSpace>  
    <Type>type-of-extension</Type>  
    <Id>identifier-of-extension</Id>  
    <Version>version-of-extension</Version>  
    <Thumbprint>thumbprint-of-encryption-certificate</Thumbprint>  
    <ThumbprintAlgorithm>thumbprint-algorithm</ThumbprintAlgorithm>  
    <PublicConfiguration>base-64-encoded-xsd-for-extension-public-configuration</PublicConfiguration>  
    <IsJsonExtension>indicator-of-json-support</IsJsonExtension>  
    <DisallowMajorVersionUpgrade>indicator-of-allowed-version-upgrades</DisallowMajorVersionUpgrade>  
  </Extension>  
</Extensions>  
  
```  
  
 The following table describes the elements of the response body.  
  
|Element name|Description|  
|------------------|-----------------|  
|ProviderNameSpace|The provider namespace of the extension. The provider namespace for Microsoft Azure extensions is `Microsoft.Windows.Azure.Extensions`.|  
|Type|Required. The type of the extension.|  
|Id|The identifier of the extension.|  
|Version|The version of the extension.|  
|Thumbprint|The thumbprint of the certificate that is used to encrypt the configuration specified in `PrivateConfiguration`. If this element is not specified, a certificate may be automatically generated and added to the cloud service.|  
|ThumbprintAlgorithm|The thumbprint algorithm of the certificate that is used to encrypt the configuration specified in `PrivateConfiguration`.|  
|PublicConfiguration|The public configuration that is defined using the schema returned by the [List Available Extensions](rest-list-available-extensions.md) operation.|  
|IsJsonExtension|Indicates whether the extension configuration supports JSON.<br /><br /> Possible values are:<br /><br /> -   `true`<br />-   `false`<br /><br /> The `IsJsonExtension` element is only available using version 2014-06-01 or higher.|  
|DisallowMajorVersionUpgrade|Indicates whether the extension supports automatically upgrading to new major versions.<br /><br /> The `DisallowMajorVersionUpgrade` element is only available using version 2014-06-01 or higher.|