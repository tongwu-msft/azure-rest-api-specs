---
title: "ServiceFabricClientAPIs"
description: "ServiceFabricClientAPIs"
ms.date: "04/02/2021"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows Server 2012 R2"
  - "Windows Server 2016"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
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


# Service Fabric Client REST API Reference

[Service Fabric](https://aka.ms/ServiceFabric) is a distributed systems platform that makes it easy to package, deploy, and manage scalable and reliable microservices. 

Service Fabric Client APIs allow deploying and managing microservices based applications and containers in a Service Fabric cluster on Azure, on-premise, on local development machine or in other cloud. This document provides a reference for these APIs.


> [!IMPORTANT]
>  These APIs work with Service Fabric clusters running runtime version 8.0.0.46 and above.
>

## Versioning
The REST APIs are versioned using the api-version query parameter in the URI.
All the REST APIs will always support api-version=MajorVersion.MinorVersion where the Major and Minor version number correspond to the version of the Service Fabric cluster runtime being targeted. 
For instance, while sending requests to a 6.0 cluster, api-version=6.0 is always guaranteed to work, with the latest contract supported by the REST API.
However, requests with api-version=6.0 will fail against a 5.5 cluster.
To maintain backward compatibility, the cluster will always support any previously supported api-version. So requests with api-version=1.0 or 2.0 or 3.0 will succeed against a 6.0 cluster. The response output will depend on the contract specified for the specific api-version.



## Protocol
All task operations conform to the HTTP/1.1 protocol specification. All task operations return standard HTTP status codes and may also return additional [Status and Error Codes](sfclient-v80-status-and-error-codes.md) in the response body. See [Service Fabric Names and JSON Serialization](sfclient-v80-service-fabric-names-and-json-serialization.md) for special considerations when serializing and de-serializing names and identities of various entities such as nodes, applications, services, partitions, and replicas in the Service Fabric cluster, to and from request and response. It is recommended that you secure request and responses. For more information, see [Authenticating Service Fabric REST Requests](sfclient-v80-authenticating-service-fabric-rest-requests.md). 


## Connection
 To connect to the local development cluster, you must use the correct URI with the correct client connection port, identified by {connection-port} in the URIs listed below. The client connection port is specified by HttpGatewayEndpoint in the cluster manifest file.  
  
 Though the examples show http, both http and https protocols are supported by Service Fabric. The protocol is specified by HttpGatewayEndpoint in the cluster manifest file.  
  
 To connect to the local development cluster, use the following URI:  
  
```  
http://localhost:{connection-port}  
```  
  
 To connect to a cluster by fully qualified domain name, use a URI similar to the following URI.  
  
```  
http://MyCluster.cloudapp.net:{connection-port}  
```  
  
 To connect to a cluster by IP address, use a URI similar to the following URI.  
  
```  
http://65.52.117.43:{connection-port}  

```  


## Preview Features
### Service Fabric Resource Model
[Service Fabric Resource Model](/azure/service-fabric-mesh/service-fabric-mesh-service-fabric-resources) describes a simple approach to define resources that comprise a [Service Fabric Mesh](https://aka.ms/sfmesh) application.

Following is a list of Service Fabric Client APIs that allows deploying and managing [Service Fabric Mesh](https://aka.ms/sfmesh) applications in a Service Fabric cluster.

* [Service Fabric Secret Resource APIs](#meshsecrets-apis)
    - [Secret Value APIs](#meshsecretvalues-apis)
* [Service Fabric Volume Resource APIs](#meshvolumes-apis)
* [Service Fabric Network Resource APIs](#meshnetworks-apis)
* [Service Fabric Application Resource APIs](#meshapplications-apis)
    - [Service APIs](#meshservices-apis)
    - [Service Replica APIs](#meshservicereplicas-apis)
    - [Code Package APIs](#meshcodepackages-apis)
* [Service Fabric Gateway Resource APIs](#meshgateways-apis)

## Client API Reference
Following is a list of Service Fabric Client REST APIs.


----
## [Cluster APIs](sfclient-v80-index-cluster.md)

| Name | Description |
| --- | --- |
| [Get Cluster Manifest](sfclient-v80-api-getclustermanifest.md) | Get the Service Fabric cluster manifest.<br/> |
| [Get Cluster Health](sfclient-v80-api-getclusterhealth.md) | Gets the health of a Service Fabric cluster.<br/> |
| [Get Cluster Health Using Policy](sfclient-v80-api-getclusterhealthusingpolicy.md) | Gets the health of a Service Fabric cluster using the specified policy.<br/> |
| [Get Cluster Health Chunk](sfclient-v80-api-getclusterhealthchunk.md) | Gets the health of a Service Fabric cluster using health chunks.<br/> |
| [Get Cluster Health Chunk Using Policy And Advanced Filters](sfclient-v80-api-getclusterhealthchunkusingpolicyandadvancedfilters.md) | Gets the health of a Service Fabric cluster using health chunks.<br/> |
| [Report Cluster Health](sfclient-v80-api-reportclusterhealth.md) | Sends a health report on the Service Fabric cluster.<br/> |
| [Get Provisioned Fabric Code Version Info List](sfclient-v80-api-getprovisionedfabriccodeversioninfolist.md) | Gets a list of fabric code versions that are provisioned in a Service Fabric cluster.<br/> |
| [Get Provisioned Fabric Config Version Info List](sfclient-v80-api-getprovisionedfabricconfigversioninfolist.md) | Gets a list of fabric config versions that are provisioned in a Service Fabric cluster.<br/> |
| [Get Cluster Upgrade Progress](sfclient-v80-api-getclusterupgradeprogress.md) | Gets the progress of the current cluster upgrade.<br/> |
| [Get Cluster Configuration](sfclient-v80-api-getclusterconfiguration.md) | Get the Service Fabric standalone cluster configuration.<br/> |
| [Get Cluster Configuration Upgrade Status](sfclient-v80-api-getclusterconfigurationupgradestatus.md) | Get the cluster configuration upgrade status of a Service Fabric standalone cluster.<br/> |
| [Get Upgrade Orchestration Service State](sfclient-v80-api-getupgradeorchestrationservicestate.md) | Get the service state of Service Fabric Upgrade Orchestration Service.<br/> |
| [Set Upgrade Orchestration Service State](sfclient-v80-api-setupgradeorchestrationservicestate.md) | Update the service state of Service Fabric Upgrade Orchestration Service.<br/> |
| [Provision Cluster](sfclient-v80-api-provisioncluster.md) | Provision the code or configuration packages of a Service Fabric cluster.<br/> |
| [Unprovision Cluster](sfclient-v80-api-unprovisioncluster.md) | Unprovision the code or configuration packages of a Service Fabric cluster.<br/> |
| [Rollback Cluster Upgrade](sfclient-v80-api-rollbackclusterupgrade.md) | Roll back the upgrade of a Service Fabric cluster.<br/> |
| [Resume Cluster Upgrade](sfclient-v80-api-resumeclusterupgrade.md) | Make the cluster upgrade move on to the next upgrade domain.<br/> |
| [Start Cluster Upgrade](sfclient-v80-api-startclusterupgrade.md) | Start upgrading the code or configuration version of a Service Fabric cluster.<br/> |
| [Start Cluster Configuration Upgrade](sfclient-v80-api-startclusterconfigurationupgrade.md) | Start upgrading the configuration of a Service Fabric standalone cluster.<br/> |
| [Update Cluster Upgrade](sfclient-v80-api-updateclusterupgrade.md) | Update the upgrade parameters of a Service Fabric cluster upgrade.<br/> |
| [Get Aad Metadata](sfclient-v80-api-getaadmetadata.md) | Gets the Azure Active Directory metadata used for secured connection to cluster.<br/> |
| [Get Cluster Version](sfclient-v80-api-getclusterversion.md) | Get the current Service Fabric cluster version.<br/> |
| [Get Cluster Load](sfclient-v80-api-getclusterload.md) | Gets the load of a Service Fabric cluster.<br/> |
| [Toggle Verbose Service Placement Health Reporting](sfclient-v80-api-toggleverboseserviceplacementhealthreporting.md) | Changes the verbosity of service placement health reporting.<br/> |

----
## [Node APIs](sfclient-v80-index-node.md)

| Name | Description |
| --- | --- |
| [Get Node Info List](sfclient-v80-api-getnodeinfolist.md) | Gets the list of nodes in the Service Fabric cluster.<br/> |
| [Get Node Info](sfclient-v80-api-getnodeinfo.md) | Gets the information about a specific node in the Service Fabric cluster.<br/> |
| [Get Node Health](sfclient-v80-api-getnodehealth.md) | Gets the health of a Service Fabric node.<br/> |
| [Get Node Health Using Policy](sfclient-v80-api-getnodehealthusingpolicy.md) | Gets the health of a Service Fabric node, by using the specified health policy.<br/> |
| [Report Node Health](sfclient-v80-api-reportnodehealth.md) | Sends a health report on the Service Fabric node.<br/> |
| [Get Node Load Info](sfclient-v80-api-getnodeloadinfo.md) | Gets the load information of a Service Fabric node.<br/> |
| [Disable Node](sfclient-v80-api-disablenode.md) | Deactivate a Service Fabric cluster node with the specified deactivation intent.<br/> |
| [Enable Node](sfclient-v80-api-enablenode.md) | Activate a Service Fabric cluster node that is currently deactivated.<br/> |
| [Remove Node State](sfclient-v80-api-removenodestate.md) | Notifies Service Fabric that the persisted state on a node has been permanently removed or lost.<br/> |
| [Restart Node](sfclient-v80-api-restartnode.md) | Restarts a Service Fabric cluster node.<br/> |
| [Remove Configuration Overrides](sfclient-v80-api-removeconfigurationoverrides.md) | Removes configuration overrides on the specified node.<br/> |
| [Get Configuration Overrides](sfclient-v80-api-getconfigurationoverrides.md) | Gets the list of configuration overrides on the specified node.<br/> |
| [Add Configuration Parameter Overrides](sfclient-v80-api-addconfigurationparameteroverrides.md) | Adds the list of configuration overrides on the specified node.<br/> |
| [Remove Node Tags](sfclient-v80-api-removenodetags.md) | Removes the list of tags from the specified node.<br/> |
| [Add Node Tags](sfclient-v80-api-addnodetags.md) | Adds the list of tags on the specified node.<br/> |

----
## [ApplicationType APIs](sfclient-v80-index-applicationtype.md)

| Name | Description |
| --- | --- |
| [Get Application Type Info List](sfclient-v80-api-getapplicationtypeinfolist.md) | Gets the list of application types in the Service Fabric cluster.<br/> |
| [Get Application Type Info List By Name](sfclient-v80-api-getapplicationtypeinfolistbyname.md) | Gets the list of application types in the Service Fabric cluster matching exactly the specified name.<br/> |
| [Provision Application Type](sfclient-v80-api-provisionapplicationtype.md) | Provisions or registers a Service Fabric application type with the cluster using the '.sfpkg' package in the external store or using the application package in the image store.<br/> |
| [Unprovision Application Type](sfclient-v80-api-unprovisionapplicationtype.md) | Removes or unregisters a Service Fabric application type from the cluster.<br/> |
| [Get Application Manifest](sfclient-v80-api-getapplicationmanifest.md) | Gets the manifest describing an application type.<br/> |

----
## [ServiceType APIs](sfclient-v80-index-servicetype.md)

| Name | Description |
| --- | --- |
| [Get Service Type Info List](sfclient-v80-api-getservicetypeinfolist.md) | Gets the list containing the information about service types that are supported by a provisioned application type in a Service Fabric cluster.<br/> |
| [Get Service Type Info By Name](sfclient-v80-api-getservicetypeinfobyname.md) | Gets the information about a specific service type that is supported by a provisioned application type in a Service Fabric cluster.<br/> |
| [Get Service Manifest](sfclient-v80-api-getservicemanifest.md) | Gets the manifest describing a service type.<br/> |
| [Get Deployed Service Type Info List](sfclient-v80-api-getdeployedservicetypeinfolist.md) | Gets the list containing the information about service types from the applications deployed on a node in a Service Fabric cluster.<br/> |
| [Get Deployed Service Type Info By Name](sfclient-v80-api-getdeployedservicetypeinfobyname.md) | Gets the information about a specified service type of the application deployed on a node in a Service Fabric cluster.<br/> |

----
## [Application APIs](sfclient-v80-index-application.md)

| Name | Description |
| --- | --- |
| [Create Application](sfclient-v80-api-createapplication.md) | Creates a Service Fabric application.<br/> |
| [Delete Application](sfclient-v80-api-deleteapplication.md) | Deletes an existing Service Fabric application.<br/> |
| [Get Application Load Info](sfclient-v80-api-getapplicationloadinfo.md) | Gets load information about a Service Fabric application.<br/> |
| [Get Application Info List](sfclient-v80-api-getapplicationinfolist.md) | Gets the list of applications created in the Service Fabric cluster that match the specified filters.<br/> |
| [Get Application Info](sfclient-v80-api-getapplicationinfo.md) | Gets information about a Service Fabric application.<br/> |
| [Get Application Health](sfclient-v80-api-getapplicationhealth.md) | Gets the health of the service fabric application.<br/> |
| [Get Application Health Using Policy](sfclient-v80-api-getapplicationhealthusingpolicy.md) | Gets the health of a Service Fabric application using the specified policy.<br/> |
| [Report Application Health](sfclient-v80-api-reportapplicationhealth.md) | Sends a health report on the Service Fabric application.<br/> |
| [Start Application Upgrade](sfclient-v80-api-startapplicationupgrade.md) | Starts upgrading an application in the Service Fabric cluster.<br/> |
| [Get Application Upgrade](sfclient-v80-api-getapplicationupgrade.md) | Gets details for the latest upgrade performed on this application.<br/> |
| [Update Application Upgrade](sfclient-v80-api-updateapplicationupgrade.md) | Updates an ongoing application upgrade in the Service Fabric cluster.<br/> |
| [Resume Application Upgrade](sfclient-v80-api-resumeapplicationupgrade.md) | Resumes upgrading an application in the Service Fabric cluster.<br/> |
| [Rollback Application Upgrade](sfclient-v80-api-rollbackapplicationupgrade.md) | Starts rolling back the currently on-going upgrade of an application in the Service Fabric cluster.<br/> |
| [Get Deployed Application Info List](sfclient-v80-api-getdeployedapplicationinfolist.md) | Gets the list of applications deployed on a Service Fabric node.<br/> |
| [Get Deployed Application Info](sfclient-v80-api-getdeployedapplicationinfo.md) | Gets the information about an application deployed on a Service Fabric node.<br/> |
| [Get Deployed Application Health](sfclient-v80-api-getdeployedapplicationhealth.md) | Gets the information about health of an application deployed on a Service Fabric node.<br/> |
| [Get Deployed Application Health Using Policy](sfclient-v80-api-getdeployedapplicationhealthusingpolicy.md) | Gets the information about health of an application deployed on a Service Fabric node. using the specified policy.<br/> |
| [Report Deployed Application Health](sfclient-v80-api-reportdeployedapplicationhealth.md) | Sends a health report on the Service Fabric application deployed on a Service Fabric node.<br/> |

----
## [Service APIs](sfclient-v80-index-service.md)

| Name | Description |
| --- | --- |
| [Get Service Info List](sfclient-v80-api-getserviceinfolist.md) | Gets the information about all services belonging to the application specified by the application ID.<br/> |
| [Get Service Info](sfclient-v80-api-getserviceinfo.md) | Gets the information about the specific service belonging to the Service Fabric application.<br/> |
| [Get Application Name Info](sfclient-v80-api-getapplicationnameinfo.md) | Gets the name of the Service Fabric application for a service.<br/> |
| [Create Service](sfclient-v80-api-createservice.md) | Creates the specified Service Fabric service.<br/> |
| [Create Service From Template](sfclient-v80-api-createservicefromtemplate.md) | Creates a Service Fabric service from the service template.<br/> |
| [Delete Service](sfclient-v80-api-deleteservice.md) | Deletes an existing Service Fabric service.<br/> |
| [Update Service](sfclient-v80-api-updateservice.md) | Updates a Service Fabric service using the specified update description.<br/> |
| [Get Service Description](sfclient-v80-api-getservicedescription.md) | Gets the description of an existing Service Fabric service.<br/> |
| [Get Service Health](sfclient-v80-api-getservicehealth.md) | Gets the health of the specified Service Fabric service.<br/> |
| [Get Service Health Using Policy](sfclient-v80-api-getservicehealthusingpolicy.md) | Gets the health of the specified Service Fabric service, by using the specified health policy.<br/> |
| [Report Service Health](sfclient-v80-api-reportservicehealth.md) | Sends a health report on the Service Fabric service.<br/> |
| [Resolve Service](sfclient-v80-api-resolveservice.md) | Resolve a Service Fabric partition.<br/> |
| [Get Unplaced Replica Information](sfclient-v80-api-getunplacedreplicainformation.md) | Gets the information about unplaced replica of the service.<br/> |

----
## [Partition APIs](sfclient-v80-index-partition.md)

| Name | Description |
| --- | --- |
| [Get Loaded Partition Info List](sfclient-v80-api-getloadedpartitioninfolist.md) | Gets ordered list of partitions.<br/> |
| [Get Partition Info List](sfclient-v80-api-getpartitioninfolist.md) | Gets the list of partitions of a Service Fabric service.<br/> |
| [Get Partition Info](sfclient-v80-api-getpartitioninfo.md) | Gets the information about a Service Fabric partition.<br/> |
| [Get Service Name Info](sfclient-v80-api-getservicenameinfo.md) | Gets the name of the Service Fabric service for a partition.<br/> |
| [Get Partition Health](sfclient-v80-api-getpartitionhealth.md) | Gets the health of the specified Service Fabric partition.<br/> |
| [Get Partition Health Using Policy](sfclient-v80-api-getpartitionhealthusingpolicy.md) | Gets the health of the specified Service Fabric partition, by using the specified health policy.<br/> |
| [Report Partition Health](sfclient-v80-api-reportpartitionhealth.md) | Sends a health report on the Service Fabric partition.<br/> |
| [Get Partition Load Information](sfclient-v80-api-getpartitionloadinformation.md) | Gets the load information of the specified Service Fabric partition.<br/> |
| [Reset Partition Load](sfclient-v80-api-resetpartitionload.md) | Resets the current load of a Service Fabric partition.<br/> |
| [Recover Partition](sfclient-v80-api-recoverpartition.md) | Indicates to the Service Fabric cluster that it should attempt to recover a specific partition that is currently stuck in quorum loss.<br/> |
| [Recover Service Partitions](sfclient-v80-api-recoverservicepartitions.md) | Indicates to the Service Fabric cluster that it should attempt to recover the specified service that is currently stuck in quorum loss.<br/> |
| [Recover System Partitions](sfclient-v80-api-recoversystempartitions.md) | Indicates to the Service Fabric cluster that it should attempt to recover the system services that are currently stuck in quorum loss.<br/> |
| [Recover All Partitions](sfclient-v80-api-recoverallpartitions.md) | Indicates to the Service Fabric cluster that it should attempt to recover any services (including system services) which are currently stuck in quorum loss.<br/> |
| [Move Primary Replica](sfclient-v80-api-moveprimaryreplica.md) | Moves the primary replica of a partition of a stateful service.<br/> |
| [Move Secondary Replica](sfclient-v80-api-movesecondaryreplica.md) | Moves the secondary replica of a partition of a stateful service.<br/> |
| [Update Partition Load](sfclient-v80-api-updatepartitionload.md) | Update the loads of provided partitions for specific metrics.<br/> |
| [Move Instance](sfclient-v80-api-moveinstance.md) | Moves the instance of a partition of a stateless service.<br/> |

----
## [RepairManagement APIs](sfclient-v80-index-repairmanagement.md)

| Name | Description |
| --- | --- |
| [Create Repair Task](sfclient-v80-api-createrepairtask.md) | Creates a new repair task.<br/> |
| [Cancel Repair Task](sfclient-v80-api-cancelrepairtask.md) | Requests the cancellation of the given repair task.<br/> |
| [Delete Repair Task](sfclient-v80-api-deleterepairtask.md) | Deletes a completed repair task.<br/> |
| [Get Repair Task List](sfclient-v80-api-getrepairtasklist.md) | Gets a list of repair tasks matching the given filters.<br/> |
| [Force Approve Repair Task](sfclient-v80-api-forceapproverepairtask.md) | Forces the approval of the given repair task.<br/> |
| [Update Repair Task Health Policy](sfclient-v80-api-updaterepairtaskhealthpolicy.md) | Updates the health policy of the given repair task.<br/> |
| [Update Repair Execution State](sfclient-v80-api-updaterepairexecutionstate.md) | Updates the execution state of a repair task.<br/> |

----
## [Replica APIs](sfclient-v80-index-replica.md)

| Name | Description |
| --- | --- |
| [Get Replica Info List](sfclient-v80-api-getreplicainfolist.md) | Gets the information about replicas of a Service Fabric service partition.<br/> |
| [Get Replica Info](sfclient-v80-api-getreplicainfo.md) | Gets the information about a replica of a Service Fabric partition.<br/> |
| [Get Replica Health](sfclient-v80-api-getreplicahealth.md) | Gets the health of a Service Fabric stateful service replica or stateless service instance.<br/> |
| [Get Replica Health Using Policy](sfclient-v80-api-getreplicahealthusingpolicy.md) | Gets the health of a Service Fabric stateful service replica or stateless service instance using the specified policy.<br/> |
| [Report Replica Health](sfclient-v80-api-reportreplicahealth.md) | Sends a health report on the Service Fabric replica.<br/> |
| [Get Deployed Service Replica Info List](sfclient-v80-api-getdeployedservicereplicainfolist.md) | Gets the list of replicas deployed on a Service Fabric node.<br/> |
| [Get Deployed Service Replica Detail Info](sfclient-v80-api-getdeployedservicereplicadetailinfo.md) | Gets the details of replica deployed on a Service Fabric node.<br/> |
| [Get Deployed Service Replica Detail Info By Partition Id](sfclient-v80-api-getdeployedservicereplicadetailinfobypartitionid.md) | Gets the details of replica deployed on a Service Fabric node.<br/> |
| [Restart Replica](sfclient-v80-api-restartreplica.md) | Restarts a service replica of a persisted service running on a node.<br/> |
| [Remove Replica](sfclient-v80-api-removereplica.md) | Removes a service replica running on a node.<br/> |

----
## [Service Package APIs](sfclient-v80-index-service-package.md)

| Name | Description |
| --- | --- |
| [Get Deployed Service Package Info List](sfclient-v80-api-getdeployedservicepackageinfolist.md) | Gets the list of service packages deployed on a Service Fabric node.<br/> |
| [Get Deployed Service Package Info List By Name](sfclient-v80-api-getdeployedservicepackageinfolistbyname.md) | Gets the list of service packages deployed on a Service Fabric node matching exactly the specified name.<br/> |
| [Get Deployed Service Package Health](sfclient-v80-api-getdeployedservicepackagehealth.md) | Gets the information about health of a service package for a specific application deployed for a Service Fabric node and application.<br/> |
| [Get Deployed Service Package Health Using Policy](sfclient-v80-api-getdeployedservicepackagehealthusingpolicy.md) | Gets the information about health of service package for a specific application deployed on a Service Fabric node using the specified policy.<br/> |
| [Report Deployed Service Package Health](sfclient-v80-api-reportdeployedservicepackagehealth.md) | Sends a health report on the Service Fabric deployed service package.<br/> |
| [Deploy Service Package To Node](sfclient-v80-api-deployservicepackagetonode.md) | Downloads all of the code packages associated with specified service manifest on the specified node.<br/> |

----
## [Code Package APIs](sfclient-v80-index-code-package.md)

| Name | Description |
| --- | --- |
| [Get Deployed Code Package Info List](sfclient-v80-api-getdeployedcodepackageinfolist.md) | Gets the list of code packages deployed on a Service Fabric node.<br/> |
| [Restart Deployed Code Package](sfclient-v80-api-restartdeployedcodepackage.md) | Restarts a code package deployed on a Service Fabric node in a cluster.<br/> |
| [Get Container Logs Deployed On Node](sfclient-v80-api-getcontainerlogsdeployedonnode.md) | Gets the container logs for container deployed on a Service Fabric node.<br/> |
| [Invoke Container Api](sfclient-v80-api-invokecontainerapi.md) | Invoke container API on a container deployed on a Service Fabric node.<br/> |

----
## [Compose Deployment APIs](sfclient-v80-index-compose-deployment.md)

| Name | Description |
| --- | --- |
| [Create Compose Deployment](sfclient-v80-api-createcomposedeployment.md) | Creates a Service Fabric compose deployment.<br/> |
| [Get Compose Deployment Status](sfclient-v80-api-getcomposedeploymentstatus.md) | Gets information about a Service Fabric compose deployment.<br/> |
| [Get Compose Deployment Status List](sfclient-v80-api-getcomposedeploymentstatuslist.md) | Gets the list of compose deployments created in the Service Fabric cluster.<br/> |
| [Get Compose Deployment Upgrade Progress](sfclient-v80-api-getcomposedeploymentupgradeprogress.md) | Gets details for the latest upgrade performed on this Service Fabric compose deployment.<br/> |
| [Remove Compose Deployment](sfclient-v80-api-removecomposedeployment.md) | Deletes an existing Service Fabric compose deployment from cluster.<br/> |
| [Start Compose Deployment Upgrade](sfclient-v80-api-startcomposedeploymentupgrade.md) | Starts upgrading a compose deployment in the Service Fabric cluster.<br/> |
| [Start Rollback Compose Deployment Upgrade](sfclient-v80-api-startrollbackcomposedeploymentupgrade.md) | Starts rolling back a compose deployment upgrade in the Service Fabric cluster.<br/> |

----
## [Chaos APIs](sfclient-v80-index-chaos.md)

| Name | Description |
| --- | --- |
| [Get Chaos](sfclient-v80-api-getchaos.md) | Get the status of Chaos.<br/> |
| [Start Chaos](sfclient-v80-api-startchaos.md) | Starts Chaos in the cluster.<br/> |
| [Stop Chaos](sfclient-v80-api-stopchaos.md) | Stops Chaos if it is running in the cluster and put the Chaos Schedule in a stopped state.<br/> |
| [Get Chaos Events](sfclient-v80-api-getchaosevents.md) | Gets the next segment of the Chaos events based on the continuation token or the time range.<br/> |
| [Get Chaos Schedule](sfclient-v80-api-getchaosschedule.md) | Get the Chaos Schedule defining when and how to run Chaos.<br/> |
| [Post Chaos Schedule](sfclient-v80-api-postchaosschedule.md) | Set the schedule used by Chaos.<br/> |

----
## [ImageStore APIs](sfclient-v80-index-imagestore.md)

| Name | Description |
| --- | --- |
| [Upload File](sfclient-v80-api-uploadfile.md) | Uploads contents of the file to the image store.<br/> |
| [Get Image Store Content](sfclient-v80-api-getimagestorecontent.md) | Gets the image store content information.<br/> |
| [Delete Image Store Content](sfclient-v80-api-deleteimagestorecontent.md) | Deletes existing image store content.<br/> |
| [Get Image Store Root Content](sfclient-v80-api-getimagestorerootcontent.md) | Gets the content information at the root of the image store.<br/> |
| [Copy Image Store Content](sfclient-v80-api-copyimagestorecontent.md) | Copies image store content internally<br/> |
| [Delete Image Store Upload Session](sfclient-v80-api-deleteimagestoreuploadsession.md) | Cancels an image store upload session.<br/> |
| [Commit Image Store Upload Session](sfclient-v80-api-commitimagestoreuploadsession.md) | Commit an image store upload session.<br/> |
| [Get Image Store Upload Session By Id](sfclient-v80-api-getimagestoreuploadsessionbyid.md) | Get the image store upload session by ID.<br/> |
| [Get Image Store Upload Session By Path](sfclient-v80-api-getimagestoreuploadsessionbypath.md) | Get the image store upload session by relative path.<br/> |
| [Upload File Chunk](sfclient-v80-api-uploadfilechunk.md) | Uploads a file chunk to the image store relative path.<br/> |
| [Get Image Store Root Folder Size](sfclient-v80-api-getimagestorerootfoldersize.md) | Get the folder size at the root of the image store.<br/> |
| [Get Image Store Folder Size](sfclient-v80-api-getimagestorefoldersize.md) | Get the size of a folder in image store<br/> |
| [Get Image Store Info](sfclient-v80-api-getimagestoreinfo.md) | Gets the overall ImageStore information<br/> |

----
## [Infrastructure APIs](sfclient-v80-index-infrastructure.md)

| Name | Description |
| --- | --- |
| [Invoke Infrastructure Command](sfclient-v80-api-invokeinfrastructurecommand.md) | Invokes an administrative command on the given Infrastructure Service instance.<br/> |
| [Invoke Infrastructure Query](sfclient-v80-api-invokeinfrastructurequery.md) | Invokes a read-only query on the given infrastructure service instance.<br/> |

----
## [Faults APIs](sfclient-v80-index-faults.md)

| Name | Description |
| --- | --- |
| [Start Data Loss](sfclient-v80-api-startdataloss.md) | This API will induce data loss for the specified partition. It will trigger a call to the OnDataLossAsync API of the partition.<br/> |
| [Get Data Loss Progress](sfclient-v80-api-getdatalossprogress.md) | Gets the progress of a partition data loss operation started using the StartDataLoss API.<br/> |
| [Start Quorum Loss](sfclient-v80-api-startquorumloss.md) | Induces quorum loss for a given stateful service partition.<br/> |
| [Get Quorum Loss Progress](sfclient-v80-api-getquorumlossprogress.md) | Gets the progress of a quorum loss operation on a partition started using the StartQuorumLoss API.<br/> |
| [Start Partition Restart](sfclient-v80-api-startpartitionrestart.md) | This API will restart some or all replicas or instances of the specified partition.<br/> |
| [Get Partition Restart Progress](sfclient-v80-api-getpartitionrestartprogress.md) | Gets the progress of a PartitionRestart operation started using StartPartitionRestart.<br/> |
| [Start Node Transition](sfclient-v80-api-startnodetransition.md) | Starts or stops a cluster node.<br/> |
| [Get Node Transition Progress](sfclient-v80-api-getnodetransitionprogress.md) | Gets the progress of an operation started using StartNodeTransition.<br/> |
| [Get Fault Operation List](sfclient-v80-api-getfaultoperationlist.md) | Gets a list of user-induced fault operations filtered by provided input.<br/> |
| [Cancel Operation](sfclient-v80-api-canceloperation.md) | Cancels a user-induced fault operation.<br/> |

----
## [BackupRestore APIs](sfclient-v80-index-backuprestore.md)

| Name | Description |
| --- | --- |
| [Create Backup Policy](sfclient-v80-api-createbackuppolicy.md) | Creates a backup policy.<br/> |
| [Delete Backup Policy](sfclient-v80-api-deletebackuppolicy.md) | Deletes the backup policy.<br/> |
| [Get Backup Policy List](sfclient-v80-api-getbackuppolicylist.md) | Gets all the backup policies configured.<br/> |
| [Get Backup Policy By Name](sfclient-v80-api-getbackuppolicybyname.md) | Gets a particular backup policy by name.<br/> |
| [Get All Entities Backed Up By Policy](sfclient-v80-api-getallentitiesbackedupbypolicy.md) | Gets the list of backup entities that are associated with this policy.<br/> |
| [Update Backup Policy](sfclient-v80-api-updatebackuppolicy.md) | Updates the backup policy.<br/> |
| [Enable Application Backup](sfclient-v80-api-enableapplicationbackup.md) | Enables periodic backup of stateful partitions under this Service Fabric application.<br/> |
| [Disable Application Backup](sfclient-v80-api-disableapplicationbackup.md) | Disables periodic backup of Service Fabric application.<br/> |
| [Get Application Backup Configuration Info](sfclient-v80-api-getapplicationbackupconfigurationinfo.md) | Gets the Service Fabric application backup configuration information.<br/> |
| [Get Application Backup List](sfclient-v80-api-getapplicationbackuplist.md) | Gets the list of backups available for every partition in this application.<br/> |
| [Suspend Application Backup](sfclient-v80-api-suspendapplicationbackup.md) | Suspends periodic backup for the specified Service Fabric application.<br/> |
| [Resume Application Backup](sfclient-v80-api-resumeapplicationbackup.md) | Resumes periodic backup of a Service Fabric application which was previously suspended.<br/> |
| [Enable Service Backup](sfclient-v80-api-enableservicebackup.md) | Enables periodic backup of stateful partitions under this Service Fabric service.<br/> |
| [Disable Service Backup](sfclient-v80-api-disableservicebackup.md) | Disables periodic backup of Service Fabric service which was previously enabled.<br/> |
| [Get Service Backup Configuration Info](sfclient-v80-api-getservicebackupconfigurationinfo.md) | Gets the Service Fabric service backup configuration information.<br/> |
| [Get Service Backup List](sfclient-v80-api-getservicebackuplist.md) | Gets the list of backups available for every partition in this service.<br/> |
| [Suspend Service Backup](sfclient-v80-api-suspendservicebackup.md) | Suspends periodic backup for the specified Service Fabric service.<br/> |
| [Resume Service Backup](sfclient-v80-api-resumeservicebackup.md) | Resumes periodic backup of a Service Fabric service which was previously suspended.<br/> |
| [Enable Partition Backup](sfclient-v80-api-enablepartitionbackup.md) | Enables periodic backup of the stateful persisted partition.<br/> |
| [Disable Partition Backup](sfclient-v80-api-disablepartitionbackup.md) | Disables periodic backup of Service Fabric partition which was previously enabled.<br/> |
| [Get Partition Backup Configuration Info](sfclient-v80-api-getpartitionbackupconfigurationinfo.md) | Gets the partition backup configuration information<br/> |
| [Get Partition Backup List](sfclient-v80-api-getpartitionbackuplist.md) | Gets the list of backups available for the specified partition.<br/> |
| [Suspend Partition Backup](sfclient-v80-api-suspendpartitionbackup.md) | Suspends periodic backup for the specified partition.<br/> |
| [Resume Partition Backup](sfclient-v80-api-resumepartitionbackup.md) | Resumes periodic backup of partition which was previously suspended.<br/> |
| [Backup Partition](sfclient-v80-api-backuppartition.md) | Triggers backup of the partition's state.<br/> |
| [Get Partition Backup Progress](sfclient-v80-api-getpartitionbackupprogress.md) | Gets details for the latest backup triggered for this partition.<br/> |
| [Restore Partition](sfclient-v80-api-restorepartition.md) | Triggers restore of the state of the partition using the specified restore partition description.<br/> |
| [Get Partition Restore Progress](sfclient-v80-api-getpartitionrestoreprogress.md) | Gets details for the latest restore operation triggered for this partition.<br/> |
| [Get Backups From Backup Location](sfclient-v80-api-getbackupsfrombackuplocation.md) | Gets the list of backups available for the specified backed up entity at the specified backup location.<br/> |

----
## [Property Management APIs](sfclient-v80-index-property-management.md)

| Name | Description |
| --- | --- |
| [Create Name](sfclient-v80-api-createname.md) | Creates a Service Fabric name.<br/> |
| [Get Name Exists Info](sfclient-v80-api-getnameexistsinfo.md) | Returns whether the Service Fabric name exists.<br/> |
| [Delete Name](sfclient-v80-api-deletename.md) | Deletes a Service Fabric name.<br/> |
| [Get Sub Name Info List](sfclient-v80-api-getsubnameinfolist.md) | Enumerates all the Service Fabric names under a given name.<br/> |
| [Get Property Info List](sfclient-v80-api-getpropertyinfolist.md) | Gets information on all Service Fabric properties under a given name.<br/> |
| [Put Property](sfclient-v80-api-putproperty.md) | Creates or updates a Service Fabric property.<br/> |
| [Get Property Info](sfclient-v80-api-getpropertyinfo.md) | Gets the specified Service Fabric property.<br/> |
| [Delete Property](sfclient-v80-api-deleteproperty.md) | Deletes the specified Service Fabric property.<br/> |
| [Submit Property Batch](sfclient-v80-api-submitpropertybatch.md) | Submits a property batch.<br/> |

----
## [EventsStore APIs](sfclient-v80-index-eventsstore.md)

| Name | Description |
| --- | --- |
| [Get Cluster Event List](sfclient-v80-api-getclustereventlist.md) | Gets all Cluster-related events.<br/> |
| [Get Containers Event List](sfclient-v80-api-getcontainerseventlist.md) | Gets all Containers-related events.<br/> |
| [Get Node Event List](sfclient-v80-api-getnodeeventlist.md) | Gets a Node-related events.<br/> |
| [Get Nodes Event List](sfclient-v80-api-getnodeseventlist.md) | Gets all Nodes-related Events.<br/> |
| [Get Application Event List](sfclient-v80-api-getapplicationeventlist.md) | Gets an Application-related events.<br/> |
| [Get Applications Event List](sfclient-v80-api-getapplicationseventlist.md) | Gets all Applications-related events.<br/> |
| [Get Service Event List](sfclient-v80-api-getserviceeventlist.md) | Gets a Service-related events.<br/> |
| [Get Services Event List](sfclient-v80-api-getserviceseventlist.md) | Gets all Services-related events.<br/> |
| [Get Partition Event List](sfclient-v80-api-getpartitioneventlist.md) | Gets a Partition-related events.<br/> |
| [Get Partitions Event List](sfclient-v80-api-getpartitionseventlist.md) | Gets all Partitions-related events.<br/> |
| [Get Partition Replica Event List](sfclient-v80-api-getpartitionreplicaeventlist.md) | Gets a Partition Replica-related events.<br/> |
| [Get Partition Replicas Event List](sfclient-v80-api-getpartitionreplicaseventlist.md) | Gets all Replicas-related events for a Partition.<br/> |
| [Get Correlated Event List](sfclient-v80-api-getcorrelatedeventlist.md) | Gets all correlated events for a given event.<br/> |

----
## [MeshSecrets APIs](sfclient-v80-index-meshsecrets.md)

| Name | Description |
| --- | --- |
| [Create Or Update](sfclient-v80-api-meshsecret_createorupdate.md) | Creates or updates a Secret resource.<br/> |
| [Get](sfclient-v80-api-meshsecret_get.md) | Gets the Secret resource with the given name.<br/> |
| [Delete](sfclient-v80-api-meshsecret_delete.md) | Deletes the Secret resource.<br/> |
| [List](sfclient-v80-api-meshsecret_list.md) | Lists all the secret resources.<br/> |

----
## [MeshSecretValues APIs](sfclient-v80-index-meshsecretvalues.md)

| Name | Description |
| --- | --- |
| [Add Value](sfclient-v80-api-meshsecretvalue_addvalue.md) | Adds the specified value as a new version of the specified secret resource.<br/> |
| [Get](sfclient-v80-api-meshsecretvalue_get.md) | Gets the specified secret value resource.<br/> |
| [Delete](sfclient-v80-api-meshsecretvalue_delete.md) | Deletes the specified  value of the named secret resource.<br/> |
| [List](sfclient-v80-api-meshsecretvalue_list.md) | List names of all values of the specified secret resource.<br/> |
| [Show](sfclient-v80-api-meshsecretvalue_show.md) | Lists the specified value of the secret resource.<br/> |

----
## [MeshVolumes APIs](sfclient-v80-index-meshvolumes.md)

| Name | Description |
| --- | --- |
| [Create Or Update](sfclient-v80-api-meshvolume_createorupdate.md) | Creates or updates a Volume resource.<br/> |
| [Get](sfclient-v80-api-meshvolume_get.md) | Gets the Volume resource with the given name.<br/> |
| [Delete](sfclient-v80-api-meshvolume_delete.md) | Deletes the Volume resource.<br/> |
| [List](sfclient-v80-api-meshvolume_list.md) | Lists all the volume resources.<br/> |

----
## [MeshNetworks APIs](sfclient-v80-index-meshnetworks.md)

| Name | Description |
| --- | --- |
| [Create Or Update](sfclient-v80-api-meshnetwork_createorupdate.md) | Creates or updates a Network resource.<br/> |
| [Get](sfclient-v80-api-meshnetwork_get.md) | Gets the Network resource with the given name.<br/> |
| [Delete](sfclient-v80-api-meshnetwork_delete.md) | Deletes the Network resource.<br/> |
| [List](sfclient-v80-api-meshnetwork_list.md) | Lists all the network resources.<br/> |

----
## [MeshApplications APIs](sfclient-v80-index-meshapplications.md)

| Name | Description |
| --- | --- |
| [Create Or Update](sfclient-v80-api-meshapplication_createorupdate.md) | Creates or updates a Application resource.<br/> |
| [Get](sfclient-v80-api-meshapplication_get.md) | Gets the Application resource with the given name.<br/> |
| [Delete](sfclient-v80-api-meshapplication_delete.md) | Deletes the Application resource.<br/> |
| [List](sfclient-v80-api-meshapplication_list.md) | Lists all the application resources.<br/> |
| [Get Upgrade Progress](sfclient-v80-api-meshapplication_getupgradeprogress.md) | Gets the progress of the latest upgrade performed on this application resource.<br/> |

----
## [MeshServices APIs](sfclient-v80-index-meshservices.md)

| Name | Description |
| --- | --- |
| [Get](sfclient-v80-api-meshservice_get.md) | Gets the Service resource with the given name.<br/> |
| [List](sfclient-v80-api-meshservice_list.md) | Lists all the service resources.<br/> |

----
## [MeshCodePackages APIs](sfclient-v80-index-meshcodepackages.md)

| Name | Description |
| --- | --- |
| [Get Container Logs](sfclient-v80-api-meshcodepackage_getcontainerlogs.md) | Gets the logs from the container.<br/> |

----
## [MeshServiceReplicas APIs](sfclient-v80-index-meshservicereplicas.md)

| Name | Description |
| --- | --- |
| [Get](sfclient-v80-api-meshservicereplica_get.md) | Gets the given replica of the service of an application.<br/> |
| [List](sfclient-v80-api-meshservicereplica_list.md) | Lists all the replicas of a service.<br/> |

----
## [MeshGateways APIs](sfclient-v80-index-meshgateways.md)

| Name | Description |
| --- | --- |
| [Create Or Update](sfclient-v80-api-meshgateway_createorupdate.md) | Creates or updates a Gateway resource.<br/> |
| [Get](sfclient-v80-api-meshgateway_get.md) | Gets the Gateway resource with the given name.<br/> |
| [Delete](sfclient-v80-api-meshgateway_delete.md) | Deletes the Gateway resource.<br/> |
| [List](sfclient-v80-api-meshgateway_list.md) | Lists all the gateway resources.<br/> |

----
## [Models](sfclient-v80-index-models.md)

| Name | Description |
| --- | --- |
| [AadMetadata](sfclient-v80-model-aadmetadata.md) | Azure Active Directory metadata used for secured connection to cluster.<br/> |
| [AadMetadataObject](sfclient-v80-model-aadmetadataobject.md) | Azure Active Directory metadata object used for secured connection to cluster.<br/> |
| [AddRemoveIncrementalNamedPartitionScalingMechanism](sfclient-v80-model-addremoveincrementalnamedpartitionscalingmechanism.md) | Represents a scaling mechanism for adding or removing named partitions of a stateless service. Partition names are in the format '0','1''N-1'<br/> |
| [AddRemoveIncrementalNamedPartitionScalingMechanism](sfclient-v80-model-addremoveincrementalnamedpartitionscalingmechanism.md) | Represents a scaling mechanism for adding or removing named partitions of a stateless service. Partition names are in the format '0','1''N-1'<br/> |
| [AddRemoveReplicaScalingMechanism](sfclient-v80-model-addremovereplicascalingmechanism.md) | Describes the horizontal auto scaling mechanism that adds or removes replicas (containers or container groups).<br/> |
| [AddRemoveReplicaScalingMechanism](sfclient-v80-model-addremovereplicascalingmechanism.md) | Describes the horizontal auto scaling mechanism that adds or removes replicas (containers or container groups).<br/> |
| [AnalysisEventMetadata](sfclient-v80-model-analysiseventmetadata.md) | Metadata about an Analysis Event.<br/> |
| [ApplicationBackupConfigurationInfo](sfclient-v80-model-applicationbackupconfigurationinfo.md) | Backup configuration information for a specific Service Fabric application specifying what backup policy is being applied and suspend description, if any.<br/> |
| [ApplicationBackupConfigurationInfo](sfclient-v80-model-applicationbackupconfigurationinfo.md) | Backup configuration information for a specific Service Fabric application specifying what backup policy is being applied and suspend description, if any.<br/> |
| [ApplicationBackupEntity](sfclient-v80-model-applicationbackupentity.md) | Identifies the Service Fabric application which is being backed up.<br/> |
| [ApplicationBackupEntity](sfclient-v80-model-applicationbackupentity.md) | Identifies the Service Fabric application which is being backed up.<br/> |
| [ApplicationCapacityDescription](sfclient-v80-model-applicationcapacitydescription.md) | Describes capacity information for services of this application. This description can be used for describing the following.<br/>- Reserving the capacity for the services on the nodes<br/>- Limiting the total number of nodes that services of this application can run on<br/>- Limiting the custom capacity metrics to limit the total consumption of this metric by the services of this application<br/> |
| [ApplicationContainerInstanceExitedEvent](sfclient-v80-model-applicationcontainerinstanceexitedevent.md) | Container Exited event.<br/> |
| [ApplicationContainerInstanceExitedEvent](sfclient-v80-model-applicationcontainerinstanceexitedevent.md) | Container Exited event.<br/> |
| [ApplicationCreatedEvent](sfclient-v80-model-applicationcreatedevent.md) | Application Created event.<br/> |
| [ApplicationCreatedEvent](sfclient-v80-model-applicationcreatedevent.md) | Application Created event.<br/> |
| [ApplicationDefinitionKind enum](sfclient-v80-model-applicationdefinitionkind.md) | The mechanism used to define a Service Fabric application.<br/> |
| [ApplicationDeletedEvent](sfclient-v80-model-applicationdeletedevent.md) | Application Deleted event.<br/> |
| [ApplicationDeletedEvent](sfclient-v80-model-applicationdeletedevent.md) | Application Deleted event.<br/> |
| [ApplicationDescription](sfclient-v80-model-applicationdescription.md) | Describes a Service Fabric application.<br/> |
| [ApplicationEvent](sfclient-v80-model-applicationevent.md) | Represents the base for all Application Events.<br/> |
| [ApplicationEvent](sfclient-v80-model-applicationevent.md) | Represents the base for all Application Events.<br/> |
| [ApplicationHealth](sfclient-v80-model-applicationhealth.md) | Represents the health of the application. Contains the application aggregated health state and the service and deployed application health states.<br/> |
| [ApplicationHealth](sfclient-v80-model-applicationhealth.md) | Represents the health of the application. Contains the application aggregated health state and the service and deployed application health states.<br/> |
| [ApplicationHealthEvaluation](sfclient-v80-model-applicationhealthevaluation.md) | Represents health evaluation for an application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [ApplicationHealthEvaluation](sfclient-v80-model-applicationhealthevaluation.md) | Represents health evaluation for an application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [ApplicationHealthPolicies](sfclient-v80-model-applicationhealthpolicies.md) | Defines the application health policy map used to evaluate the health of an application or one of its children entities.<br/> |
| [ApplicationHealthPolicy](sfclient-v80-model-applicationhealthpolicy.md) | Defines a health policy used to evaluate the health of an application or one of its children entities.<br/> |
| [ApplicationHealthPolicyMapItem](sfclient-v80-model-applicationhealthpolicymapitem.md) | Defines an item in ApplicationHealthPolicyMap.<br/> |
| [ApplicationHealthPolicyMapObject](sfclient-v80-model-applicationhealthpolicymapobject.md) | Represents the map of application health policies for a ServiceFabric cluster upgrade<br/> |
| [ApplicationHealthReportExpiredEvent](sfclient-v80-model-applicationhealthreportexpiredevent.md) | Application Health Report Expired event.<br/> |
| [ApplicationHealthReportExpiredEvent](sfclient-v80-model-applicationhealthreportexpiredevent.md) | Application Health Report Expired event.<br/> |
| [ApplicationHealthState](sfclient-v80-model-applicationhealthstate.md) | Represents the health state of an application, which contains the application identifier and the aggregated health state.<br/> |
| [ApplicationHealthState](sfclient-v80-model-applicationhealthstate.md) | Represents the health state of an application, which contains the application identifier and the aggregated health state.<br/> |
| [ApplicationHealthStateChunk](sfclient-v80-model-applicationhealthstatechunk.md) | Represents the health state chunk of a application.<br/>The application health state chunk contains the application name, its aggregated health state and any children services and deployed applications that respect the filters in cluster health chunk query description.<br/> |
| [ApplicationHealthStateChunk](sfclient-v80-model-applicationhealthstatechunk.md) | Represents the health state chunk of a application.<br/>The application health state chunk contains the application name, its aggregated health state and any children services and deployed applications that respect the filters in cluster health chunk query description.<br/> |
| [ApplicationHealthStateChunkList](sfclient-v80-model-applicationhealthstatechunklist.md) | The list of application health state chunks in the cluster that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ApplicationHealthStateChunkList](sfclient-v80-model-applicationhealthstatechunklist.md) | The list of application health state chunks in the cluster that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ApplicationHealthStateFilter](sfclient-v80-model-applicationhealthstatefilter.md) | Defines matching criteria to determine whether a application should be included in the cluster health chunk.<br/>One filter can match zero, one or multiple applications, depending on its properties.<br/> |
| [ApplicationInfo](sfclient-v80-model-applicationinfo.md) | Information about a Service Fabric application.<br/> |
| [ApplicationLoadInfo](sfclient-v80-model-applicationloadinfo.md) | Load Information about a Service Fabric application.<br/> |
| [ApplicationLoadMetricInformation](sfclient-v80-model-applicationloadmetricinformation.md) | Describes load information for a custom resource balancing metric. This can be used to limit the total consumption of this metric by the services of this application.<br/> |
| [ApplicationMetricDescription](sfclient-v80-model-applicationmetricdescription.md) | Describes capacity information for a custom resource balancing metric. This can be used to limit the total consumption of this metric by the services of this application.<br/> |
| [ApplicationNameInfo](sfclient-v80-model-applicationnameinfo.md) | Information about the application name.<br/> |
| [ApplicationNewHealthReportEvent](sfclient-v80-model-applicationnewhealthreportevent.md) | Application Health Report Created event.<br/> |
| [ApplicationNewHealthReportEvent](sfclient-v80-model-applicationnewhealthreportevent.md) | Application Health Report Created event.<br/> |
| [ApplicationPackageCleanupPolicy enum](sfclient-v80-model-applicationpackagecleanuppolicy.md) | The kind of action that needs to be taken for cleaning up the application package after successful provision.<br/> |
| [ApplicationParameter](sfclient-v80-model-applicationparameter.md) | Describes an application parameter override to be applied when creating or upgrading an application.<br/> |
| [ApplicationProcessExitedEvent](sfclient-v80-model-applicationprocessexitedevent.md) | Process Exited event.<br/> |
| [ApplicationProcessExitedEvent](sfclient-v80-model-applicationprocessexitedevent.md) | Process Exited event.<br/> |
| [ApplicationProperties](sfclient-v80-model-applicationproperties.md) | Describes properties of a application resource.<br/> |
| [ApplicationResourceDescription](sfclient-v80-model-applicationresourcedescription.md) | This type describes a application resource.<br/> |
| [ApplicationResourceUpgradeProgressInfo](sfclient-v80-model-applicationresourceupgradeprogressinfo.md) | This type describes an application resource upgrade.<br/> |
| [ApplicationResourceUpgradeState enum](sfclient-v80-model-applicationresourceupgradestate.md) | The state of the application resource upgrade.<br/> |
| [ApplicationScopedVolume](sfclient-v80-model-applicationscopedvolume.md) | Describes a volume whose lifetime is scoped to the application's lifetime.<br/> |
| [ApplicationScopedVolume](sfclient-v80-model-applicationscopedvolume.md) | Describes a volume whose lifetime is scoped to the application's lifetime.<br/> |
| [ApplicationScopedVolumeCreationParameters](sfclient-v80-model-applicationscopedvolumecreationparameters.md) | Describes parameters for creating application-scoped volumes.<br/> |
| [ApplicationScopedVolumeCreationParametersServiceFabricVolumeDisk](sfclient-v80-model-applicationscopedvolumecreationparametersservicefabricvolumedisk.md) | Describes parameters for creating application-scoped volumes provided by Service Fabric Volume Disks<br/> |
| [ApplicationScopedVolumeCreationParametersServiceFabricVolumeDisk](sfclient-v80-model-applicationscopedvolumecreationparametersservicefabricvolumedisk.md) | Describes parameters for creating application-scoped volumes provided by Service Fabric Volume Disks<br/> |
| [ApplicationScopedVolumeKind enum](sfclient-v80-model-applicationscopedvolumekind.md) | Specifies the application-scoped volume kind.<br/> |
| [ApplicationsHealthEvaluation](sfclient-v80-model-applicationshealthevaluation.md) | Represents health evaluation for applications, containing health evaluations for each unhealthy application that impacted current aggregated health state.<br/> |
| [ApplicationsHealthEvaluation](sfclient-v80-model-applicationshealthevaluation.md) | Represents health evaluation for applications, containing health evaluations for each unhealthy application that impacted current aggregated health state.<br/> |
| [ApplicationStatus enum](sfclient-v80-model-applicationstatus.md) | The status of the application.<br/> |
| [ApplicationTypeApplicationsHealthEvaluation](sfclient-v80-model-applicationtypeapplicationshealthevaluation.md) | Represents health evaluation for applications of a particular application type. The application type applications evaluation can be returned when cluster health evaluation returns unhealthy aggregated health state, either Error or Warning. It contains health evaluations for each unhealthy application of the included application type that impacted current aggregated health state.<br/> |
| [ApplicationTypeApplicationsHealthEvaluation](sfclient-v80-model-applicationtypeapplicationshealthevaluation.md) | Represents health evaluation for applications of a particular application type. The application type applications evaluation can be returned when cluster health evaluation returns unhealthy aggregated health state, either Error or Warning. It contains health evaluations for each unhealthy application of the included application type that impacted current aggregated health state.<br/> |
| [ApplicationTypeDefinitionKind enum](sfclient-v80-model-applicationtypedefinitionkind.md) | The mechanism used to define a Service Fabric application type.<br/> |
| [ApplicationTypeHealthPolicyMapItem](sfclient-v80-model-applicationtypehealthpolicymapitem.md) | Defines an item in ApplicationTypeHealthPolicyMap.<br/> |
| [ApplicationTypeImageStorePath](sfclient-v80-model-applicationtypeimagestorepath.md) | Path description for the application package in the image store specified during the prior copy operation.<br/> |
| [ApplicationTypeInfo](sfclient-v80-model-applicationtypeinfo.md) | Information about an application type.<br/> |
| [ApplicationTypeManifest](sfclient-v80-model-applicationtypemanifest.md) | Contains the manifest describing an application type registered in a Service Fabric cluster.<br/> |
| [ApplicationTypeStatus enum](sfclient-v80-model-applicationtypestatus.md) | The status of the application type.<br/> |
| [ApplicationUpgradeCompletedEvent](sfclient-v80-model-applicationupgradecompletedevent.md) | Application Upgrade Completed event.<br/> |
| [ApplicationUpgradeCompletedEvent](sfclient-v80-model-applicationupgradecompletedevent.md) | Application Upgrade Completed event.<br/> |
| [ApplicationUpgradeDescription](sfclient-v80-model-applicationupgradedescription.md) | Describes the parameters for an application upgrade. Note that upgrade description replaces the existing application description. This means that if the parameters are not specified, the existing parameters on the applications will be overwritten with the empty parameters list. This would result in the application using the default value of the parameters from the application manifest. If you do not want to change any existing parameter values, please get the application parameters first using the GetApplicationInfo query and then supply those values as Parameters in this ApplicationUpgradeDescription.<br/> |
| [ApplicationUpgradeDomainCompletedEvent](sfclient-v80-model-applicationupgradedomaincompletedevent.md) | Application Upgrade Domain Completed event.<br/> |
| [ApplicationUpgradeDomainCompletedEvent](sfclient-v80-model-applicationupgradedomaincompletedevent.md) | Application Upgrade Domain Completed event.<br/> |
| [ApplicationUpgradeProgressInfo](sfclient-v80-model-applicationupgradeprogressinfo.md) | Describes the parameters for an application upgrade.<br/> |
| [ApplicationUpgradeRollbackCompletedEvent](sfclient-v80-model-applicationupgraderollbackcompletedevent.md) | Application Upgrade Rollback Completed event.<br/> |
| [ApplicationUpgradeRollbackCompletedEvent](sfclient-v80-model-applicationupgraderollbackcompletedevent.md) | Application Upgrade Rollback Completed event.<br/> |
| [ApplicationUpgradeRollbackStartedEvent](sfclient-v80-model-applicationupgraderollbackstartedevent.md) | Application Upgrade Rollback Started event.<br/> |
| [ApplicationUpgradeRollbackStartedEvent](sfclient-v80-model-applicationupgraderollbackstartedevent.md) | Application Upgrade Rollback Started event.<br/> |
| [ApplicationUpgradeStartedEvent](sfclient-v80-model-applicationupgradestartedevent.md) | Application Upgrade Started event.<br/> |
| [ApplicationUpgradeStartedEvent](sfclient-v80-model-applicationupgradestartedevent.md) | Application Upgrade Started event.<br/> |
| [ApplicationUpgradeUpdateDescription](sfclient-v80-model-applicationupgradeupdatedescription.md) | Describes the parameters for updating an ongoing application upgrade.<br/> |
| [AutoScalingMechanism](sfclient-v80-model-autoscalingmechanism.md) | Describes the mechanism for performing auto scaling operation. Derived classes will describe the actual mechanism.<br/> |
| [AutoScalingMechanismKind enum](sfclient-v80-model-autoscalingmechanismkind.md) | Enumerates the mechanisms for auto scaling.<br/> |
| [AutoScalingMetric](sfclient-v80-model-autoscalingmetric.md) | Describes the metric that is used for triggering auto scaling operation. Derived classes will describe resources or metrics.<br/> |
| [AutoScalingMetricKind enum](sfclient-v80-model-autoscalingmetrickind.md) | Enumerates the metrics that are used for triggering auto scaling.<br/> |
| [AutoScalingPolicy](sfclient-v80-model-autoscalingpolicy.md) | Describes the auto scaling policy<br/> |
| [AutoScalingResourceMetric](sfclient-v80-model-autoscalingresourcemetric.md) | Describes the resource that is used for triggering auto scaling.<br/> |
| [AutoScalingResourceMetric](sfclient-v80-model-autoscalingresourcemetric.md) | Describes the resource that is used for triggering auto scaling.<br/> |
| [AutoScalingResourceMetricName enum](sfclient-v80-model-autoscalingresourcemetricname.md) | Enumerates the resources that are used for triggering auto scaling.<br/> |
| [AutoScalingTrigger](sfclient-v80-model-autoscalingtrigger.md) | Describes the trigger for performing auto scaling operation.<br/> |
| [AutoScalingTriggerKind enum](sfclient-v80-model-autoscalingtriggerkind.md) | Enumerates the triggers for auto scaling.<br/> |
| [AverageLoadScalingTrigger](sfclient-v80-model-averageloadscalingtrigger.md) | Describes the average load trigger used for auto scaling.<br/> |
| [AverageLoadScalingTrigger](sfclient-v80-model-averageloadscalingtrigger.md) | Describes the average load trigger used for auto scaling.<br/> |
| [AveragePartitionLoadScalingTrigger](sfclient-v80-model-averagepartitionloadscalingtrigger.md) | Represents a scaling trigger related to an average load of a metric/resource of a partition.<br/> |
| [AveragePartitionLoadScalingTrigger](sfclient-v80-model-averagepartitionloadscalingtrigger.md) | Represents a scaling trigger related to an average load of a metric/resource of a partition.<br/> |
| [AverageServiceLoadScalingTrigger](sfclient-v80-model-averageserviceloadscalingtrigger.md) | Represents a scaling policy related to an average load of a metric/resource of a service.<br/> |
| [AverageServiceLoadScalingTrigger](sfclient-v80-model-averageserviceloadscalingtrigger.md) | Represents a scaling policy related to an average load of a metric/resource of a service.<br/> |
| [AzureBlobBackupStorageDescription](sfclient-v80-model-azureblobbackupstoragedescription.md) | Describes the parameters for Azure blob store used for storing and enumerating backups.<br/> |
| [AzureBlobBackupStorageDescription](sfclient-v80-model-azureblobbackupstoragedescription.md) | Describes the parameters for Azure blob store used for storing and enumerating backups.<br/> |
| [AzureInternalMonitoringPipelineSinkDescription](sfclient-v80-model-azureinternalmonitoringpipelinesinkdescription.md) | Diagnostics settings for Geneva.<br/> |
| [AzureInternalMonitoringPipelineSinkDescription](sfclient-v80-model-azureinternalmonitoringpipelinesinkdescription.md) | Diagnostics settings for Geneva.<br/> |
| [BackupConfigurationInfo](sfclient-v80-model-backupconfigurationinfo.md) | Describes the backup configuration information.<br/> |
| [BackupEntity](sfclient-v80-model-backupentity.md) | Describes the Service Fabric entity that is configured for backup.<br/> |
| [BackupEntityKind enum](sfclient-v80-model-backupentitykind.md) | The entity type of a Service Fabric entity such as Application, Service or a Partition where periodic backups can be enabled.<br/> |
| [BackupInfo](sfclient-v80-model-backupinfo.md) | Represents a backup point which can be used to trigger a restore.<br/> |
| [BackupPartitionDescription](sfclient-v80-model-backuppartitiondescription.md) | Describes the parameters for triggering partition's backup.<br/> |
| [BackupPolicyDescription](sfclient-v80-model-backuppolicydescription.md) | Describes a backup policy for configuring periodic backup.<br/> |
| [BackupPolicyScope enum](sfclient-v80-model-backuppolicyscope.md) | Specifies the scope at which the backup policy is applied.<br/> |
| [BackupProgressInfo](sfclient-v80-model-backupprogressinfo.md) | Describes the progress of a partition's backup.<br/> |
| [BackupScheduleDescription](sfclient-v80-model-backupscheduledescription.md) | Describes the backup schedule parameters.<br/> |
| [BackupScheduleFrequencyType enum](sfclient-v80-model-backupschedulefrequencytype.md) | Describes the frequency with which to run the time based backup schedule.<br/> |
| [BackupScheduleKind enum](sfclient-v80-model-backupschedulekind.md) | The kind of backup schedule, time based or frequency based.<br/> |
| [BackupState enum](sfclient-v80-model-backupstate.md) | Represents the current state of the partition backup operation.<br/> |
| [BackupStorageDescription](sfclient-v80-model-backupstoragedescription.md) | Describes the parameters for the backup storage.<br/> |
| [BackupStorageKind enum](sfclient-v80-model-backupstoragekind.md) | The kind of backup storage, where backups are saved.<br/> |
| [BackupSuspensionInfo](sfclient-v80-model-backupsuspensioninfo.md) | Describes the backup suspension details.<br/> |
| [BackupSuspensionScope enum](sfclient-v80-model-backupsuspensionscope.md) | Specifies the scope at which the backup suspension was applied.<br/> |
| [BackupType enum](sfclient-v80-model-backuptype.md) | Describes the type of backup, whether its full or incremental.<br/> |
| [BasicRetentionPolicyDescription](sfclient-v80-model-basicretentionpolicydescription.md) | Describes basic retention policy.<br/> |
| [BasicRetentionPolicyDescription](sfclient-v80-model-basicretentionpolicydescription.md) | Describes basic retention policy.<br/> |
| [BinaryPropertyValue](sfclient-v80-model-binarypropertyvalue.md) | Describes a Service Fabric property value of type Binary.<br/> |
| [BinaryPropertyValue](sfclient-v80-model-binarypropertyvalue.md) | Describes a Service Fabric property value of type Binary.<br/> |
| [Chaos](sfclient-v80-model-chaos.md) | Contains a description of Chaos.<br/> |
| [ChaosCodePackageRestartScheduledEvent](sfclient-v80-model-chaoscodepackagerestartscheduledevent.md) | Chaos Restart Code Package Fault Scheduled event.<br/> |
| [ChaosCodePackageRestartScheduledEvent](sfclient-v80-model-chaoscodepackagerestartscheduledevent.md) | Chaos Restart Code Package Fault Scheduled event.<br/> |
| [ChaosContext](sfclient-v80-model-chaoscontext.md) | Describes a map, which is a collection of (string, string) type key-value pairs. The map can be used to record information about<br/>the Chaos run. There cannot be more than 100 such pairs and each string (key or value) can be at most 4095 characters long.<br/>This map is set by the starter of the Chaos run to optionally store the context about the specific run.<br/> |
| [ChaosEvent](sfclient-v80-model-chaosevent.md) | Represents an event generated during a Chaos run.<br/> |
| [ChaosEventKind enum](sfclient-v80-model-chaoseventkind.md) | The kind of Chaos event.<br/> |
| [ChaosEventsSegment](sfclient-v80-model-chaoseventssegment.md) | Contains the list of Chaos events and the continuation token to get the next segment.<br/> |
| [ChaosEventWrapper](sfclient-v80-model-chaoseventwrapper.md) | Wrapper object for Chaos event.<br/> |
| [ChaosNodeRestartScheduledEvent](sfclient-v80-model-chaosnoderestartscheduledevent.md) | Chaos Restart Node Fault Scheduled event.<br/> |
| [ChaosNodeRestartScheduledEvent](sfclient-v80-model-chaosnoderestartscheduledevent.md) | Chaos Restart Node Fault Scheduled event.<br/> |
| [ChaosParameters](sfclient-v80-model-chaosparameters.md) | Defines all the parameters to configure a Chaos run.<br/> |
| [ChaosParametersDictionaryItem](sfclient-v80-model-chaosparametersdictionaryitem.md) | Defines an item in ChaosParametersDictionary of the Chaos Schedule.<br/> |
| [ChaosPartitionPrimaryMoveScheduledEvent](sfclient-v80-model-chaospartitionprimarymovescheduledevent.md) | Chaos Move Primary Fault Scheduled event.<br/> |
| [ChaosPartitionPrimaryMoveScheduledEvent](sfclient-v80-model-chaospartitionprimarymovescheduledevent.md) | Chaos Move Primary Fault Scheduled event.<br/> |
| [ChaosPartitionSecondaryMoveScheduledEvent](sfclient-v80-model-chaospartitionsecondarymovescheduledevent.md) | Chaos Move Secondary Fault Scheduled event.<br/> |
| [ChaosPartitionSecondaryMoveScheduledEvent](sfclient-v80-model-chaospartitionsecondarymovescheduledevent.md) | Chaos Move Secondary Fault Scheduled event.<br/> |
| [ChaosReplicaRemovalScheduledEvent](sfclient-v80-model-chaosreplicaremovalscheduledevent.md) | Chaos Remove Replica Fault Scheduled event.<br/> |
| [ChaosReplicaRemovalScheduledEvent](sfclient-v80-model-chaosreplicaremovalscheduledevent.md) | Chaos Remove Replica Fault Scheduled event.<br/> |
| [ChaosReplicaRestartScheduledEvent](sfclient-v80-model-chaosreplicarestartscheduledevent.md) | Chaos Restart Replica Fault Scheduled event.<br/> |
| [ChaosReplicaRestartScheduledEvent](sfclient-v80-model-chaosreplicarestartscheduledevent.md) | Chaos Restart Replica Fault Scheduled event.<br/> |
| [ChaosSchedule](sfclient-v80-model-chaosschedule.md) | Defines the schedule used by Chaos.<br/> |
| [ChaosScheduleDescription](sfclient-v80-model-chaosscheduledescription.md) | Defines the Chaos Schedule used by Chaos and the version of the Chaos Schedule. The version value wraps back to 0 after surpassing 2,147,483,647.<br/> |
| [ChaosScheduleJob](sfclient-v80-model-chaosschedulejob.md) | Defines a repetition rule and parameters of Chaos to be used with the Chaos Schedule.<br/> |
| [ChaosScheduleJobActiveDaysOfWeek](sfclient-v80-model-chaosschedulejobactivedaysofweek.md) | Defines the days of the week that a Chaos Schedule Job will run for.<br/> |
| [ChaosScheduleStatus enum](sfclient-v80-model-chaosschedulestatus.md) | Current status of the schedule.<br/> |
| [ChaosStartedEvent](sfclient-v80-model-chaosstartedevent.md) | Chaos Started event.<br/> |
| [ChaosStartedEvent](sfclient-v80-model-chaosstartedevent.md) | Chaos Started event.<br/> |
| [ChaosStatus enum](sfclient-v80-model-chaosstatus.md) | Current status of the Chaos run.<br/> |
| [ChaosStoppedEvent](sfclient-v80-model-chaosstoppedevent.md) | Chaos Stopped event.<br/> |
| [ChaosStoppedEvent](sfclient-v80-model-chaosstoppedevent.md) | Chaos Stopped event.<br/> |
| [ChaosTargetFilter](sfclient-v80-model-chaostargetfilter.md) | Defines all filters for targeted Chaos faults, for example, faulting only certain node types or faulting only certain applications.<br/>If ChaosTargetFilter is not used, Chaos faults all cluster entities. If ChaosTargetFilter is used, Chaos faults only the entities that meet the ChaosTargetFilter<br/>specification. NodeTypeInclusionList and ApplicationInclusionList allow a union semantics only. It is not possible to specify an intersection<br/>of NodeTypeInclusionList and ApplicationInclusionList. For example, it is not possible to specify "fault this application only when it is on that node type."<br/>Once an entity is included in either NodeTypeInclusionList or ApplicationInclusionList, that entity cannot be excluded using ChaosTargetFilter. Even if<br/>applicationX does not appear in ApplicationInclusionList, in some Chaos iteration applicationX can be faulted because it happens to be on a node of nodeTypeY that is included<br/>in NodeTypeInclusionList. If both NodeTypeInclusionList and ApplicationInclusionList are null or empty, an ArgumentException is thrown.<br/> |
| [CheckExistsPropertyBatchOperation](sfclient-v80-model-checkexistspropertybatchoperation.md) | Represents a PropertyBatchOperation that compares the Boolean existence of a property with the Exists argument.<br/>The PropertyBatchOperation operation fails if the property's existence is not equal to the Exists argument.<br/>The CheckExistsPropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [CheckExistsPropertyBatchOperation](sfclient-v80-model-checkexistspropertybatchoperation.md) | Represents a PropertyBatchOperation that compares the Boolean existence of a property with the Exists argument.<br/>The PropertyBatchOperation operation fails if the property's existence is not equal to the Exists argument.<br/>The CheckExistsPropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [CheckSequencePropertyBatchOperation](sfclient-v80-model-checksequencepropertybatchoperation.md) | Compares the Sequence Number of a property with the SequenceNumber argument.<br/>A property's sequence number can be thought of as that property's version.<br/>Every time the property is modified, its sequence number is increased.<br/>The sequence number can be found in a property's metadata.<br/>The comparison fails if the sequence numbers are not equal.<br/>CheckSequencePropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [CheckSequencePropertyBatchOperation](sfclient-v80-model-checksequencepropertybatchoperation.md) | Compares the Sequence Number of a property with the SequenceNumber argument.<br/>A property's sequence number can be thought of as that property's version.<br/>Every time the property is modified, its sequence number is increased.<br/>The sequence number can be found in a property's metadata.<br/>The comparison fails if the sequence numbers are not equal.<br/>CheckSequencePropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [CheckValuePropertyBatchOperation](sfclient-v80-model-checkvaluepropertybatchoperation.md) | Represents a PropertyBatchOperation that compares the value of the property with the expected value.<br/>The CheckValuePropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [CheckValuePropertyBatchOperation](sfclient-v80-model-checkvaluepropertybatchoperation.md) | Represents a PropertyBatchOperation that compares the value of the property with the expected value.<br/>The CheckValuePropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [ClusterConfiguration](sfclient-v80-model-clusterconfiguration.md) | Information about the standalone cluster configuration.<br/> |
| [ClusterConfigurationUpgradeDescription](sfclient-v80-model-clusterconfigurationupgradedescription.md) | Describes the parameters for a standalone cluster configuration upgrade.<br/> |
| [ClusterConfigurationUpgradeStatusInfo](sfclient-v80-model-clusterconfigurationupgradestatusinfo.md) | Information about a standalone cluster configuration upgrade status.<br/> |
| [ClusterEvent](sfclient-v80-model-clusterevent.md) | Represents the base for all Cluster Events.<br/> |
| [ClusterEvent](sfclient-v80-model-clusterevent.md) | Represents the base for all Cluster Events.<br/> |
| [ClusterHealth](sfclient-v80-model-clusterhealth.md) | Represents the health of the cluster.<br/>Contains the cluster aggregated health state, the cluster application and node health states as well as the health events and the unhealthy evaluations.<br/> |
| [ClusterHealth](sfclient-v80-model-clusterhealth.md) | Represents the health of the cluster.<br/>Contains the cluster aggregated health state, the cluster application and node health states as well as the health events and the unhealthy evaluations.<br/> |
| [ClusterHealthChunk](sfclient-v80-model-clusterhealthchunk.md) | Represents the health chunk of the cluster.<br/>Contains the cluster aggregated health state, and the cluster entities that respect the input filter.<br/> |
| [ClusterHealthChunkQueryDescription](sfclient-v80-model-clusterhealthchunkquerydescription.md) | The cluster health chunk query description, which can specify the health policies to evaluate cluster health and very expressive filters to select which cluster entities to include in response.<br/> |
| [ClusterHealthPolicies](sfclient-v80-model-clusterhealthpolicies.md) | Health policies to evaluate cluster health.<br/> |
| [ClusterHealthPolicy](sfclient-v80-model-clusterhealthpolicy.md) | Defines a health policy used to evaluate the health of the cluster or of a cluster node.<br/> |
| [ClusterHealthReportExpiredEvent](sfclient-v80-model-clusterhealthreportexpiredevent.md) | Cluster Health Report Expired event.<br/> |
| [ClusterHealthReportExpiredEvent](sfclient-v80-model-clusterhealthreportexpiredevent.md) | Cluster Health Report Expired event.<br/> |
| [ClusterLoadInfo](sfclient-v80-model-clusterloadinfo.md) | Information about load in a Service Fabric cluster. It holds a summary of all metrics and their load in a cluster.<br/> |
| [ClusterManifest](sfclient-v80-model-clustermanifest.md) | Information about the cluster manifest.<br/> |
| [ClusterNewHealthReportEvent](sfclient-v80-model-clusternewhealthreportevent.md) | Cluster Health Report Created event.<br/> |
| [ClusterNewHealthReportEvent](sfclient-v80-model-clusternewhealthreportevent.md) | Cluster Health Report Created event.<br/> |
| [ClusterUpgradeCompletedEvent](sfclient-v80-model-clusterupgradecompletedevent.md) | Cluster Upgrade Completed event.<br/> |
| [ClusterUpgradeCompletedEvent](sfclient-v80-model-clusterupgradecompletedevent.md) | Cluster Upgrade Completed event.<br/> |
| [ClusterUpgradeDescriptionObject](sfclient-v80-model-clusterupgradedescriptionobject.md) | Represents a ServiceFabric cluster upgrade<br/> |
| [ClusterUpgradeDomainCompletedEvent](sfclient-v80-model-clusterupgradedomaincompletedevent.md) | Cluster Upgrade Domain Completed event.<br/> |
| [ClusterUpgradeDomainCompletedEvent](sfclient-v80-model-clusterupgradedomaincompletedevent.md) | Cluster Upgrade Domain Completed event.<br/> |
| [ClusterUpgradeHealthPolicyObject](sfclient-v80-model-clusterupgradehealthpolicyobject.md) | Defines a health policy used to evaluate the health of the cluster during a cluster upgrade.<br/> |
| [ClusterUpgradeProgressObject](sfclient-v80-model-clusterupgradeprogressobject.md) | Information about a cluster upgrade.<br/> |
| [ClusterUpgradeRollbackCompletedEvent](sfclient-v80-model-clusterupgraderollbackcompletedevent.md) | Cluster Upgrade Rollback Completed event.<br/> |
| [ClusterUpgradeRollbackCompletedEvent](sfclient-v80-model-clusterupgraderollbackcompletedevent.md) | Cluster Upgrade Rollback Completed event.<br/> |
| [ClusterUpgradeRollbackStartedEvent](sfclient-v80-model-clusterupgraderollbackstartedevent.md) | Cluster Upgrade Rollback Started event.<br/> |
| [ClusterUpgradeRollbackStartedEvent](sfclient-v80-model-clusterupgraderollbackstartedevent.md) | Cluster Upgrade Rollback Started event.<br/> |
| [ClusterUpgradeStartedEvent](sfclient-v80-model-clusterupgradestartedevent.md) | Cluster Upgrade Started event.<br/> |
| [ClusterUpgradeStartedEvent](sfclient-v80-model-clusterupgradestartedevent.md) | Cluster Upgrade Started event.<br/> |
| [ClusterVersion](sfclient-v80-model-clusterversion.md) | The cluster version.<br/> |
| [CodePackageEntryPoint](sfclient-v80-model-codepackageentrypoint.md) | Information about setup or main entry point of a code package deployed on a Service Fabric node.<br/> |
| [CodePackageEntryPointStatistics](sfclient-v80-model-codepackageentrypointstatistics.md) | Statistics about setup or main entry point  of a code package deployed on a Service Fabric node.<br/> |
| [ComposeDeploymentStatus enum](sfclient-v80-model-composedeploymentstatus.md) | The status of the compose deployment.<br/> |
| [ComposeDeploymentStatusInfo](sfclient-v80-model-composedeploymentstatusinfo.md) | Information about a Service Fabric compose deployment.<br/> |
| [ComposeDeploymentUpgradeDescription](sfclient-v80-model-composedeploymentupgradedescription.md) | Describes the parameters for a compose deployment upgrade.<br/> |
| [ComposeDeploymentUpgradeProgressInfo](sfclient-v80-model-composedeploymentupgradeprogressinfo.md) | Describes the parameters for a compose deployment upgrade.<br/> |
| [ComposeDeploymentUpgradeState enum](sfclient-v80-model-composedeploymentupgradestate.md) | The state of the compose deployment upgrade.<br/> |
| [ConfigParameterOverride](sfclient-v80-model-configparameteroverride.md) | Information about a configuration parameter override.<br/> |
| [ContainerApiRequestBody](sfclient-v80-model-containerapirequestbody.md) | parameters for making container API call.<br/> |
| [ContainerApiResponse](sfclient-v80-model-containerapiresponse.md) | Response body that wraps container API result.<br/> |
| [ContainerApiResult](sfclient-v80-model-containerapiresult.md) | Container API result.<br/> |
| [ContainerCodePackageProperties](sfclient-v80-model-containercodepackageproperties.md) | Describes a container and its runtime properties.<br/> |
| [ContainerEvent](sfclient-v80-model-containerevent.md) | A container event.<br/> |
| [ContainerInstanceEvent](sfclient-v80-model-containerinstanceevent.md) | Represents the base for all Container Events.<br/> |
| [ContainerInstanceEvent](sfclient-v80-model-containerinstanceevent.md) | Represents the base for all Container Events.<br/> |
| [ContainerInstanceView](sfclient-v80-model-containerinstanceview.md) | Runtime information of a container instance.<br/> |
| [ContainerLabel](sfclient-v80-model-containerlabel.md) | Describes a container label.<br/> |
| [ContainerLogs](sfclient-v80-model-containerlogs.md) | Container logs.<br/> |
| [ContainerState](sfclient-v80-model-containerstate.md) | The container state.<br/> |
| [CreateComposeDeploymentDescription](sfclient-v80-model-createcomposedeploymentdescription.md) | Defines description for creating a Service Fabric compose deployment.<br/> |
| [CreateFabricDump enum](sfclient-v80-model-createfabricdump.md) | Possible values include: 'False', 'True'<br/> |
| [CurrentUpgradeDomainProgressInfo](sfclient-v80-model-currentupgradedomainprogressinfo.md) | Information about the current in-progress upgrade domain.<br/> |
| [DataLossMode enum](sfclient-v80-model-datalossmode.md) | Possible values include: 'Invalid', 'PartialDataLoss', 'FullDataLoss'<br/> |
| [DayOfWeek enum](sfclient-v80-model-dayofweek.md) | Describes the days in a week.<br/> |
| [DeactivationIntent enum](sfclient-v80-model-deactivationintent.md) | Possible values include: 'Pause', 'Restart', 'RemoveData'<br/> |
| [DeactivationIntentDescription](sfclient-v80-model-deactivationintentdescription.md) | Describes the intent or reason for deactivating the node.<br/> |
| [DefaultExecutionPolicy](sfclient-v80-model-defaultexecutionpolicy.md) | The default execution policy. Always restart the service if an exit occurs.<br/> |
| [DefaultExecutionPolicy](sfclient-v80-model-defaultexecutionpolicy.md) | The default execution policy. Always restart the service if an exit occurs.<br/> |
| [DeletePropertyBatchOperation](sfclient-v80-model-deletepropertybatchoperation.md) | Represents a PropertyBatchOperation that deletes a specified property if it exists.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [DeletePropertyBatchOperation](sfclient-v80-model-deletepropertybatchoperation.md) | Represents a PropertyBatchOperation that deletes a specified property if it exists.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [DeltaNodesCheckHealthEvaluation](sfclient-v80-model-deltanodescheckhealthevaluation.md) | Represents health evaluation for delta nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when the aggregated health state of the cluster is Warning or Error.<br/> |
| [DeltaNodesCheckHealthEvaluation](sfclient-v80-model-deltanodescheckhealthevaluation.md) | Represents health evaluation for delta nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when the aggregated health state of the cluster is Warning or Error.<br/> |
| [DeployedApplicationHealth](sfclient-v80-model-deployedapplicationhealth.md) | Information about the health of an application deployed on a Service Fabric node.<br/> |
| [DeployedApplicationHealth](sfclient-v80-model-deployedapplicationhealth.md) | Information about the health of an application deployed on a Service Fabric node.<br/> |
| [DeployedApplicationHealthEvaluation](sfclient-v80-model-deployedapplicationhealthevaluation.md) | Represents health evaluation for a deployed application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [DeployedApplicationHealthEvaluation](sfclient-v80-model-deployedapplicationhealthevaluation.md) | Represents health evaluation for a deployed application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [DeployedApplicationHealthReportExpiredEvent](sfclient-v80-model-deployedapplicationhealthreportexpiredevent.md) | Deployed Application Health Report Expired event.<br/> |
| [DeployedApplicationHealthReportExpiredEvent](sfclient-v80-model-deployedapplicationhealthreportexpiredevent.md) | Deployed Application Health Report Expired event.<br/> |
| [DeployedApplicationHealthState](sfclient-v80-model-deployedapplicationhealthstate.md) | Represents the health state of a deployed application, which contains the entity identifier and the aggregated health state.<br/> |
| [DeployedApplicationHealthState](sfclient-v80-model-deployedapplicationhealthstate.md) | Represents the health state of a deployed application, which contains the entity identifier and the aggregated health state.<br/> |
| [DeployedApplicationHealthStateChunk](sfclient-v80-model-deployedapplicationhealthstatechunk.md) | Represents the health state chunk of a deployed application, which contains the node where the application is deployed, the aggregated health state and any deployed service packages that respect the chunk query description filters.<br/> |
| [DeployedApplicationHealthStateChunk](sfclient-v80-model-deployedapplicationhealthstatechunk.md) | Represents the health state chunk of a deployed application, which contains the node where the application is deployed, the aggregated health state and any deployed service packages that respect the chunk query description filters.<br/> |
| [DeployedApplicationHealthStateChunkList](sfclient-v80-model-deployedapplicationhealthstatechunklist.md) | The list of deployed application health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [DeployedApplicationHealthStateFilter](sfclient-v80-model-deployedapplicationhealthstatefilter.md) | Defines matching criteria to determine whether a deployed application should be included as a child of an application in the cluster health chunk.<br/>The deployed applications are only returned if the parent application matches a filter specified in the cluster health chunk query description.<br/>One filter can match zero, one or multiple deployed applications, depending on its properties.<br/> |
| [DeployedApplicationInfo](sfclient-v80-model-deployedapplicationinfo.md) | Information about application deployed on the node.<br/> |
| [DeployedApplicationNewHealthReportEvent](sfclient-v80-model-deployedapplicationnewhealthreportevent.md) | Deployed Application Health Report Created event.<br/> |
| [DeployedApplicationNewHealthReportEvent](sfclient-v80-model-deployedapplicationnewhealthreportevent.md) | Deployed Application Health Report Created event.<br/> |
| [DeployedApplicationsHealthEvaluation](sfclient-v80-model-deployedapplicationshealthevaluation.md) | Represents health evaluation for deployed applications, containing health evaluations for each unhealthy deployed application that impacted current aggregated health state.<br/>Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedApplicationsHealthEvaluation](sfclient-v80-model-deployedapplicationshealthevaluation.md) | Represents health evaluation for deployed applications, containing health evaluations for each unhealthy deployed application that impacted current aggregated health state.<br/>Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedApplicationStatus enum](sfclient-v80-model-deployedapplicationstatus.md) | The status of the application deployed on the node. Following are the possible values.<br/> |
| [DeployedCodePackageInfo](sfclient-v80-model-deployedcodepackageinfo.md) | Information about code package deployed on a Service Fabric node.<br/> |
| [DeployedServicePackageHealth](sfclient-v80-model-deployedservicepackagehealth.md) | Information about the health of a service package for a specific application deployed on a Service Fabric node.<br/> |
| [DeployedServicePackageHealth](sfclient-v80-model-deployedservicepackagehealth.md) | Information about the health of a service package for a specific application deployed on a Service Fabric node.<br/> |
| [DeployedServicePackageHealthEvaluation](sfclient-v80-model-deployedservicepackagehealthevaluation.md) | Represents health evaluation for a deployed service package, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [DeployedServicePackageHealthEvaluation](sfclient-v80-model-deployedservicepackagehealthevaluation.md) | Represents health evaluation for a deployed service package, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [DeployedServicePackageHealthReportExpiredEvent](sfclient-v80-model-deployedservicepackagehealthreportexpiredevent.md) | Deployed Service Health Report Expired event.<br/> |
| [DeployedServicePackageHealthReportExpiredEvent](sfclient-v80-model-deployedservicepackagehealthreportexpiredevent.md) | Deployed Service Health Report Expired event.<br/> |
| [DeployedServicePackageHealthState](sfclient-v80-model-deployedservicepackagehealthstate.md) | Represents the health state of a deployed service package, containing the entity identifier and the aggregated health state.<br/> |
| [DeployedServicePackageHealthState](sfclient-v80-model-deployedservicepackagehealthstate.md) | Represents the health state of a deployed service package, containing the entity identifier and the aggregated health state.<br/> |
| [DeployedServicePackageHealthStateChunk](sfclient-v80-model-deployedservicepackagehealthstatechunk.md) | Represents the health state chunk of a deployed service package, which contains the service manifest name and the service package aggregated health state.<br/> |
| [DeployedServicePackageHealthStateChunk](sfclient-v80-model-deployedservicepackagehealthstatechunk.md) | Represents the health state chunk of a deployed service package, which contains the service manifest name and the service package aggregated health state.<br/> |
| [DeployedServicePackageHealthStateChunkList](sfclient-v80-model-deployedservicepackagehealthstatechunklist.md) | The list of deployed service package health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [DeployedServicePackageHealthStateFilter](sfclient-v80-model-deployedservicepackagehealthstatefilter.md) | Defines matching criteria to determine whether a deployed service package should be included as a child of a deployed application in the cluster health chunk.<br/>The deployed service packages are only returned if the parent entities match a filter specified in the cluster health chunk query description. The parent deployed application and its parent application must be included in the cluster health chunk.<br/>One filter can match zero, one or multiple deployed service packages, depending on its properties.<br/> |
| [DeployedServicePackageInfo](sfclient-v80-model-deployedservicepackageinfo.md) | Information about service package deployed on a Service Fabric node.<br/> |
| [DeployedServicePackageNewHealthReportEvent](sfclient-v80-model-deployedservicepackagenewhealthreportevent.md) | Deployed Service Health Report Created event.<br/> |
| [DeployedServicePackageNewHealthReportEvent](sfclient-v80-model-deployedservicepackagenewhealthreportevent.md) | Deployed Service Health Report Created event.<br/> |
| [DeployedServicePackagesHealthEvaluation](sfclient-v80-model-deployedservicepackageshealthevaluation.md) | Represents health evaluation for deployed service packages, containing health evaluations for each unhealthy deployed service package that impacted current aggregated health state. Can be returned when evaluating deployed application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedServicePackagesHealthEvaluation](sfclient-v80-model-deployedservicepackageshealthevaluation.md) | Represents health evaluation for deployed service packages, containing health evaluations for each unhealthy deployed service package that impacted current aggregated health state. Can be returned when evaluating deployed application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedServiceReplicaDetailInfo](sfclient-v80-model-deployedservicereplicadetailinfo.md) | Information about a Service Fabric service replica deployed on a node.<br/> |
| [DeployedServiceReplicaInfo](sfclient-v80-model-deployedservicereplicainfo.md) | Information about a Service Fabric service replica deployed on a node.<br/> |
| [DeployedServiceTypeInfo](sfclient-v80-model-deployedservicetypeinfo.md) | Information about service type deployed on a node, information such as the status of the service type registration on a node.<br/> |
| [DeployedStatefulServiceReplicaDetailInfo](sfclient-v80-model-deployedstatefulservicereplicadetailinfo.md) | Information about a stateful replica running in a code package. Note DeployedServiceReplicaQueryResult will contain duplicate data like ServiceKind, ServiceName, PartitionId and replicaId.<br/> |
| [DeployedStatefulServiceReplicaDetailInfo](sfclient-v80-model-deployedstatefulservicereplicadetailinfo.md) | Information about a stateful replica running in a code package. Note DeployedServiceReplicaQueryResult will contain duplicate data like ServiceKind, ServiceName, PartitionId and replicaId.<br/> |
| [DeployedStatefulServiceReplicaInfo](sfclient-v80-model-deployedstatefulservicereplicainfo.md) | Information about a stateful service replica deployed on a node.<br/> |
| [DeployedStatefulServiceReplicaInfo](sfclient-v80-model-deployedstatefulservicereplicainfo.md) | Information about a stateful service replica deployed on a node.<br/> |
| [DeployedStatelessServiceInstanceDetailInfo](sfclient-v80-model-deployedstatelessserviceinstancedetailinfo.md) | Information about a stateless instance running in a code package. Note that DeployedServiceReplicaQueryResult will contain duplicate data like ServiceKind, ServiceName, PartitionId and InstanceId.<br/> |
| [DeployedStatelessServiceInstanceDetailInfo](sfclient-v80-model-deployedstatelessserviceinstancedetailinfo.md) | Information about a stateless instance running in a code package. Note that DeployedServiceReplicaQueryResult will contain duplicate data like ServiceKind, ServiceName, PartitionId and InstanceId.<br/> |
| [DeployedStatelessServiceInstanceInfo](sfclient-v80-model-deployedstatelessserviceinstanceinfo.md) | Information about a stateless service instance deployed on a node.<br/> |
| [DeployedStatelessServiceInstanceInfo](sfclient-v80-model-deployedstatelessserviceinstanceinfo.md) | Information about a stateless service instance deployed on a node.<br/> |
| [DeploymentStatus enum](sfclient-v80-model-deploymentstatus.md) | Specifies the status of a deployed application or service package on a Service Fabric node.<br/> |
| [DeployServicePackageToNodeDescription](sfclient-v80-model-deployservicepackagetonodedescription.md) | Defines description for downloading packages associated with a service manifest to image cache on a Service Fabric node.<br/> |
| [DiagnosticsDescription](sfclient-v80-model-diagnosticsdescription.md) | Describes the diagnostics options available<br/> |
| [DiagnosticsRef](sfclient-v80-model-diagnosticsref.md) | Reference to sinks in DiagnosticsDescription.<br/> |
| [DiagnosticsSinkKind enum](sfclient-v80-model-diagnosticssinkkind.md) | The kind of DiagnosticsSink.<br/> |
| [DiagnosticsSinkProperties](sfclient-v80-model-diagnosticssinkproperties.md) | Properties of a DiagnosticsSink.<br/> |
| [DisableBackupDescription](sfclient-v80-model-disablebackupdescription.md) | It describes the body parameters while disabling backup of a backup entity(Application/Service/Partition).<br/> |
| [DiskInfo](sfclient-v80-model-diskinfo.md) | Information about the disk<br/> |
| [DoublePropertyValue](sfclient-v80-model-doublepropertyvalue.md) | Describes a Service Fabric property value of type Double.<br/> |
| [DoublePropertyValue](sfclient-v80-model-doublepropertyvalue.md) | Describes a Service Fabric property value of type Double.<br/> |
| [DsmsAzureBlobBackupStorageDescription](sfclient-v80-model-dsmsazureblobbackupstoragedescription.md) | Describes the parameters for Dsms Azure blob store used for storing and enumerating backups.<br/> |
| [DsmsAzureBlobBackupStorageDescription](sfclient-v80-model-dsmsazureblobbackupstoragedescription.md) | Describes the parameters for Dsms Azure blob store used for storing and enumerating backups.<br/> |
| [EnableBackupDescription](sfclient-v80-model-enablebackupdescription.md) | Specifies the parameters needed to enable periodic backup.<br/> |
| [EndpointProperties](sfclient-v80-model-endpointproperties.md) | Describes a container endpoint.<br/> |
| [EndpointRef](sfclient-v80-model-endpointref.md) | Describes a reference to a service endpoint.<br/> |
| [EnsureAvailabilitySafetyCheck](sfclient-v80-model-ensureavailabilitysafetycheck.md) | Safety check that waits to ensure the availability of the partition. It waits until there are replicas available such that bringing down this replica will not cause availability loss for the partition.<br/> |
| [EnsureAvailabilitySafetyCheck](sfclient-v80-model-ensureavailabilitysafetycheck.md) | Safety check that waits to ensure the availability of the partition. It waits until there are replicas available such that bringing down this replica will not cause availability loss for the partition.<br/> |
| [EnsurePartitionQuorumSafetyCheck](sfclient-v80-model-ensurepartitionquorumsafetycheck.md) | Safety check that ensures that a quorum of replicas are not lost for a partition.<br/> |
| [EnsurePartitionQuorumSafetyCheck](sfclient-v80-model-ensurepartitionquorumsafetycheck.md) | Safety check that ensures that a quorum of replicas are not lost for a partition.<br/> |
| [EntityHealth](sfclient-v80-model-entityhealth.md) | Health information common to all entities in the cluster. It contains the aggregated health state, health events and unhealthy evaluation.<br/> |
| [EntityHealthState](sfclient-v80-model-entityhealthstate.md) | A base type for the health state of various entities in the cluster. It contains the aggregated health state.<br/> |
| [EntityHealthStateChunk](sfclient-v80-model-entityhealthstatechunk.md) | A base type for the health state chunk of various entities in the cluster. It contains the aggregated health state.<br/> |
| [EntityHealthStateChunkList](sfclient-v80-model-entityhealthstatechunklist.md) | A base type for the list of health state chunks found in the cluster. It contains the total number of health states that match the input filters.<br/> |
| [EntityKind enum](sfclient-v80-model-entitykind.md) | The entity type of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.<br/> |
| [EntityKindHealthStateCount](sfclient-v80-model-entitykindhealthstatecount.md) | Represents health state count for entities of the specified entity kind.<br/> |
| [EntryPointStatus enum](sfclient-v80-model-entrypointstatus.md) | Specifies the status of the code package entry point deployed on a Service Fabric node.<br/> |
| [EnvironmentVariable](sfclient-v80-model-environmentvariable.md) | Describes an environment variable for the container.<br/> |
| [EnvironmentVariableType enum](sfclient-v80-model-environmentvariabletype.md) | The type of the environment variable being given in value<br/> |
| [Epoch](sfclient-v80-model-epoch.md) | An Epoch is a configuration number for the partition as a whole. When the configuration of the replica set changes, for example when the Primary replica changes, the operations that are replicated from the new Primary replica are said to be a new Epoch from the ones which were sent by the old Primary replica.<br/> |
| [EventHealthEvaluation](sfclient-v80-model-eventhealthevaluation.md) | Represents health evaluation of a HealthEvent that was reported on the entity.<br/>The health evaluation is returned when evaluating health of an entity results in Error or Warning.<br/> |
| [EventHealthEvaluation](sfclient-v80-model-eventhealthevaluation.md) | Represents health evaluation of a HealthEvent that was reported on the entity.<br/>The health evaluation is returned when evaluating health of an entity results in Error or Warning.<br/> |
| [ExecutingFaultsChaosEvent](sfclient-v80-model-executingfaultschaosevent.md) | Describes a Chaos event that gets generated when Chaos has decided on the faults for an iteration. This Chaos event contains the details of the faults as a list of strings.<br/> |
| [ExecutingFaultsChaosEvent](sfclient-v80-model-executingfaultschaosevent.md) | Describes a Chaos event that gets generated when Chaos has decided on the faults for an iteration. This Chaos event contains the details of the faults as a list of strings.<br/> |
| [ExecutionPolicy](sfclient-v80-model-executionpolicy.md) | The execution policy of the service<br/> |
| [ExecutionPolicyType enum](sfclient-v80-model-executionpolicytype.md) | Enumerates the execution policy types for services.<br/> |
| [ExternalStoreProvisionApplicationTypeDescription](sfclient-v80-model-externalstoreprovisionapplicationtypedescription.md) | Describes the operation to register or provision an application type using an application package from an external store instead of a package uploaded to the Service Fabric image store.<br/> |
| [ExternalStoreProvisionApplicationTypeDescription](sfclient-v80-model-externalstoreprovisionapplicationtypedescription.md) | Describes the operation to register or provision an application type using an application package from an external store instead of a package uploaded to the Service Fabric image store.<br/> |
| [FabricCodeVersionInfo](sfclient-v80-model-fabriccodeversioninfo.md) | Information about a Service Fabric code version.<br/> |
| [FabricConfigVersionInfo](sfclient-v80-model-fabricconfigversioninfo.md) | Information about a Service Fabric config version.<br/> |
| [FabricError](sfclient-v80-model-fabricerror.md) | The REST API operations for Service Fabric return standard HTTP status codes. This type defines the additional information returned from the Service Fabric API operations that are not successful.<br/> |
| [FabricErrorCodes enum](sfclient-v80-model-fabricerrorcodes.md) | Defines the fabric error codes that be returned as part of the error object in response to Service Fabric API operations that are not successful. Following are the error code values that can be returned for a specific HTTP status code.<br/><br/>  - Possible values of the error code for HTTP status code 400 (Bad Request)<br/>    - "FABRIC_E_INVALID_PARTITION_KEY"<br/>    - "FABRIC_E_IMAGEBUILDER_VALIDATION_ERROR"<br/>    - "FABRIC_E_INVALID_ADDRESS"<br/>    - "FABRIC_E_APPLICATION_NOT_UPGRADING"<br/>    - "FABRIC_E_APPLICATION_UPGRADE_VALIDATION_ERROR"<br/>    - "FABRIC_E_FABRIC_NOT_UPGRADING"<br/>    - "FABRIC_E_FABRIC_UPGRADE_VALIDATION_ERROR"<br/>    - "FABRIC_E_INVALID_CONFIGURATION"<br/>    - "FABRIC_E_INVALID_NAME_URI"<br/>    - "FABRIC_E_PATH_TOO_LONG"<br/>    - "FABRIC_E_KEY_TOO_LARGE"<br/>    - "FABRIC_E_SERVICE_AFFINITY_CHAIN_NOT_SUPPORTED"<br/>    - "FABRIC_E_INVALID_ATOMIC_GROUP"<br/>    - "FABRIC_E_VALUE_EMPTY"<br/>    - "FABRIC_E_BACKUP_IS_ENABLED"<br/>    - "FABRIC_E_RESTORE_SOURCE_TARGET_PARTITION_MISMATCH"<br/>    - "FABRIC_E_INVALID_FOR_STATELESS_SERVICES"<br/>    - "FABRIC_E_INVALID_SERVICE_SCALING_POLICY"<br/>    - "E_INVALIDARG"<br/><br/>  - Possible values of the error code for HTTP status code 404 (Not Found)<br/>    - "FABRIC_E_NODE_NOT_FOUND"<br/>    - "FABRIC_E_APPLICATION_TYPE_NOT_FOUND"<br/>    - "FABRIC_E_APPLICATION_NOT_FOUND"<br/>    - "FABRIC_E_SERVICE_TYPE_NOT_FOUND"<br/>    - "FABRIC_E_SERVICE_DOES_NOT_EXIST"<br/>    - "FABRIC_E_SERVICE_TYPE_TEMPLATE_NOT_FOUND"<br/>    - "FABRIC_E_CONFIGURATION_SECTION_NOT_FOUND"<br/>    - "FABRIC_E_PARTITION_NOT_FOUND"<br/>    - "FABRIC_E_REPLICA_DOES_NOT_EXIST"<br/>    - "FABRIC_E_SERVICE_GROUP_DOES_NOT_EXIST"<br/>    - "FABRIC_E_CONFIGURATION_PARAMETER_NOT_FOUND"<br/>    - "FABRIC_E_DIRECTORY_NOT_FOUND"<br/>    - "FABRIC_E_FABRIC_VERSION_NOT_FOUND"<br/>    - "FABRIC_E_FILE_NOT_FOUND"<br/>    - "FABRIC_E_NAME_DOES_NOT_EXIST"<br/>    - "FABRIC_E_PROPERTY_DOES_NOT_EXIST"<br/>    - "FABRIC_E_ENUMERATION_COMPLETED"<br/>    - "FABRIC_E_SERVICE_MANIFEST_NOT_FOUND"<br/>    - "FABRIC_E_KEY_NOT_FOUND"<br/>    - "FABRIC_E_HEALTH_ENTITY_NOT_FOUND"<br/>    - "FABRIC_E_BACKUP_NOT_ENABLED"<br/>    - "FABRIC_E_BACKUP_POLICY_NOT_EXISTING"<br/>    - "FABRIC_E_FAULT_ANALYSIS_SERVICE_NOT_EXISTING"<br/>    - "FABRIC_E_IMAGEBUILDER_RESERVED_DIRECTORY_ERROR"<br/><br/>  - Possible values of the error code for HTTP status code 409 (Conflict)<br/>    - "FABRIC_E_APPLICATION_TYPE_ALREADY_EXISTS"<br/>    - "FABRIC_E_APPLICATION_ALREADY_EXISTS"<br/>    - "FABRIC_E_APPLICATION_ALREADY_IN_TARGET_VERSION"<br/>    - "FABRIC_E_APPLICATION_TYPE_PROVISION_IN_PROGRESS"<br/>    - "FABRIC_E_APPLICATION_UPGRADE_IN_PROGRESS"<br/>    - "FABRIC_E_SERVICE_ALREADY_EXISTS"<br/>    - "FABRIC_E_SERVICE_GROUP_ALREADY_EXISTS"<br/>    - "FABRIC_E_APPLICATION_TYPE_IN_USE"<br/>    - "FABRIC_E_FABRIC_ALREADY_IN_TARGET_VERSION"<br/>    - "FABRIC_E_FABRIC_VERSION_ALREADY_EXISTS"<br/>    - "FABRIC_E_FABRIC_VERSION_IN_USE"<br/>    - "FABRIC_E_FABRIC_UPGRADE_IN_PROGRESS"<br/>    - "FABRIC_E_NAME_ALREADY_EXISTS"<br/>    - "FABRIC_E_NAME_NOT_EMPTY"<br/>    - "FABRIC_E_PROPERTY_CHECK_FAILED"<br/>    - "FABRIC_E_SERVICE_METADATA_MISMATCH"<br/>    - "FABRIC_E_SERVICE_TYPE_MISMATCH"<br/>    - "FABRIC_E_HEALTH_STALE_REPORT"<br/>    - "FABRIC_E_SEQUENCE_NUMBER_CHECK_FAILED"<br/>    - "FABRIC_E_NODE_HAS_NOT_STOPPED_YET"<br/>    - "FABRIC_E_INSTANCE_ID_MISMATCH"<br/>    - "FABRIC_E_BACKUP_IN_PROGRESS"<br/>    - "FABRIC_E_RESTORE_IN_PROGRESS"<br/>    - "FABRIC_E_BACKUP_POLICY_ALREADY_EXISTING"<br/><br/>  - Possible values of the error code for HTTP status code 413 (Request Entity Too Large)<br/>    - "FABRIC_E_VALUE_TOO_LARGE"<br/><br/>  - Possible values of the error code for HTTP status code 500 (Internal Server Error)<br/>    - "FABRIC_E_NODE_IS_UP"<br/>    - "E_FAIL"<br/>    - "FABRIC_E_SINGLE_INSTANCE_APPLICATION_ALREADY_EXISTS"<br/>    - "FABRIC_E_SINGLE_INSTANCE_APPLICATION_NOT_FOUND"<br/>    - "FABRIC_E_VOLUME_ALREADY_EXISTS"<br/>    - "FABRIC_E_VOLUME_NOT_FOUND"<br/>    - "SerializationError"<br/><br/>  - Possible values of the error code for HTTP status code 503 (Service Unavailable)<br/>    - "FABRIC_E_NO_WRITE_QUORUM"<br/>    - "FABRIC_E_NOT_PRIMARY"<br/>    - "FABRIC_E_NOT_READY"<br/>    - "FABRIC_E_RECONFIGURATION_PENDING"<br/>    - "FABRIC_E_SERVICE_OFFLINE"<br/>    - "E_ABORT"<br/>    - "FABRIC_E_VALUE_TOO_LARGE"<br/><br/>  - Possible values of the error code for HTTP status code 504 (Gateway Timeout)<br/>    - "FABRIC_E_COMMUNICATION_ERROR"<br/>    - "FABRIC_E_OPERATION_NOT_COMPLETE"<br/>    - "FABRIC_E_TIMEOUT"<br/> |
| [FabricErrorError](sfclient-v80-model-fabricerrorerror.md) | Error object containing error code and error message.<br/> |
| [FabricEvent](sfclient-v80-model-fabricevent.md) | Represents the base for all Fabric Events.<br/> |
| [FabricEventKind enum](sfclient-v80-model-fabriceventkind.md) | The kind of FabricEvent.<br/> |
| [FabricReplicaStatus enum](sfclient-v80-model-fabricreplicastatus.md) | Specifies the status of the replica.<br/> |
| [FailedPropertyBatchInfo](sfclient-v80-model-failedpropertybatchinfo.md) | Derived from PropertyBatchInfo. Represents the property batch failing. Contains information about the specific batch failure.<br/> |
| [FailedPropertyBatchInfo](sfclient-v80-model-failedpropertybatchinfo.md) | Derived from PropertyBatchInfo. Represents the property batch failing. Contains information about the specific batch failure.<br/> |
| [FailedUpgradeDomainProgressObject](sfclient-v80-model-failedupgradedomainprogressobject.md) | The detailed upgrade progress for nodes in the current upgrade domain at the point of failure.<br/> |
| [FailureAction enum](sfclient-v80-model-failureaction.md) | The compensating action to perform when a Monitored upgrade encounters monitoring policy or health policy violations.<br/>Invalid indicates the failure action is invalid. Rollback specifies that the upgrade will start rolling back automatically.<br/>Manual indicates that the upgrade will switch to UnmonitoredManual upgrade mode.<br/> |
| [FailureReason enum](sfclient-v80-model-failurereason.md) | The cause of an upgrade failure that resulted in FailureAction being executed.<br/> |
| [FailureUpgradeDomainProgressInfo](sfclient-v80-model-failureupgradedomainprogressinfo.md) | Information about the upgrade domain progress at the time of upgrade failure.<br/> |
| [FileInfo](sfclient-v80-model-fileinfo.md) | Information about a image store file.<br/> |
| [FileShareBackupStorageDescription](sfclient-v80-model-filesharebackupstoragedescription.md) | Describes the parameters for file share storage used for storing or enumerating backups.<br/> |
| [FileShareBackupStorageDescription](sfclient-v80-model-filesharebackupstoragedescription.md) | Describes the parameters for file share storage used for storing or enumerating backups.<br/> |
| [FileVersion](sfclient-v80-model-fileversion.md) | Information about the version of image store file.<br/> |
| [FolderInfo](sfclient-v80-model-folderinfo.md) | Information about a image store folder. It includes how many files this folder contains and its image store relative path.<br/> |
| [FolderSizeInfo](sfclient-v80-model-foldersizeinfo.md) | Information of a image store folder size<br/> |
| [FrequencyBasedBackupScheduleDescription](sfclient-v80-model-frequencybasedbackupscheduledescription.md) | Describes the frequency based backup schedule.<br/> |
| [FrequencyBasedBackupScheduleDescription](sfclient-v80-model-frequencybasedbackupscheduledescription.md) | Describes the frequency based backup schedule.<br/> |
| [GatewayDestination](sfclient-v80-model-gatewaydestination.md) | Describes destination endpoint for routing traffic.<br/> |
| [GatewayProperties](sfclient-v80-model-gatewayproperties.md) | Describes properties of a gateway resource.<br/> |
| [GatewayResourceDescription](sfclient-v80-model-gatewayresourcedescription.md) | This type describes a gateway resource.<br/> |
| [GetBackupByStorageQueryDescription](sfclient-v80-model-getbackupbystoragequerydescription.md) | Describes additional filters to be applied, while listing backups, and backup storage details from where to fetch the backups.<br/> |
| [GetPropertyBatchOperation](sfclient-v80-model-getpropertybatchoperation.md) | Represents a PropertyBatchOperation that gets the specified property if it exists.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [GetPropertyBatchOperation](sfclient-v80-model-getpropertybatchoperation.md) | Represents a PropertyBatchOperation that gets the specified property if it exists.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [GuidPropertyValue](sfclient-v80-model-guidpropertyvalue.md) | Describes a Service Fabric property value of type Guid.<br/> |
| [GuidPropertyValue](sfclient-v80-model-guidpropertyvalue.md) | Describes a Service Fabric property value of type Guid.<br/> |
| [HeaderMatchType enum](sfclient-v80-model-headermatchtype.md) | Possible values include: 'exact'<br/> |
| [HealthEvaluation](sfclient-v80-model-healthevaluation.md) | Represents a health evaluation which describes the data and the algorithm used by health manager to evaluate the health of an entity.<br/> |
| [HealthEvaluationKind enum](sfclient-v80-model-healthevaluationkind.md) | The health manager in the cluster performs health evaluations in determining the aggregated health state of an entity. This enumeration provides information on the kind of evaluation that was performed. Following are the possible values.<br/> |
| [HealthEvaluationWrapper](sfclient-v80-model-healthevaluationwrapper.md) | Wrapper object for health evaluation.<br/> |
| [HealthEvent](sfclient-v80-model-healthevent.md) | Represents health information reported on a health entity, such as cluster, application or node, with additional metadata added by the Health Manager.<br/> |
| [HealthEvent](sfclient-v80-model-healthevent.md) | Represents health information reported on a health entity, such as cluster, application or node, with additional metadata added by the Health Manager.<br/> |
| [HealthInformation](sfclient-v80-model-healthinformation.md) | Represents common health report information. It is included in all health reports sent to health store and in all health events returned by health queries.<br/> |
| [HealthState enum](sfclient-v80-model-healthstate.md) | The health state of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.<br/> |
| [HealthStateCount](sfclient-v80-model-healthstatecount.md) | Represents information about how many health entities are in Ok, Warning and Error health state.<br/> |
| [HealthStatistics](sfclient-v80-model-healthstatistics.md) | The health statistics of an entity, returned as part of the health query result when the query description is configured to include statistics.<br/>The statistics include health state counts for all children types of the current entity.<br/>For example, for cluster, the health statistics include health state counts for nodes, applications, services, partitions, replicas, deployed applications and deployed service packages.<br/>For partition, the health statistics include health counts for replicas.<br/> |
| [HostIsolationMode enum](sfclient-v80-model-hostisolationmode.md) | Specifies the isolation mode of main entry point of a code package when it's host type is ContainerHost. This is specified as part of container host policies in application manifest while importing service manifest.<br/> |
| [HostType enum](sfclient-v80-model-hosttype.md) | Specifies the type of host for main entry point of a code package as specified in service manifest.<br/> |
| [HttpConfig](sfclient-v80-model-httpconfig.md) | Describes the http configuration for external connectivity for this network.<br/> |
| [HttpHostConfig](sfclient-v80-model-httphostconfig.md) | Describes the hostname properties for http routing.<br/> |
| [HttpRouteConfig](sfclient-v80-model-httprouteconfig.md) | Describes the hostname properties for http routing.<br/> |
| [HttpRouteMatchHeader](sfclient-v80-model-httproutematchheader.md) | Describes header information for http route matching.<br/> |
| [HttpRouteMatchPath](sfclient-v80-model-httproutematchpath.md) | Path to match for routing.<br/> |
| [HttpRouteMatchRule](sfclient-v80-model-httproutematchrule.md) | Describes a rule for http route matching.<br/> |
| [IdentityDescription](sfclient-v80-model-identitydescription.md) | Information describing the identities associated with this application.<br/> |
| [IdentityItemDescription](sfclient-v80-model-identityitemdescription.md) | Describes a single user-assigned identity associated with the application.<br/> |
| [ImageRegistryCredential](sfclient-v80-model-imageregistrycredential.md) | Image registry credential.<br/> |
| [ImageRegistryPasswordType enum](sfclient-v80-model-imageregistrypasswordtype.md) | The type of the image registry password being given in password<br/> |
| [ImageStoreContent](sfclient-v80-model-imagestorecontent.md) | Information about the image store content.<br/> |
| [ImageStoreCopyDescription](sfclient-v80-model-imagestorecopydescription.md) | Information about how to copy image store content from one image store relative path to another image store relative path.<br/> |
| [ImageStoreInfo](sfclient-v80-model-imagestoreinfo.md) | Information about the ImageStore's resource usage<br/> |
| [ImpactLevel enum](sfclient-v80-model-impactlevel.md) | Possible values include: 'Invalid', 'None', 'Restart', 'RemoveData', 'RemoveNode'<br/> |
| [InlinedValueSecretResourceProperties](sfclient-v80-model-inlinedvaluesecretresourceproperties.md) | Describes the properties of a secret resource whose value is provided explicitly as plaintext. The secret resource may have multiple values, each being uniquely versioned. The secret value of each version is stored encrypted, and delivered as plaintext into the context of applications referencing it.<br/> |
| [InlinedValueSecretResourceProperties](sfclient-v80-model-inlinedvaluesecretresourceproperties.md) | Describes the properties of a secret resource whose value is provided explicitly as plaintext. The secret resource may have multiple values, each being uniquely versioned. The secret value of each version is stored encrypted, and delivered as plaintext into the context of applications referencing it.<br/> |
| [InstanceLifecycleDescription](sfclient-v80-model-instancelifecycledescription.md) | Describes how the instance will behave<br/> |
| [Int64PropertyValue](sfclient-v80-model-int64propertyvalue.md) | Describes a Service Fabric property value of type Int64.<br/> |
| [Int64PropertyValue](sfclient-v80-model-int64propertyvalue.md) | Describes a Service Fabric property value of type Int64.<br/> |
| [Int64RangePartitionInformation](sfclient-v80-model-int64rangepartitioninformation.md) | Describes the partition information for the integer range that is based on partition schemes.<br/> |
| [Int64RangePartitionInformation](sfclient-v80-model-int64rangepartitioninformation.md) | Describes the partition information for the integer range that is based on partition schemes.<br/> |
| [InvokeDataLossResult](sfclient-v80-model-invokedatalossresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [InvokeQuorumLossResult](sfclient-v80-model-invokequorumlossresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [KeyValueStoreReplicaStatus](sfclient-v80-model-keyvaluestorereplicastatus.md) | Key value store related information for the replica.<br/> |
| [KeyValueStoreReplicaStatus](sfclient-v80-model-keyvaluestorereplicastatus.md) | Key value store related information for the replica.<br/> |
| [LoadedPartitionInformationQueryDescription](sfclient-v80-model-loadedpartitioninformationquerydescription.md) | Represents data structure that contains query information.<br/> |
| [LoadedPartitionInformationResult](sfclient-v80-model-loadedpartitioninformationresult.md) | Represents partition information.<br/> |
| [LoadedPartitionInformationResultList](sfclient-v80-model-loadedpartitioninformationresultlist.md) | Represents data structure that contains top/least loaded partitions for a certain metric.<br/> |
| [LoadMetricInformation](sfclient-v80-model-loadmetricinformation.md) | Represents data structure that contains load information for a certain metric in a cluster.<br/> |
| [LoadMetricReport](sfclient-v80-model-loadmetricreport.md) | Represents the load metric report which contains the time metric was reported, its name and value.<br/> |
| [LoadMetricReportInfo](sfclient-v80-model-loadmetricreportinfo.md) | Information about load reported by replica.<br/> |
| [LocalNetworkResourceProperties](sfclient-v80-model-localnetworkresourceproperties.md) | Information about a Service Fabric container network local to a single Service Fabric cluster.<br/> |
| [LocalNetworkResourceProperties](sfclient-v80-model-localnetworkresourceproperties.md) | Information about a Service Fabric container network local to a single Service Fabric cluster.<br/> |
| [ManagedApplicationIdentity](sfclient-v80-model-managedapplicationidentity.md) | Describes a managed application identity.<br/> |
| [ManagedApplicationIdentityDescription](sfclient-v80-model-managedapplicationidentitydescription.md) | Managed application identity description.<br/> |
| [ManagedIdentityAzureBlobBackupStorageDescription](sfclient-v80-model-managedidentityazureblobbackupstoragedescription.md) | Describes the parameters for Azure blob store (connected using managed identity) used for storing and enumerating backups.<br/> |
| [ManagedIdentityAzureBlobBackupStorageDescription](sfclient-v80-model-managedidentityazureblobbackupstoragedescription.md) | Describes the parameters for Azure blob store (connected using managed identity) used for storing and enumerating backups.<br/> |
| [ManagedIdentityType enum](sfclient-v80-model-managedidentitytype.md) | The type of managed identity to be used to connect to Azure Blob Store via Managed Identity.<br/> |
| [MetricLoadDescription](sfclient-v80-model-metricloaddescription.md) | Specifies metric load information.<br/> |
| [MonitoringPolicyDescription](sfclient-v80-model-monitoringpolicydescription.md) | Describes the parameters for monitoring an upgrade in Monitored mode.<br/> |
| [MoveCost enum](sfclient-v80-model-movecost.md) | Specifies the move cost for the service.<br/> |
| [NameDescription](sfclient-v80-model-namedescription.md) | Describes a Service Fabric name.<br/> |
| [NamedPartitionInformation](sfclient-v80-model-namedpartitioninformation.md) | Describes the partition information for the name as a string that is based on partition schemes.<br/> |
| [NamedPartitionInformation](sfclient-v80-model-namedpartitioninformation.md) | Describes the partition information for the name as a string that is based on partition schemes.<br/> |
| [NamedPartitionSchemeDescription](sfclient-v80-model-namedpartitionschemedescription.md) | Describes the named partition scheme of the service.<br/> |
| [NamedPartitionSchemeDescription](sfclient-v80-model-namedpartitionschemedescription.md) | Describes the named partition scheme of the service.<br/> |
| [NetworkKind enum](sfclient-v80-model-networkkind.md) | The type of a Service Fabric container network.<br/> |
| [NetworkRef](sfclient-v80-model-networkref.md) | Describes a network reference in a service.<br/> |
| [NetworkResourceDescription](sfclient-v80-model-networkresourcedescription.md) | This type describes a network resource.<br/> |
| [NetworkResourceProperties](sfclient-v80-model-networkresourceproperties.md) | Describes properties of a network resource.<br/> |
| [NetworkResourcePropertiesBase](sfclient-v80-model-networkresourcepropertiesbase.md) | This type describes the properties of a network resource, including its kind.<br/> |
| [NodeAbortedEvent](sfclient-v80-model-nodeabortedevent.md) | Node Aborted event.<br/> |
| [NodeAbortedEvent](sfclient-v80-model-nodeabortedevent.md) | Node Aborted event.<br/> |
| [NodeAddedToClusterEvent](sfclient-v80-model-nodeaddedtoclusterevent.md) | Node Added event.<br/> |
| [NodeAddedToClusterEvent](sfclient-v80-model-nodeaddedtoclusterevent.md) | Node Added event.<br/> |
| [NodeClosedEvent](sfclient-v80-model-nodeclosedevent.md) | Node Closed event.<br/> |
| [NodeClosedEvent](sfclient-v80-model-nodeclosedevent.md) | Node Closed event.<br/> |
| [NodeDeactivateCompletedEvent](sfclient-v80-model-nodedeactivatecompletedevent.md) | Node Deactivate Completed event.<br/> |
| [NodeDeactivateCompletedEvent](sfclient-v80-model-nodedeactivatecompletedevent.md) | Node Deactivate Completed event.<br/> |
| [NodeDeactivateStartedEvent](sfclient-v80-model-nodedeactivatestartedevent.md) | Node Deactivate Started event.<br/> |
| [NodeDeactivateStartedEvent](sfclient-v80-model-nodedeactivatestartedevent.md) | Node Deactivate Started event.<br/> |
| [NodeDeactivationInfo](sfclient-v80-model-nodedeactivationinfo.md) | Information about the node deactivation. This information is valid for a node that is undergoing deactivation or has already been deactivated.<br/> |
| [NodeDeactivationIntent enum](sfclient-v80-model-nodedeactivationintent.md) | The intent or the reason for deactivating the node. Following are the possible values for it.<br/> |
| [NodeDeactivationStatus enum](sfclient-v80-model-nodedeactivationstatus.md) | The status of node deactivation operation. Following are the possible values.<br/> |
| [NodeDeactivationTask](sfclient-v80-model-nodedeactivationtask.md) | The task representing the deactivation operation on the node.<br/> |
| [NodeDeactivationTaskId](sfclient-v80-model-nodedeactivationtaskid.md) | Identity of the task related to deactivation operation on the node.<br/> |
| [NodeDeactivationTaskType enum](sfclient-v80-model-nodedeactivationtasktype.md) | The type of the task that performed the node deactivation. Following are the possible values.<br/> |
| [NodeDownEvent](sfclient-v80-model-nodedownevent.md) | Node Down event.<br/> |
| [NodeDownEvent](sfclient-v80-model-nodedownevent.md) | Node Down event.<br/> |
| [NodeEvent](sfclient-v80-model-nodeevent.md) | Represents the base for all Node Events.<br/> |
| [NodeEvent](sfclient-v80-model-nodeevent.md) | Represents the base for all Node Events.<br/> |
| [NodeHealth](sfclient-v80-model-nodehealth.md) | Information about the health of a Service Fabric node.<br/> |
| [NodeHealth](sfclient-v80-model-nodehealth.md) | Information about the health of a Service Fabric node.<br/> |
| [NodeHealthEvaluation](sfclient-v80-model-nodehealthevaluation.md) | Represents health evaluation for a node, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [NodeHealthEvaluation](sfclient-v80-model-nodehealthevaluation.md) | Represents health evaluation for a node, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [NodeHealthReportExpiredEvent](sfclient-v80-model-nodehealthreportexpiredevent.md) | Node Health Report Expired event.<br/> |
| [NodeHealthReportExpiredEvent](sfclient-v80-model-nodehealthreportexpiredevent.md) | Node Health Report Expired event.<br/> |
| [NodeHealthState](sfclient-v80-model-nodehealthstate.md) | Represents the health state of a node, which contains the node identifier and its aggregated health state.<br/> |
| [NodeHealthState](sfclient-v80-model-nodehealthstate.md) | Represents the health state of a node, which contains the node identifier and its aggregated health state.<br/> |
| [NodeHealthStateChunk](sfclient-v80-model-nodehealthstatechunk.md) | Represents the health state chunk of a node, which contains the node name and its aggregated health state.<br/> |
| [NodeHealthStateChunk](sfclient-v80-model-nodehealthstatechunk.md) | Represents the health state chunk of a node, which contains the node name and its aggregated health state.<br/> |
| [NodeHealthStateChunkList](sfclient-v80-model-nodehealthstatechunklist.md) | The list of node health state chunks in the cluster that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [NodeHealthStateChunkList](sfclient-v80-model-nodehealthstatechunklist.md) | The list of node health state chunks in the cluster that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [NodeHealthStateFilter](sfclient-v80-model-nodehealthstatefilter.md) | Defines matching criteria to determine whether a node should be included in the returned cluster health chunk.<br/>One filter can match zero, one or multiple nodes, depending on its properties.<br/>Can be specified in the cluster health chunk query description.<br/> |
| [NodeId](sfclient-v80-model-nodeid.md) | An internal ID used by Service Fabric to uniquely identify a node. Node Id is deterministically generated from node name.<br/> |
| [NodeImpact](sfclient-v80-model-nodeimpact.md) | Describes the expected impact of a repair to a particular node.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeInfo](sfclient-v80-model-nodeinfo.md) | Information about a node in Service Fabric cluster.<br/> |
| [NodeLoadInfo](sfclient-v80-model-nodeloadinfo.md) | Information about load on a Service Fabric node. It holds a summary of all metrics and their load on a node.<br/> |
| [NodeLoadMetricInformation](sfclient-v80-model-nodeloadmetricinformation.md) | Represents data structure that contains load information for a certain metric on a node.<br/> |
| [NodeNewHealthReportEvent](sfclient-v80-model-nodenewhealthreportevent.md) | Node Health Report Created event.<br/> |
| [NodeNewHealthReportEvent](sfclient-v80-model-nodenewhealthreportevent.md) | Node Health Report Created event.<br/> |
| [NodeOpenFailedEvent](sfclient-v80-model-nodeopenfailedevent.md) | Node Open Failed event.<br/> |
| [NodeOpenFailedEvent](sfclient-v80-model-nodeopenfailedevent.md) | Node Open Failed event.<br/> |
| [NodeOpenSucceededEvent](sfclient-v80-model-nodeopensucceededevent.md) | Node Opened Succeeded event.<br/> |
| [NodeOpenSucceededEvent](sfclient-v80-model-nodeopensucceededevent.md) | Node Opened Succeeded event.<br/> |
| [NodeRemovedFromClusterEvent](sfclient-v80-model-noderemovedfromclusterevent.md) | Node Removed event.<br/> |
| [NodeRemovedFromClusterEvent](sfclient-v80-model-noderemovedfromclusterevent.md) | Node Removed event.<br/> |
| [NodeRepairImpactDescription](sfclient-v80-model-noderepairimpactdescription.md) | Describes the expected impact of a repair on a set of nodes.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeRepairImpactDescription](sfclient-v80-model-noderepairimpactdescription.md) | Describes the expected impact of a repair on a set of nodes.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeRepairTargetDescription](sfclient-v80-model-noderepairtargetdescription.md) | Describes the list of nodes targeted by a repair action.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeRepairTargetDescription](sfclient-v80-model-noderepairtargetdescription.md) | Describes the list of nodes targeted by a repair action.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeResult](sfclient-v80-model-noderesult.md) | Contains information about a node that was targeted by a user-induced operation.<br/> |
| [NodesHealthEvaluation](sfclient-v80-model-nodeshealthevaluation.md) | Represents health evaluation for nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health and the aggregated health state is either Error or Warning.<br/> |
| [NodesHealthEvaluation](sfclient-v80-model-nodeshealthevaluation.md) | Represents health evaluation for nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health and the aggregated health state is either Error or Warning.<br/> |
| [NodeStatus enum](sfclient-v80-model-nodestatus.md) | The status of the node.<br/> |
| [NodeStatusFilter enum](sfclient-v80-model-nodestatusfilter.md) | Possible values include: 'default', 'all', 'up', 'down', 'enabling', 'disabling', 'disabled', 'unknown', 'removed'<br/> |
| [NodeTagsDescription](sfclient-v80-model-nodetagsdescription.md) | Describes the tags required for placement or running of the service.<br/> |
| [NodeTransitionProgress](sfclient-v80-model-nodetransitionprogress.md) | Information about an NodeTransition operation.  This class contains an OperationState and a NodeTransitionResult.  The NodeTransitionResult is not valid until OperationState<br/>is Completed or Faulted.<br/> |
| [NodeTransitionResult](sfclient-v80-model-nodetransitionresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [NodeTransitionType enum](sfclient-v80-model-nodetransitiontype.md) | Possible values include: 'Invalid', 'Start', 'Stop'<br/> |
| [NodeTypeHealthPolicyMapItem](sfclient-v80-model-nodetypehealthpolicymapitem.md) | Defines an item in NodeTypeHealthPolicyMap.<br/> |
| [NodeTypeNodesHealthEvaluation](sfclient-v80-model-nodetypenodeshealthevaluation.md) | Represents health evaluation for nodes of a particular node type. The node type nodes evaluation can be returned when cluster health evaluation returns unhealthy aggregated health state, either Error or Warning. It contains health evaluations for each unhealthy node of the included node type that impacted current aggregated health state.<br/> |
| [NodeTypeNodesHealthEvaluation](sfclient-v80-model-nodetypenodeshealthevaluation.md) | Represents health evaluation for nodes of a particular node type. The node type nodes evaluation can be returned when cluster health evaluation returns unhealthy aggregated health state, either Error or Warning. It contains health evaluations for each unhealthy node of the included node type that impacted current aggregated health state.<br/> |
| [NodeUpEvent](sfclient-v80-model-nodeupevent.md) | Node Up event.<br/> |
| [NodeUpEvent](sfclient-v80-model-nodeupevent.md) | Node Up event.<br/> |
| [NodeUpgradePhase enum](sfclient-v80-model-nodeupgradephase.md) | The state of the upgrading node.<br/> |
| [NodeUpgradeProgressInfo](sfclient-v80-model-nodeupgradeprogressinfo.md) | Information about the upgrading node and its status<br/> |
| [OperatingSystemType enum](sfclient-v80-model-operatingsystemtype.md) | The operation system required by the code in service.<br/> |
| [OperationState enum](sfclient-v80-model-operationstate.md) | The state of the operation.<br/> |
| [OperationStatus](sfclient-v80-model-operationstatus.md) | Contains the OperationId, OperationState, and OperationType for user-induced operations.<br/> |
| [OperationType enum](sfclient-v80-model-operationtype.md) | The type of the operation.<br/> |
| [Ordering enum](sfclient-v80-model-ordering.md) | Defines the order.<br/> |
| [PackageSharingPolicyInfo](sfclient-v80-model-packagesharingpolicyinfo.md) | Represents a policy for the package sharing.<br/> |
| [PackageSharingPolicyScope enum](sfclient-v80-model-packagesharingpolicyscope.md) | Represents the scope for PackageSharingPolicy. This is specified during DeployServicePackageToNode operation.<br/> |
| [PagedApplicationInfoList](sfclient-v80-model-pagedapplicationinfolist.md) | The list of applications in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedApplicationResourceDescriptionList](sfclient-v80-model-pagedapplicationresourcedescriptionlist.md) | The list of application resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedApplicationTypeInfoList](sfclient-v80-model-pagedapplicationtypeinfolist.md) | The list of application types that are provisioned or being provisioned in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedBackupConfigurationInfoList](sfclient-v80-model-pagedbackupconfigurationinfolist.md) | The list of backup configuration information. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedBackupEntityList](sfclient-v80-model-pagedbackupentitylist.md) | The list of backup entities that are being periodically backed. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedBackupInfoList](sfclient-v80-model-pagedbackupinfolist.md) | The list of backups. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedBackupPolicyDescriptionList](sfclient-v80-model-pagedbackuppolicydescriptionlist.md) | The list of backup policies configured in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedComposeDeploymentStatusInfoList](sfclient-v80-model-pagedcomposedeploymentstatusinfolist.md) | The list of compose deployments in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedDeployedApplicationInfoList](sfclient-v80-model-pageddeployedapplicationinfolist.md) | The list of deployed applications in activating, downloading, or active states on a node.<br/>The list is paged when all of the results cannot fit in a single message.<br/>The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedGatewayResourceDescriptionList](sfclient-v80-model-pagedgatewayresourcedescriptionlist.md) | The list of gateway resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedNetworkResourceDescriptionList](sfclient-v80-model-pagednetworkresourcedescriptionlist.md) | The list of network resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedNodeInfoList](sfclient-v80-model-pagednodeinfolist.md) | The list of nodes in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedPropertyInfoList](sfclient-v80-model-pagedpropertyinfolist.md) | The paged list of Service Fabric properties under a given name. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedReplicaInfoList](sfclient-v80-model-pagedreplicainfolist.md) | The list of replicas in the cluster for a given partition. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedSecretResourceDescriptionList](sfclient-v80-model-pagedsecretresourcedescriptionlist.md) | The list of secret resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedSecretValueResourceDescriptionList](sfclient-v80-model-pagedsecretvalueresourcedescriptionlist.md) | The list of values of a secret resource, paged if the number of results exceeds the limits of a single message. The next set of results can be obtained by executing the same query with the continuation token provided in the previous page.<br/> |
| [PagedServiceInfoList](sfclient-v80-model-pagedserviceinfolist.md) | The list of services in the cluster for an application. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedServicePartitionInfoList](sfclient-v80-model-pagedservicepartitioninfolist.md) | The list of partition in the cluster for a service. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedServiceReplicaDescriptionList](sfclient-v80-model-pagedservicereplicadescriptionlist.md) | The list of service resource replicas in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedServiceResourceDescriptionList](sfclient-v80-model-pagedserviceresourcedescriptionlist.md) | The list of service resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedSubNameInfoList](sfclient-v80-model-pagedsubnameinfolist.md) | A paged list of Service Fabric names. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedUpdatePartitionLoadResultList](sfclient-v80-model-pagedupdatepartitionloadresultlist.md) | The list of results of the call UpdatePartitionLoad. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedVolumeResourceDescriptionList](sfclient-v80-model-pagedvolumeresourcedescriptionlist.md) | The list of volume resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PartitionAccessStatus enum](sfclient-v80-model-partitionaccessstatus.md) | Specifies the access status of the partition.<br/> |
| [PartitionAnalysisEvent](sfclient-v80-model-partitionanalysisevent.md) | Represents the base for all Partition Analysis Events.<br/> |
| [PartitionAnalysisEvent](sfclient-v80-model-partitionanalysisevent.md) | Represents the base for all Partition Analysis Events.<br/> |
| [PartitionBackupConfigurationInfo](sfclient-v80-model-partitionbackupconfigurationinfo.md) | Backup configuration information, for a specific partition, specifying what backup policy is being applied and suspend description, if any.<br/> |
| [PartitionBackupConfigurationInfo](sfclient-v80-model-partitionbackupconfigurationinfo.md) | Backup configuration information, for a specific partition, specifying what backup policy is being applied and suspend description, if any.<br/> |
| [PartitionBackupEntity](sfclient-v80-model-partitionbackupentity.md) | Identifies the Service Fabric stateful partition which is being backed up.<br/> |
| [PartitionBackupEntity](sfclient-v80-model-partitionbackupentity.md) | Identifies the Service Fabric stateful partition which is being backed up.<br/> |
| [PartitionDataLossProgress](sfclient-v80-model-partitiondatalossprogress.md) | Information about a partition data loss user-induced operation.<br/> |
| [PartitionEvent](sfclient-v80-model-partitionevent.md) | Represents the base for all Partition Events.<br/> |
| [PartitionEvent](sfclient-v80-model-partitionevent.md) | Represents the base for all Partition Events.<br/> |
| [PartitionHealth](sfclient-v80-model-partitionhealth.md) | Information about the health of a Service Fabric partition.<br/> |
| [PartitionHealth](sfclient-v80-model-partitionhealth.md) | Information about the health of a Service Fabric partition.<br/> |
| [PartitionHealthEvaluation](sfclient-v80-model-partitionhealthevaluation.md) | Represents health evaluation for a partition, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [PartitionHealthEvaluation](sfclient-v80-model-partitionhealthevaluation.md) | Represents health evaluation for a partition, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [PartitionHealthReportExpiredEvent](sfclient-v80-model-partitionhealthreportexpiredevent.md) | Partition Health Report Expired event.<br/> |
| [PartitionHealthReportExpiredEvent](sfclient-v80-model-partitionhealthreportexpiredevent.md) | Partition Health Report Expired event.<br/> |
| [PartitionHealthState](sfclient-v80-model-partitionhealthstate.md) | Represents the health state of a partition, which contains the partition identifier and its aggregated health state.<br/> |
| [PartitionHealthState](sfclient-v80-model-partitionhealthstate.md) | Represents the health state of a partition, which contains the partition identifier and its aggregated health state.<br/> |
| [PartitionHealthStateChunk](sfclient-v80-model-partitionhealthstatechunk.md) | Represents the health state chunk of a partition, which contains the partition ID, its aggregated health state and any replicas that respect the filters in the cluster health chunk query description.<br/> |
| [PartitionHealthStateChunk](sfclient-v80-model-partitionhealthstatechunk.md) | Represents the health state chunk of a partition, which contains the partition ID, its aggregated health state and any replicas that respect the filters in the cluster health chunk query description.<br/> |
| [PartitionHealthStateChunkList](sfclient-v80-model-partitionhealthstatechunklist.md) | The list of partition health state chunks that respect the input filters in the chunk query description.<br/>Returned by get cluster health state chunks query as part of the parent application hierarchy.<br/> |
| [PartitionHealthStateFilter](sfclient-v80-model-partitionhealthstatefilter.md) | Defines matching criteria to determine whether a partition should be included as a child of a service in the cluster health chunk.<br/>The partitions are only returned if the parent entities match a filter specified in the cluster health chunk query description. The parent service and application must be included in the cluster health chunk.<br/>One filter can match zero, one or multiple partitions, depending on its properties.<br/> |
| [PartitionInformation](sfclient-v80-model-partitioninformation.md) | Information about the partition identity, partitioning scheme and keys supported by it.<br/> |
| [PartitionInstanceCountScaleMechanism](sfclient-v80-model-partitioninstancecountscalemechanism.md) | Represents a scaling mechanism for adding or removing instances of stateless service partition.<br/> |
| [PartitionInstanceCountScaleMechanism](sfclient-v80-model-partitioninstancecountscalemechanism.md) | Represents a scaling mechanism for adding or removing instances of stateless service partition.<br/> |
| [PartitionLoadInformation](sfclient-v80-model-partitionloadinformation.md) | Represents load information for a partition, which contains the primary and secondary reported load metrics.<br/>In case there is no load reported, PartitionLoadInformation will contain the default load for the service of the partition.<br/>For default loads, LoadMetricReport's LastReportedUtc is set to 0.<br/> |
| [PartitionMetricLoadDescription](sfclient-v80-model-partitionmetricloaddescription.md) | Represents load information for a partition, which contains the metrics load information about primary, all secondary replicas/instances or a specific secondary replica/instance located on a specific node.<br/> |
| [PartitionNewHealthReportEvent](sfclient-v80-model-partitionnewhealthreportevent.md) | Partition Health Report Created event.<br/> |
| [PartitionNewHealthReportEvent](sfclient-v80-model-partitionnewhealthreportevent.md) | Partition Health Report Created event.<br/> |
| [PartitionPrimaryMoveAnalysisEvent](sfclient-v80-model-partitionprimarymoveanalysisevent.md) | Partition Primary Move Analysis event.<br/> |
| [PartitionPrimaryMoveAnalysisEvent](sfclient-v80-model-partitionprimarymoveanalysisevent.md) | Partition Primary Move Analysis event.<br/> |
| [PartitionQuorumLossProgress](sfclient-v80-model-partitionquorumlossprogress.md) | Information about a partition quorum loss user-induced operation.<br/> |
| [PartitionReconfiguredEvent](sfclient-v80-model-partitionreconfiguredevent.md) | Partition Reconfiguration event.<br/> |
| [PartitionReconfiguredEvent](sfclient-v80-model-partitionreconfiguredevent.md) | Partition Reconfiguration event.<br/> |
| [PartitionRestartProgress](sfclient-v80-model-partitionrestartprogress.md) | Information about a partition restart user-induced operation.<br/> |
| [PartitionSafetyCheck](sfclient-v80-model-partitionsafetycheck.md) | Represents a safety check for the service partition being performed by service fabric before continuing with operations.<br/> |
| [PartitionScheme enum](sfclient-v80-model-partitionscheme.md) | Enumerates the ways that a service can be partitioned.<br/> |
| [PartitionSchemeDescription](sfclient-v80-model-partitionschemedescription.md) | Describes how the service is partitioned.<br/> |
| [PartitionsHealthEvaluation](sfclient-v80-model-partitionshealthevaluation.md) | Represents health evaluation for the partitions of a service, containing health evaluations for each unhealthy partition that impacts current aggregated health state. Can be returned when evaluating service health and the aggregated health state is either Error or Warning.<br/> |
| [PartitionsHealthEvaluation](sfclient-v80-model-partitionshealthevaluation.md) | Represents health evaluation for the partitions of a service, containing health evaluations for each unhealthy partition that impacts current aggregated health state. Can be returned when evaluating service health and the aggregated health state is either Error or Warning.<br/> |
| [PrimaryReplicatorStatus](sfclient-v80-model-primaryreplicatorstatus.md) | Provides statistics about the Service Fabric Replicator, when it is functioning in a Primary role.<br/> |
| [PrimaryReplicatorStatus](sfclient-v80-model-primaryreplicatorstatus.md) | Provides statistics about the Service Fabric Replicator, when it is functioning in a Primary role.<br/> |
| [Probe](sfclient-v80-model-probe.md) | Probes have a number of fields that you can use to control their behavior.<br/> |
| [ProbeExec](sfclient-v80-model-probeexec.md) | Exec command to run inside the container.<br/> |
| [ProbeHttpGet](sfclient-v80-model-probehttpget.md) | Http probe for the container.<br/> |
| [ProbeHttpGetHeaders](sfclient-v80-model-probehttpgetheaders.md) | Http headers.<br/> |
| [ProbeTcpSocket](sfclient-v80-model-probetcpsocket.md) | Tcp port to probe inside the container.<br/> |
| [PropertyBatchDescriptionList](sfclient-v80-model-propertybatchdescriptionlist.md) | Describes a list of property batch operations to be executed. Either all or none of the operations will be committed.<br/> |
| [PropertyBatchInfo](sfclient-v80-model-propertybatchinfo.md) | Information about the results of a property batch.<br/> |
| [PropertyBatchInfoKind enum](sfclient-v80-model-propertybatchinfokind.md) | The kind of property batch info, determined by the results of a property batch. The following are the possible values.<br/> |
| [PropertyBatchOperation](sfclient-v80-model-propertybatchoperation.md) | Represents the base type for property operations that can be put into a batch and submitted.<br/> |
| [PropertyBatchOperationKind enum](sfclient-v80-model-propertybatchoperationkind.md) | The kind of property batch operation, determined by the operation to be performed. The following are the possible values.<br/> |
| [PropertyDescription](sfclient-v80-model-propertydescription.md) | Description of a Service Fabric property.<br/> |
| [PropertyInfo](sfclient-v80-model-propertyinfo.md) | Information about a Service Fabric property.<br/> |
| [PropertyMetadata](sfclient-v80-model-propertymetadata.md) | The metadata associated with a property, including the property's name.<br/> |
| [PropertyValue](sfclient-v80-model-propertyvalue.md) | Describes a Service Fabric property value.<br/> |
| [PropertyValueKind enum](sfclient-v80-model-propertyvaluekind.md) | The kind of property, determined by the type of data. Following are the possible values.<br/> |
| [ProvisionApplicationTypeDescription](sfclient-v80-model-provisionapplicationtypedescription.md) | Describes the operation to register or provision an application type using an application package uploaded to the Service Fabric image store.<br/> |
| [ProvisionApplicationTypeDescription](sfclient-v80-model-provisionapplicationtypedescription.md) | Describes the operation to register or provision an application type using an application package uploaded to the Service Fabric image store.<br/> |
| [ProvisionApplicationTypeDescriptionBase](sfclient-v80-model-provisionapplicationtypedescriptionbase.md) | Represents the type of registration or provision requested, and if the operation needs to be asynchronous or not. Supported types of provision operations are from either image store or external store.<br/> |
| [ProvisionApplicationTypeKind enum](sfclient-v80-model-provisionapplicationtypekind.md) | The kind of application type registration or provision requested. The application package can be registered or provisioned either from the image store or from an external store. Following are the kinds of the application type provision.<br/> |
| [ProvisionFabricDescription](sfclient-v80-model-provisionfabricdescription.md) | Describes the parameters for provisioning a cluster.<br/> |
| [PutPropertyBatchOperation](sfclient-v80-model-putpropertybatchoperation.md) | Puts the specified property under the specified name.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [PutPropertyBatchOperation](sfclient-v80-model-putpropertybatchoperation.md) | Puts the specified property under the specified name.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [QuorumLossMode enum](sfclient-v80-model-quorumlossmode.md) | Possible values include: 'Invalid', 'QuorumReplicas', 'AllReplicas'<br/> |
| [ReconfigurationInformation](sfclient-v80-model-reconfigurationinformation.md) | Information about current reconfiguration like phase, type, previous configuration role of replica and reconfiguration start date time.<br/> |
| [ReconfigurationPhase enum](sfclient-v80-model-reconfigurationphase.md) | The reconfiguration phase of a replica of a stateful service.<br/> |
| [ReconfigurationType enum](sfclient-v80-model-reconfigurationtype.md) | The type of reconfiguration for replica of a stateful service.<br/> |
| [RegistryCredential](sfclient-v80-model-registrycredential.md) | Credential information to connect to container registry.<br/> |
| [ReliableCollectionsRef](sfclient-v80-model-reliablecollectionsref.md) | Specifying this parameter adds support for reliable collections<br/> |
| [RemoteReplicatorAcknowledgementDetail](sfclient-v80-model-remotereplicatoracknowledgementdetail.md) | Provides various statistics of the acknowledgements that are being received from the remote replicator.<br/> |
| [RemoteReplicatorAcknowledgementStatus](sfclient-v80-model-remotereplicatoracknowledgementstatus.md) | Provides details about the remote replicators from the primary replicator's point of view.<br/> |
| [RemoteReplicatorStatus](sfclient-v80-model-remotereplicatorstatus.md) | Represents the state of the secondary replicator from the primary replicator’s point of view.<br/> |
| [RepairImpactDescriptionBase](sfclient-v80-model-repairimpactdescriptionbase.md) | Describes the expected impact of executing a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairImpactKind enum](sfclient-v80-model-repairimpactkind.md) | Specifies the kind of the impact. This type supports the Service Fabric platform; it is not meant to be used directly from your code.'<br/> |
| [RepairTargetDescriptionBase](sfclient-v80-model-repairtargetdescriptionbase.md) | Describes the entities targeted by a repair action.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTargetKind enum](sfclient-v80-model-repairtargetkind.md) | Specifies the kind of the repair target. This type supports the Service Fabric platform; it is not meant to be used directly from your code.'<br/> |
| [RepairTask](sfclient-v80-model-repairtask.md) | Represents a repair task, which includes information about what kind of repair was requested, what its progress is, and what its final result was.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskApproveDescription](sfclient-v80-model-repairtaskapprovedescription.md) | Describes a request for forced approval of a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskCancelDescription](sfclient-v80-model-repairtaskcanceldescription.md) | Describes a request to cancel a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskDeleteDescription](sfclient-v80-model-repairtaskdeletedescription.md) | Describes a request to delete a completed repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskHealthCheckState enum](sfclient-v80-model-repairtaskhealthcheckstate.md) | Specifies the workflow state of a repair task's health check. This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskHistory](sfclient-v80-model-repairtaskhistory.md) | A record of the times when the repair task entered each state.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskUpdateHealthPolicyDescription](sfclient-v80-model-repairtaskupdatehealthpolicydescription.md) | Describes a request to update the health policy of a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskUpdateInfo](sfclient-v80-model-repairtaskupdateinfo.md) | Describes the result of an operation that created or updated a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [ReplicaEvent](sfclient-v80-model-replicaevent.md) | Represents the base for all Replica Events.<br/> |
| [ReplicaEvent](sfclient-v80-model-replicaevent.md) | Represents the base for all Replica Events.<br/> |
| [ReplicaHealth](sfclient-v80-model-replicahealth.md) | Represents a base class for stateful service replica or stateless service instance health.<br/>Contains the replica aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [ReplicaHealthEvaluation](sfclient-v80-model-replicahealthevaluation.md) | Represents health evaluation for a replica, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ReplicaHealthEvaluation](sfclient-v80-model-replicahealthevaluation.md) | Represents health evaluation for a replica, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ReplicaHealthReportServiceKind enum](sfclient-v80-model-replicahealthreportservicekind.md) | Possible values include: 'Stateless', 'Stateful'<br/> |
| [ReplicaHealthState](sfclient-v80-model-replicahealthstate.md) | Represents a base class for stateful service replica or stateless service instance health state.<br/> |
| [ReplicaHealthStateChunk](sfclient-v80-model-replicahealthstatechunk.md) | Represents the health state chunk of a stateful service replica or a stateless service instance.<br/>The replica health state contains the replica ID and its aggregated health state.<br/> |
| [ReplicaHealthStateChunk](sfclient-v80-model-replicahealthstatechunk.md) | Represents the health state chunk of a stateful service replica or a stateless service instance.<br/>The replica health state contains the replica ID and its aggregated health state.<br/> |
| [ReplicaHealthStateChunkList](sfclient-v80-model-replicahealthstatechunklist.md) | The list of replica health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ReplicaHealthStateFilter](sfclient-v80-model-replicahealthstatefilter.md) | Defines matching criteria to determine whether a replica should be included as a child of a partition in the cluster health chunk.<br/>The replicas are only returned if the parent entities match a filter specified in the cluster health chunk query description. The parent partition, service and application must be included in the cluster health chunk.<br/>One filter can match zero, one or multiple replicas, depending on its properties.<br/> |
| [ReplicaInfo](sfclient-v80-model-replicainfo.md) | Information about the identity, status, health, node name, uptime, and other details about the replica.<br/> |
| [ReplicaKind enum](sfclient-v80-model-replicakind.md) | The role of a replica of a stateful service.<br/> |
| [ReplicaLifecycleDescription](sfclient-v80-model-replicalifecycledescription.md) | Describes how the replica will behave<br/> |
| [ReplicaMetricLoadDescription](sfclient-v80-model-replicametricloaddescription.md) | Specifies metric loads of a partition's specific secondary replica or instance.<br/> |
| [ReplicaRole enum](sfclient-v80-model-replicarole.md) | The role of a replica of a stateful service.<br/> |
| [ReplicasHealthEvaluation](sfclient-v80-model-replicashealthevaluation.md) | Represents health evaluation for replicas, containing health evaluations for each unhealthy replica that impacted current aggregated health state. Can be returned when evaluating partition health and the aggregated health state is either Error or Warning.<br/> |
| [ReplicasHealthEvaluation](sfclient-v80-model-replicashealthevaluation.md) | Represents health evaluation for replicas, containing health evaluations for each unhealthy replica that impacted current aggregated health state. Can be returned when evaluating partition health and the aggregated health state is either Error or Warning.<br/> |
| [ReplicaStatus enum](sfclient-v80-model-replicastatus.md) | The status of a replica of a service.<br/> |
| [ReplicaStatusBase](sfclient-v80-model-replicastatusbase.md) | Information about the replica.<br/> |
| [ReplicatorOperationName enum](sfclient-v80-model-replicatoroperationname.md) | Specifies the operation currently being executed by the Replicator.<br/> |
| [ReplicatorQueueStatus](sfclient-v80-model-replicatorqueuestatus.md) | Provides various statistics of the queue used in the service fabric replicator.<br/>Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.<br/>Depending on the role of the replicator, the properties in this type imply different meanings.<br/> |
| [ReplicatorStatus](sfclient-v80-model-replicatorstatus.md) | Represents a base class for primary or secondary replicator status.<br/>Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.<br/> |
| [ResolvedServiceEndpoint](sfclient-v80-model-resolvedserviceendpoint.md) | Endpoint of a resolved service partition.<br/> |
| [ResolvedServicePartition](sfclient-v80-model-resolvedservicepartition.md) | Information about a service partition and its associated endpoints.<br/> |
| [ResourceLimits](sfclient-v80-model-resourcelimits.md) | This type describes the resource limits for a given container. It describes the most amount of resources a container is allowed to use before being restarted.<br/> |
| [ResourceRequests](sfclient-v80-model-resourcerequests.md) | This type describes the requested resources for a given container. It describes the least amount of resources required for the container. A container can consume more than requested resources up to the specified limits before being restarted. Currently, the requested resources are treated as limits.<br/> |
| [ResourceRequirements](sfclient-v80-model-resourcerequirements.md) | This type describes the resource requirements for a container or a service.<br/> |
| [ResourceStatus enum](sfclient-v80-model-resourcestatus.md) | Status of the resource.<br/> |
| [RestartDeployedCodePackageDescription](sfclient-v80-model-restartdeployedcodepackagedescription.md) | Defines description for restarting a deployed code package on Service Fabric node.<br/> |
| [RestartNodeDescription](sfclient-v80-model-restartnodedescription.md) | Describes the parameters to restart a Service Fabric node.<br/> |
| [RestartPartitionMode enum](sfclient-v80-model-restartpartitionmode.md) | Possible values include: 'Invalid', 'AllReplicasOrInstances', 'OnlyActiveSecondaries'<br/> |
| [RestartPartitionResult](sfclient-v80-model-restartpartitionresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [RestartPolicy enum](sfclient-v80-model-restartpolicy.md) | Enumerates the restart policy for RunToCompletionExecutionPolicy<br/> |
| [RestorePartitionDescription](sfclient-v80-model-restorepartitiondescription.md) | Specifies the parameters needed to trigger a restore of a specific partition.<br/> |
| [RestoreProgressInfo](sfclient-v80-model-restoreprogressinfo.md) | Describes the progress of a restore operation on a partition.<br/> |
| [RestoreState enum](sfclient-v80-model-restorestate.md) | Represents the current state of the partition restore operation.<br/> |
| [ResultStatus enum](sfclient-v80-model-resultstatus.md) | Possible values include: 'Invalid', 'Succeeded', 'Cancelled', 'Interrupted', 'Failed', 'Pending'<br/> |
| [ResumeApplicationUpgradeDescription](sfclient-v80-model-resumeapplicationupgradedescription.md) | Describes the parameters for resuming an unmonitored manual Service Fabric application upgrade<br/> |
| [ResumeClusterUpgradeDescription](sfclient-v80-model-resumeclusterupgradedescription.md) | Describes the parameters for resuming a cluster upgrade.<br/> |
| [RetentionPolicyDescription](sfclient-v80-model-retentionpolicydescription.md) | Describes the retention policy configured.<br/> |
| [RetentionPolicyType enum](sfclient-v80-model-retentionpolicytype.md) | The type of retention policy. Currently only "Basic" retention policy is supported.<br/> |
| [RollingUpgradeMode enum](sfclient-v80-model-rollingupgrademode.md) | The mode used to monitor health during a rolling upgrade. The values are UnmonitoredAuto, UnmonitoredManual, and Monitored.<br/> |
| [RollingUpgradeUpdateDescription](sfclient-v80-model-rollingupgradeupdatedescription.md) | Describes the parameters for updating a rolling upgrade of application or cluster.<br/> |
| [RunToCompletionExecutionPolicy](sfclient-v80-model-runtocompletionexecutionpolicy.md) | The run to completion execution policy, the service will perform its desired operation and complete successfully. If the service encounters failure, it will restarted based on restart policy specified. If the service completes its operation successfully, it will not be restarted again.<br/> |
| [RunToCompletionExecutionPolicy](sfclient-v80-model-runtocompletionexecutionpolicy.md) | The run to completion execution policy, the service will perform its desired operation and complete successfully. If the service encounters failure, it will restarted based on restart policy specified. If the service completes its operation successfully, it will not be restarted again.<br/> |
| [SafetyCheck](sfclient-v80-model-safetycheck.md) | Represents a safety check performed by service fabric before continuing with the operations. These checks ensure the availability of the service and the reliability of the state.<br/> |
| [SafetyCheckKind enum](sfclient-v80-model-safetycheckkind.md) | The kind of safety check performed by service fabric before continuing with the operations. These checks ensure the availability of the service and the reliability of the state. Following are the kinds of safety checks.<br/> |
| [SafetyCheckWrapper](sfclient-v80-model-safetycheckwrapper.md) | A wrapper for the safety check object. Safety checks are performed by service fabric before continuing with the operations. These checks ensure the availability of the service and the reliability of the state.<br/> |
| [ScalingMechanismDescription](sfclient-v80-model-scalingmechanismdescription.md) | Describes the mechanism for performing a scaling operation.<br/> |
| [ScalingMechanismKind enum](sfclient-v80-model-scalingmechanismkind.md) | Enumerates the ways that a service can be scaled.<br/> |
| [ScalingPolicyDescription](sfclient-v80-model-scalingpolicydescription.md) | Describes how the scaling should be performed<br/> |
| [ScalingTriggerDescription](sfclient-v80-model-scalingtriggerdescription.md) | Describes the trigger for performing a scaling operation.<br/> |
| [ScalingTriggerKind enum](sfclient-v80-model-scalingtriggerkind.md) | Enumerates the ways that a service can be scaled.<br/> |
| [Scheme enum](sfclient-v80-model-scheme.md) | Possible values include: 'http', 'https'<br/> |
| [SecondaryActiveReplicatorStatus](sfclient-v80-model-secondaryactivereplicatorstatus.md) | Status of the secondary replicator when it is in active mode and is part of the replica set.<br/> |
| [SecondaryActiveReplicatorStatus](sfclient-v80-model-secondaryactivereplicatorstatus.md) | Status of the secondary replicator when it is in active mode and is part of the replica set.<br/> |
| [SecondaryIdleReplicatorStatus](sfclient-v80-model-secondaryidlereplicatorstatus.md) | Status of the secondary replicator when it is in idle mode and is being built by the primary.<br/> |
| [SecondaryIdleReplicatorStatus](sfclient-v80-model-secondaryidlereplicatorstatus.md) | Status of the secondary replicator when it is in idle mode and is being built by the primary.<br/> |
| [SecondaryReplicatorStatus](sfclient-v80-model-secondaryreplicatorstatus.md) | Provides statistics about the Service Fabric Replicator, when it is functioning in a ActiveSecondary role.<br/> |
| [SecretKind enum](sfclient-v80-model-secretkind.md) | Describes the kind of secret.<br/> |
| [SecretResourceDescription](sfclient-v80-model-secretresourcedescription.md) | This type describes a secret resource.<br/> |
| [SecretResourceProperties](sfclient-v80-model-secretresourceproperties.md) | Describes the properties of a secret resource.<br/> |
| [SecretResourcePropertiesBase](sfclient-v80-model-secretresourcepropertiesbase.md) | This type describes the properties of a secret resource, including its kind.<br/> |
| [SecretValue](sfclient-v80-model-secretvalue.md) | This type represents the unencrypted value of the secret.<br/> |
| [SecretValueProperties](sfclient-v80-model-secretvalueproperties.md) | This type describes properties of secret value resource.<br/> |
| [SecretValueResourceDescription](sfclient-v80-model-secretvalueresourcedescription.md) | This type describes a value of a secret resource. The name of this resource is the version identifier corresponding to this secret value.<br/> |
| [SecretValueResourceProperties](sfclient-v80-model-secretvalueresourceproperties.md) | This type describes properties of a secret value resource.<br/> |
| [SecretValueResourceProperties](sfclient-v80-model-secretvalueresourceproperties.md) | This type describes properties of a secret value resource.<br/> |
| [SeedNodeSafetyCheck](sfclient-v80-model-seednodesafetycheck.md) | Represents a safety check for the seed nodes being performed by service fabric before continuing with node level operations.<br/> |
| [SeedNodeSafetyCheck](sfclient-v80-model-seednodesafetycheck.md) | Represents a safety check for the seed nodes being performed by service fabric before continuing with node level operations.<br/> |
| [SelectedPartition](sfclient-v80-model-selectedpartition.md) | This class returns information about the partition that the user-induced operation acted upon.<br/> |
| [ServiceBackupConfigurationInfo](sfclient-v80-model-servicebackupconfigurationinfo.md) | Backup configuration information for a specific Service Fabric service specifying what backup policy is being applied and suspend description, if any.<br/> |
| [ServiceBackupConfigurationInfo](sfclient-v80-model-servicebackupconfigurationinfo.md) | Backup configuration information for a specific Service Fabric service specifying what backup policy is being applied and suspend description, if any.<br/> |
| [ServiceBackupEntity](sfclient-v80-model-servicebackupentity.md) | Identifies the Service Fabric stateful service which is being backed up.<br/> |
| [ServiceBackupEntity](sfclient-v80-model-servicebackupentity.md) | Identifies the Service Fabric stateful service which is being backed up.<br/> |
| [ServiceCorrelationDescription](sfclient-v80-model-servicecorrelationdescription.md) | Creates a particular correlation between services.<br/> |
| [ServiceCorrelationScheme enum](sfclient-v80-model-servicecorrelationscheme.md) | The service correlation scheme.<br/> |
| [ServiceCreatedEvent](sfclient-v80-model-servicecreatedevent.md) | Service Created event.<br/> |
| [ServiceCreatedEvent](sfclient-v80-model-servicecreatedevent.md) | Service Created event.<br/> |
| [ServiceDeletedEvent](sfclient-v80-model-servicedeletedevent.md) | Service Deleted event.<br/> |
| [ServiceDeletedEvent](sfclient-v80-model-servicedeletedevent.md) | Service Deleted event.<br/> |
| [ServiceDescription](sfclient-v80-model-servicedescription.md) | A ServiceDescription contains all of the information necessary to create a service.<br/> |
| [ServiceEndpointRole enum](sfclient-v80-model-serviceendpointrole.md) | The role of the replica where the endpoint is reported.<br/> |
| [ServiceEvent](sfclient-v80-model-serviceevent.md) | Represents the base for all Service Events.<br/> |
| [ServiceEvent](sfclient-v80-model-serviceevent.md) | Represents the base for all Service Events.<br/> |
| [ServiceFromTemplateDescription](sfclient-v80-model-servicefromtemplatedescription.md) | Defines description for creating a Service Fabric service from a template defined in the application manifest.<br/> |
| [ServiceHealth](sfclient-v80-model-servicehealth.md) | Information about the health of a Service Fabric service.<br/> |
| [ServiceHealth](sfclient-v80-model-servicehealth.md) | Information about the health of a Service Fabric service.<br/> |
| [ServiceHealthEvaluation](sfclient-v80-model-servicehealthevaluation.md) | Represents health evaluation for a service, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ServiceHealthEvaluation](sfclient-v80-model-servicehealthevaluation.md) | Represents health evaluation for a service, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ServiceHealthReportExpiredEvent](sfclient-v80-model-servicehealthreportexpiredevent.md) | Service Health Report Expired event.<br/> |
| [ServiceHealthReportExpiredEvent](sfclient-v80-model-servicehealthreportexpiredevent.md) | Service Health Report Expired event.<br/> |
| [ServiceHealthState](sfclient-v80-model-servicehealthstate.md) | Represents the health state of a service, which contains the service identifier and its aggregated health state.<br/> |
| [ServiceHealthState](sfclient-v80-model-servicehealthstate.md) | Represents the health state of a service, which contains the service identifier and its aggregated health state.<br/> |
| [ServiceHealthStateChunk](sfclient-v80-model-servicehealthstatechunk.md) | Represents the health state chunk of a service, which contains the service name, its aggregated health state and any partitions that respect the filters in the cluster health chunk query description.<br/> |
| [ServiceHealthStateChunk](sfclient-v80-model-servicehealthstatechunk.md) | Represents the health state chunk of a service, which contains the service name, its aggregated health state and any partitions that respect the filters in the cluster health chunk query description.<br/> |
| [ServiceHealthStateChunkList](sfclient-v80-model-servicehealthstatechunklist.md) | The list of service health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ServiceHealthStateFilter](sfclient-v80-model-servicehealthstatefilter.md) | Defines matching criteria to determine whether a service should be included as a child of an application in the cluster health chunk.<br/>The services are only returned if the parent application matches a filter specified in the cluster health chunk query description.<br/>One filter can match zero, one or multiple services, depending on its properties.<br/> |
| [ServiceIdentity](sfclient-v80-model-serviceidentity.md) | Map service identity friendly name to an application identity.<br/> |
| [ServiceInfo](sfclient-v80-model-serviceinfo.md) | Information about a Service Fabric service.<br/> |
| [ServiceKind enum](sfclient-v80-model-servicekind.md) | The kind of service (Stateless or Stateful).<br/> |
| [ServiceLoadMetricDescription](sfclient-v80-model-serviceloadmetricdescription.md) | Specifies a metric to load balance a service during runtime.<br/> |
| [ServiceLoadMetricWeight enum](sfclient-v80-model-serviceloadmetricweight.md) | Determines the metric weight relative to the other metrics that are configured for this service. During runtime, if two metrics end up in conflict, the Cluster Resource Manager prefers the metric with the higher weight.<br/> |
| [ServiceNameInfo](sfclient-v80-model-servicenameinfo.md) | Information about the service name.<br/> |
| [ServiceNewHealthReportEvent](sfclient-v80-model-servicenewhealthreportevent.md) | Service Health Report Created event.<br/> |
| [ServiceNewHealthReportEvent](sfclient-v80-model-servicenewhealthreportevent.md) | Service Health Report Created event.<br/> |
| [ServiceOperationName enum](sfclient-v80-model-serviceoperationname.md) | Specifies the current active life-cycle operation on a stateful service replica or stateless service instance.<br/> |
| [ServicePackageActivationMode enum](sfclient-v80-model-servicepackageactivationmode.md) | The activation mode of service package to be used for a Service Fabric service. This is specified at the time of creating the Service.<br/> |
| [ServicePartitionInfo](sfclient-v80-model-servicepartitioninfo.md) | Information about a partition of a Service Fabric service.<br/> |
| [ServicePartitionKind enum](sfclient-v80-model-servicepartitionkind.md) | The kind of partitioning scheme used to partition the service.<br/> |
| [ServicePartitionStatus enum](sfclient-v80-model-servicepartitionstatus.md) | The status of the service fabric service partition.<br/> |
| [ServicePlacementAllowMultipleStatelessInstancesOnNodePolicyDescription](sfclient-v80-model-serviceplacementallowmultiplestatelessinstancesonnodepolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service allowing multiple stateless instances of a partition of the service to be placed on a node.<br/> |
| [ServicePlacementAllowMultipleStatelessInstancesOnNodePolicyDescription](sfclient-v80-model-serviceplacementallowmultiplestatelessinstancesonnodepolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service allowing multiple stateless instances of a partition of the service to be placed on a node.<br/> |
| [ServicePlacementInvalidDomainPolicyDescription](sfclient-v80-model-serviceplacementinvaliddomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where a particular fault or upgrade domain should not be used for placement of the instances or replicas of that service.<br/> |
| [ServicePlacementInvalidDomainPolicyDescription](sfclient-v80-model-serviceplacementinvaliddomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where a particular fault or upgrade domain should not be used for placement of the instances or replicas of that service.<br/> |
| [ServicePlacementNonPartiallyPlaceServicePolicyDescription](sfclient-v80-model-serviceplacementnonpartiallyplaceservicepolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where all replicas must be able to be placed in order for any replicas to be created.<br/> |
| [ServicePlacementNonPartiallyPlaceServicePolicyDescription](sfclient-v80-model-serviceplacementnonpartiallyplaceservicepolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where all replicas must be able to be placed in order for any replicas to be created.<br/> |
| [ServicePlacementPolicyDescription](sfclient-v80-model-serviceplacementpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service.<br/> |
| [ServicePlacementPolicyType enum](sfclient-v80-model-serviceplacementpolicytype.md) | The type of placement policy for a service fabric service. Following are the possible values.<br/> |
| [ServicePlacementPreferPrimaryDomainPolicyDescription](sfclient-v80-model-serviceplacementpreferprimarydomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where the service's Primary replicas should optimally be placed in a particular domain.<br/><br/>This placement policy is usually used with fault domains in scenarios where the Service Fabric cluster is geographically distributed in order to indicate that a service's primary replica should be located in a particular fault domain, which in geo-distributed scenarios usually aligns with regional or datacenter boundaries. Note that since this is an optimization it is possible that the Primary replica may not end up located in this domain due to failures, capacity limits, or other constraints.<br/> |
| [ServicePlacementPreferPrimaryDomainPolicyDescription](sfclient-v80-model-serviceplacementpreferprimarydomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where the service's Primary replicas should optimally be placed in a particular domain.<br/><br/>This placement policy is usually used with fault domains in scenarios where the Service Fabric cluster is geographically distributed in order to indicate that a service's primary replica should be located in a particular fault domain, which in geo-distributed scenarios usually aligns with regional or datacenter boundaries. Note that since this is an optimization it is possible that the Primary replica may not end up located in this domain due to failures, capacity limits, or other constraints.<br/> |
| [ServicePlacementRequiredDomainPolicyDescription](sfclient-v80-model-serviceplacementrequireddomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where the instances or replicas of that service must be placed in a particular domain<br/> |
| [ServicePlacementRequiredDomainPolicyDescription](sfclient-v80-model-serviceplacementrequireddomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where the instances or replicas of that service must be placed in a particular domain<br/> |
| [ServicePlacementRequireDomainDistributionPolicyDescription](sfclient-v80-model-serviceplacementrequiredomaindistributionpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where two replicas from the same partition should never be placed in the same fault or upgrade domain.<br/><br/>While this is not common it can expose the service to an increased risk of concurrent failures due to unplanned outages or other cases of subsequent/concurrent failures. As an example, consider a case where replicas are deployed across different data center, with one replica per location. In the event that one of the datacenters goes offline, normally the replica that was placed in that datacenter will be packed into one of the remaining datacenters. If this is not desirable then this policy should be set.<br/> |
| [ServicePlacementRequireDomainDistributionPolicyDescription](sfclient-v80-model-serviceplacementrequiredomaindistributionpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where two replicas from the same partition should never be placed in the same fault or upgrade domain.<br/><br/>While this is not common it can expose the service to an increased risk of concurrent failures due to unplanned outages or other cases of subsequent/concurrent failures. As an example, consider a case where replicas are deployed across different data center, with one replica per location. In the event that one of the datacenters goes offline, normally the replica that was placed in that datacenter will be packed into one of the remaining datacenters. If this is not desirable then this policy should be set.<br/> |
| [ServiceProperties](sfclient-v80-model-serviceproperties.md) | Describes properties of a service resource.<br/> |
| [ServiceReplicaDescription](sfclient-v80-model-servicereplicadescription.md) | Describes a replica of a service resource.<br/> |
| [ServiceReplicaDescription](sfclient-v80-model-servicereplicadescription.md) | Describes a replica of a service resource.<br/> |
| [ServiceReplicaProperties](sfclient-v80-model-servicereplicaproperties.md) | Describes the properties of a service replica.<br/> |
| [ServiceResourceDescription](sfclient-v80-model-serviceresourcedescription.md) | This type describes a service resource.<br/> |
| [ServiceResourceProperties](sfclient-v80-model-serviceresourceproperties.md) | This type describes properties of a service resource.<br/> |
| [ServicesHealthEvaluation](sfclient-v80-model-serviceshealthevaluation.md) | Represents health evaluation for services of a certain service type belonging to an application, containing health evaluations for each unhealthy service that impacted current aggregated health state. Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [ServicesHealthEvaluation](sfclient-v80-model-serviceshealthevaluation.md) | Represents health evaluation for services of a certain service type belonging to an application, containing health evaluations for each unhealthy service that impacted current aggregated health state. Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [ServiceStatus enum](sfclient-v80-model-servicestatus.md) | The status of the application.<br/> |
| [ServiceTypeDescription](sfclient-v80-model-servicetypedescription.md) | Describes a service type defined in the service manifest of a provisioned application type. The properties the ones defined in the service manifest.<br/> |
| [ServiceTypeExtensionDescription](sfclient-v80-model-servicetypeextensiondescription.md) | Describes extension of a service type defined in the service manifest.<br/> |
| [ServiceTypeHealthPolicy](sfclient-v80-model-servicetypehealthpolicy.md) | Represents the health policy used to evaluate the health of services belonging to a service type.<br/> |
| [ServiceTypeHealthPolicyMapItem](sfclient-v80-model-servicetypehealthpolicymapitem.md) | Defines an item in ServiceTypeHealthPolicyMap.<br/> |
| [ServiceTypeInfo](sfclient-v80-model-servicetypeinfo.md) | Information about a service type that is defined in a service manifest of a provisioned application type.<br/> |
| [ServiceTypeManifest](sfclient-v80-model-servicetypemanifest.md) | Contains the manifest describing a service type registered as part of an application in a Service Fabric cluster.<br/> |
| [ServiceTypeRegistrationStatus enum](sfclient-v80-model-servicetyperegistrationstatus.md) | The status of the service type registration on the node.<br/> |
| [ServiceUpdateDescription](sfclient-v80-model-serviceupdatedescription.md) | A ServiceUpdateDescription contains all of the information necessary to update a service.<br/> |
| [ServiceUpgradeProgress](sfclient-v80-model-serviceupgradeprogress.md) | Information about how many replicas are completed or pending for a specific service during upgrade.<br/> |
| [Setting](sfclient-v80-model-setting.md) | Describes a setting for the container. The setting file path can be fetched from environment variable "Fabric_SettingPath". The path for Windows container is "C:\\secrets". The path for Linux container is "/var/secrets".<br/> |
| [SettingType enum](sfclient-v80-model-settingtype.md) | The type of the setting being given in value<br/> |
| [SingletonPartitionInformation](sfclient-v80-model-singletonpartitioninformation.md) | Information about a partition that is singleton. The services with singleton partitioning scheme are effectively non-partitioned. They only have one partition.<br/> |
| [SingletonPartitionInformation](sfclient-v80-model-singletonpartitioninformation.md) | Information about a partition that is singleton. The services with singleton partitioning scheme are effectively non-partitioned. They only have one partition.<br/> |
| [SingletonPartitionSchemeDescription](sfclient-v80-model-singletonpartitionschemedescription.md) | Describes the partition scheme of a singleton-partitioned, or non-partitioned service.<br/> |
| [SingletonPartitionSchemeDescription](sfclient-v80-model-singletonpartitionschemedescription.md) | Describes the partition scheme of a singleton-partitioned, or non-partitioned service.<br/> |
| [SizeTypes enum](sfclient-v80-model-sizetypes.md) | Possible values include: 'Small', 'Medium', 'Large'<br/> |
| [StartClusterUpgradeDescription](sfclient-v80-model-startclusterupgradedescription.md) | Describes the parameters for starting a cluster upgrade.<br/> |
| [StartedChaosEvent](sfclient-v80-model-startedchaosevent.md) | Describes a Chaos event that gets generated when Chaos is started.<br/> |
| [StartedChaosEvent](sfclient-v80-model-startedchaosevent.md) | Describes a Chaos event that gets generated when Chaos is started.<br/> |
| [State enum](sfclient-v80-model-state.md) | Possible values include: 'Invalid', 'Created', 'Claimed', 'Preparing', 'Approved', 'Executing', 'Restoring', 'Completed'<br/> |
| [StatefulReplicaHealthReportExpiredEvent](sfclient-v80-model-statefulreplicahealthreportexpiredevent.md) | Stateful Replica Health Report Expired event.<br/> |
| [StatefulReplicaHealthReportExpiredEvent](sfclient-v80-model-statefulreplicahealthreportexpiredevent.md) | Stateful Replica Health Report Expired event.<br/> |
| [StatefulReplicaNewHealthReportEvent](sfclient-v80-model-statefulreplicanewhealthreportevent.md) | Stateful Replica Health Report Created event.<br/> |
| [StatefulReplicaNewHealthReportEvent](sfclient-v80-model-statefulreplicanewhealthreportevent.md) | Stateful Replica Health Report Created event.<br/> |
| [StatefulServiceDescription](sfclient-v80-model-statefulservicedescription.md) | Describes a stateful service.<br/> |
| [StatefulServiceDescription](sfclient-v80-model-statefulservicedescription.md) | Describes a stateful service.<br/> |
| [StatefulServiceInfo](sfclient-v80-model-statefulserviceinfo.md) | Information about a stateful Service Fabric service.<br/> |
| [StatefulServiceInfo](sfclient-v80-model-statefulserviceinfo.md) | Information about a stateful Service Fabric service.<br/> |
| [StatefulServicePartitionInfo](sfclient-v80-model-statefulservicepartitioninfo.md) | Information about a partition of a stateful Service Fabric service..<br/> |
| [StatefulServicePartitionInfo](sfclient-v80-model-statefulservicepartitioninfo.md) | Information about a partition of a stateful Service Fabric service..<br/> |
| [StatefulServiceReplicaHealth](sfclient-v80-model-statefulservicereplicahealth.md) | Represents the health of the stateful service replica.<br/>Contains the replica aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatefulServiceReplicaHealth](sfclient-v80-model-statefulservicereplicahealth.md) | Represents the health of the stateful service replica.<br/>Contains the replica aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatefulServiceReplicaHealthState](sfclient-v80-model-statefulservicereplicahealthstate.md) | Represents the health state of the stateful service replica, which contains the replica ID and the aggregated health state.<br/> |
| [StatefulServiceReplicaHealthState](sfclient-v80-model-statefulservicereplicahealthstate.md) | Represents the health state of the stateful service replica, which contains the replica ID and the aggregated health state.<br/> |
| [StatefulServiceReplicaInfo](sfclient-v80-model-statefulservicereplicainfo.md) | Represents a stateful service replica. This includes information about the identity, role, status, health, node name, uptime, and other details about the replica.<br/> |
| [StatefulServiceReplicaInfo](sfclient-v80-model-statefulservicereplicainfo.md) | Represents a stateful service replica. This includes information about the identity, role, status, health, node name, uptime, and other details about the replica.<br/> |
| [StatefulServiceTypeDescription](sfclient-v80-model-statefulservicetypedescription.md) | Describes a stateful service type defined in the service manifest of a provisioned application type.<br/> |
| [StatefulServiceTypeDescription](sfclient-v80-model-statefulservicetypedescription.md) | Describes a stateful service type defined in the service manifest of a provisioned application type.<br/> |
| [StatefulServiceUpdateDescription](sfclient-v80-model-statefulserviceupdatedescription.md) | Describes an update for a stateful service.<br/> |
| [StatefulServiceUpdateDescription](sfclient-v80-model-statefulserviceupdatedescription.md) | Describes an update for a stateful service.<br/> |
| [StatelessReplicaHealthReportExpiredEvent](sfclient-v80-model-statelessreplicahealthreportexpiredevent.md) | Stateless Replica Health Report Expired event.<br/> |
| [StatelessReplicaHealthReportExpiredEvent](sfclient-v80-model-statelessreplicahealthreportexpiredevent.md) | Stateless Replica Health Report Expired event.<br/> |
| [StatelessReplicaNewHealthReportEvent](sfclient-v80-model-statelessreplicanewhealthreportevent.md) | Stateless Replica Health Report Created event.<br/> |
| [StatelessReplicaNewHealthReportEvent](sfclient-v80-model-statelessreplicanewhealthreportevent.md) | Stateless Replica Health Report Created event.<br/> |
| [StatelessServiceDescription](sfclient-v80-model-statelessservicedescription.md) | Describes a stateless service.<br/> |
| [StatelessServiceDescription](sfclient-v80-model-statelessservicedescription.md) | Describes a stateless service.<br/> |
| [StatelessServiceInfo](sfclient-v80-model-statelessserviceinfo.md) | Information about a stateless Service Fabric service.<br/> |
| [StatelessServiceInfo](sfclient-v80-model-statelessserviceinfo.md) | Information about a stateless Service Fabric service.<br/> |
| [StatelessServiceInstanceHealth](sfclient-v80-model-statelessserviceinstancehealth.md) | Represents the health of the stateless service instance.<br/>Contains the instance aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatelessServiceInstanceHealth](sfclient-v80-model-statelessserviceinstancehealth.md) | Represents the health of the stateless service instance.<br/>Contains the instance aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatelessServiceInstanceHealthState](sfclient-v80-model-statelessserviceinstancehealthstate.md) | Represents the health state of the stateless service instance, which contains the instance ID and the aggregated health state.<br/> |
| [StatelessServiceInstanceHealthState](sfclient-v80-model-statelessserviceinstancehealthstate.md) | Represents the health state of the stateless service instance, which contains the instance ID and the aggregated health state.<br/> |
| [StatelessServiceInstanceInfo](sfclient-v80-model-statelessserviceinstanceinfo.md) | Represents a stateless service instance. This includes information about the identity, status, health, node name, uptime, and other details about the instance.<br/> |
| [StatelessServiceInstanceInfo](sfclient-v80-model-statelessserviceinstanceinfo.md) | Represents a stateless service instance. This includes information about the identity, status, health, node name, uptime, and other details about the instance.<br/> |
| [StatelessServicePartitionInfo](sfclient-v80-model-statelessservicepartitioninfo.md) | Information about a partition of a stateless Service Fabric service.<br/> |
| [StatelessServicePartitionInfo](sfclient-v80-model-statelessservicepartitioninfo.md) | Information about a partition of a stateless Service Fabric service.<br/> |
| [StatelessServiceTypeDescription](sfclient-v80-model-statelessservicetypedescription.md) | Describes a stateless service type defined in the service manifest of a provisioned application type.<br/> |
| [StatelessServiceTypeDescription](sfclient-v80-model-statelessservicetypedescription.md) | Describes a stateless service type defined in the service manifest of a provisioned application type.<br/> |
| [StatelessServiceUpdateDescription](sfclient-v80-model-statelessserviceupdatedescription.md) | Describes an update for a stateless service.<br/> |
| [StatelessServiceUpdateDescription](sfclient-v80-model-statelessserviceupdatedescription.md) | Describes an update for a stateless service.<br/> |
| [StoppedChaosEvent](sfclient-v80-model-stoppedchaosevent.md) | Describes a Chaos event that gets generated when Chaos stops because either the user issued a stop or the time to run was up.<br/> |
| [StoppedChaosEvent](sfclient-v80-model-stoppedchaosevent.md) | Describes a Chaos event that gets generated when Chaos stops because either the user issued a stop or the time to run was up.<br/> |
| [StringPropertyValue](sfclient-v80-model-stringpropertyvalue.md) | Describes a Service Fabric property value of type String.<br/> |
| [StringPropertyValue](sfclient-v80-model-stringpropertyvalue.md) | Describes a Service Fabric property value of type String.<br/> |
| [SuccessfulPropertyBatchInfo](sfclient-v80-model-successfulpropertybatchinfo.md) | Derived from PropertyBatchInfo. Represents the property batch succeeding. Contains the results of any "Get" operations in the batch.<br/> |
| [SuccessfulPropertyBatchInfo](sfclient-v80-model-successfulpropertybatchinfo.md) | Derived from PropertyBatchInfo. Represents the property batch succeeding. Contains the results of any "Get" operations in the batch.<br/> |
| [SystemApplicationHealthEvaluation](sfclient-v80-model-systemapplicationhealthevaluation.md) | Represents health evaluation for the fabric:/System application, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state of the cluster is either Error or Warning.<br/> |
| [SystemApplicationHealthEvaluation](sfclient-v80-model-systemapplicationhealthevaluation.md) | Represents health evaluation for the fabric:/System application, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state of the cluster is either Error or Warning.<br/> |
| [TcpConfig](sfclient-v80-model-tcpconfig.md) | Describes the tcp configuration for external connectivity for this network.<br/> |
| [TestErrorChaosEvent](sfclient-v80-model-testerrorchaosevent.md) | Describes a Chaos event that gets generated when an unexpected event occurs in the Chaos engine.<br/>For example, due to the cluster snapshot being inconsistent, while faulting an entity, Chaos found that the entity was already faulted -- which would be an unexpected event.<br/> |
| [TestErrorChaosEvent](sfclient-v80-model-testerrorchaosevent.md) | Describes a Chaos event that gets generated when an unexpected event occurs in the Chaos engine.<br/>For example, due to the cluster snapshot being inconsistent, while faulting an entity, Chaos found that the entity was already faulted -- which would be an unexpected event.<br/> |
| [TimeBasedBackupScheduleDescription](sfclient-v80-model-timebasedbackupscheduledescription.md) | Describes the time based backup schedule.<br/> |
| [TimeBasedBackupScheduleDescription](sfclient-v80-model-timebasedbackupscheduledescription.md) | Describes the time based backup schedule.<br/> |
| [TimeOfDay](sfclient-v80-model-timeofday.md) | Defines an hour and minute of the day specified in 24 hour time.<br/> |
| [TimeRange](sfclient-v80-model-timerange.md) | Defines a time range in a 24 hour day specified by a start and end time.<br/> |
| [UniformInt64RangePartitionSchemeDescription](sfclient-v80-model-uniformint64rangepartitionschemedescription.md) | Describes a partitioning scheme where an integer range is allocated evenly across a number of partitions.<br/> |
| [UniformInt64RangePartitionSchemeDescription](sfclient-v80-model-uniformint64rangepartitionschemedescription.md) | Describes a partitioning scheme where an integer range is allocated evenly across a number of partitions.<br/> |
| [UnplacedReplicaInformation](sfclient-v80-model-unplacedreplicainformation.md) | Contains information for an unplaced replica.<br/> |
| [UnprovisionApplicationTypeDescriptionInfo](sfclient-v80-model-unprovisionapplicationtypedescriptioninfo.md) | Describes the operation to unregister or unprovision an application type and its version that was registered with the Service Fabric.<br/> |
| [UnprovisionFabricDescription](sfclient-v80-model-unprovisionfabricdescription.md) | Describes the parameters for unprovisioning a cluster.<br/> |
| [UpdateClusterUpgradeDescription](sfclient-v80-model-updateclusterupgradedescription.md) | Parameters for updating a cluster upgrade.<br/> |
| [UpdatePartitionLoadResult](sfclient-v80-model-updatepartitionloadresult.md) | Specifies result of updating load for specified partitions. The output will be ordered based on the partition ID.<br/> |
| [UpgradeDomainDeltaNodesCheckHealthEvaluation](sfclient-v80-model-upgradedomaindeltanodescheckhealthevaluation.md) | Represents health evaluation for delta unhealthy cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when cluster aggregated health state is Warning or Error.<br/> |
| [UpgradeDomainDeltaNodesCheckHealthEvaluation](sfclient-v80-model-upgradedomaindeltanodescheckhealthevaluation.md) | Represents health evaluation for delta unhealthy cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when cluster aggregated health state is Warning or Error.<br/> |
| [UpgradeDomainInfo](sfclient-v80-model-upgradedomaininfo.md) | Information about an upgrade domain.<br/> |
| [UpgradeDomainNodesHealthEvaluation](sfclient-v80-model-upgradedomainnodeshealthevaluation.md) | Represents health evaluation for cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health during cluster upgrade and the aggregated health state is either Error or Warning.<br/> |
| [UpgradeDomainNodesHealthEvaluation](sfclient-v80-model-upgradedomainnodeshealthevaluation.md) | Represents health evaluation for cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health during cluster upgrade and the aggregated health state is either Error or Warning.<br/> |
| [UpgradeDomainState enum](sfclient-v80-model-upgradedomainstate.md) | The state of the upgrade domain.<br/> |
| [UpgradeKind enum](sfclient-v80-model-upgradekind.md) | The kind of upgrade out of the following possible values.<br/> |
| [UpgradeMode enum](sfclient-v80-model-upgrademode.md) | The mode used to monitor health during a rolling upgrade. The values are UnmonitoredAuto, UnmonitoredManual, and Monitored.<br/> |
| [UpgradeOrchestrationServiceState](sfclient-v80-model-upgradeorchestrationservicestate.md) | Service state of Service Fabric Upgrade Orchestration Service.<br/> |
| [UpgradeOrchestrationServiceStateSummary](sfclient-v80-model-upgradeorchestrationservicestatesummary.md) | Service state summary of Service Fabric Upgrade Orchestration Service.<br/> |
| [UpgradeSortOrder enum](sfclient-v80-model-upgradesortorder.md) | Defines the order in which an upgrade proceeds through the cluster.<br/> |
| [UpgradeState enum](sfclient-v80-model-upgradestate.md) | The state of the upgrade domain.<br/> |
| [UpgradeType enum](sfclient-v80-model-upgradetype.md) | The type of upgrade out of the following possible values.<br/> |
| [UploadChunkRange](sfclient-v80-model-uploadchunkrange.md) | Information about which portion of the file to upload.<br/> |
| [UploadSession](sfclient-v80-model-uploadsession.md) | Information about a image store upload session<br/> |
| [UploadSessionInfo](sfclient-v80-model-uploadsessioninfo.md) | Information about an image store upload session. A session is associated with a relative path in the image store.<br/> |
| [UsageInfo](sfclient-v80-model-usageinfo.md) | Information about how much space and how many files in the file system the ImageStore is using in this category<br/> |
| [ValidationFailedChaosEvent](sfclient-v80-model-validationfailedchaosevent.md) | Chaos event corresponding to a failure during validation.<br/> |
| [ValidationFailedChaosEvent](sfclient-v80-model-validationfailedchaosevent.md) | Chaos event corresponding to a failure during validation.<br/> |
| [VolumeProperties](sfclient-v80-model-volumeproperties.md) | Describes properties of a volume resource.<br/> |
| [VolumeProvider enum](sfclient-v80-model-volumeprovider.md) | Describes the provider of the volume resource.<br/> |
| [VolumeProviderParametersAzureFile](sfclient-v80-model-volumeproviderparametersazurefile.md) | This type describes a volume provided by an Azure Files file share.<br/> |
| [VolumeReference](sfclient-v80-model-volumereference.md) | Describes a reference to a volume resource.<br/> |
| [VolumeResourceDescription](sfclient-v80-model-volumeresourcedescription.md) | This type describes a volume resource.<br/> |
| [WaitForInbuildReplicaSafetyCheck](sfclient-v80-model-waitforinbuildreplicasafetycheck.md) | Safety check that waits for the replica build operation to finish. This indicates that there is a replica that is going through the copy or is providing data for building another replica. Bring the node down will abort this copy operation which are typically expensive involving data movements.<br/> |
| [WaitForInbuildReplicaSafetyCheck](sfclient-v80-model-waitforinbuildreplicasafetycheck.md) | Safety check that waits for the replica build operation to finish. This indicates that there is a replica that is going through the copy or is providing data for building another replica. Bring the node down will abort this copy operation which are typically expensive involving data movements.<br/> |
| [WaitForPrimaryPlacementSafetyCheck](sfclient-v80-model-waitforprimaryplacementsafetycheck.md) | Safety check that waits for the primary replica that was moved out of the node due to upgrade to be placed back again on that node.<br/> |
| [WaitForPrimaryPlacementSafetyCheck](sfclient-v80-model-waitforprimaryplacementsafetycheck.md) | Safety check that waits for the primary replica that was moved out of the node due to upgrade to be placed back again on that node.<br/> |
| [WaitForPrimarySwapSafetyCheck](sfclient-v80-model-waitforprimaryswapsafetycheck.md) | Safety check that waits for the primary replica to be moved out of the node before starting an upgrade to ensure the availability of the primary replica for the partition.<br/> |
| [WaitForPrimarySwapSafetyCheck](sfclient-v80-model-waitforprimaryswapsafetycheck.md) | Safety check that waits for the primary replica to be moved out of the node before starting an upgrade to ensure the availability of the primary replica for the partition.<br/> |
| [WaitForReconfigurationSafetyCheck](sfclient-v80-model-waitforreconfigurationsafetycheck.md) | Safety check that waits for the current reconfiguration of the partition to be completed before starting an upgrade.<br/> |
| [WaitForReconfigurationSafetyCheck](sfclient-v80-model-waitforreconfigurationsafetycheck.md) | Safety check that waits for the current reconfiguration of the partition to be completed before starting an upgrade.<br/> |
| [WaitingChaosEvent](sfclient-v80-model-waitingchaosevent.md) | Describes a Chaos event that gets generated when Chaos is waiting for the cluster to become ready for faulting, for example, Chaos may be waiting for the on-going upgrade to finish.<br/> |
| [WaitingChaosEvent](sfclient-v80-model-waitingchaosevent.md) | Describes a Chaos event that gets generated when Chaos is waiting for the cluster to become ready for faulting, for example, Chaos may be waiting for the on-going upgrade to finish.<br/> |

