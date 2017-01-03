---
title: "Available resource paths for Event Hubs"
ms.custom: ""
ms.date: "2016-04-11"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 9cf172b6-975a-4649-9a0f-6ecc40f71e30
caps.latest.revision: 7
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Available resource paths for Event Hubs
You can use the following resource paths to query metrics for Event Hubs.  
  
## Request  
  
|Resource Path|Description|  
|-------------------|-----------------|  
|`namespaces/{servicebusNamespace}/eventhubs/{eventHubPath}`|Metrics for the specified Event Hub.|  
|`namespaces/{servicebusNamespace}/eventhubs/{eventHubPath}/Partitions/{partitionId}`|Metrics for the specified partition of the Event Hub.|  
|`namespaces/{servicebusNamespace}/eventhubs/{eventHubPath}/ConsumerGroups/{consumerGroupId}`|Metrics for the specified consumer group of the Event Hub.|  
|`namespaces/{servicebusNamespace}/eventhubs/{eventHubPath}/ConsumerGroups/{consumerGroupId}/Partitions/{PartitionId}`|Metrics for the specified consumer group on a partition of the Event Hub.|  
  
### Request Headers  
 See [Common parameters and headers](metrics1-1.md#bk_common) for headers and parameters that are used by all requests related to Event Hubs.  
  
## Examples  
 Request: get  supported metrics for the specified Event Hub:  
  
```  
GET https://management.core.windows.net/[your-subscription-id]/services/ServiceBus/Namespaces/[your-namespace]/eventhubs/[your-event-hub]/Metrics?timeout=60&api-version=2014-01 HTTP/1.1  
x-ms-version: 2012-03-01  
Content-Type: application/json  
Host: management.core.windows.net  
  
```  
  
 Request: get  supported rollups for the specified partition’s total requests:  
  
```  
GET https://management.core.windows.net/[your-subscription-id]/services/ServiceBus/Namespaces/[your-namespace]/eventhubs/[your-event-hub]/Partitions/0/Metrics/requests.total/Rollups?timeout=60&api-version=2014-01 HTTP/1.1  
x-ms-version: 2012-03-01  
Content-Type: application/json  
Host: management.core.windows.net  
  
```  
  
 Request: get  total request metric data with 1-day roll up for the specified Event Hub :  
  
```  
GET https://management.core.windows.net/[your-subscription-id]/services/ServiceBus/Namespaces/[your-namespace]/eventhubs/[your-event-hub]/Metrics/requests.total/Rollups/P1D/Values?$filter=Timestamp%20gt%20datetime'2016-02-24T13:05:09.00Z'&timeout=60&api-version=2014-01 HTTP/1.1  
x-ms-version: 2012-03-01  
Content-Type: application/json  
Host: management.core.windows.net  
  
```  
  
 Response:  
  
```  
HTTP/1.1 200 OK  
Cache-Control: no-cache  
Content-Length: 4195  
Content-Type: application/json; charset=utf-8  
Server: 1.0.6198.319 (rd_rdfe_stable.160216-1642) Microsoft-HTTPAPI/2.0  
x-ms-servedbyregion: ussouth3  
Server-SB: Service-Bus-Resource-Provider/SN1  
x-ms-request-id: 9e0661b2c8eb72c6a29d6da47bf6e9e1  
Date: Thu, 25 Feb 2016 01:30:53 GMT  
  
[  
   {  
      "Name":"size",  
      "Unit":"bytes",  
      "PrimaryAggregation":"Max",  
      "Rollups":[  
         {  
            "TimeGrain":"00:05:00",  
            "Retention":"02:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"01:00:00",  
            "Retention":"7.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"1.00:00:00",  
            "Retention":"60.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"7.00:00:00",  
            "Retention":"730.00:00:00",  
            "Values":null  
         }  
      ],  
      "DisplayName":"Size"  
   },  
   {  
      "Name":"incoming",  
      "Unit":"Messages",  
      "PrimaryAggregation":"Total",  
      "Rollups":[  
         {  
            "TimeGrain":"00:05:00",  
            "Retention":"02:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"01:00:00",  
            "Retention":"7.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"1.00:00:00",  
            "Retention":"60.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"7.00:00:00",  
            "Retention":"730.00:00:00",  
            "Values":null  
         }  
      ],  
      "DisplayName":"Incoming Messages"  
   },  
   {  
      "Name":"requests.total",  
      "Unit":"Requests",  
      "PrimaryAggregation":"Total",  
      "Rollups":[  
         {  
            "TimeGrain":"00:05:00",  
            "Retention":"02:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"01:00:00",  
            "Retention":"7.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"1.00:00:00",  
            "Retention":"60.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"7.00:00:00",  
            "Retention":"730.00:00:00",  
            "Values":null  
         }  
      ],  
      "DisplayName":"Total Requests"  
   },  
   {  
      "Name":"requests.successful",  
      "Unit":"Requests",  
      "PrimaryAggregation":"Total",  
      "Rollups":[  
         {  
            "TimeGrain":"00:05:00",  
            "Retention":"02:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"01:00:00",  
            "Retention":"7.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"1.00:00:00",  
            "Retention":"60.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"7.00:00:00",  
            "Retention":"730.00:00:00",  
            "Values":null  
         }  
      ],  
      "DisplayName":"Successful Requests"  
   },  
   {  
      "Name":"requests.failed",  
      "Unit":"Requests",  
      "PrimaryAggregation":"Total",  
      "Rollups":[  
         {  
            "TimeGrain":"00:05:00",  
            "Retention":"02:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"01:00:00",  
            "Retention":"7.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"1.00:00:00",  
            "Retention":"60.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"7.00:00:00",  
            "Retention":"730.00:00:00",  
            "Values":null  
         }  
      ],  
      "DisplayName":"Failed requests"  
   },  
   {  
      "Name":"requests.failed.internalservererror",  
      "Unit":"Requests",  
      "PrimaryAggregation":"Total",  
      "Rollups":[  
         {  
            "TimeGrain":"00:05:00",  
            "Retention":"02:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"01:00:00",  
            "Retention":"7.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"1.00:00:00",  
            "Retention":"60.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"7.00:00:00",  
            "Retention":"730.00:00:00",  
            "Values":null  
         }  
      ],  
      "DisplayName":"Internal Server Errors"  
   },  
   {  
      "Name":"requests.failed.serverbusy",  
      "Unit":"Requests",  
      "PrimaryAggregation":"Total",  
      "Rollups":[  
         {  
            "TimeGrain":"00:05:00",  
            "Retention":"02:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"01:00:00",  
            "Retention":"7.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"1.00:00:00",  
            "Retention":"60.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"7.00:00:00",  
            "Retention":"730.00:00:00",  
            "Values":null  
         }  
      ],  
      "DisplayName":"Server Busy Errors"  
   },  
   {  
      "Name":"requests.failed.other",  
      "Unit":"Requests",  
      "PrimaryAggregation":"Total",  
      "Rollups":[  
         {  
            "TimeGrain":"00:05:00",  
            "Retention":"02:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"01:00:00",  
            "Retention":"7.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"1.00:00:00",  
            "Retention":"60.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"7.00:00:00",  
            "Retention":"730.00:00:00",  
            "Values":null  
         }  
      ],  
      "DisplayName":"Other Errors"  
   },  
   {  
      "Name":"outgoing",  
      "Unit":"Messages",  
      "PrimaryAggregation":"Total",  
      "Rollups":[  
         {  
            "TimeGrain":"00:05:00",  
            "Retention":"02:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"01:00:00",  
            "Retention":"7.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"1.00:00:00",  
            "Retention":"60.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"7.00:00:00",  
            "Retention":"730.00:00:00",  
            "Values":null  
         }  
      ],  
      "DisplayName":"Outgoing Messages"  
   },  
   {  
      "Name":"incoming.throughput",  
      "Unit":"bytes",  
      "PrimaryAggregation":"Total",  
      "Rollups":[  
         {  
            "TimeGrain":"00:05:00",  
            "Retention":"02:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"01:00:00",  
            "Retention":"7.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"1.00:00:00",  
            "Retention":"60.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"7.00:00:00",  
            "Retention":"730.00:00:00",  
            "Values":null  
         }  
      ],  
      "DisplayName":"incoming.throughput"  
   },  
   {  
      "Name":"outgoing.throughput",  
      "Unit":"bytes",  
      "PrimaryAggregation":"Average",  
      "Rollups":[  
         {  
            "TimeGrain":"00:05:00",  
            "Retention":"02:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"01:00:00",  
            "Retention":"7.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"1.00:00:00",  
            "Retention":"60.00:00:00",  
            "Values":null  
         },  
         {  
            "TimeGrain":"7.00:00:00",  
            "Retention":"730.00:00:00",  
            "Values":null  
         }  
      ],  
      "DisplayName":"outgoing.throughput"  
   }  
]  
  
```