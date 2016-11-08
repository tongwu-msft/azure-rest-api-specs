---
title: "Resolve a service&#160;"
ms.custom: ""
ms.date: "2016-03-30"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-fabric"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows 10"
  - "Windows 8"
  - "Windows 8.1"
  - "Windows Server 2012 R2"
dev_langs: 
  - "CSharp"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
ms.assetid: 3cfa63ed-ca7c-4e0f-80f2-5c046d767084
caps.latest.revision: 8
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Resolve a service&#160;
Resolves a Service Fabric service partition, to get the endpoints of the service replicas.  
  
## Request  
 See [Service](service.md) for headers and parameters that are used by all requests related to services.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/Applications/{application-id}/$/GetServices/{service-id}/$/ResolvePartition?api-version={api-version}&PartitionKeyType={partition-key-type}&PartitionKeyValue={key-value}&PreviousRspVersion={previous-rsp-version}`|  
|GET|`<URI>/Services/{service-id}/$/ResolvePartition?api-version={api-version}&PartitionKeyType={partition-key-type>&PartitionKeyValue={key-value}&PreviousRspVersion={previous-rsp-version}`|  
  
 All query parameters are optional. Replace {partition-key-type} with the key type for the partition. Replace {key-value} with the partition key that needs to be resolved to an endpoint. Replace {previous-rsp-version} with the result of the previous resolve service partition call.  
  
### URI Parameters  
  
|URI Parameters|Required|Description|  
|--------------------|--------------|-----------------|  
|application-name|Yes|Application to which the service belongs to|  
|service-name|Yes|Service name|  
|api-version|Yes|The API Version, which is "1.0”.|  
|PartitionKeyType|No|Key type for the partition. This is required if the partition scheme for the service is Int64Range or Named. <br />The value for Int64Range is 2 <br />The value for Named is 3|  
|PartitionKeyValue|No|Partition key. This is required if the partition scheme for the service is Int64Range or Named.|  
|PreviousRspVersion|No|Gives the value in the Version field of the response that was received previously. This is required if the user knows that the result that was got previously is stale.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
|Element name|Description|  
|------------------|-----------------|  
|Name|Name of the service.|  
|PartitionInformation|Represents the PartitionInformation object described below.|  
|Endpoints|Represents an array of EndpointLocation objects described below.|  
|Version|The version of this resolved service partition result. This version should be passed in the next time the ResolveService call is made via the PreviousRspVersion query parameter.|  
  
### PartitionInformation  
  
|Element name|Description|  
|------------------|-----------------|  
|ServicePartitionKind|The partition scheme of this service. Possible values are:<br /><br /> -   `Invalid` - Indicates the partition kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   `Singleton` - Indicates that the partition is based on string names, and is a SingletonPartitionInformation object, that was originally created via SingletonPartitionSchemeDescription. The value is 1.<br />-   `Int64Range` - Indicates that the partition is based on Int64 key ranges, and is an Int64RangePartitionInformation object that was originally created via UniformInt64RangePartitionSchemeDescription. The value is 2.<br />-   `Named` - Indicates that the partition is based on string names, and is a NamedPartitionInformation object, that was originally created via NamedPartitionSchemeDescription. The value is 3.|  
|Id|The partition ID as a GUID string.|  
|Name|This is returned if the ServicePartitionKind is Named.|  
|LowKey|This is returned if the ServicePartitionKind is Int64Range. This corresponds to the Low key of the partition.|  
|HighKey|This is returned if the ServicePartitionKind is Int64Range. This corresponds to the High key of the partition.|  
  
### Endpoints  
  
|Element name|Description|  
|------------------|-----------------|  
|ServiceEndpointRole|This corresponds to the role of the replica. This can be Stateless(value 1), StatefulPrimary(value 2) or StatefulSecondary(value 3)|  
|Address|This corresponds to the endpoint address of the replica.|