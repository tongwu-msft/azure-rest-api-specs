---
title: "TaskTemplate"
ms.custom: ""
ms.date: "03/14/2018"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "media-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 2ffeee8a-bf60-400f-beb1-c5db4ad0bddc
caps.latest.revision: 29
author: "Juliako"
ms.author: "juliako"
manager: "erikre"
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
# TaskTemplate
TaskTemplates provide reusable settings for tasks that run within a JobTemplate definition.  
  
 This article gives an overview of the `TaskTemplate` entity and also demonstrates how to execute various operations with the Media Services REST API.  
  
-   [TaskTemplate Entity Properties](../operations/tasktemplate.md#task_template_entity_properties)  
  
-   [Create a TaskTemplate](../operations/tasktemplate.md#create_a_tasktemplate)  
  
-   [List TaskTemplates](../operations/tasktemplate.md#list_tasktemplates)  
  
> [!IMPORTANT]
> When accessing entities in Media Services, you must set specific header fields and values in your HTTP requests. <br/>For more information, see [Setup for Media Services REST API Development](https://docs.microsoft.com/azure/media-services/media-services-rest-how-to-use) and [Connecting to Media Services with the Media Services REST API](https://docs.microsoft.com/azure/media-services/media-services-use-aad-auth-to-access-ams-api).  

##  <a name="task_template_entity_properties"></a> TaskTemplate Entity Properties  
  
|Property|Type|Description|  
|--------------|----------|-----------------|  
|Id<br /><br /> Read-only. Set by Media Services at creation time.|Edm.String|User-defined unique identifier of the following format, "nb:ttid:UUID:\<INSERT NEW GUID STRING>."|  
|Configuration<br /><br /> Optional.|Edm.String|Preset that defines processing actions, such as encoding, protection, and so on, that the TaskTemplate will perform. Maximum length is 100000.|  
|Created<br /><br /> Read-only. Set by Media Services at creation time.|Edm.DateTime|This value is set by Media Services at creation time.|  
|Description<br /><br /> Optional.|Edm.String|The description of the TaskTemplate. Maximum length is 4000.|  
|LastModified<br /><br /> Read-only. Set by Media Services.|Edm.DateTime|This value is updated by Media Services after any property changes are made.|  
|MediaProcessorId<br /><br /> Optional.|Edm.String|Id of the MediaProcessor that will be used in the TaskTemplate. Valid values can be retrieved by performing GET request on /API/MediaProcessors.|  
|Name<br /><br /> Optional.|Edm.String|Friendly name for the task template. Maximum length is 4000.|  
|NumberofInputAssets<br /><br /> Required.|Edm.Int32|Number of input Assets the TaskTemplate must process.|  
|NumberofOutputAssets<br /><br /> Required.|Edm.Int32|Number of output Assets the TaskTemplate must create if they are not already specified, or use if they are specified.|  
|Options<br /><br /> Optional.|Edm.Int32|An enumeration value that describes the encryption options that a TaskTemplate can be created with. Valid values are:<br /><br /> -   None = 0<br />-   ProtectedConfiguration = 1|  
|EncryptionKeyId<br /><br /> Optional.|Edm.String|The encrypted Key Id.|  
|EncryptionScheme<br /><br /> Optional.|Edm.String|The EncryptionScheme used with the configuration file. The valid value is "ConfigurationEncryption."|  
|EncryptionVersion<br /><br /> Optional.|Edm.String|The version of configuration encryption to use. The currently supported version is "1.0."|  
|InitializationVector<br /><br /> Optional.|Edm.String|The InitializationVector of the configuration file.|  
  
##  <a name="create_a_tasktemplate"></a> Create a TaskTemplate  
 TaskTemplates are created by creating a JobTemplate. For an example, see [Create a JobTemplate](../operations/jobtemplate.md#create_a_jobtemplate).  
  
##  <a name="list_tasktemplates"></a> List TaskTemplates  
 Tasks are retrieved using a GET HTTP request.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/TaskTemplates|HTTP/1.1|  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/JobTemplates('*jobtemplateid*')/TaskTemplates|HTTP/1.1|  
  
### Sample Request  

 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
```  
GET https://<accountname>.restv2.<location>.media.azure.net/api/JobTemplates('nb:jtid:UUID:b1f956b3-774c-bb44-a3f7-ee47e23aed38')/TaskTemplates HTTP/1.1  
Content-Type: application/json;odata=verbose  
Accept: application/json;odata=verbose  
DataServiceVersion: 3.0  
MaxDataServiceVersion: 3.0  
x-ms-version: 2.11  
Authorization: Bearer http%3a%2f%2fschemas.xmlsoap.org%2fws%2f2005%2f05%2fidentity%2fclaims%2fnameidentifier=youraccountname&urn%3aSubscriptionId=2f84471d-b1ae-4e75-aa09-010f0fc0cf5b&http%3a%2f%2fschemas.microsoft.com%2faccesscontrolservice%2f2010%2f07%2fclaims%2fidentityprovider=https%3a%2f%2fmediaservices.accesscontrol.windows.net%2f&Audience=urn%3aWindowsAzureMediaServices&ExpiresOn=1337212980&Issuer=https%3a%2f%2fwamsprodglobal001acs.accesscontrol.windows.net%2f&HMACSHA256=kK7PbPM3lTAEJYIx5OTWeaSY7zvia358UjPiuvSFHz0%3d  
Host: media.windows.net  
```  
  
## See Also  
 [ContentKey](../operations/contentkey.md)   
 [Asset](../operations/asset.md)   
 [AccessPolicy](../operations/accesspolicy.md)   
 [AssetFile](../operations/assetfile.md)   
 [Job](../operations/job.md)   
 [Locator](../operations/locator.md)   
 [MediaProcessor](../operations/mediaprocessor.md)   
 [Task](../operations/task.md)   
 [JobTemplate](../operations/jobtemplate.md)   
 [Quotas and Limitations](http://msdn.microsoft.com/en-us/82f7e538-6bdf-4883-aa50-24574cc4996e)