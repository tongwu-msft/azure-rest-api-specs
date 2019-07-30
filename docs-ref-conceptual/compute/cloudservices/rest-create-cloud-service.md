---
title: "Azure Cloud Services REST - Create Cloud Service1 | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""

ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: dc8b6b22-3a10-4511-9803-c3e6a1021407
caps.latest.revision: 24
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Create Cloud Service
The `Create Cloud Service` asynchronous operation creates a new cloud service in Microsoft Azure.  
  
## Request  
 The `Create Cloud Service` request is specified as follows. Replace `<subscription-id>` with your subscription ID.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices`|  
  
### URI Parameters  
 None.  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Content-Type`|Required. Set this header to `application/xml`.|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. The value of this header must be set to `2010-10-28` or higher.|  
  
### Request Body  
 The format of the request body is as follows:  
  
```  
<?xml version="1.0" encoding="utf-8"?>  
<CreateHostedService xmlns="http://schemas.microsoft.com/windowsazure">  
  <ServiceName>name-of-cloud-service</ServiceName>  
  <Label>base64-encoded-label-of-cloud-service</Label>  
  <Description>description-of-cloud-service</Description>  
  <Location>location-of-cloud-service</Location>  
  <AffinityGroup>name-of-affinity-group</AffinityGroup>  
  <ExtendedProperties>  
    <ExtendedProperty>  
      <Name>name-of-property</Name>  
      <Value>value-of-property</Value>  
    </ExtendedProperty>  
  </ExtendedProperties>  
  <ReverseDnsFqdn>reverse-dns-fqdn</ReverseDnsFqdn>  
</CreateHostedService>  
```  
  
 The following table describes the elements of the request body.  
  
|||  
|-|-|  
|Element Name|Description|  
|ServiceName|Required. Specifies the name for the cloud service. This name must be unique within Azure. This name is the DNS prefix name that is used to access the service. To verify the availability of a name, you can use [Check Cloud Service Name Availability](rest-check-cloud-service-name-availability.md).|  
|Label|Required. Specifies the base-64-encoded identifier of the cloud service. The identifier can be up to 100 characters long. The label can be used for your tracking purposes.|  
|Description|Optional. Specifies the description of the cloud service. The description can be up to 1024 characters long.|  
|Location|Required if `AffinityGroup` is not specified. Specifies the location where the cloud service is created.<br /><br /> You must specify `Location` or `AffinityGroup`, but not both. To see the available locations, you can use [List Locations](http://msdn.microsoft.com/library/azure/954b5c9f-e9ae-434f-8c13-11cd74c5d1a1).|  
|AffinityGroup|Required if `Location` is not specified. Specifies the name of an existing affinity group that is associated with the subscription. You must specify `Location` or `AffinityGroup`, but not both. To see the available affinity groups, you can use [List Affinity Groups](http://msdn.microsoft.com/library/azure/e2af3475-b0d0-407c-8252-6af8d1e22215).|  
|Name|Optional. Specifies the name of an extended cloud service property. The name can be up to 64 characters long, only alphanumeric characters and underscores are valid in the name, and it must start with a letter. Each extended property must have both a defined name and value. You can define a maximum of 50 extended properties.<br /><br /> The `Name` element is only available using version 2012-03-01 or higher.|  
|Value|Optional. Specifies the value of an extended cloud service property. The extended property value can be up to 255 characters long.<br /><br /> The `Value` element is only available using version 2012-03-01 or higher.|  
|ReverseDnsFqdn|Optional. Specifies the DNS address to which the IP address of the cloud service resolves when queried using a reverse DNS query.<br /><br /> The `ReverseDnsFqdn` element is only available using version 2014-06-01 or higher.|  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 201 (Created).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers.  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|A value that uniquely identifies a request made against the management service. For an asynchronous operation, you can call [Get Operation Status](http://msdn.microsoft.com/library/azure/1215ece5-cbef-4a85-a3db-ab6c20c2c6df) with the value of the header to determine whether the operation is complete, has failed, or is still in progress.|  
  
### Response Body  
 None.