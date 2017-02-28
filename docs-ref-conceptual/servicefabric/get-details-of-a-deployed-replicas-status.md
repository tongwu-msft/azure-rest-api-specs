---
title: "Get details of a deployed replica’s status"
ms.custom: ""
ms.date: "2017-02-03"
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
ms.assetid: c6b642bd-ccb2-425d-8e60-d587ea3efdfb
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

# Get details of a deployed replica’s status
Gets detailed information of a Service Fabric replica that belongs to a specified partition and is deployed on a specified node.  
  
## Request  
 See [Common parameters and headers](replica.md#bk_common) for headers and parameters that are used by all requests related to replicas.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/nodes/{node-name}/$/getpartitions/{partition-name}/$/getreplicas/{replica-id}/$/GetDetail?api-version={api-version}`|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
{  
    "ServiceKind": 2,  
    “ServiceName”: “fabric:/WordCountApp/WordCountService  
    "PartitionId": "dd612667-22dc-4168-bc0d-24e1eee03845",  
    "InstanceId": "130741286282693495",  
    "ReplicaId": "130741286282693495",  
    “ReadStatus” : 1,  
    “WriteStatus” : 2,  
    “CurrentServiceOperation”: 2,  
    “CurrentServiceOperationStartTimeUtc”: “130761881766577481”,  
    “CurrentReplicatorOperation” : 1,  
    “ReportedLoad”: [  
        {  
		          “Name”: “Memory”,  
		          “Value”: 1234,  
		          “LastReportedUtc” : “130761881766577481”  
	       },  
	       {  
		          “Name”: “DiskUsage”,  
		          “Value”: 9999,  
		          “LastReportedUtc”: “130761881766577481”  
       	}  
    ],  
    “ReplicatorStatusResult” : {  
        “Kind” : 2,  
	       “IsInBuild” : false,  
	       “ReplicationQueueStatus” : {  
		          “QueueUtilizationPercentage” : 55,  
		          “QueueMemorySize” : 12383,  
		          “FirstSequenceNumber” : 443,  
		          “CompletedSequenceNumber” : 564,  
		          “CommittedSequenceNumber” : 580,  
		          “LastSequenceNumber” : 600  
	       },  
	       “CopyQueueStatus” : {  
		          “QueueUtilizationPercentage” : 5,  
		          “QueueMemorySize” : 123,  
		          “FirstSequenceNumber” : 4,  
		          “CompletedSequenceNumber” : 50,  
		          “CommittedSequenceNumber” : 53,  
		          “LastSequenceNumber” : 56  
	       },  
	       “LastReplicationOperationReceivedTimeUtc” : “130761881766577481”,  
	       “LastCopyOperationReceivedTimeUtc” : “130761881766577481”,  
	       “LastAcknowledgementSentTimeUtc” : “130761881766577481”,  
	       “RemoteReplicators” : [  
	           {  
		              “ReplicaId” : “130741286282693455”,  
		              “IsInBuild” : true,  
		              “LastAcknowledgementProcessedTimeUtc” : “130761881766577487”,  
		              “LastReceivedReplicationSequenceNumber” : 434,  
		              “LastAppliedReplicationSequenceNumber” : 400,  
		              “LastReceivedCopySequenceNumber” : 50,  
		              “LastAppliedCopySequenceNumber” : 30  
	           },  
	           {  
		              “ReplicaId” : “130741286282693405”,  
		              “IsInBuild” : false,  
		              “LastAcknowledgementProcessedTimeUtc” : “130761881766577490”,  
		              “LastReceivedReplicationSequenceNumber” : 470,  
		              “LastAppliedReplicationSequenceNumber” : 450,  
		              “LastReceivedCopySequenceNumber” : -1,  
		              “LastAppliedCopySequenceNumber” : -1  
	           }  
        ]		  
    }  
}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|PartitionId|The partition ID|  
|InstanceId|The instance ID if this is a stateless service instance.|  
|ReplicaId|The replica ID if this is a stateful service partition|  
|ReadStatus|The partition access status for reads.<br /> Possible values are: Invalid – Value is 0 <br />Granted – Value is 1<br /> ReconfigurationPending – Value is 2 <br />NotPrimary – Value is 3 <br />NoWriteQuorum – Value is 4|  
|WriteStatus|The partition access status for writes. <br />Possible values are: Invalid – Value is 0 <br />Granted – Value is 1 <br />ReconfigurationPending – Value is 2 <br />NotPrimary – Value is 3 <br />NoWriteQuorum – Value is 4|  
|CurrentServiceOperation|The current operation (API) the service is running. <br />Possible values are: <br />Invalid – Value is 0 <br />None – Value is 1 <br />Open – Value is 2 <br />ChangeRole – Value is 3 <br />Close – Value is 4 <br />Abort – Value is 5|  
|CurrentServiceOperationStartTimeUtc|The start time (in UTC) of the current service operation indicated by the above enum|  
|CurrentReplicatorOperation|The current operation (API) the replicator is running. <br />Possible values are: <br />Invalid – Value is 0 <br />None – Value is 1 <br />Open – Value is 2 <br />ChangeRole – Value is 3 <br />UpdateEpoch – Value is 4 <br />Close – Value is 5 <br />Abort – Value is 6 <br />OnDataLoss – Value is 7 <br />WaitForCatchup – Value is 8 <br />Build – Value is 9|  
|ReportedLoad|A list of load reports that the service has reported. Content of each report is defined in the below table named – ‘[LoadMetricReportResult](#LoadMetricReportResult)’|  
|ReplicatorStatusResult|The replicator’s detail status as described in the below table named – ‘[ReplicatorStatusResult](#ReplicatorStatusResult)’|  
  
###  <a name="LoadMetricReportResult"></a> LoadMetricReportResult  
  
|Element name|Description|  
|------------------|-----------------|  
|Name|The name of the load metric|  
|Value|Value of the load metric|  
|LastReportedUtc|The Utc time of the last report|  
  
###  <a name="ReplicatorStatusResult"></a> ReplicatorStatusResult  
  
|Element name|Description|  
|------------------|-----------------|  
|Kind|The kind of replicator status with possible values: <br />0 – Unknown <br />1 – None <br />2 – Primary <br />3 – IdleSecondary <br />4 - ActiveSecondary|  
|IsInBuild|A Boolean that indicates if the replicator is currently in build or is active.|  
|LastCopyOperationReceivedTimeUtc|This field is only applicable if the Kind of report is 3 – IdleSecondary. <br />It provides the time in Utc of the last copy operation that was received by the idle from the primary replicator.|  
|LastReplicationOperationReceivedTimeUtc|This field is only applicable if the Kind of report is 3 or 4 – IdleSecondary.or ActiveSecondary. <br />It provides the time in Utc of the last replication operation that was received by the secondary from the primary replicator.|  
|LastAcknowledgementSentTimeUtc|This field is only applicable if the Kind of report is 3 or 4 – IdleSecondary.or ActiveSecondary. <br />It provides the time in Utc of the last acknowledgement message that was sent by the secondary to the primary replicator.|  
|ReplicationQueueStatus|Provides details of the replication queue on the primary or the secondary replicator based on the kind of the report. The detailed status information is described in the table below – ‘[ReplicatorQueueStatus](#ReplicatorQueueStatus)’|  
|CopyQueueStatus|This field is only applicable if the Kind of report is 3 – IdleSecondary. <br />Provides details of the copy queue on the idle secondary replicator. The detailed status information is described in the table below – ‘[ReplicatorQueueStatus](#ReplicatorQueueStatus)’|  
|RemoteReplicators|This field is only applicable if the Kind of report is 2 – Primary <br />This is a list of RemoteReplicatorStatus, which provides details of the primary’s view of the secondary and idle replicators progress information. The detailed information in each entry of the list is described in the table below – ‘[RemoteReplicatorStatus](#RemoteReplicatorStatus)’|  
  
###  <a name="ReplicatorQueueStatus"></a> ReplicatorQueueStatus  
  
|Element name|Description|  
|------------------|-----------------|  
|QueueUtilizationPercentage|Based on the capacity, this represents the utilization of the queue in terms of %age.|  
|QueueMemorySize|Represents the virtual memory usage of the queue in bytes.|  
|FirstSequenceNumber|The logical sequence number (LSN) of the first operation in the queue|  
|CompletedSequenceNumber|The LSN of the completed operation in the queue.  Completed operation indicates the last operation persisted on the disk when the kind of the report is ‘IdleSecondary’ or ‘ActiveSecondary’. <br />Completed operation indicates the lowest LSN of all the remote secondary replicator’s when the kind of report is ‘Primary’|  
|CommmittedSequenceNumber|The LSN of the committed operation in the queue. Committed operation indicates the last in-order operation that is received from the primary when the kind of the report is ‘IdleSecondary’ or ‘ActiveSecondary’. <br />Committed operation indicates the majority quorum LSN of all the remote secondary replicator’s when the kind of report is ‘Primary’|  
|LastSequenceNumber|The latest LSN of the operation in the queue|  
  
###  <a name="RemoteReplicatorStatus"></a> RemoteReplicatorStatus  
  
|Element name|Description|  
|------------------|-----------------|  
|ReplicaId|Replica ID of the remote replicator|  
|IsInBuild|Boolean that indicates if the remote replicator is being built|  
|LastAcknowledgementProcessedTimeUtc|Time in Utc of the last acknowledgement that was processed on the primary from the remote replicator|  
|LastReceivedReplicationSequenceNumber|LSN of the last replication operation that was received by the remote replicator, as per the primary’s knowledge – based on the acknowledgements received.|  
|LastAppliedReplicationSequenceNumber|LSN of the last replication operation that was applied by the remote replicator, as per the primary’s knowledge – based on the acknowledgements received.|  
|LastReceivedCopySequenceNumber|LSN of the last copy operation that was received by the remote replicator, as per the primary’s knowledge – based on the acknowledgements received. <br />The value is -1 if the remote replicator is not in build and has received all copy operations|  
|LastAppliedCopySequenceNumber|LSN of the last copy operation that was applied by the remote replicator, as per the primary’s knowledge – based on the acknowledgements received. <br />The value is -1 if the remote replicator is not in build and has applied all copy operations|  
|RemoteReplicatorAcknowledgementStatus|Returns details regarding the remote replicator’s acknowledgement status for replication and copy operations. Contains ReplicationStreamAcknowledgementDetail and CopyStreamAcknowledgementDetail - ReplicationStreamAcknowledgementDetail contains details regarding replication operations and CopyStreamAcknowledgementDetail contains details regarding copy operations. Both are RemoteReplicatorAcknowledgementDetail objects, described in more detail below.|  
  
### RemoteReplicatorAcknowledgementDetail  
  
|Element name|Description|  
|------------------|-----------------|  
|AverageReceiveDuration|Represents the average duration for the remote replicator to acknowledge that an operation has been received.|  
|AverageApplyDuration|Represents the average duration for the remote replicator to acknowledge that an operation has been applied.|  
|NotReceivedCount|The number of operations not yet received by the remote replicator.|  
|ReceivedAndNotAppliedCount|The number of operations received by the remote replicator that have not yet been applied.|