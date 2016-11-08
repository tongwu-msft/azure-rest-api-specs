---
title: "Status and Error Codes1"
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
ms.assetid: bf274b2b-2962-4bba-9b18-1fd952a470f0
caps.latest.revision: 6
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
# Status and Error Codes
REST API operations for Service Fabric return standard HTTP status codes, as defined in the [HTTP/1.1 Status Code Definitions](http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html).  
  
 API operations may also return additional error information that is defined by Service Fabric. This additional error information is returned in the response body. The body of the error response follows the basic format shown here:  
  
```  
<?xml version="1.0" encoding="utf-8"?>  
<Error>  
  <Code>string-value</Code>  
  <Message>string-value</Message>  
</Error>  
  
```  
  
 For example, the following error response indicates that the specified file was not found in the ImageStore.  
  
```  
<error xmlns="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata">  
  <code>FileNotFound</code>  
  <message xml:lang="en-US">System.FileNotFoundException: A required file was not found in the ImageStore.</message>  
</error>  
```  
  
 The error codes listed in the following table may be returned by an operation against Service Fabric.  **StatusDescription** would contain the **HRESULT** corresponding to the error code (if any).  Possible HRESULTs are definied in FabricTypes.idl in the **FABRIC_ERROR_CODE** enum.  
  
### Error Codes  
  
|HTTP Status Code|Error Code|  
|----------------------|----------------|  
|400 Bad Request|FABRIC_E_INVALID_PARTITION_KEY<br /><br /> FABRIC_E_IMAGEBUILDER_VALIDATION_ERROR<br /><br /> FABRIC_E_INVALID_ADDRESS<br /><br /> FABRIC_E_APPLICATION_NOT_UPGRADING<br /><br /> FABRIC_E_APPLICATION_UPGRADE_VALIDATION_ERROR<br /><br /> FABRIC_E_FABRIC_NOT_UPGRADING<br /><br /> FABRIC_E_FABRIC_UPGRADE_VALIDATION_ERROR<br /><br /> FABRIC_E_INVALID_CONFIGURATION<br /><br /> FABRIC_E_INVALID_NAME_URI<br /><br /> FABRIC_E_PATH_TOO_LONG<br /><br /> FABRIC_E_KEY_TOO_LARGE<br /><br /> FABRIC_E_SERVICE_AFFINITY_CHAIN_NOT_SUPPORTED<br /><br /> FABRIC_E_INVALID_ATOMIC_GROUP<br /><br /> FABRIC_E_VALUE_EMPTY|  
|404 Not Found|FABRIC_E_NODE_NOT_FOUND<br /><br /> FABRIC_E_APPLICATION_TYPE_NOT_FOUND<br /><br /> FABRIC_E_APPLICATION_NOT_FOUND<br /><br /> FABRIC_E_SERVICE_TYPE_NOT_FOUND<br /><br /> FABRIC_E_SERVICE_DOES_NOT_EXIST<br /><br /> FABRIC_E_SERVICE_TYPE_TEMPLATE_NOT_FOUND<br /><br /> FABRIC_E_CONFIGURATION_SECTION_NOT_FOUND<br /><br /> FABRIC_E_PARTITION_NOT_FOUND<br /><br /> FABRIC_E_REPLICA_DOES_NOT_EXIST<br /><br /> FABRIC_E_SERVICE_GROUP_DOES_NOT_EXIST<br /><br /> FABRIC_E_CONFIGURATION_PARAMETER_NOT_FOUND<br /><br /> FABRIC_E_DIRECTORY_NOT_FOUND<br /><br /> FABRIC_E_FABRIC_VERSION_NOT_FOUND<br /><br /> FABRIC_E_FILE_NOT_FOUND<br /><br /> FABRIC_E_NAME_DOES_NOT_EXIST<br /><br /> FABRIC_E_PROPERTY_DOES_NOT_EXIST<br /><br /> FABRIC_E_ENUMERATION_COMPLETED<br /><br /> FABRIC_E_SERVICE_MANIFEST_NOT_FOUND<br /><br /> FABRIC_E_KEY_NOT_FOUND<br /><br /> FABRIC_E_HEALTH_ENTITY_NOT_FOUND|  
|409 Conflict|FABRIC_E_APPLICATION_TYPE_ALREADY_EXISTS<br /><br /> FABRIC_E_APPLICATION_ALREADY_EXISTS<br /><br /> FABRIC_E_APPLICATION_ALREADY_IN_TARGET_VERSION<br /><br /> FABRIC_E_APPLICATION_TYPE_PROVISION_IN_PROGRESS<br /><br /> FABRIC_E_APPLICATION_UPGRADE_IN_PROGRESS<br /><br /> FABRIC_E_SERVICE_ALREADY_EXISTS<br /><br /> FABRIC_E_SERVICE_GROUP_ALREADY_EXISTS<br /><br /> FABRIC_E_APPLICATION_TYPE_IN_USE<br /><br /> FABRIC_E_FABRIC_ALREADY_IN_TARGET_VERSION<br /><br /> FABRIC_E_FABRIC_VERSION_ALREADY_EXISTS<br /><br /> FABRIC_E_FABRIC_VERSION_IN_USE<br /><br /> FABRIC_E_FABRIC_UPGRADE_IN_PROGRESS<br /><br /> FABRIC_E_NAME_ALREADY_EXISTS<br /><br /> FABRIC_E_NAME_NOT_EMPTY<br /><br /> FABRIC_E_PROPERTY_CHECK_FAILED<br /><br /> FABRIC_E_SERVICE_METADATA_MISMATCH<br /><br /> FABRIC_E_SERVICE_TYPE_MISMATCH<br /><br /> FABRIC_E_HEALTH_STALE_REPORT<br /><br /> FABRIC_E_SEQUENCE_NUMBER_CHECK_FAILED<br /><br /> FABRIC_E_NODE_HAS_NOT_STOPPED_YET<br /><br /> FABRIC_E_INSTANCE_ID_MISMATCH|  
|413 Request Entity Too Large|FABRIC_E_VALUE_TOO_LARGE|  
|503 Service Unavailable|FABRIC_E_NO_WRITE_QUORUM<br /><br /> FABRIC_E_NOT_PRIMARY<br /><br /> FABRIC_E_NOT_READY<br /><br /> FABRIC_E_RECONFIGURATION_PENDING<br /><br /> FABRIC_E_SERVICE_OFFLINE<br /><br /> E_ABORT|  
|504 Gateway timeout|FABRIC_E_COMMUNICATION_ERROR<br /><br /> FABRIC_E_OPERATION_NOT_COMPLETE<br /><br /> FABRIC_E_TIMEOUT|