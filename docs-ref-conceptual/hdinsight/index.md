---
ms.assetid: 37b1c530-8ef4-49d5-8dd2-48220e980d3e
ms.title: Azure HDInsight REST API Reference
title: Azure HDInsight REST API Reference
ms.service: hdinsight
description: Azure HDInsight REST API reference
author: guyhay
ms.author: guyhay
ms.date: 10/29/2021
ms.topic: reference
MS.devlang: rest-api
---

# Azure HDInsight: REST APIs

[Azure HDInsight](/Azure/HDInsight/hdinsight-overview) is a managed, full-spectrum, open-source analytics service in the cloud for enterprises. You can use open-source frameworks such as Hadoop, Apache Spark, Apache Hive, LLAP, Apache Kafka, Apache Storm, R, and more.  You can use these open-source frameworks to enable a broad range of scenarios such as extract, transform, and load (ETL), data warehousing, machine learning, and IoT.  

## API querying overview

Use these APIs to create and manage HDInsight resources through Azure Resource Manager. To perform operations on Azure HDInsight resources, you send HTTPS request with a supported method: `GET`, `POST`, `PUT`, or `DELETE` to an endpoint that targets a specific resource.  All task operations conform to the HTTP/1.1 protocol specification and each operation returns an `x-ms-request-id` header that can be used to obtain information about the request. Ensure that requests made to these resources are secure. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx).  

## Common parameters and headers

 The following information is common to all tasks related to clusters that you might do:  
  
* Replace {api-version} with `2021-06-01`
  
* Replace {subscription-id} with your subscription identifier in the URI.  
  
* Replace {resource-group-name} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](https://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).  
  
* Replace {cluster-name} with your HDInsight cluster name in the URI.  
  
* Set the Content-Type header to **application/json**.  
  
* Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx).

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|[Application](hdinsight-application.md)| Provides operations to create, remove, and retrieve HDInsight clusters with applications. |
|[Cluster](hdinsight-cluster.md) | Provides operations to work with HDInsight clusters. |  

## Supported REST API versions

The following table lists the supported REST API versions by the Azure HDInsight service. The version must be specified via the `x-ms-version` header in every request. If not specified, the service defaults to the latest version `2021-06-01`.

|Version|Change introduced|Retirement date|  
|-------------|---------------------|-----------------------|
|`2015-03-01-preview` || 2024-10-15 planned retirement
|`2018-06-01-preview` || 2024-10-15 planned retirement
|`2021-06-01`| New version, adding support for several new features detailed below

## Updates in the new 2021-06-01 API version

We have released a new version of the HDInsight REST API `2021-06-01`.  This new version replaces `2018-06-01-preview` version which will retire on 2024-10-15.  This new API version adds several new features including availability zones, private link, and private end-point connections.  With the latest `2021-06-01` API, please note the following new features and changes.

1. Adding support for creating clusters with availability zones.  
    1. Please see [Creating clusters with availability zones](https://github.com/Azure/azure-sdk-for-net/blob/3b68cb85f4ea3da303cb766e14b80afef3203ec1/sdk/hdinsight/Microsoft.Azure.Management.HDInsight/tests/ScenarioTests/ClusterOperationTests.cs#L779) and for a Rest example [Rest - Create cluster with availability zones](https://docs.microsoft.com/rest/api/hdinsight/2021-06-01/clusters/create#create-cluster-with-availability-zones)
1. Adding support for creating clusters with private link.  
    1. Please see [Creating clusters with private link](https://github.com/Azure/azure-sdk-for-net/blob/3b68cb85f4ea3da303cb766e14b80afef3203ec1/sdk/hdinsight/Microsoft.Azure.Management.HDInsight/tests/ScenarioTests/ClusterOperationTests.cs#L883)
1. Support getting private link resources of HDInsight clusters.  
    1. Please see [Private link resources](https://github.com/Azure/azure-sdk-for-net/blob/3b68cb85f4ea3da303cb766e14b80afef3203ec1/sdk/hdinsight/Microsoft.Azure.Management.HDInsight/tests/ScenarioTests/PrivateLinkResourceTests.cs#L38)
1. Support get/approve/reject/delete private endpoint connections.  
    1. Please see [Private endpoint connections](https://github.com/Azure/azure-sdk-for-net/blob/3b68cb85f4ea3da303cb766e14b80afef3203ec1/sdk/hdinsight/Microsoft.Azure.Management.HDInsight/tests/ScenarioTests/PrivateEndpointConnectionTests.cs#L16) and for a Rest example [Rest - Private Endpoint Connections - Create Or Update](https://docs.microsoft.com/rest/api/hdinsight/2021-06-01/private-endpoint-connections/create-or-update)
1. One property {location}, previously optional, will be required.
1. Two existing properties will be removed from the Locations API, {vmsizes} and {vmsize_filters}.  These properties remain in another part of the api, BillingSpecs.  We are moving to a single source (BillingSpecs) for these two properties.
1. Two existing properties will be renamed, to match camelCase style.
   1. {cores_used} will be renamed to {coresUsed}
   1. {max_cores_allowed} will be renamed to {maxCoresAllowed}
   1. {regionName} has been renamed to {regionName}

## See also

* [Azure HDInsight](/Azure/HDInsight/hdinsight-overview)

* [Create clusters using the REST API](/azure/hdinsight/hdinsight-hadoop-create-linux-clusters-curl-rest)

* [Manage HDInsight clusters using the Apache Ambari REST API](/azure/hdinsight/hdinsight-hadoop-manage-ambari-rest-api)

* [Azure HDInsight Spark - remote job submission REST API](/rest/api/hdinsightspark/)

* [Interact with HDInsight Kafka clusters in Azure HDInsight using a REST proxy](/azure/hdinsight/kafka/rest-proxy)
