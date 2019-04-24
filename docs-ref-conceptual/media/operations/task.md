---
title: "Task"
ms.custom: ""
ms.date: "03/14/2018"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "media-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 3823b65d-277d-423b-80e4-70ef8f2d72db
caps.latest.revision: 37
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
# Task
A Task is an individual operation of work on an Asset and is defined in a Job.  
  
 This topic gives an overview of the `Task` entity and also demonstrates how to execute various operations with the Media Services REST API.  
  
-   [Task Entity Properties](../operations/task.md#task_entity_properties)  
  
-   [Create a Task](../operations/task.md#create_a_task)  
  
-   [List Tasks](../operations/task.md#list_tasks)  
  
> [!IMPORTANT]
> When accessing entities in Media Services, you must set specific header fields and values in your HTTP requests. <br/>For more information, see [Setup for Media Services REST API Development](https://docs.microsoft.com/azure/media-services/media-services-rest-how-to-use) and [Connecting to Media Services with the Media Services REST API](https://docs.microsoft.com/azure/media-services/media-services-use-aad-auth-to-access-ams-api).  

##  <a name="task_entity_properties"></a> Task Entity Properties  
  
|Property|Type|Description|  
|--------------|----------|-----------------|  
|`Id`<br /><br /> Read-only. Set by Media Services at creation time.|Edm.String|Unique identifier.|  
|`Configuration`<br /><br /> Optional.|Edm.String|Preset that defines processing actions, such as encoding, protection, and so on, that the Task will perform. Maximum length is 100000.|  
|`EndTime`<br /><br /> Read-only. Set by Media Services.|Edm.DateTime|The datetime when the task completed, failed, or was canceled.|  
|`ErrorDetails`<br /><br /> Read-only. Set by Media Services.|Collection([ErrorDetail](../operations/errordetail.md))|A collection of codes and detailed messages describing any errors that occur when a Task is running.|  
|`HistoricalEvents`<br /><br /> Read-only. Set by Media Services.|Collection([TaskHistoricalEvent](../operations/taskhistoricalevent.md))|A collection of [TaskHistoricalEvent](../operations/taskhistoricalevent.md) objects that describe events associated with task execution.|  
|`MediaProcessorId`<br /><br /> Required.|Edm.String|Id of the MediaProcessor that will be used in the Task. Valid values can be retrieved by performing GET request on /API/MediaProcessors.|  
|`Name`<br /><br /> Optional.|Edm.String|Optional. Friendly name for the Task. Maximum length is 4000.|  
|`PerfMessage`<br /><br /> Read-only. Set by Media Services.|Edm.String|Contains performance information about the Task.|  
|`Priority`<br /><br /> Optional.|Edm.Int32|The priority of the task. A higher value indicates a higher priority relative to other tasks. . For example, a task with Priority = 40 will be processed before a task with Priority = 30. The upper bound is equal to MaxInt.|  
|`Progress`<br /><br /> Read-only. Set by Media Services.|Edm.Double|Value indicating zero to 100 percent.|  
|`RunningDuration`<br /><br /> Read-only. Set by Media Services.|Edm.Double|The elapsed time (in seconds) for the Task.|  
|`StartTime`<br /><br /> Read-only. Set by Media Services.|Edm.DateTime|The datetime when the Task started.|  
|`State`<br /><br /> Read-only. Set by Media Services.|Edm.Int32|The state of the Task. Valid values are:<br /><br /> - None = 0<br /><br /> - Active = 1<br /><br /> - Running = 2<br /><br /> - Completed = 3|  
|`TaskBody`<br /><br /> Required.|Edm.String|XML document that contains information about which input and output assets the Task should run against. A Task must have at least 1 input asset and 1 output asset.<br /><br /> The XML document is of the following format.<br /><br /> `<taskBody>     <inputAsset> JobInputAsset(0)</inputAsset>     <inputAsset> JobInputAsset(1)</inputAsset>     <outputAsset assetCreationOptions=”1”                   assetName=”output”                   storageAccountName=”mystoreagename”>                  JobOutputAsset(0)     </outputAsset> <taskBody>`<br /><br /> The \<outputAsset> element can have the following attributes:<br /><br /> - assetCreationOptions (or AssetCreationOptions). This attributes can have one of the following values: None=0x0, StorageEncrypted=0x1, CommonEncryptionProtected=0x2, EnvelopeEncryptionProtected=0x4. The default is StorageEncrypted.<br /><br /> - assetName (or AssetName). If none specified, Media Services sets a name in the following format: the parent outputAsset element suffixed by the Job Name (or the Job Id, if the Job Name is empty.<br /><br /> - storageAccountName (or StorageAccountName). The name of the storage account where the output asset will reside. If not specified, the user’s default storage account is used.<br /><br /> A task can depend on multiple tasks and also can have multiple dependents. For example, if Task A has an \<outputAsset> that is referenced as an \<inputAsset> by Task B, then Task B is dependent on Task A. As a result, Media Services has to finish processing Task A before it can process Task B.|  
|`Options`<br /><br /> Required. Read-only after creation.|Edm.Int32|An enumeration value that describes the encryption options that a Task can be created with. Valid values are:<br /><br /> - None = 0<br /><br /> - ProtectedConfiguration = 1|  
|`EncryptionKeyId`<br /><br /> Optional.|Edm.String|The encrypted Key Id.|  
|`EncryptionScheme`<br /><br /> Optional.|Edm.String|The EncryptionScheme used with the configuration file. The valid value is "ConfigurationEncryption".|  
|`EncryptionVersion`<br /><br /> Optional.|Edm.String|The version of configuration encryption to use. The currently supported version is "1.0".|  
|`InitializationVector`<br /><br /> Optional.|Edm.String|The InitializationVector of the configuration file. Maximum length is 4000.|  
|`OutputMediaAssets`<br /><br /> Read-only. Set by Media Services.|[Asset](../operations/asset.md) entity set|Navigation property that can be accessed by referencing a specific task by Id value. The returned entity set contains all of the OutputMediaAsset entities that are linked to the specified task.|  
|`InputMediaAssets`<br /><br /> Read-only. Set by Media Services.|[Asset](../operations/asset.md) entity set|Navigation property that can be accessed by referencing a specific Task by Id value. The returned entity set contains all of the InputMediaAsset entities that are linked to the specified Task.|  
|`TaskNotificationSubscriptions`<br /><br /> Required.|[TaskNotificationSubscription](../operations/tasknotificationsubscription.md) entity set|Defines the notification endpoint task state changes. Also,  indicates whether to include task progress for which to be notified.|  
  
##  <a name="create_a_task"></a> Create a Task  
 Tasks are created by creating a Job. For an example, see [How to encode an asset using Media Encoder Standard](https://azure.microsoft.com/documentation/articles/media-services-dotnet-encode-with-media-encoder-standard/).  
  
##  <a name="list_tasks"></a> List Tasks  
 Tasks are retrieved using a GET HTTP request.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/Tasks|HTTP/1.1|  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/Jobs('*jobid*')/Tasks|HTTP/1.1|  
  
### Sample Request  

 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
```  
GET https://<accountname>.restv2.<location>.media.azure.net/api/Jobs('nb:jid:UUID:b1f956b3-774c-bb44-a3f7-ee47e23add31')/Tasks HTTP/1.1  
Content-Type: application/json;odata=verbose  
Accept: application/json;odata=verbose  
DataServiceVersion: 3.0  
MaxDataServiceVersion: 3.0  
x-ms-version: 2.11  
Authorization: Bearer http%3a%2f%2fschemas.xmlsoap.org%2fws%2f2005%2f05%2fidentity%2fclaims%2fnameidentifier=youraccountname&urn%3aSubscriptionId=2f84471d-b1ae-4e75-aa09-010f0fc0cf5b&http%3a%2f%2fschemas.microsoft.com%2faccesscontrolservice%2f2010%2f07%2fclaims%2fidentityprovider=https%3a%2f%2fwamsprodglobal001acs.accesscontrol.windows.net%2f&Audience=urn%3aWindowsAzureMediaServices&ExpiresOn=1337212980&Issuer=https%3a%2f%2fwamsprodglobal001acs.accesscontrol.windows.net%2f&HMACSHA256=kK7PbPM3lTAEJYIx5OTWeaSY7zvia358UjPiuvSFHz0%3d  
Host: media.windows.net  
```  
  
## See Also  
 [AccessPolicy](../operations/accesspolicy.md)   
 [Asset](../operations/asset.md)   
 [ContentKey](../operations/contentkey.md)   
 [Job](../operations/job.md)   
 [Job](../operations/job.md)   
 [JobTemplate](../operations/jobtemplate.md)   
 [Locator](../operations/locator.md)   
 [MediaProcessor](../operations/mediaprocessor.md)   
 [TaskTemplate](../operations/tasktemplate.md)   
 [Quotas and Limitations](http://msdn.microsoft.com/en-us/82f7e538-6bdf-4883-aa50-24574cc4996e)