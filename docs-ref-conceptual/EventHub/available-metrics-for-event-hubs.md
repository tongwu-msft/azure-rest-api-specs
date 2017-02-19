---
title: "Available metrics for Event Hubs"
ms.custom: ""
ms.date: "2016-11-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 28d84f6b-3e99-4f81-9031-ea924f0f8d5a
caps.latest.revision: 3
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Available metrics for Event Hubs
You can query the following metric data points for Event Hubs.  
  
## Request  
  
|Metric name|Applicable resources|Metric key|Description|  
|-----------------|--------------------------|----------------|-----------------|  
|Size|EventHub|size|Number of bytes the entity occupies, regardless of the number of messages at the end of the selected interval.|  
|Incoming Messages|EventHub, Partition|incoming|Total number of incoming messages in selected interval.|  
|Incoming Throughput|EventHub, Partition|incoming.throughput|Incoming throughput in units of MB per second.|  
|Outgoing Messages|ConsumerGroup, ConsumerGroupOnPartition|outgoing|Total number of incoming messages in selected interval.|  
|Outgoing Throughput|ConsumerGroup, ConsumerGroupOnPartition|outgoing.throughput|Outgoing throughput in units of MB per second.|  
|Total Requests|EventHub, Partition,  ConsumerGroup, ConsumerGroupOnPartition|requests.total|Total number of requests.|  
|Failed Requests|EventHub, Partition,  ConsumerGroup, ConsumerGroupOnPartition|requests.failed|Number of failed requests.|  
|InternalServerErrors|EventHub, Partition,  ConsumerGroup, ConsumerGroupOnPartition|requests.failed.internalservererror|Total number of internal server error exceptions sent back to the sender or receiver while performing run-time operations. This type of error is due to either service-side or network problems.|  
|ServerBusyErrors|EventHub, Partition,  ConsumerGroup, ConsumerGroupOnPartition|requests.failed.serverbusy|Service Bus generates this type of error when it throttles the sender or receiver because there are not enough resources to process the requests.|  
|OtherErrors|EventHub, Partition,  ConsumerGroup, ConsumerGroupOnPartition|requests.failed.other|These types of errors are due to faults at the sender or receiver side, such as providing bad parameters, not enough credentials, or trying to perform an operation on a nonexistent entity.|