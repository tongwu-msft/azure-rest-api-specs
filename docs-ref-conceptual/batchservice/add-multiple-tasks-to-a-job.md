---
title: "Add multiple tasks to a job | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: e7729b93-3e39-446b-be59-19b2534ed46b
caps.latest.revision: 12
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Add multiple tasks to a job
 > [!IMPORTANT]
>  This API has been **deprecated**. See [Add a collection of tasks to a job](../batchservice/add-a-collection-of-tasks-to-a-job.md) for the current API.

  Requests to add multiple tasks to an account in the Batch service support the following concepts:

-   Each request must contain a unique Content\-ID MIME part header. This header is returned with the result of the operation in the response, and can be used to match an individual request with its response.

-   The Batch service returns a HTTP Status Code 400 \(Bad Request\) if any request contains an invalid set of headers or contains operations which are not supported in the batch.

-   The Batch service returns a HTTP Status Code 202 \(Accepted\) for a valid request. The server will then stream the results of individual operations.

-   The Batch service can re\-order the responses of these requests. The Content\-Id MIME part header need to be used by the Client to match the request corresponding to the response. The response contains the results and error information for each operation.

     If the server times out or the connection is closed during the request, the request may have been partially or fully processed, or not at all.  In such cases, the user should re\-issue the request. Note that it is up to the users to correctly deal with failures when re\-issuing a request.  For example, the users should use the same task ids during retry, so that if the prior operation succeeded, the retry will not create extra tasks unexpectedly.

-   A request can include at most 100 operations.

-   All the tasks in this request must belong to the same job.

## Request
 The following example shows a request containing three tasks to be added under a job.

```
POST http://myaccount.myregion.batch.azure.com/$batch?api-version=2016-02-01.3.0&timeout=120 HTTP/1.1
User-Agent: WA-Batch/1.0
client-request-id: d0bbe48e-6edd-4610-9b69-6ce3c42ee8cb
return-client-request-id: False
Content-Type: multipart/mixed; boundary=batch_822c0a14-c86d-45cd-ba06-4f08126f8fa0
Authorization: SharedKey myaccount:Xbm5iDvgCbH6iBpnbYLrSKbrt0JbjvI9imv9Wfph/eg=
Content-Length: 2532

--batch_822c0a14-c86d-45cd-ba06-4f08126f8fa0
Content-Type: multipart/mixed; boundary=changeset_3994fd0e-8e87-4cfe-b311-f56d2926e0e1

--changeset_3994fd0e-8e87-4cfe-b311-f56d2926e0e1
Content-Type: application/http
Content-Transfer-Encoding: binary

POST http://myaccount.myregion.batch.azure.com/jobs/job-0000000001/tasks?api-version=2016-02-01.3.0 HTTP/1.1
Content-Type: application/json;odata=minimalmetadata;streaming=true;charset=utf-8
client-request-id: 625b38f0-aaf3-44b6-924e-2cd52d36d9f0
return-client-request-id: True
Content-ID: 1
DataServiceVersion: 3.0;

{
   "odata.type":"Microsoft.Azure.Batch.Protocol.Entities.Task",
   "id":"taskbatch3_00000",
   "commandLine":"cmd /c echo hello, #0"
}
--changeset_3994fd0e-8e87-4cfe-b311-f56d2926e0e1--
--batch_822c0a14-c86d-45cd-ba06-4f08126f8fa0
Content-Type: multipart/mixed; boundary=changeset_b4113810-fe68-4aa7-9d74-d8a14a33e409

--changeset_b4113810-fe68-4aa7-9d74-d8a14a33e409
Content-Type: application/http
Content-Transfer-Encoding: binary

POST http://myaccount.myregion.batch.azure.com/jobs/job-0000000001/tasks?api-version=2016-02-01.3.0 HTTP/1.1
Content-Type: application/json;odata=minimalmetadata;streaming=true;charset=utf-8
client-request-id: d4bff599-d292-465b-a839-98dabf2d1ffb
return-client-request-id: True
Content-ID: 2
DataServiceVersion: 3.0;

{
   "odata.type":"Microsoft.Azure.Batch.Protocol.Entities.Task",
   "id":"taskbatch3_00000",
   "commandLine":"cmd /c echo hello, #060"
}
--changeset_b4113810-fe68-4aa7-9d74-d8a14a33e409--
--batch_822c0a14-c86d-45cd-ba06-4f08126f8fa0
Content-Type: multipart/mixed; boundary=changeset_c9adb1fc-efb2-4589-a951-fb9f7d6dc60a

--changeset_c9adb1fc-efb2-4589-a951-fb9f7d6dc60a
Content-Type: application/http
Content-Transfer-Encoding: binary

POST http://myaccount.myregion.batch.azure.com/jobs/job-0000000001/tasks?api-version=2016-02-01.3.0 HTTP/1.1
Content-Type: application/json;odata=minimalmetadata;streaming=true;charset=utf-8
client-request-id: f7881b79-6fea-4e6a-b5f2-1af06a710cfd
return-client-request-id: True
Content-ID: 3
DataServiceVersion: 3.0;

{
   "odata.type":"Microsoft.Azure.Batch.Protocol.Entities.Task",
   "id":"taskbatch3_00001",
   "commandLine":"cmd /c echo hello, #1"
}
--changeset_c9adb1fc-efb2-4589-a951-fb9f7d6dc60a--
--batch_822c0a14-c86d-45cd-ba06-4f08126f8fa0--
```

## Response

```
HTTP/1.1 202 Accepted
Content-Type: multipart/mixed; boundary=batch_a9e0dba6-7d90-4fb6-802b-8ec665814afc
Server: Microsoft-HTTPAPI/2.0
request-id: 918868f8-9869-4847-9ae6-3c0cee46f148
DataServiceVersion: 3.0
Content-Length: 2744

--batch_a9e0dba6-7d90-4fb6-802b-8ec665814afc
Content-Type: multipart/mixed; boundary=changesetresponse_b0908fd9-f098-44bc-84e0-d1e698d0c2d7

--changesetresponse_b0908fd9-f098-44bc-84e0-d1e698d0c2d7
Content-Type: application/http
Content-Transfer-Encoding: binary

HTTP/1.1 201 Created
DataServiceId: http://myaccount.myregion.batch.azure.com/jobs/job-0000000001/tasks/taskbatch3_00000
client-request-id: 625b38f0-aaf3-44b6-924e-2cd52d36d9f0
Content-ID: 1
DataServiceVersion: 3.0
Last-Modified: Wed, 09 Apr 2014 20:21:24 GMT
ETag: 0x8D122486A0901FF
Location: http://myaccount.myregion.batch.azure.com/jobs/job-0000000001/tasks/taskbatch3_00000

--changesetresponse_b0908fd9-f098-44bc-84e0-d1e698d0c2d7--
--batch_a9e0dba6-7d90-4fb6-802b-8ec665814afc
Content-Type: multipart/mixed; boundary=changesetresponse_9619d412-3d34-4cbe-8e20-0c8969e51a81

--changesetresponse_9619d412-3d34-4cbe-8e20-0c8969e51a81
Content-Type: application/http
Content-Transfer-Encoding: binary

HTTP/1.1 201 Created
DataServiceId: http://myaccount.myregion.batch.azure.com/jobs/job-0000000001/tasks/taskbatch3_00001
client-request-id: f7881b79-6fea-4e6a-b5f2-1af06a710cfd
Content-ID: 3
DataServiceVersion: 3.0
Last-Modified: Wed, 09 Apr 2014 20:21:24 GMT
ETag: 0x8D122486A0B1805
Location: http://myaccount.myregion.batch.azure.com/jobs/job-0000000001/tasks/taskbatch3_00001

--changesetresponse_9619d412-3d34-4cbe-8e20-0c8969e51a81--
--batch_a9e0dba6-7d90-4fb6-802b-8ec665814afc
Content-Type: multipart/mixed; boundary=changesetresponse_4f342348-e14f-4141-b1db-eed30c76777a

--changesetresponse_4f342348-e14f-4141-b1db-eed30c76777a
Content-Type: application/http
Content-Transfer-Encoding: binary

HTTP/1.1 409 Conflict
DataServiceId: http://myaccount.myregion.batch.azure.com/jobs/job-0000000001/tasks/taskbatch3_00000
client-request-id: d4bff599-d292-465b-a839-98dabf2d1ffb
Content-ID: 2
DataServiceVersion: 3.0;
Content-Type: application/json;odata=minimalmetadata;streaming=true;charset=utf-8

{
"odata.metadata":"http://myaccount.myregion.batch.azure.com/$metadata#Microsoft.Azure.Batch.Protocol.Entities.Container.errors/@Element",
   "code":"TaskExists",
   "message":{
      "lang":"en-US",
      "value":"The specified task already exists.\nRequestId:918868f8-9869-4847-9ae6-3c0cee46f148\nTime:2014-04-09T20:21:24.8452594Z"
   }
}
--changesetresponse_4f342348-e14f-4141-b1db-eed30c76777a--
--batch_a9e0dba6-7d90-4fb6-802b-8ec665814afc--
```

