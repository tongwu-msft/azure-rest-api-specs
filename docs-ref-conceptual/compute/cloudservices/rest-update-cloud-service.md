---
title: "Azure Cloud Services REST - Update Cloud Service | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cloud-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 8cd98a55-751e-4a00-9446-273864cfa09f
caps.latest.revision: 23
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Update Cloud Service
The `Update Cloud Service` operation updates the label or description of a cloud service.  
  
## Request  
 The `Update Cloud Service` request may be specified as follows. Replace `<subscription-id>` with your subscription ID, and `<cloudservice-name>` with the name of the cloud service.  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>`|  
  
### URI Parameters  
 None.  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Content-Type`|Required. Set this header to `application/xml`.|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. This header should be set to `2010-10-28` or higher.|  
  
### Request Body  
 The format of the request body is as follows:  
  
```  
<?xml version="1.0" encoding="utf-8"?>  
<UpdateHostedService xmlns="http://schemas.microsoft.com/windowsazure">  
  <Label>base64-encoded-label-of-cloud-service</Label>  
  <Description>description-of-cloud-service</Description>  
  <ExtendedProperties>  
    <ExtendedProperty>  
      <Name>name-of-property</Name>  
      <Value>value-of-property</Value>  
    </ExtendedProperty>  
  </ExtendedProperties>    
  <ReverseDnsFqdn>reverse-dns-fqdn</ReverseDnsFqdn>  
</UpdateHostedService>  
```  
  
 The following table describes the elements of the request body.  
  
|Element Name|Description|  
|------------------|-----------------|  
|Label|Optional if Description is specified. Specifies the base-64-encoded identifier for the cloud service. The identifier can be up to 100 characters long. It is recommended that the label be unique within the subscription. The label can be used for your tracking purposes.|  
|Description|Optional if Label is specified. Specifies the description of the cloud service. The description can be up to 1024 characters long.|  
|Name|Optional. Specifies the name of an extended cloud service property. You must provide a name and value for each property. A maximum of 50 extended properties is allowed. The name can be up to 64 characters long. Only alphanumeric characters and underscores are valid in the name, and it must start with a letter.<br /><br /> The `Name` element is only available using version 2012-03-01 or higher.|  
|Value|Optional. Specifies the value of an extended cloud service property. Each extended property must have both a defined name and value. The value can be up to 255 characters long. You can delete an existing property by setting the value to NULL.<br /><br /> The `Value` element is only available using version 2012-03-01 or higher.|  
|ReverseDnsFqdn|Optional. Specifies the DNS address to which the IP address of the cloud service resolves when queried using a reverse DNS query.<br /><br /> The `ReverseDnsFqdn` element is only available using version 2014-06-01 or higher.|  
  
## Response  
 The response includes an HTTP status code, a set of response headers, and a response body.  
  
### Status Code  
 A successful operation returns status code 200 (OK).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers.  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|A value that uniquely identifies a request made against the Management service.|  
  
### Response Body  
 None.