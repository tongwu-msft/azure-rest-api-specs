---
title: Apache Kafka REST Proxy Reference - Azure HDInsight
description: Learn how to use these APIs to create and manage Apache Kafka topics on your Kafka clusters running in Azure HDInsight.
ms.date: 12/11/2019
ms.service: hdinsight
author: hrasheed-msft
ms.author: hrasheed
---

# Apache Kafka REST Proxy API

Use these APIs to create and manage Apache Kafka topics on your Kafka clusters running in Azure HDInsight. For more information, see [Apache Kafka REST proxy](/azure/hdinsight/kafka/rest-proxy).  

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|Consumer - Topics| Consume records using a simple consumer |
|Metadata - Brokers| Get a list of Kafka brokers |
|Metadata - Topics| Get a list of Kafka topics |
|Metadata - Topic - Partition| Get metadata about a specific Kafka topic-partition. |
|Metadata - Topics| Get a list of Kafka topics |
|Producer - Topic| Produce records to a topic in Kafka. If producing records to a newly created topic, please wait a few seconds for the topic to show up. |
| Status | Check the status of Kafka Rest proxy server. |
