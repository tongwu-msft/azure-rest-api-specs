---
title: "Get the load of a partition"
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
ms.assetid: 3e468666-f8ac-4dcb-8f6a-eb51880d10d5
caps.latest.revision: 3
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
---
# Get the load of a partition
Gets the load of the specified Service Fabric partition.  
  
## Request  
 See [Partition](partition.md) for headers and parameters that are used by all requests related to partitions.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/Applications/{application-name}/$/GetServices/{service-name}/$/GetPartitions/{partition-id}/$/GetLoadInformation?api-version=1.0`|  
|GET|`<URI>/Services/{service-name}/$/GetPartitions/{partition-id}/$/GetLoadInformation?api-version=1.0`|  
|GET|`<URI>/Partitions/{partition-id}/$/GetLoadInformation?api-version=1.0`|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
{  
	“PartitionId”: ”39820b3f-1645-4bb6-be8c-7b7acabf3fe9”,  
  
 "PrimaryLoadMetricReports": [  
        {  
            "Name": "CPU",  
            "Value": 10,  
            "LastReportedUtc": “130742924296332054”  
        },  
        {  
            "Name": "MEMORY",  
            "Value": 10,  
            "LastReportedUtc": “130742924308298492”  
        },  
],   
"SecondaryLoadMetricReports": [  
        {  
            "Name": "CPU",  
            "Value": 10,  
            "LastReportedUtc": “130742924296332054”  
        },  
        {  
            "Name": "MEMORY",  
            "Value": 10,  
            "LastReportedUtc": “130742924308298492”  
        },  
    	],  
  
    ]  
}  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|PartitionId|GUID that represents the partition ID.|  
|PrimaryloadMetricReports|The list of load reports for primary role of this partition.|  
|Name|The name of the metric.|  
|Value|The value of the load for the metric.|  
|LastReportedUtc|The UTC time when the load is reported.|  
  
## Examples  
 The following example displays the load of the specified partition 5a7e4c31-372c-4daf-ae65-5dafcc8d76e5. The localhost:19007 is the endpoint of the http gateway..  
  
```  
http://localhost:19007/Partitions/5a7e4c31-372c-4daf-ae65-5dafcc8d76e5/$/GetLoadInformation?api-version=1.0  
  
```