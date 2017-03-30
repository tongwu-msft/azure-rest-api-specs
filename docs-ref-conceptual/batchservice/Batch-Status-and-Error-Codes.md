---
title: "Batch Status and Error Codes | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: e9da2d54-053a-4392-a5ba-26229c7cc9a5
caps.latest.revision: 22
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Batch Status and Error Codes
  REST API operations for the Batch service return standard HTTP status codes, as defined in the [HTTP/1.1 Status Code Definitions](http://go.microsoft.com/fwlink/?linkid=133333).

 API operations may also return additional error information to provide the developer with more information about the error. For example, the following error response indicates that a query parameter specified on the request URI was invalid, and provides additional information about the invalid parameter’s name and value and the reason for the error.

```json
{
  "code": "InvalidQueryParameterValue",
  "message": {
      "lang": "en-us",
      "value": "Value for one of the query parameters specified in the request URI is invalid"
  },
  "values": [{
      "key": "QueryParameterName",
      "value": "state"
  }, {
      "key": "QueryParameterValue",
      "value": "deleted"
  }, {
      "key": "Reason",
      "value": "invalid state"
  }]
}
```

 The following sections provide lists of error codes for the Batch service:

-   [Common REST API Error Codes](#bk_ComRESTAPIErrCodes)

-   [Batch Service Error Codes](#bk_batchsererrcode)

-   [Job/Task Scheduling Error Codes](#BKMK_JobTaskError)

##  <a name="bk_ComRESTAPIErrCodes"></a> Common REST API Error Codes
 The error codes listed in the following table may be returned by an operation on the Batch service.

|Error code|HTTP status code|User message|
|----------------|----------------------|------------------|
|ConditionNotMet|Not Modified (304)|The condition specified in the conditional header(s) was not met for a read operation.|
|MissingRequiredHeader|Bad Request (400)|A required HTTP header was not specified.|
|MissingRequiredProperty|Bad Request (400)|A required property was not specified in the request body.|
|UnsupportedHeader|Bad Request (400)|One of the HTTP headers specified in the request is not supported.|
|UnsupportedProperty|Bad Request (400)|One of the properties specified in the request body is not supported.|
|InvalidHeaderValue|Bad Request (400)|The value provided for one of the HTTP headers was not in the correct format.|
|InvalidPropertyValue|Bad Request (400)|The value provided for one of the property in the request body is invalid.|
|MissingRequiredQueryParameter|Bad Request (400)|A required query parameter was not specified for this request.|
|UnsupportedQueryParameter|Bad Request (400)|One of the query parameters specified in the request URI is not supported.|
|InvalidQueryParameterValue|Bad Request (400)|An invalid value was specified for one of the query parameters in the request URI.|
|OutOfRangeQueryParameterValue|Bad Request (400)|A query parameter specified in the request URI is outside the permissible range.|
|RequestUrlFailedToParse|Bad Request (400)|The url in the request could not be parsed.|
|InvalidUri|Bad Request (400)|The requested URI does not represent any resource on the server.|
|InvalidHttpVerb|Bad Request (400)|The HTTP verb specified was not recognized by the server.|
|EmptyMetadataKey|Bad Request (400)|The key for one of the metadata key-value pairs is empty.|
|InvalidRequestBody|Bad Request (400)|The specified Request Body is not syntactically valid.|
|OutOfRangeInput|Bad Request (400)|One of the request inputs is out of range.|
|InvalidAuthenticationInfo|Bad Request (400)|The authentication information was not provided in the correct format. Verify the value of *Authorization* header.|
|InvalidInput|Bad Request (400)|One of the request inputs is not valid.|
|InvalidMetadata|Bad Request (400)|The specified metadata is invalid. It includes characters that are not permitted.|
|MetadataTooLarge|Bad Request (400)|The size of the specified metadata exceeds the maximum size permitted.|
|MultipleConditionHeadersNotSupported|Bad Request (400)|Multiple condition headers are not supported.|
|AuthenticationFailed|Forbidden (403)|The server failed to authenticate the request. Verify that the value of *Authorization* header is formed correctly and includes the signature.|
|InsufficientAccountPermissions|Forbidden (403)|The account being accessed does not have sufficient permissions to execute this operation.|
|AccountIsDisabled|Forbidden (403)|The specified account is disabled.|
|ResourceNotFound|Not Found (404)|The specified resource does not exist.|
|UnsupportedHttpVerb|Method Not Allowed (405)|The resource doesn't support the specified HTTP verb.|
|MissingContentLengthHeader|Length Required (411)|The *Content-Length* header was not specified.|
|ConditionNotMet|Precondition Failed (412)|The condition specified in the conditional header(s) was not met for a write operation.|
|RequestBodyTooLarge|Request Entity Too Large (413)|The size of the request body exceeds the maximum size permitted.|
|InvalidRange|Requested Range Not Satisfiable (416)|The range specified is invalid for the current size of the resource.|
|InternalError|Internal Server Error (500)|The server encountered an internal error. Please retry the request.|
|OperationTimedOut|Internal Server Error (500)|The operation could not be completed within the permitted time.|
|ServerBusy|Service Unavailable (503)|The server is currently unable to receive requests. Please retry your request.|

##  <a name="bk_batchsererrcode"></a> Batch Service Error Codes
 The error codes listed in the following table may be returned by an operation on the Batch service.

|Error code|HTTP status code|User message|
|----------------|----------------------|------------------|
|UnsupportedRequestVersion|BadRequest (400)|The specified request version is not supported.|
|InvalidAutoScalingSettings|BadRequest (400)|The specified auto-scaling settings are not valid.|
|AutoScalingFormulaSyntaxError|BadRequest (400)|The specified auto-scaling formula has a syntax error.|
|AutoScalingFormulaTooLong|BadRequest (400)|The specified auto-scaling formula exceeds lengths limit.|
|OSVersionNotFound|BadRequest (400)|The specified OS Version does not exists.|
|OSVersionDisabled|BadRequest (400)|The specified OS Version is disabled.|
|OSVersionExpired|BadRequest (400)|The specified OS Version is expired.|
|PoolVersionEqualsUpgradeVersion|BadRequest (400)|The pool is already with the given version.|
|PoolNotEligibleForOSVersionUpgrade|BadRequest (400)|The specified pool is not eligible for OS Version upgrade.|
|PoolNotFound|NotFound (404)|The specified pool does not exist.|
|NodeNotFound|NotFound (404)|The specified node does not exist.|
|JobScheduleNotFound|NotFound (404)|The specified job schedule does not exist.|
|JobNotFound|NotFound (404)|The specified job does not exist.|
|TaskNotFound|NotFound (404)|The specified task does not exist.|
|FileNotFound|NotFound (404)|The specified file does not exist.|
|NodeUserNotFound|NotFound (404)|The specified node user does not exist.|
|CertificateNotFound|NotFound (404)|The specified certificate does not exist.|
|JobPreparationTaskNotRunOnNode|NotFound (404)|The job preparation task did not run on the specified node.|
|JobReleaseTaskNotRunOnNode|NotFound (404)|The job release task did not run on the specified node.|
|NodeAgentSKUNotFound|NotFound (404)|The specified Node Agent SKU does not exist.|
|OperationInvalidForCurrentState|Conflict (409)|The specified operation is not valid for the current state of the resource.|
|PoolBeingDeleted|Conflict (409)|The specified pool has been marked for deletion and is being reclaimed.|
|PoolBeingResized|Conflict (409)|The specified pool is being resized|
|PoolBeingCreated|Conflict (409)|The specified pool is being created.|
|NodeBeingCreated|Conflict (409)|The specified node is being created|
|NodeBeingStarted|Conflict (409)|The specified node is being started|
|NodeBeingReimaged|Conflict (409)|The specified node is being reimaged|
|NodeBeingRebooted|Conflict (409)|The specified node is being rebooted|
|NodeStateUnusable|Conflict (409)|The state of the specified node is unusable|
|JobScheduleBeingTerminated|Conflict (409)|The specified job schedule is being terminated.|
|JobScheduleBeingDeleted|Conflict (409)|The specified job schedule has been marked for deletion and is being reclaimed.|
|CertificateBeingDeleted|Conflict (409)|The specified certificate has been marked for deletion and is being deleted.|
|PoolExists|Conflict (409)|The specified pool already exists.|
|JobScheduleExists|Conflict (409)|The specified job schedule already exists.|
|NodeUserExists|Conflict (409)|The specified node user already exists.|
|JobExists|Conflict (409)|The specified job already exists.|
|NodeUserExists|Conflict (409)|The specified node user already exists.|
|CertificateExists|Conflict (409)|The specified certificate already exists.|
|JobScheduleDisabled|Conflict (409)|The specified job schedule is disabled.|
|JobScheduleCompleted|Conflict (409)|The specified job schedule is already in completed state.|
|JobBeingTerminated|Conflict (409)|The specified job is being terminated.|
|JobBeingDeleted|Conflict (409)|The specified job has been marked for deletion and is being garbage collected.|
|JobDisabled|Conflict (409)|The specified job is disabled.|
|JobCompleted|Conflict (409)|The specified job is already in a completed state.|
|JobNotActive|Conflict (409)|The specified job is not in active state.|
|TaskExists|Conflict (409)|The specified task already exists.|
|TaskCompleted|Conflict (409)|The specified task is already in a completed state.|
|TaskNotCompleted|Conflict (409)|The specified task is not in a completed state, and the requested operation can be performed only on completed tasks.|
|TaskSucceeded|Conflict (409)|The specified task has already completed successfully, and the requested operation cannot be performed on successful tasks.|
|TaskFilesUnavailable|Conflict (409)|The files of the specified task are unavailable.|
|TaskFilesCleanedup|Conflict (409)|The files of the specified task are cleanedup.|
|ActiveJobAndScheduleQuotaReached|Conflict (409)|Active job and schedule quota for the account has been reached.|
|PoolQuotaReached|Conflict (409)|Pool quota for the account has been reached.|
|UpgradePoolVersionConflict|Conflict (409)|The pool is already upgrading to a different version.|
|JobPreparationTaskNotSpecified|Conflict (409)|The specified job does not have job preparation task.|
|JobReleaseTaskNotSpecified|Conflict (409)|The specified job does not have job release task.|
|TaskIdSameAsJobPreparationTask|Conflict (409)|The specified task id is same as the job preparation task.|
|TaskIdSameAsJobReleaseTask|Conflict (409)|The specified task id is same as the job release task.|
|JobWithSameIdExists|Conflict (409)|A job with the specified job schedule id exists. Job and job schedule cannot have the same id.|
|JobScheduleWithSameIdExists|Conflict (409)|A job schedule with the specified job id exists. Job and job schedule cannot have the same id.|
|NodeAlreadyInTargetSchedulingState|Conflict (409)|The specified node is already in the target scheduling state.|
|OperationNotValidOnNode|Conflict (409)|The specified operation is not valid on the node.|
|OperationNotValidOnPool|Conflict (409)|The specified operation is not valid on the pool.|
|IOError|Forbidden (403)|An I/O error occurred when accessing the specified resource.|
|TooManyEnableAutoScaleRequests|ServiceUnavailable (503)|Too many Enable Pool AutoScale requests are issued on the pool.|
|ApplicationNotFound|Not Found (404)|The specified application does not exist.|
|InvalidApplicationPackageReferences|Conflict (409)|One or more application package references could not be satisfied. This occurs if the application id or version does not exist or is not active, or if the reference did not specify a version and there is no default version configured.|
|TaskDependenciesNotSpecifiedOnJob|Bad Request (400)|A task was specified as depending on other tasks, but the job did not specify that it would use task dependencies.|
|TaskDependencyListTooLong|Bad Request (400)|A task was specified as depending on other tasks, but the list of dependencies was too long to be stored. The total stored length is limited to 64000 characters; the total length of task ids must be slightly less than this to allow for internal storage overhead. If you encounter this error, consider using task range dependencies instead.|
|TaskDependencyRangesTooLong|Bad Request (400)|A task was specified as depending on multiple ranges of task ids, and the list of ranges was too long to be stored. Note that the issue is not with the size of ranges, but with the number of ranges.|

##  <a name="BKMK_JobTaskError"></a> Job/Task Scheduling Error Codes
 If the Batch service encounters an error in scheduling a task on a node, it marks the task as completed.  This scheduling error information is returned within a `SchedulingError` element in the response body of [List the files associated with a task](../batchservice/list-the-files-associated-with-a-task.md) and [Get information about a task](../batchservice/get-information-about-a-task.md) APIs.

 Similarly, if the Batch service encounters an error while starting the job, it marks the job as completed.  This scheduling error information is returned within a `SchedulingError` element in the response body of [List the tasks associated with a job](../batchservice/list-the-tasks-associated-with-a-job.md) and [Get information about a job in Batch](../batchservice/get-information-about-a-job-in-batch.md) APIs.

 The following table provides the list of categories for task scheduling errors.

|Category|Description|
|--------------|-----------------|
|UserError|Errors in the task specification provided by the user.|
|ServerError|Errors encountered by the Batch service that prevent it from scheduling the task.|

 Below is a sample scheduling error returned by the Batch service.

```json
{
  "schedulingError": {
    "category": "UserError",
    "code": "BlobNotFound",
    "message": "The specified blob does not exist.",
    "values": {
      "name": "FilePath",
      "value": "myfile.txt"
    }
  }
}
```

 The following table provides the list of job scheduling error codes that may be returned by the Batch service.

|Error code|Category|User message|
|----------------|--------------|------------------|
|InvalidCertificatesInAutoPool|UserError|The specified certificate references in the auto pool specification are not valid.|
|AutoPoolCreationFailedWithQuotaReached|UserError|The pool quota for the account is reached.|
|InvalidApplicationPackageReferencesInAutoPool|UserError|One or more application packages specified for the pool are invalid.|
|InvalidAutoScaleFormulaInAutoPool|UserError|The specified auto-scaling settings are not valid.|
|InvalidAutoPoolSettings|UserError|The specified autopool settings are not valid.|
|JobBeingTerminated|UserError|Task cannot be started because the associated job is being terminated.|
|Unknown|ServerError|An unknown scheduling error has occurred.|

 The following table provides the list of task scheduling error codes that may be returned by the Batch service.

|Error code|Category|User message|
|----------------|--------------|------------------|
|BlobNotFound|UserError|One of the specified Azure Blob(s) is not found.|
|BlobAccessDenied|UserError|Access for one of the specified Azure Blob(s) is denied.|
|BlobDownloadTimedOut|ServerError|Timeout encountered while downloading one of the specified Azure Blob(s).|
|BlobDownloadMiscError|ServerError|Miscellaneous error encountered while downloading one of the specified Azure Blob(s).|
|ResourceDirectoryCreateFailed|ServerError|Failure encountered creating resource directory for the task.|
|ResourceFileCreateFailed|ServerError|Failure encountered creating resource file.|
|ResourceFileWriteFailed|ServerError|Failure encountered writing resource file.|
|CommandProgramNotFound|UserError|The specified command program is not found.|
|CommandLaunchFailed|UserError|Failed to launch the specified command line.|
|TaskEnded|UserError|Task was ended by user request.|
|MaxInternalRetryCountReached|UserError|The specified task has reached maximum internal retry count.|
|TaskSchedulingConstraintFailed|UserError|Task cannot be scheduled on the pool associated with the job|
|DiskFull|ServerError|There is not enough disk space on the node that was selected to run the task.|
|Unknown|ServerError|An unknown scheduling error has occurred.|

