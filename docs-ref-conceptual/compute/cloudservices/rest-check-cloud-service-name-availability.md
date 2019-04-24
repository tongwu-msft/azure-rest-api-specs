---
title: "Azure Cloud Services REST - Check Cloud Service Name Availability | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""

ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a0aa05cc-a252-47a1-9616-2f8fe39d4c25
caps.latest.revision: 11
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Check Cloud Service Name Availability
The `Check Hosted Service Name Availability` operation checks for the availability of the specified cloud service name.  
  
## Request  
 The `Check Hosted Service Name Availability` request may be specified as follows. Replace `<subscription-id>` with your subscription ID and `<cloudservice-name>` with the cloud service name that you would like to use.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.core.windows.net/<subscription-id>/services/hostedservices/operations/isavailable/<cloudservice-name>`|  
  
### URI Parameters  
 None.  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. This header should be set to `2012-03-01` or higher.|  
  
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
 The format of the response body is as follows:  
  
```  
  
<?xml version="1.0" encoding="utf-8"?>  
<AvailabilityResponse xmlns=”http://schemas.microsoft.com/windowsazure”>  
  <Result>name-availability</Result>  
  <Reason>reason</Reason>  
</AvailabilityResponse>  
  
```  
  
 The following table describes the elements in the response body.  
  
|Element name|Description|  
|------------------|-----------------|  
|Result|A boolean value that indicates whether the name is available for you to use. `true` if the name is available; otherwise `false`.<br /><br /> For versions before 2013-03-01, the operation returned `true` for non-taken names even if they were reserved or profane. With version headers of 2013-03-01 and later, the operation returns `false` for reserved or profane words.|  
|Reason|Indicates why the name cannot be used to create the cloud service.<br /><br /> Possible values are:<br /><br /> -   `HostedServiceAlreadyExists` – returned if the cloud service name already exists.<br />-   `HostedServiceNameNotValid` – returned if the cloud service name uses unsupported characters, reserved words, or profane words.<br /><br /> The `Reason` element is only available using version 2013-03-01 or higher.|