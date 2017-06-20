---
ms.assetid: 179c0eec-e204-42ec-868d-e3a2f04173cf
ms.title: Azure HDInsight Spark Remote Job Submission REST API
ms.prod: azure
ms.service: hdinsight
author: nitinme
ms.author: nitinme
ms.manager: jhubbard
service_description: To be added
---


# Azure HDInsight Spark - Remote Job Submission REST API

Use these APIs to submit remote job to HDInsight Spark clusters. All task operations conform to the HTTP/1.1 protocol. Please make sure you are authenticating with the Spark cluster management endpoint using HTTP basic authentication with your Spark administrator credentials. 

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|[Batch job](hdinsight-spark-batch-job.md)| Provides operations to run and manage batch jobs on an HDInsight Spark cluster. |
|[Interactive session](hdinsight-spark-interactive-session.md) | Provides operations to run and manage interactive sessions on an HDInsight Spark cluster. |