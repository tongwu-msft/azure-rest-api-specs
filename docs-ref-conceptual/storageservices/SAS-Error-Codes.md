---
title: SAS error codes (REST API) - Azure Storage
description: SAS error codes.
author: pemari-msft

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# SAS error codes

Beginning with version 2015-04-05, Azure Storage returns several new error codes for  shared access signatures (SAS).  
  
|Scenario|Storage Error Code|Old Http Status Code|New Http Status Code|Error Message|Applies To (SAS Type)|  
|--------------|------------------------|--------------------------|--------------------------|-------------------|-----------------------------|  
|Authorization of IP address or range failed|`AuthorizationSourceIPMismatch`|N/A|403 (Forbidden)|This request is not authorized to perform this operation using this source IP {SourceIP}.|Account SAS<br /><br /> Service SAS|  
|Authorization of HTTPS failed|`AuthorizationProtocolMismatch`|N/A|403 (Forbidden)|This request is not authorized to perform this operation using this protocol.|Account SAS<br /><br /> Service SAS|  
|Unauthorized signed permission (including create and add permissions)|`AuthorizationPermissionMismatch`|404 (Not Found)|403 (Forbidden)|This request is not authorized to perform this operation using this permission.|Account SAS<br /><br /> Service SAS|  
|Unauthorized signed service|`AuthorizationServiceMismatch`|N/A|403 (Forbidden)|This request is not authorized to perform this operation using this service.|Account SAS<br /><br /> Service SAS|  
|Unauthorized signed resource type|`AuthorizationResourceTypeMismatch`|N/A|403 (Forbidden)|This request is not authorized to perform this operation using this resource type.|Account SAS<br /><br /> Service SAS|  
|Other authorization errors (for example, attempting  to modify an ACL or calling another unsupported SAS API)|`AuthorizationFailure`|404 (Not Found)|403 (Forbidden)|This request is not authorized to perform this operation.|Account SAS<br /><br /> Service SAS|  
|Stored access policy for file or blob relies on Create or Add permission, and Get ACL is called using a version prior to 2015-04-05|`FeatureVersionMismatch`|N/A|409 (Conflict)|Stored access policy contains a permission that is not supported by this version.|Service SAS|  
  
## See Also  
 [Delegate access with a shared access signature](delegate-access-with-shared-access-signature.md)   
 [Create a service SAS](create-service-sas.md)
