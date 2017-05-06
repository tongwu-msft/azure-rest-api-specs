---
title: "FabricError_Error"
ms.date: "2017-05-06"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows Server 2012 R2"
  - "Windows Server 2016"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
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
# FabricError_Error

Error object containing error code and error message.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Code](#code) | string (enum) | Yes |
| [Message](#message) | string | No |

____
### Code
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>
Defines the fabric error codes that be returned as part of the error object in response to Service Fabric API operations that are not successful. Following are the error code values that can be returned for a specific HTTP status code.

  - Possible values of the error code for HTTP status code 400 (Bad Request)
    - "FABRIC_E_INVALID_PARTITION_KEY"
    - "FABRIC_E_IMAGEBUILDER_VALIDATION_ERROR"
    - "FABRIC_E_INVALID_ADDRESS"
    - "FABRIC_E_APPLICATION_NOT_UPGRADING"
    - "FABRIC_E_APPLICATION_UPGRADE_VALIDATION_ERROR"
    - "FABRIC_E_FABRIC_NOT_UPGRADING"
    - "FABRIC_E_FABRIC_UPGRADE_VALIDATION_ERROR"
    - "FABRIC_E_INVALID_CONFIGURATION"
    - "FABRIC_E_INVALID_NAME_URI"
    - "FABRIC_E_PATH_TOO_LONG"
    - "FABRIC_E_KEY_TOO_LARGE"
    - "FABRIC_E_SERVICE_AFFINITY_CHAIN_NOT_SUPPORTED"
    - "FABRIC_E_INVALID_ATOMIC_GROUP"
    - "FABRIC_E_VALUE_EMPTY" 
  
  - Possible values of the error code for HTTP status code 404 (Not Found)
    - "FABRIC_E_NODE_NOT_FOUND"
    - "FABRIC_E_APPLICATION_TYPE_NOT_FOUND"
    - "FABRIC_E_APPLICATION_NOT_FOUND"
    - "FABRIC_E_SERVICE_TYPE_NOT_FOUND"
    - "FABRIC_E_SERVICE_DOES_NOT_EXIST"
    - "FABRIC_E_SERVICE_TYPE_TEMPLATE_NOT_FOUND"
    - "FABRIC_E_CONFIGURATION_SECTION_NOT_FOUND"
    - "FABRIC_E_PARTITION_NOT_FOUND"
    - "FABRIC_E_REPLICA_DOES_NOT_EXIST"
    - "FABRIC_E_SERVICE_GROUP_DOES_NOT_EXIST"
    - "FABRIC_E_CONFIGURATION_PARAMETER_NOT_FOUND"
    - "FABRIC_E_DIRECTORY_NOT_FOUND"
    - "FABRIC_E_FABRIC_VERSION_NOT_FOUND"
    - "FABRIC_E_FILE_NOT_FOUND"
    - "FABRIC_E_NAME_DOES_NOT_EXIST"
    - "FABRIC_E_PROPERTY_DOES_NOT_EXIST"
    - "FABRIC_E_ENUMERATION_COMPLETED"
    - "FABRIC_E_SERVICE_MANIFEST_NOT_FOUND"
    - "FABRIC_E_KEY_NOT_FOUND"
    - "FABRIC_E_HEALTH_ENTITY_NOT_FOUND"
    
  - Possible values of the error code for HTTP status code 409 (Conflict)
    - "FABRIC_E_APPLICATION_TYPE_ALREADY_EXISTS"
    - "FABRIC_E_APPLICATION_ALREADY_EXISTS"
    - "FABRIC_E_APPLICATION_ALREADY_IN_TARGET_VERSION"
    - "FABRIC_E_APPLICATION_TYPE_PROVISION_IN_PROGRESS"
    - "FABRIC_E_APPLICATION_UPGRADE_IN_PROGRESS"
    - "FABRIC_E_SERVICE_ALREADY_EXISTS"
    - "FABRIC_E_SERVICE_GROUP_ALREADY_EXISTS"
    - "FABRIC_E_APPLICATION_TYPE_IN_USE"
    - "FABRIC_E_FABRIC_ALREADY_IN_TARGET_VERSION"
    - "FABRIC_E_FABRIC_VERSION_ALREADY_EXISTS"
    - "FABRIC_E_FABRIC_VERSION_IN_USE"
    - "FABRIC_E_FABRIC_UPGRADE_IN_PROGRESS"
    - "FABRIC_E_NAME_ALREADY_EXISTS"
    - "FABRIC_E_NAME_NOT_EMPTY"
    - "FABRIC_E_PROPERTY_CHECK_FAILED"
    - "FABRIC_E_SERVICE_METADATA_MISMATCH"
    - "FABRIC_E_SERVICE_TYPE_MISMATCH"
    - "FABRIC_E_HEALTH_STALE_REPORT"
    - "FABRIC_E_SEQUENCE_NUMBER_CHECK_FAILED"
    - "FABRIC_E_NODE_HAS_NOT_STOPPED_YET"
    - "FABRIC_E_INSTANCE_ID_MISMATCH"
    
  - Possible values of the error code for HTTP status code 413 (Request Entity Too Large)
    - "FABRIC_E_VALUE_TOO_LARGE"
    
  - Possible values of the error code for HTTP status code 500 (Internal Server Error)
    - "FABRIC_E_NODE_IS_UP"

  - Possible values of the error code for HTTP status code 503 (Service Unavailable)
    - "FABRIC_E_NO_WRITE_QUORUM"
    - "FABRIC_E_NOT_PRIMARY"
    - "FABRIC_E_NOT_READY"
    - "FABRIC_E_RECONFIGURATION_PENDING"
    - "FABRIC_E_SERVICE_OFFLINE"
    - "E_ABORT"
    - "FABRIC_E_VALUE_TOO_LARGE"
      
  - Possible values of the error code for HTTP status code 504 (Gateway Timeout)
    - "FABRIC_E_COMMUNICATION_ERROR"
    - "FABRIC_E_OPERATION_NOT_COMPLETE"
    - "FABRIC_E_TIMEOUT"
      


____
### Message
__Type__: string <br/>
__Required__: No<br/>
<br/>
Error message.
