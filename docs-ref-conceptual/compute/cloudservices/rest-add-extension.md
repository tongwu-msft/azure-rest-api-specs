---
title: "Azure Cloud Services REST - Add Extension | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cloud-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 4745de1c-a555-424c-b9c4-b3c116f1f553
caps.latest.revision: 10
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Add Extension
The `Add Extension` asynchronous operation adds an available extension to your cloud service. In Microsoft Azure, a process can run as an extension of a cloud service.  
  
## Request  
 The `Add Extension` request may be specified as follows. Replace `<subscription-id>` with your subscription ID and `<cloudservice-name>` with the name of the cloud service.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/extensions`|  
  
### URI Parameters  
 None.  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. This header should be set to `2013-03-01` or a later version.|  
  
### Request Body  
 The following example shows the format of the request body:  
  
```  
  
<?xml version="1.0" encoding="utf-8"?>  
<Extension xmlns=”http://schemas.microsoft.com/windowsazure”>  
  <ProviderNameSpace>namespace-of-extension</ProviderNameSpace>  
  <Type>type-of-extension</Type>  
  <Id>identifier-of-extension</Id>  
  <Thumbprint>thumbprint-of-encryption-certificate</Thumbprint>  
  <ThumbprintAlgorithm>thumbprint-algorithm</ThumbprintAlgorithm>  
  <PublicConfiguration>base-64-encoded-xsd-for-extension-public-configuration</PublicConfiguration>  
  <PrivateConfiguration>base-64-encoded-xsd-for-extension-private-configuration</PrivateConfiguration>  
  <Version>version-of-extension</Version>  
</Extension>  
```  
  
 The following table describes the elements of the request body.  
  
|Element name|Description|  
|------------------|-----------------|  
|ProviderNameSpace|Required. Specifies the provider namespace of the extension. The provider namespace for Azure extensions is `Microsoft.Windows.Azure.Extensions`.|  
|Type|Required. Specifies the type of the extension.|  
|Id|Required. Specifies the identifier of the extension.|  
|Thumbprint|Optional. Specifies the thumbprint of the certificate that is used to encrypt the configuration specified in `PrivateConfiguration`. If this element is not specified, a certificate may be automatically generated and added to the cloud service.|  
|ThumbprintAlgorithm|Optional. Specifies the thumbprint algorithm of the certificate that is used to encrypt the configuration specified in `PrivateConfiguration`.|  
|PublicConfiguration|Optional. Specifies the public configuration that is defined using the schema returned by the [List Available Extensions](rest-list-available-extensions.md) operation.|  
|PrivateConfiguration|Optional. Specifies the private configuration that is defined using the schema returned by the [List Available Extensions](rest-list-available-extensions.md) operation.|  
|Version|Optional. Specifies the version of the extension. If this element is not specified or an asterisk (`*`) is used as the value, the latest version of the extension is used. If the value is specified with a major version number and an asterisk as the minor version number (`X.*`), the latest minor version of the specified major version is selected. If a major version number and a minor version number are specified (`X.Y`), the specific extension version is selected. If a version is specified, an auto-upgrade is performed on the role instance.|  
  
## Response  
 The response includes an HTTP status code, a set of response headers, and a response body.  
  
### Status Code  
 A successful operation returns status code 200 (OK).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers.  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|A value that uniquely identifies a request made against the Management service. For an asynchronous operation, you can call [Get Operation Status](http://msdn.microsoft.com/library/azure/1215ece5-cbef-4a85-a3db-ab6c20c2c6df) with the value of the header to determine whether the operation is complete, has failed, or is still in progress.|  
  
### Response Body  
 None.