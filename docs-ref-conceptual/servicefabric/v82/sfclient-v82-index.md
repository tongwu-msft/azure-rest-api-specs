---
title: "Service Fabric Client REST API Reference"
description: "Service Fabric Client REST API Reference"
ms.date: "10/20/2021"
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
>  These APIs work with Service Fabric clusters running runtime version 8.2.0.46 and above.
>

## Versioning
The REST APIs are versioned using the api-version query parameter in the URI.
All the REST APIs will always support api-version=MajorVersion.MinorVersion where the Major and Minor version number correspond to the version of the Service Fabric cluster runtime being targeted. 
For instance, while sending requests to a 6.0 cluster, api-version=6.0 is always guaranteed to work, with the latest contract supported by the REST API.
However, requests with api-version=6.0 will fail against a 5.5 cluster.
To maintain backward compatibility, the cluster will always support any previously supported api-version. So requests with api-version=1.0 or 2.0 or 3.0 will succeed against a 6.0 cluster. The response output will depend on the contract specified for the specific api-version.



## Protocol
All task operations conform to the HTTP/1.1 protocol specification. All task operations return standard HTTP status codes and may also return additional [Status and Error Codes](sfclient-v82-status-and-error-codes.md) in the response body. See [Service Fabric Names and JSON Serialization](sfclient-v82-service-fabric-names-and-json-serialization.md) for special considerations when serializing and de-serializing names and identities of various entities such as nodes, applications, services, partitions, and replicas in the Service Fabric cluster, to and from request and response. It is recommended that you secure request and responses. For more information, see [Authenticating Service Fabric REST Requests](sfclient-v82-authenticating-service-fabric-rest-requests.md). 


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

## Client API Reference
Following is a list of Service Fabric Client REST APIs.


----
## [Cluster APIs](sfclient-v82-index-cluster.md)

| Name | Description |
| --- | --- |
| [Get Cluster Manifest](sfclient-v82-api-getclustermanifest.md) | Get the Service Fabric cluster manifest.<br/> |
| [Get Cluster Health](sfclient-v82-api-getclusterhealth.md) | Gets the health of a Service Fabric cluster.<br/> |
| [Get Cluster Health Using Policy](sfclient-v82-api-getclusterhealthusingpolicy.md) | Gets the health of a Service Fabric cluster using the specified policy.<br/> |
| [Get Cluster Health Chunk](sfclient-v82-api-getclusterhealthchunk.md) | Gets the health of a Service Fabric cluster using health chunks.<br/> |
| [Get Cluster Health Chunk Using Policy And Advanced Filters](sfclient-v82-api-getclusterhealthchunkusingpolicyandadvancedfilters.md) | Gets the health of a Service Fabric cluster using health chunks.<br/> |
| [Report Cluster Health](sfclient-v82-api-reportclusterhealth.md) | Sends a health report on the Service Fabric cluster.<br/> |
| [Get Provisioned Fabric Code Version Info List](sfclient-v82-api-getprovisionedfabriccodeversioninfolist.md) | Gets a list of fabric code versions that are provisioned in a Service Fabric cluster.<br/> |
| [Get Provisioned Fabric Config Version Info List](sfclient-v82-api-getprovisionedfabricconfigversioninfolist.md) | Gets a list of fabric config versions that are provisioned in a Service Fabric cluster.<br/> |
| [Get Cluster Upgrade Progress](sfclient-v82-api-getclusterupgradeprogress.md) | Gets the progress of the current cluster upgrade.<br/> |
| [Get Cluster Configuration](sfclient-v82-api-getclusterconfiguration.md) | Get the Service Fabric standalone cluster configuration.<br/> |
| [Get Cluster Configuration Upgrade Status](sfclient-v82-api-getclusterconfigurationupgradestatus.md) | Get the cluster configuration upgrade status of a Service Fabric standalone cluster.<br/> |
| [Get Upgrade Orchestration Service State](sfclient-v82-api-getupgradeorchestrationservicestate.md) | Get the service state of Service Fabric Upgrade Orchestration Service.<br/> |
| [Set Upgrade Orchestration Service State](sfclient-v82-api-setupgradeorchestrationservicestate.md) | Update the service state of Service Fabric Upgrade Orchestration Service.<br/> |
| [Provision Cluster](sfclient-v82-api-provisioncluster.md) | Provision the code or configuration packages of a Service Fabric cluster.<br/> |
| [Unprovision Cluster](sfclient-v82-api-unprovisioncluster.md) | Unprovision the code or configuration packages of a Service Fabric cluster.<br/> |
| [Rollback Cluster Upgrade](sfclient-v82-api-rollbackclusterupgrade.md) | Roll back the upgrade of a Service Fabric cluster.<br/> |
| [Resume Cluster Upgrade](sfclient-v82-api-resumeclusterupgrade.md) | Make the cluster upgrade move on to the next upgrade domain.<br/> |
| [Start Cluster Upgrade](sfclient-v82-api-startclusterupgrade.md) | Start upgrading the code or configuration version of a Service Fabric cluster.<br/> |
| [Start Cluster Configuration Upgrade](sfclient-v82-api-startclusterconfigurationupgrade.md) | Start upgrading the configuration of a Service Fabric standalone cluster.<br/> |
| [Update Cluster Upgrade](sfclient-v82-api-updateclusterupgrade.md) | Update the upgrade parameters of a Service Fabric cluster upgrade.<br/> |
| [Get Aad Metadata](sfclient-v82-api-getaadmetadata.md) | Gets the Azure Active Directory metadata used for secured connection to cluster.<br/> |
| [Get Cluster Version](sfclient-v82-api-getclusterversion.md) | Get the current Service Fabric cluster version.<br/> |
| [Get Cluster Load](sfclient-v82-api-getclusterload.md) | Gets the load of a Service Fabric cluster.<br/> |
| [Toggle Verbose Service Placement Health Reporting](sfclient-v82-api-toggleverboseserviceplacementhealthreporting.md) | Changes the verbosity of service placement health reporting.<br/> |
| [Validate Cluster Upgrade](sfclient-v82-api-validateclusterupgrade.md) | Validate and assess the impact of a code or configuration version update of a Service Fabric cluster.<br/> |

----
## [Node APIs](sfclient-v82-index-node.md)

| Name | Description |
| --- | --- |
| [Get Node Info List](sfclient-v82-api-getnodeinfolist.md) | Gets the list of nodes in the Service Fabric cluster.<br/> |
| [Get Node Info](sfclient-v82-api-getnodeinfo.md) | Gets the information about a specific node in the Service Fabric cluster.<br/> |
| [Get Node Health](sfclient-v82-api-getnodehealth.md) | Gets the health of a Service Fabric node.<br/> |
| [Get Node Health Using Policy](sfclient-v82-api-getnodehealthusingpolicy.md) | Gets the health of a Service Fabric node, by using the specified health policy.<br/> |
| [Report Node Health](sfclient-v82-api-reportnodehealth.md) | Sends a health report on the Service Fabric node.<br/> |
| [Get Node Load Info](sfclient-v82-api-getnodeloadinfo.md) | Gets the load information of a Service Fabric node.<br/> |
| [Disable Node](sfclient-v82-api-disablenode.md) | Deactivate a Service Fabric cluster node with the specified deactivation intent.<br/> |
| [Enable Node](sfclient-v82-api-enablenode.md) | Activate a Service Fabric cluster node that is currently deactivated.<br/> |
| [Remove Node State](sfclient-v82-api-removenodestate.md) | Notifies Service Fabric that the persisted state on a node has been permanently removed or lost.<br/> |
| [Restart Node](sfclient-v82-api-restartnode.md) | Restarts a Service Fabric cluster node.<br/> |
| [Remove Configuration Overrides](sfclient-v82-api-removeconfigurationoverrides.md) | Removes configuration overrides on the specified node.<br/> |
| [Get Configuration Overrides](sfclient-v82-api-getconfigurationoverrides.md) | Gets the list of configuration overrides on the specified node.<br/> |
| [Add Configuration Parameter Overrides](sfclient-v82-api-addconfigurationparameteroverrides.md) | Adds the list of configuration overrides on the specified node.<br/> |
| [Remove Node Tags](sfclient-v82-api-removenodetags.md) | Removes the list of tags from the specified node.<br/> |
| [Add Node Tags](sfclient-v82-api-addnodetags.md) | Adds the list of tags on the specified node.<br/> |

----
## [ApplicationType APIs](sfclient-v82-index-applicationtype.md)

| Name | Description |
| --- | --- |
| [Get Application Type Info List](sfclient-v82-api-getapplicationtypeinfolist.md) | Gets the list of application types in the Service Fabric cluster.<br/> |
| [Get Application Type Info List By Name](sfclient-v82-api-getapplicationtypeinfolistbyname.md) | Gets the list of application types in the Service Fabric cluster matching exactly the specified name.<br/> |
| [Provision Application Type](sfclient-v82-api-provisionapplicationtype.md) | Provisions or registers a Service Fabric application type with the cluster using the '.sfpkg' package in the external store or using the application package in the image store.<br/> |
| [Unprovision Application Type](sfclient-v82-api-unprovisionapplicationtype.md) | Removes or unregisters a Service Fabric application type from the cluster.<br/> |
| [Get Application Manifest](sfclient-v82-api-getapplicationmanifest.md) | Gets the manifest describing an application type.<br/> |

----
## [ServiceType APIs](sfclient-v82-index-servicetype.md)

| Name | Description |
| --- | --- |
| [Get Service Type Info List](sfclient-v82-api-getservicetypeinfolist.md) | Gets the list containing the information about service types that are supported by a provisioned application type in a Service Fabric cluster.<br/> |
| [Get Service Type Info By Name](sfclient-v82-api-getservicetypeinfobyname.md) | Gets the information about a specific service type that is supported by a provisioned application type in a Service Fabric cluster.<br/> |
| [Get Service Manifest](sfclient-v82-api-getservicemanifest.md) | Gets the manifest describing a service type.<br/> |
| [Get Deployed Service Type Info List](sfclient-v82-api-getdeployedservicetypeinfolist.md) | Gets the list containing the information about service types from the applications deployed on a node in a Service Fabric cluster.<br/> |
| [Get Deployed Service Type Info By Name](sfclient-v82-api-getdeployedservicetypeinfobyname.md) | Gets the information about a specified service type of the application deployed on a node in a Service Fabric cluster.<br/> |

----
## [Application APIs](sfclient-v82-index-application.md)

| Name | Description |
| --- | --- |
| [Create Application](sfclient-v82-api-createapplication.md) | Creates a Service Fabric application.<br/> |
| [Delete Application](sfclient-v82-api-deleteapplication.md) | Deletes an existing Service Fabric application.<br/> |
| [Get Application Load Info](sfclient-v82-api-getapplicationloadinfo.md) | Gets load information about a Service Fabric application.<br/> |
| [Get Application Info List](sfclient-v82-api-getapplicationinfolist.md) | Gets the list of applications created in the Service Fabric cluster that match the specified filters.<br/> |
| [Get Application Info](sfclient-v82-api-getapplicationinfo.md) | Gets information about a Service Fabric application.<br/> |
| [Get Application Health](sfclient-v82-api-getapplicationhealth.md) | Gets the health of the service fabric application.<br/> |
| [Get Application Health Using Policy](sfclient-v82-api-getapplicationhealthusingpolicy.md) | Gets the health of a Service Fabric application using the specified policy.<br/> |
| [Report Application Health](sfclient-v82-api-reportapplicationhealth.md) | Sends a health report on the Service Fabric application.<br/> |
| [Start Application Upgrade](sfclient-v82-api-startapplicationupgrade.md) | Starts upgrading an application in the Service Fabric cluster.<br/> |
| [Get Application Upgrade](sfclient-v82-api-getapplicationupgrade.md) | Gets details for the latest upgrade performed on this application.<br/> |
| [Update Application Upgrade](sfclient-v82-api-updateapplicationupgrade.md) | Updates an ongoing application upgrade in the Service Fabric cluster.<br/> |
| [Update Application](sfclient-v82-api-updateapplication.md) | Updates a Service Fabric application.<br/> |
| [Resume Application Upgrade](sfclient-v82-api-resumeapplicationupgrade.md) | Resumes upgrading an application in the Service Fabric cluster.<br/> |
| [Rollback Application Upgrade](sfclient-v82-api-rollbackapplicationupgrade.md) | Starts rolling back the currently on-going upgrade of an application in the Service Fabric cluster.<br/> |
| [Get Deployed Application Info List](sfclient-v82-api-getdeployedapplicationinfolist.md) | Gets the list of applications deployed on a Service Fabric node.<br/> |
| [Get Deployed Application Info](sfclient-v82-api-getdeployedapplicationinfo.md) | Gets the information about an application deployed on a Service Fabric node.<br/> |
| [Get Deployed Application Health](sfclient-v82-api-getdeployedapplicationhealth.md) | Gets the information about health of an application deployed on a Service Fabric node.<br/> |
| [Get Deployed Application Health Using Policy](sfclient-v82-api-getdeployedapplicationhealthusingpolicy.md) | Gets the information about health of an application deployed on a Service Fabric node. using the specified policy.<br/> |
| [Report Deployed Application Health](sfclient-v82-api-reportdeployedapplicationhealth.md) | Sends a health report on the Service Fabric application deployed on a Service Fabric node.<br/> |

----
## [Service APIs](sfclient-v82-index-service.md)

| Name | Description |
| --- | --- |
| [Get Service Info List](sfclient-v82-api-getserviceinfolist.md) | Gets the information about all services belonging to the application specified by the application ID.<br/> |
| [Get Service Info](sfclient-v82-api-getserviceinfo.md) | Gets the information about the specific service belonging to the Service Fabric application.<br/> |
| [Get Application Name Info](sfclient-v82-api-getapplicationnameinfo.md) | Gets the name of the Service Fabric application for a service.<br/> |
| [Create Service](sfclient-v82-api-createservice.md) | Creates the specified Service Fabric service.<br/> |
| [Create Service From Template](sfclient-v82-api-createservicefromtemplate.md) | Creates a Service Fabric service from the service template.<br/> |
| [Delete Service](sfclient-v82-api-deleteservice.md) | Deletes an existing Service Fabric service.<br/> |
| [Update Service](sfclient-v82-api-updateservice.md) | Updates a Service Fabric service using the specified update description.<br/> |
| [Get Service Description](sfclient-v82-api-getservicedescription.md) | Gets the description of an existing Service Fabric service.<br/> |
| [Get Service Health](sfclient-v82-api-getservicehealth.md) | Gets the health of the specified Service Fabric service.<br/> |
| [Get Service Health Using Policy](sfclient-v82-api-getservicehealthusingpolicy.md) | Gets the health of the specified Service Fabric service, by using the specified health policy.<br/> |
| [Report Service Health](sfclient-v82-api-reportservicehealth.md) | Sends a health report on the Service Fabric service.<br/> |
| [Resolve Service](sfclient-v82-api-resolveservice.md) | Resolve a Service Fabric partition.<br/> |
| [Get Unplaced Replica Information](sfclient-v82-api-getunplacedreplicainformation.md) | Gets the information about unplaced replica of the service.<br/> |

----
## [Partition APIs](sfclient-v82-index-partition.md)

| Name | Description |
| --- | --- |
| [Get Loaded Partition Info List](sfclient-v82-api-getloadedpartitioninfolist.md) | Gets ordered list of partitions.<br/> |
| [Get Partition Info List](sfclient-v82-api-getpartitioninfolist.md) | Gets the list of partitions of a Service Fabric service.<br/> |
| [Get Partition Info](sfclient-v82-api-getpartitioninfo.md) | Gets the information about a Service Fabric partition.<br/> |
| [Get Service Name Info](sfclient-v82-api-getservicenameinfo.md) | Gets the name of the Service Fabric service for a partition.<br/> |
| [Get Partition Health](sfclient-v82-api-getpartitionhealth.md) | Gets the health of the specified Service Fabric partition.<br/> |
| [Get Partition Health Using Policy](sfclient-v82-api-getpartitionhealthusingpolicy.md) | Gets the health of the specified Service Fabric partition, by using the specified health policy.<br/> |
| [Report Partition Health](sfclient-v82-api-reportpartitionhealth.md) | Sends a health report on the Service Fabric partition.<br/> |
| [Get Partition Load Information](sfclient-v82-api-getpartitionloadinformation.md) | Gets the load information of the specified Service Fabric partition.<br/> |
| [Reset Partition Load](sfclient-v82-api-resetpartitionload.md) | Resets the current load of a Service Fabric partition.<br/> |
| [Recover Partition](sfclient-v82-api-recoverpartition.md) | Indicates to the Service Fabric cluster that it should attempt to recover a specific partition that is currently stuck in quorum loss.<br/> |
| [Recover Service Partitions](sfclient-v82-api-recoverservicepartitions.md) | Indicates to the Service Fabric cluster that it should attempt to recover the specified service that is currently stuck in quorum loss.<br/> |
| [Recover System Partitions](sfclient-v82-api-recoversystempartitions.md) | Indicates to the Service Fabric cluster that it should attempt to recover the system services that are currently stuck in quorum loss.<br/> |
| [Recover All Partitions](sfclient-v82-api-recoverallpartitions.md) | Indicates to the Service Fabric cluster that it should attempt to recover any services (including system services) which are currently stuck in quorum loss.<br/> |
| [Move Primary Replica](sfclient-v82-api-moveprimaryreplica.md) | Moves the primary replica of a partition of a stateful service.<br/> |
| [Move Secondary Replica](sfclient-v82-api-movesecondaryreplica.md) | Moves the secondary replica of a partition of a stateful service.<br/> |
| [Update Partition Load](sfclient-v82-api-updatepartitionload.md) | Update the loads of provided partitions for specific metrics.<br/> |
| [Move Instance](sfclient-v82-api-moveinstance.md) | Moves the instance of a partition of a stateless service.<br/> |
| [Move Auxiliary Replica](sfclient-v82-api-moveauxiliaryreplica.md) | Moves the auxiliary replica of a partition of a stateful service.<br/> |

----
## [RepairManagement APIs](sfclient-v82-index-repairmanagement.md)

| Name | Description |
| --- | --- |
| [Create Repair Task](sfclient-v82-api-createrepairtask.md) | Creates a new repair task.<br/> |
| [Cancel Repair Task](sfclient-v82-api-cancelrepairtask.md) | Requests the cancellation of the given repair task.<br/> |
| [Delete Repair Task](sfclient-v82-api-deleterepairtask.md) | Deletes a completed repair task.<br/> |
| [Get Repair Task List](sfclient-v82-api-getrepairtasklist.md) | Gets a list of repair tasks matching the given filters.<br/> |
| [Force Approve Repair Task](sfclient-v82-api-forceapproverepairtask.md) | Forces the approval of the given repair task.<br/> |
| [Update Repair Task Health Policy](sfclient-v82-api-updaterepairtaskhealthpolicy.md) | Updates the health policy of the given repair task.<br/> |
| [Update Repair Execution State](sfclient-v82-api-updaterepairexecutionstate.md) | Updates the execution state of a repair task.<br/> |

----
## [Replica APIs](sfclient-v82-index-replica.md)

| Name | Description |
| --- | --- |
| [Get Replica Info List](sfclient-v82-api-getreplicainfolist.md) | Gets the information about replicas of a Service Fabric service partition.<br/> |
| [Get Replica Info](sfclient-v82-api-getreplicainfo.md) | Gets the information about a replica of a Service Fabric partition.<br/> |
| [Get Replica Health](sfclient-v82-api-getreplicahealth.md) | Gets the health of a Service Fabric stateful service replica or stateless service instance.<br/> |
| [Get Replica Health Using Policy](sfclient-v82-api-getreplicahealthusingpolicy.md) | Gets the health of a Service Fabric stateful service replica or stateless service instance using the specified policy.<br/> |
| [Report Replica Health](sfclient-v82-api-reportreplicahealth.md) | Sends a health report on the Service Fabric replica.<br/> |
| [Get Deployed Service Replica Info List](sfclient-v82-api-getdeployedservicereplicainfolist.md) | Gets the list of replicas deployed on a Service Fabric node.<br/> |
| [Get Deployed Service Replica Detail Info](sfclient-v82-api-getdeployedservicereplicadetailinfo.md) | Gets the details of replica deployed on a Service Fabric node.<br/> |
| [Get Deployed Service Replica Detail Info By Partition Id](sfclient-v82-api-getdeployedservicereplicadetailinfobypartitionid.md) | Gets the details of replica deployed on a Service Fabric node.<br/> |
| [Restart Replica](sfclient-v82-api-restartreplica.md) | Restarts a service replica of a persisted service running on a node.<br/> |
| [Remove Replica](sfclient-v82-api-removereplica.md) | Removes a service replica running on a node.<br/> |

----
## [Service Package APIs](sfclient-v82-index-service-package.md)

| Name | Description |
| --- | --- |
| [Get Deployed Service Package Info List](sfclient-v82-api-getdeployedservicepackageinfolist.md) | Gets the list of service packages deployed on a Service Fabric node.<br/> |
| [Get Deployed Service Package Info List By Name](sfclient-v82-api-getdeployedservicepackageinfolistbyname.md) | Gets the list of service packages deployed on a Service Fabric node matching exactly the specified name.<br/> |
| [Get Deployed Service Package Health](sfclient-v82-api-getdeployedservicepackagehealth.md) | Gets the information about health of a service package for a specific application deployed for a Service Fabric node and application.<br/> |
| [Get Deployed Service Package Health Using Policy](sfclient-v82-api-getdeployedservicepackagehealthusingpolicy.md) | Gets the information about health of service package for a specific application deployed on a Service Fabric node using the specified policy.<br/> |
| [Report Deployed Service Package Health](sfclient-v82-api-reportdeployedservicepackagehealth.md) | Sends a health report on the Service Fabric deployed service package.<br/> |
| [Deploy Service Package To Node](sfclient-v82-api-deployservicepackagetonode.md) | Downloads all of the code packages associated with specified service manifest on the specified node.<br/> |

----
## [Code Package APIs](sfclient-v82-index-code-package.md)

| Name | Description |
| --- | --- |
| [Get Deployed Code Package Info List](sfclient-v82-api-getdeployedcodepackageinfolist.md) | Gets the list of code packages deployed on a Service Fabric node.<br/> |
| [Restart Deployed Code Package](sfclient-v82-api-restartdeployedcodepackage.md) | Restarts a code package deployed on a Service Fabric node in a cluster.<br/> |
| [Get Container Logs Deployed On Node](sfclient-v82-api-getcontainerlogsdeployedonnode.md) | Gets the container logs for container deployed on a Service Fabric node.<br/> |
| [Invoke Container Api](sfclient-v82-api-invokecontainerapi.md) | Invoke container API on a container deployed on a Service Fabric node.<br/> |

----
## [Compose Deployment APIs](sfclient-v82-index-compose-deployment.md)

| Name | Description |
| --- | --- |
| [Create Compose Deployment](sfclient-v82-api-createcomposedeployment.md) | Creates a Service Fabric compose deployment.<br/> |
| [Get Compose Deployment Status](sfclient-v82-api-getcomposedeploymentstatus.md) | Gets information about a Service Fabric compose deployment.<br/> |
| [Get Compose Deployment Status List](sfclient-v82-api-getcomposedeploymentstatuslist.md) | Gets the list of compose deployments created in the Service Fabric cluster.<br/> |
| [Get Compose Deployment Upgrade Progress](sfclient-v82-api-getcomposedeploymentupgradeprogress.md) | Gets details for the latest upgrade performed on this Service Fabric compose deployment.<br/> |
| [Remove Compose Deployment](sfclient-v82-api-removecomposedeployment.md) | Deletes an existing Service Fabric compose deployment from cluster.<br/> |
| [Start Compose Deployment Upgrade](sfclient-v82-api-startcomposedeploymentupgrade.md) | Starts upgrading a compose deployment in the Service Fabric cluster.<br/> |
| [Start Rollback Compose Deployment Upgrade](sfclient-v82-api-startrollbackcomposedeploymentupgrade.md) | Starts rolling back a compose deployment upgrade in the Service Fabric cluster.<br/> |

----
## [Chaos APIs](sfclient-v82-index-chaos.md)

| Name | Description |
| --- | --- |
| [Get Chaos](sfclient-v82-api-getchaos.md) | Get the status of Chaos.<br/> |
| [Start Chaos](sfclient-v82-api-startchaos.md) | Starts Chaos in the cluster.<br/> |
| [Stop Chaos](sfclient-v82-api-stopchaos.md) | Stops Chaos if it is running in the cluster and put the Chaos Schedule in a stopped state.<br/> |
| [Get Chaos Events](sfclient-v82-api-getchaosevents.md) | Gets the next segment of the Chaos events based on the continuation token or the time range.<br/> |
| [Get Chaos Schedule](sfclient-v82-api-getchaosschedule.md) | Get the Chaos Schedule defining when and how to run Chaos.<br/> |
| [Post Chaos Schedule](sfclient-v82-api-postchaosschedule.md) | Set the schedule used by Chaos.<br/> |

----
## [ImageStore APIs](sfclient-v82-index-imagestore.md)

| Name | Description |
| --- | --- |
| [Upload File](sfclient-v82-api-uploadfile.md) | Uploads contents of the file to the image store.<br/> |
| [Get Image Store Content](sfclient-v82-api-getimagestorecontent.md) | Gets the image store content information.<br/> |
| [Delete Image Store Content](sfclient-v82-api-deleteimagestorecontent.md) | Deletes existing image store content.<br/> |
| [Get Image Store Root Content](sfclient-v82-api-getimagestorerootcontent.md) | Gets the content information at the root of the image store.<br/> |
| [Copy Image Store Content](sfclient-v82-api-copyimagestorecontent.md) | Copies image store content internally<br/> |
| [Delete Image Store Upload Session](sfclient-v82-api-deleteimagestoreuploadsession.md) | Cancels an image store upload session.<br/> |
| [Commit Image Store Upload Session](sfclient-v82-api-commitimagestoreuploadsession.md) | Commit an image store upload session.<br/> |
| [Get Image Store Upload Session By Id](sfclient-v82-api-getimagestoreuploadsessionbyid.md) | Get the image store upload session by ID.<br/> |
| [Get Image Store Upload Session By Path](sfclient-v82-api-getimagestoreuploadsessionbypath.md) | Get the image store upload session by relative path.<br/> |
| [Upload File Chunk](sfclient-v82-api-uploadfilechunk.md) | Uploads a file chunk to the image store relative path.<br/> |
| [Get Image Store Root Folder Size](sfclient-v82-api-getimagestorerootfoldersize.md) | Get the folder size at the root of the image store.<br/> |
| [Get Image Store Folder Size](sfclient-v82-api-getimagestorefoldersize.md) | Get the size of a folder in image store<br/> |
| [Get Image Store Info](sfclient-v82-api-getimagestoreinfo.md) | Gets the overall ImageStore information<br/> |

----
## [Infrastructure APIs](sfclient-v82-index-infrastructure.md)

| Name | Description |
| --- | --- |
| [Invoke Infrastructure Command](sfclient-v82-api-invokeinfrastructurecommand.md) | Invokes an administrative command on the given Infrastructure Service instance.<br/> |
| [Invoke Infrastructure Query](sfclient-v82-api-invokeinfrastructurequery.md) | Invokes a read-only query on the given infrastructure service instance.<br/> |

----
## [Faults APIs](sfclient-v82-index-faults.md)

| Name | Description |
| --- | --- |
| [Start Data Loss](sfclient-v82-api-startdataloss.md) | This API will induce data loss for the specified partition. It will trigger a call to the OnDataLossAsync API of the partition.<br/> |
| [Get Data Loss Progress](sfclient-v82-api-getdatalossprogress.md) | Gets the progress of a partition data loss operation started using the StartDataLoss API.<br/> |
| [Start Quorum Loss](sfclient-v82-api-startquorumloss.md) | Induces quorum loss for a given stateful service partition.<br/> |
| [Get Quorum Loss Progress](sfclient-v82-api-getquorumlossprogress.md) | Gets the progress of a quorum loss operation on a partition started using the StartQuorumLoss API.<br/> |
| [Start Partition Restart](sfclient-v82-api-startpartitionrestart.md) | This API will restart some or all replicas or instances of the specified partition.<br/> |
| [Get Partition Restart Progress](sfclient-v82-api-getpartitionrestartprogress.md) | Gets the progress of a PartitionRestart operation started using StartPartitionRestart.<br/> |
| [Start Node Transition](sfclient-v82-api-startnodetransition.md) | Starts or stops a cluster node.<br/> |
| [Get Node Transition Progress](sfclient-v82-api-getnodetransitionprogress.md) | Gets the progress of an operation started using StartNodeTransition.<br/> |
| [Get Fault Operation List](sfclient-v82-api-getfaultoperationlist.md) | Gets a list of user-induced fault operations filtered by provided input.<br/> |
| [Cancel Operation](sfclient-v82-api-canceloperation.md) | Cancels a user-induced fault operation.<br/> |

----
## [BackupRestore APIs](sfclient-v82-index-backuprestore.md)

| Name | Description |
| --- | --- |
| [Create Backup Policy](sfclient-v82-api-createbackuppolicy.md) | Creates a backup policy.<br/> |
| [Delete Backup Policy](sfclient-v82-api-deletebackuppolicy.md) | Deletes the backup policy.<br/> |
| [Get Backup Policy List](sfclient-v82-api-getbackuppolicylist.md) | Gets all the backup policies configured.<br/> |
| [Get Backup Policy By Name](sfclient-v82-api-getbackuppolicybyname.md) | Gets a particular backup policy by name.<br/> |
| [Get All Entities Backed Up By Policy](sfclient-v82-api-getallentitiesbackedupbypolicy.md) | Gets the list of backup entities that are associated with this policy.<br/> |
| [Update Backup Policy](sfclient-v82-api-updatebackuppolicy.md) | Updates the backup policy.<br/> |
| [Enable Application Backup](sfclient-v82-api-enableapplicationbackup.md) | Enables periodic backup of stateful partitions under this Service Fabric application.<br/> |
| [Disable Application Backup](sfclient-v82-api-disableapplicationbackup.md) | Disables periodic backup of Service Fabric application.<br/> |
| [Get Application Backup Configuration Info](sfclient-v82-api-getapplicationbackupconfigurationinfo.md) | Gets the Service Fabric application backup configuration information.<br/> |
| [Get Application Backup List](sfclient-v82-api-getapplicationbackuplist.md) | Gets the list of backups available for every partition in this application.<br/> |
| [Suspend Application Backup](sfclient-v82-api-suspendapplicationbackup.md) | Suspends periodic backup for the specified Service Fabric application.<br/> |
| [Resume Application Backup](sfclient-v82-api-resumeapplicationbackup.md) | Resumes periodic backup of a Service Fabric application which was previously suspended.<br/> |
| [Enable Service Backup](sfclient-v82-api-enableservicebackup.md) | Enables periodic backup of stateful partitions under this Service Fabric service.<br/> |
| [Disable Service Backup](sfclient-v82-api-disableservicebackup.md) | Disables periodic backup of Service Fabric service which was previously enabled.<br/> |
| [Get Service Backup Configuration Info](sfclient-v82-api-getservicebackupconfigurationinfo.md) | Gets the Service Fabric service backup configuration information.<br/> |
| [Get Service Backup List](sfclient-v82-api-getservicebackuplist.md) | Gets the list of backups available for every partition in this service.<br/> |
| [Suspend Service Backup](sfclient-v82-api-suspendservicebackup.md) | Suspends periodic backup for the specified Service Fabric service.<br/> |
| [Resume Service Backup](sfclient-v82-api-resumeservicebackup.md) | Resumes periodic backup of a Service Fabric service which was previously suspended.<br/> |
| [Enable Partition Backup](sfclient-v82-api-enablepartitionbackup.md) | Enables periodic backup of the stateful persisted partition.<br/> |
| [Disable Partition Backup](sfclient-v82-api-disablepartitionbackup.md) | Disables periodic backup of Service Fabric partition which was previously enabled.<br/> |
| [Get Partition Backup Configuration Info](sfclient-v82-api-getpartitionbackupconfigurationinfo.md) | Gets the partition backup configuration information<br/> |
| [Get Partition Backup List](sfclient-v82-api-getpartitionbackuplist.md) | Gets the list of backups available for the specified partition.<br/> |
| [Suspend Partition Backup](sfclient-v82-api-suspendpartitionbackup.md) | Suspends periodic backup for the specified partition.<br/> |
| [Resume Partition Backup](sfclient-v82-api-resumepartitionbackup.md) | Resumes periodic backup of partition which was previously suspended.<br/> |
| [Backup Partition](sfclient-v82-api-backuppartition.md) | Triggers backup of the partition's state.<br/> |
| [Get Partition Backup Progress](sfclient-v82-api-getpartitionbackupprogress.md) | Gets details for the latest backup triggered for this partition.<br/> |
| [Restore Partition](sfclient-v82-api-restorepartition.md) | Triggers restore of the state of the partition using the specified restore partition description.<br/> |
| [Get Partition Restore Progress](sfclient-v82-api-getpartitionrestoreprogress.md) | Gets details for the latest restore operation triggered for this partition.<br/> |
| [Get Backups From Backup Location](sfclient-v82-api-getbackupsfrombackuplocation.md) | Gets the list of backups available for the specified backed up entity at the specified backup location.<br/> |

----
## [Property Management APIs](sfclient-v82-index-property-management.md)

| Name | Description |
| --- | --- |
| [Create Name](sfclient-v82-api-createname.md) | Creates a Service Fabric name.<br/> |
| [Get Name Exists Info](sfclient-v82-api-getnameexistsinfo.md) | Returns whether the Service Fabric name exists.<br/> |
| [Delete Name](sfclient-v82-api-deletename.md) | Deletes a Service Fabric name.<br/> |
| [Get Sub Name Info List](sfclient-v82-api-getsubnameinfolist.md) | Enumerates all the Service Fabric names under a given name.<br/> |
| [Get Property Info List](sfclient-v82-api-getpropertyinfolist.md) | Gets information on all Service Fabric properties under a given name.<br/> |
| [Put Property](sfclient-v82-api-putproperty.md) | Creates or updates a Service Fabric property.<br/> |
| [Get Property Info](sfclient-v82-api-getpropertyinfo.md) | Gets the specified Service Fabric property.<br/> |
| [Delete Property](sfclient-v82-api-deleteproperty.md) | Deletes the specified Service Fabric property.<br/> |
| [Submit Property Batch](sfclient-v82-api-submitpropertybatch.md) | Submits a property batch.<br/> |

----
## [EventsStore APIs](sfclient-v82-index-eventsstore.md)

| Name | Description |
| --- | --- |
| [Get Cluster Event List](sfclient-v82-api-getclustereventlist.md) | Gets all Cluster-related events.<br/> |
| [Get Containers Event List](sfclient-v82-api-getcontainerseventlist.md) | Gets all Containers-related events.<br/> |
| [Get Node Event List](sfclient-v82-api-getnodeeventlist.md) | Gets a Node-related events.<br/> |
| [Get Nodes Event List](sfclient-v82-api-getnodeseventlist.md) | Gets all Nodes-related Events.<br/> |
| [Get Application Event List](sfclient-v82-api-getapplicationeventlist.md) | Gets an Application-related events.<br/> |
| [Get Applications Event List](sfclient-v82-api-getapplicationseventlist.md) | Gets all Applications-related events.<br/> |
| [Get Service Event List](sfclient-v82-api-getserviceeventlist.md) | Gets a Service-related events.<br/> |
| [Get Services Event List](sfclient-v82-api-getserviceseventlist.md) | Gets all Services-related events.<br/> |
| [Get Partition Event List](sfclient-v82-api-getpartitioneventlist.md) | Gets a Partition-related events.<br/> |
| [Get Partitions Event List](sfclient-v82-api-getpartitionseventlist.md) | Gets all Partitions-related events.<br/> |
| [Get Partition Replica Event List](sfclient-v82-api-getpartitionreplicaeventlist.md) | Gets a Partition Replica-related events.<br/> |
| [Get Partition Replicas Event List](sfclient-v82-api-getpartitionreplicaseventlist.md) | Gets all Replicas-related events for a Partition.<br/> |
| [Get Correlated Event List](sfclient-v82-api-getcorrelatedeventlist.md) | Gets all correlated events for a given event.<br/> |

----
## [Models](sfclient-v82-index-models.md)

| Name | Description |
| --- | --- |
| [AadMetadata](sfclient-v82-model-aadmetadata.md) | Azure Active Directory metadata used for secured connection to cluster.<br/> |
| [AadMetadataObject](sfclient-v82-model-aadmetadataobject.md) | Azure Active Directory metadata object used for secured connection to cluster.<br/> |
| [AddRemoveIncrementalNamedPartitionScalingMechanism](sfclient-v82-model-addremoveincrementalnamedpartitionscalingmechanism.md) | Represents a scaling mechanism for adding or removing named partitions of a stateless service. Partition names are in the format '0','1''N-1'<br/> |
| [AddRemoveIncrementalNamedPartitionScalingMechanism](sfclient-v82-model-addremoveincrementalnamedpartitionscalingmechanism.md) | Represents a scaling mechanism for adding or removing named partitions of a stateless service. Partition names are in the format '0','1''N-1'<br/> |
| [AddRemoveReplicaScalingMechanism](sfclient-v82-model-addremovereplicascalingmechanism.md) | Describes the horizontal auto scaling mechanism that adds or removes replicas (containers or container groups).<br/> |
| [AddRemoveReplicaScalingMechanism](sfclient-v82-model-addremovereplicascalingmechanism.md) | Describes the horizontal auto scaling mechanism that adds or removes replicas (containers or container groups).<br/> |
| [AnalysisEventMetadata](sfclient-v82-model-analysiseventmetadata.md) | Metadata about an Analysis Event.<br/> |
| [ApplicationBackupConfigurationInfo](sfclient-v82-model-applicationbackupconfigurationinfo.md) | Backup configuration information for a specific Service Fabric application specifying what backup policy is being applied and suspend description, if any.<br/> |
| [ApplicationBackupConfigurationInfo](sfclient-v82-model-applicationbackupconfigurationinfo.md) | Backup configuration information for a specific Service Fabric application specifying what backup policy is being applied and suspend description, if any.<br/> |
| [ApplicationBackupEntity](sfclient-v82-model-applicationbackupentity.md) | Identifies the Service Fabric application which is being backed up.<br/> |
| [ApplicationBackupEntity](sfclient-v82-model-applicationbackupentity.md) | Identifies the Service Fabric application which is being backed up.<br/> |
| [ApplicationCapacityDescription](sfclient-v82-model-applicationcapacitydescription.md) | Describes capacity information for services of this application. This description can be used for describing the following.<br/>- Reserving the capacity for the services on the nodes<br/>- Limiting the total number of nodes that services of this application can run on<br/>- Limiting the custom capacity metrics to limit the total consumption of this metric by the services of this application<br/> |
| [ApplicationContainerInstanceExitedEvent](sfclient-v82-model-applicationcontainerinstanceexitedevent.md) | Container Exited event.<br/> |
| [ApplicationContainerInstanceExitedEvent](sfclient-v82-model-applicationcontainerinstanceexitedevent.md) | Container Exited event.<br/> |
| [ApplicationCreatedEvent](sfclient-v82-model-applicationcreatedevent.md) | Application Created event.<br/> |
| [ApplicationCreatedEvent](sfclient-v82-model-applicationcreatedevent.md) | Application Created event.<br/> |
| [ApplicationDefinitionKind enum](sfclient-v82-model-applicationdefinitionkind.md) | The mechanism used to define a Service Fabric application.<br/> |
| [ApplicationDeletedEvent](sfclient-v82-model-applicationdeletedevent.md) | Application Deleted event.<br/> |
| [ApplicationDeletedEvent](sfclient-v82-model-applicationdeletedevent.md) | Application Deleted event.<br/> |
| [ApplicationDescription](sfclient-v82-model-applicationdescription.md) | Describes a Service Fabric application.<br/> |
| [ApplicationEvent](sfclient-v82-model-applicationevent.md) | Represents the base for all Application Events.<br/> |
| [ApplicationEvent](sfclient-v82-model-applicationevent.md) | Represents the base for all Application Events.<br/> |
| [ApplicationHealth](sfclient-v82-model-applicationhealth.md) | Represents the health of the application. Contains the application aggregated health state and the service and deployed application health states.<br/> |
| [ApplicationHealth](sfclient-v82-model-applicationhealth.md) | Represents the health of the application. Contains the application aggregated health state and the service and deployed application health states.<br/> |
| [ApplicationHealthEvaluation](sfclient-v82-model-applicationhealthevaluation.md) | Represents health evaluation for an application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [ApplicationHealthEvaluation](sfclient-v82-model-applicationhealthevaluation.md) | Represents health evaluation for an application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [ApplicationHealthPolicies](sfclient-v82-model-applicationhealthpolicies.md) | Defines the application health policy map used to evaluate the health of an application or one of its children entities.<br/> |
| [ApplicationHealthPolicy](sfclient-v82-model-applicationhealthpolicy.md) | Defines a health policy used to evaluate the health of an application or one of its children entities.<br/> |
| [ApplicationHealthPolicyMapItem](sfclient-v82-model-applicationhealthpolicymapitem.md) | Defines an item in ApplicationHealthPolicyMap.<br/> |
| [ApplicationHealthPolicyMapObject](sfclient-v82-model-applicationhealthpolicymapobject.md) | Represents the map of application health policies for a ServiceFabric cluster upgrade<br/> |
| [ApplicationHealthReportExpiredEvent](sfclient-v82-model-applicationhealthreportexpiredevent.md) | Application Health Report Expired event.<br/> |
| [ApplicationHealthReportExpiredEvent](sfclient-v82-model-applicationhealthreportexpiredevent.md) | Application Health Report Expired event.<br/> |
| [ApplicationHealthState](sfclient-v82-model-applicationhealthstate.md) | Represents the health state of an application, which contains the application identifier and the aggregated health state.<br/> |
| [ApplicationHealthState](sfclient-v82-model-applicationhealthstate.md) | Represents the health state of an application, which contains the application identifier and the aggregated health state.<br/> |
| [ApplicationHealthStateChunk](sfclient-v82-model-applicationhealthstatechunk.md) | Represents the health state chunk of a application.<br/>The application health state chunk contains the application name, its aggregated health state and any children services and deployed applications that respect the filters in cluster health chunk query description.<br/> |
| [ApplicationHealthStateChunk](sfclient-v82-model-applicationhealthstatechunk.md) | Represents the health state chunk of a application.<br/>The application health state chunk contains the application name, its aggregated health state and any children services and deployed applications that respect the filters in cluster health chunk query description.<br/> |
| [ApplicationHealthStateChunkList](sfclient-v82-model-applicationhealthstatechunklist.md) | The list of application health state chunks in the cluster that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ApplicationHealthStateChunkList](sfclient-v82-model-applicationhealthstatechunklist.md) | The list of application health state chunks in the cluster that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ApplicationHealthStateFilter](sfclient-v82-model-applicationhealthstatefilter.md) | Defines matching criteria to determine whether a application should be included in the cluster health chunk.<br/>One filter can match zero, one or multiple applications, depending on its properties.<br/> |
| [ApplicationInfo](sfclient-v82-model-applicationinfo.md) | Information about a Service Fabric application.<br/> |
| [ApplicationLoadInfo](sfclient-v82-model-applicationloadinfo.md) | Load Information about a Service Fabric application.<br/> |
| [ApplicationLoadMetricInformation](sfclient-v82-model-applicationloadmetricinformation.md) | Describes load information for a custom resource balancing metric. This can be used to limit the total consumption of this metric by the services of this application.<br/> |
| [ApplicationMetricDescription](sfclient-v82-model-applicationmetricdescription.md) | Describes capacity information for a custom resource balancing metric. This can be used to limit the total consumption of this metric by the services of this application.<br/> |
| [ApplicationNameInfo](sfclient-v82-model-applicationnameinfo.md) | Information about the application name.<br/> |
| [ApplicationNewHealthReportEvent](sfclient-v82-model-applicationnewhealthreportevent.md) | Application Health Report Created event.<br/> |
| [ApplicationNewHealthReportEvent](sfclient-v82-model-applicationnewhealthreportevent.md) | Application Health Report Created event.<br/> |
| [ApplicationPackageCleanupPolicy enum](sfclient-v82-model-applicationpackagecleanuppolicy.md) | The kind of action that needs to be taken for cleaning up the application package after successful provision.<br/> |
| [ApplicationParameter](sfclient-v82-model-applicationparameter.md) | Describes an application parameter override to be applied when creating or upgrading an application.<br/> |
| [ApplicationProcessExitedEvent](sfclient-v82-model-applicationprocessexitedevent.md) | Process Exited event.<br/> |
| [ApplicationProcessExitedEvent](sfclient-v82-model-applicationprocessexitedevent.md) | Process Exited event.<br/> |
| [ApplicationProperties](sfclient-v82-model-applicationproperties.md) | Describes properties of a application resource.<br/> |
| [ApplicationResourceDescription](sfclient-v82-model-applicationresourcedescription.md) | This type describes a application resource.<br/> |
| [ApplicationResourceUpgradeProgressInfo](sfclient-v82-model-applicationresourceupgradeprogressinfo.md) | This type describes an application resource upgrade.<br/> |
| [ApplicationResourceUpgradeState enum](sfclient-v82-model-applicationresourceupgradestate.md) | The state of the application resource upgrade.<br/> |
| [ApplicationScopedVolume](sfclient-v82-model-applicationscopedvolume.md) | Describes a volume whose lifetime is scoped to the application's lifetime.<br/> |
| [ApplicationScopedVolume](sfclient-v82-model-applicationscopedvolume.md) | Describes a volume whose lifetime is scoped to the application's lifetime.<br/> |
| [ApplicationScopedVolumeCreationParameters](sfclient-v82-model-applicationscopedvolumecreationparameters.md) | Describes parameters for creating application-scoped volumes.<br/> |
| [ApplicationScopedVolumeCreationParametersServiceFabricVolumeDisk](sfclient-v82-model-applicationscopedvolumecreationparametersservicefabricvolumedisk.md) | Describes parameters for creating application-scoped volumes provided by Service Fabric Volume Disks<br/> |
| [ApplicationScopedVolumeCreationParametersServiceFabricVolumeDisk](sfclient-v82-model-applicationscopedvolumecreationparametersservicefabricvolumedisk.md) | Describes parameters for creating application-scoped volumes provided by Service Fabric Volume Disks<br/> |
| [ApplicationScopedVolumeKind enum](sfclient-v82-model-applicationscopedvolumekind.md) | Specifies the application-scoped volume kind.<br/> |
| [ApplicationsHealthEvaluation](sfclient-v82-model-applicationshealthevaluation.md) | Represents health evaluation for applications, containing health evaluations for each unhealthy application that impacted current aggregated health state.<br/> |
| [ApplicationsHealthEvaluation](sfclient-v82-model-applicationshealthevaluation.md) | Represents health evaluation for applications, containing health evaluations for each unhealthy application that impacted current aggregated health state.<br/> |
| [ApplicationStatus enum](sfclient-v82-model-applicationstatus.md) | The status of the application.<br/> |
| [ApplicationTypeApplicationsHealthEvaluation](sfclient-v82-model-applicationtypeapplicationshealthevaluation.md) | Represents health evaluation for applications of a particular application type. The application type applications evaluation can be returned when cluster health evaluation returns unhealthy aggregated health state, either Error or Warning. It contains health evaluations for each unhealthy application of the included application type that impacted current aggregated health state.<br/> |
| [ApplicationTypeApplicationsHealthEvaluation](sfclient-v82-model-applicationtypeapplicationshealthevaluation.md) | Represents health evaluation for applications of a particular application type. The application type applications evaluation can be returned when cluster health evaluation returns unhealthy aggregated health state, either Error or Warning. It contains health evaluations for each unhealthy application of the included application type that impacted current aggregated health state.<br/> |
| [ApplicationTypeDefinitionKind enum](sfclient-v82-model-applicationtypedefinitionkind.md) | The mechanism used to define a Service Fabric application type.<br/> |
| [ApplicationTypeHealthPolicyMapItem](sfclient-v82-model-applicationtypehealthpolicymapitem.md) | Defines an item in ApplicationTypeHealthPolicyMap.<br/> |
| [ApplicationTypeImageStorePath](sfclient-v82-model-applicationtypeimagestorepath.md) | Path description for the application package in the image store specified during the prior copy operation.<br/> |
| [ApplicationTypeInfo](sfclient-v82-model-applicationtypeinfo.md) | Information about an application type.<br/> |
| [ApplicationTypeManifest](sfclient-v82-model-applicationtypemanifest.md) | Contains the manifest describing an application type registered in a Service Fabric cluster.<br/> |
| [ApplicationTypeStatus enum](sfclient-v82-model-applicationtypestatus.md) | The status of the application type.<br/> |
| [ApplicationUpdateDescription](sfclient-v82-model-applicationupdatedescription.md) | Describes the parameters for updating an application instance.<br/> |
| [ApplicationUpgradeCompletedEvent](sfclient-v82-model-applicationupgradecompletedevent.md) | Application Upgrade Completed event.<br/> |
| [ApplicationUpgradeCompletedEvent](sfclient-v82-model-applicationupgradecompletedevent.md) | Application Upgrade Completed event.<br/> |
| [ApplicationUpgradeDescription](sfclient-v82-model-applicationupgradedescription.md) | Describes the parameters for an application upgrade. Note that upgrade description replaces the existing application description. This means that if the parameters are not specified, the existing parameters on the applications will be overwritten with the empty parameters list. This would result in the application using the default value of the parameters from the application manifest. If you do not want to change any existing parameter values, please get the application parameters first using the GetApplicationInfo query and then supply those values as Parameters in this ApplicationUpgradeDescription.<br/> |
| [ApplicationUpgradeDomainCompletedEvent](sfclient-v82-model-applicationupgradedomaincompletedevent.md) | Application Upgrade Domain Completed event.<br/> |
| [ApplicationUpgradeDomainCompletedEvent](sfclient-v82-model-applicationupgradedomaincompletedevent.md) | Application Upgrade Domain Completed event.<br/> |
| [ApplicationUpgradeProgressInfo](sfclient-v82-model-applicationupgradeprogressinfo.md) | Describes the parameters for an application upgrade.<br/> |
| [ApplicationUpgradeRollbackCompletedEvent](sfclient-v82-model-applicationupgraderollbackcompletedevent.md) | Application Upgrade Rollback Completed event.<br/> |
| [ApplicationUpgradeRollbackCompletedEvent](sfclient-v82-model-applicationupgraderollbackcompletedevent.md) | Application Upgrade Rollback Completed event.<br/> |
| [ApplicationUpgradeRollbackStartedEvent](sfclient-v82-model-applicationupgraderollbackstartedevent.md) | Application Upgrade Rollback Started event.<br/> |
| [ApplicationUpgradeRollbackStartedEvent](sfclient-v82-model-applicationupgraderollbackstartedevent.md) | Application Upgrade Rollback Started event.<br/> |
| [ApplicationUpgradeStartedEvent](sfclient-v82-model-applicationupgradestartedevent.md) | Application Upgrade Started event.<br/> |
| [ApplicationUpgradeStartedEvent](sfclient-v82-model-applicationupgradestartedevent.md) | Application Upgrade Started event.<br/> |
| [ApplicationUpgradeUpdateDescription](sfclient-v82-model-applicationupgradeupdatedescription.md) | Describes the parameters for updating an ongoing application upgrade.<br/> |
| [AutoScalingMechanism](sfclient-v82-model-autoscalingmechanism.md) | Describes the mechanism for performing auto scaling operation. Derived classes will describe the actual mechanism.<br/> |
| [AutoScalingMechanismKind enum](sfclient-v82-model-autoscalingmechanismkind.md) | Enumerates the mechanisms for auto scaling.<br/> |
| [AutoScalingMetric](sfclient-v82-model-autoscalingmetric.md) | Describes the metric that is used for triggering auto scaling operation. Derived classes will describe resources or metrics.<br/> |
| [AutoScalingMetricKind enum](sfclient-v82-model-autoscalingmetrickind.md) | Enumerates the metrics that are used for triggering auto scaling.<br/> |
| [AutoScalingPolicy](sfclient-v82-model-autoscalingpolicy.md) | Describes the auto scaling policy<br/> |
| [AutoScalingResourceMetric](sfclient-v82-model-autoscalingresourcemetric.md) | Describes the resource that is used for triggering auto scaling.<br/> |
| [AutoScalingResourceMetric](sfclient-v82-model-autoscalingresourcemetric.md) | Describes the resource that is used for triggering auto scaling.<br/> |
| [AutoScalingResourceMetricName enum](sfclient-v82-model-autoscalingresourcemetricname.md) | Enumerates the resources that are used for triggering auto scaling.<br/> |
| [AutoScalingTrigger](sfclient-v82-model-autoscalingtrigger.md) | Describes the trigger for performing auto scaling operation.<br/> |
| [AutoScalingTriggerKind enum](sfclient-v82-model-autoscalingtriggerkind.md) | Enumerates the triggers for auto scaling.<br/> |
| [AverageLoadScalingTrigger](sfclient-v82-model-averageloadscalingtrigger.md) | Describes the average load trigger used for auto scaling.<br/> |
| [AverageLoadScalingTrigger](sfclient-v82-model-averageloadscalingtrigger.md) | Describes the average load trigger used for auto scaling.<br/> |
| [AveragePartitionLoadScalingTrigger](sfclient-v82-model-averagepartitionloadscalingtrigger.md) | Represents a scaling trigger related to an average load of a metric/resource of a partition.<br/> |
| [AveragePartitionLoadScalingTrigger](sfclient-v82-model-averagepartitionloadscalingtrigger.md) | Represents a scaling trigger related to an average load of a metric/resource of a partition.<br/> |
| [AverageServiceLoadScalingTrigger](sfclient-v82-model-averageserviceloadscalingtrigger.md) | Represents a scaling policy related to an average load of a metric/resource of a service.<br/> |
| [AverageServiceLoadScalingTrigger](sfclient-v82-model-averageserviceloadscalingtrigger.md) | Represents a scaling policy related to an average load of a metric/resource of a service.<br/> |
| [AzureBlobBackupStorageDescription](sfclient-v82-model-azureblobbackupstoragedescription.md) | Describes the parameters for Azure blob store used for storing and enumerating backups.<br/> |
| [AzureBlobBackupStorageDescription](sfclient-v82-model-azureblobbackupstoragedescription.md) | Describes the parameters for Azure blob store used for storing and enumerating backups.<br/> |
| [AzureInternalMonitoringPipelineSinkDescription](sfclient-v82-model-azureinternalmonitoringpipelinesinkdescription.md) | Diagnostics settings for Geneva.<br/> |
| [AzureInternalMonitoringPipelineSinkDescription](sfclient-v82-model-azureinternalmonitoringpipelinesinkdescription.md) | Diagnostics settings for Geneva.<br/> |
| [BackupConfigurationInfo](sfclient-v82-model-backupconfigurationinfo.md) | Describes the backup configuration information.<br/> |
| [BackupEntity](sfclient-v82-model-backupentity.md) | Describes the Service Fabric entity that is configured for backup.<br/> |
| [BackupEntityKind enum](sfclient-v82-model-backupentitykind.md) | The entity type of a Service Fabric entity such as Application, Service or a Partition where periodic backups can be enabled.<br/> |
| [BackupInfo](sfclient-v82-model-backupinfo.md) | Represents a backup point which can be used to trigger a restore.<br/> |
| [BackupPartitionDescription](sfclient-v82-model-backuppartitiondescription.md) | Describes the parameters for triggering partition's backup.<br/> |
| [BackupPolicyDescription](sfclient-v82-model-backuppolicydescription.md) | Describes a backup policy for configuring periodic backup.<br/> |
| [BackupPolicyScope enum](sfclient-v82-model-backuppolicyscope.md) | Specifies the scope at which the backup policy is applied.<br/> |
| [BackupProgressInfo](sfclient-v82-model-backupprogressinfo.md) | Describes the progress of a partition's backup.<br/> |
| [BackupScheduleDescription](sfclient-v82-model-backupscheduledescription.md) | Describes the backup schedule parameters.<br/> |
| [BackupScheduleFrequencyType enum](sfclient-v82-model-backupschedulefrequencytype.md) | Describes the frequency with which to run the time based backup schedule.<br/> |
| [BackupScheduleKind enum](sfclient-v82-model-backupschedulekind.md) | The kind of backup schedule, time based or frequency based.<br/> |
| [BackupState enum](sfclient-v82-model-backupstate.md) | Represents the current state of the partition backup operation.<br/> |
| [BackupStorageDescription](sfclient-v82-model-backupstoragedescription.md) | Describes the parameters for the backup storage.<br/> |
| [BackupStorageKind enum](sfclient-v82-model-backupstoragekind.md) | The kind of backup storage, where backups are saved.<br/> |
| [BackupSuspensionInfo](sfclient-v82-model-backupsuspensioninfo.md) | Describes the backup suspension details.<br/> |
| [BackupSuspensionScope enum](sfclient-v82-model-backupsuspensionscope.md) | Specifies the scope at which the backup suspension was applied.<br/> |
| [BackupType enum](sfclient-v82-model-backuptype.md) | Describes the type of backup, whether its full or incremental.<br/> |
| [BasicRetentionPolicyDescription](sfclient-v82-model-basicretentionpolicydescription.md) | Describes basic retention policy.<br/> |
| [BasicRetentionPolicyDescription](sfclient-v82-model-basicretentionpolicydescription.md) | Describes basic retention policy.<br/> |
| [BinaryPropertyValue](sfclient-v82-model-binarypropertyvalue.md) | Describes a Service Fabric property value of type Binary.<br/> |
| [BinaryPropertyValue](sfclient-v82-model-binarypropertyvalue.md) | Describes a Service Fabric property value of type Binary.<br/> |
| [Chaos](sfclient-v82-model-chaos.md) | Contains a description of Chaos.<br/> |
| [ChaosCodePackageRestartScheduledEvent](sfclient-v82-model-chaoscodepackagerestartscheduledevent.md) | Chaos Restart Code Package Fault Scheduled event.<br/> |
| [ChaosCodePackageRestartScheduledEvent](sfclient-v82-model-chaoscodepackagerestartscheduledevent.md) | Chaos Restart Code Package Fault Scheduled event.<br/> |
| [ChaosContext](sfclient-v82-model-chaoscontext.md) | Describes a map, which is a collection of (string, string) type key-value pairs. The map can be used to record information about<br/>the Chaos run. There cannot be more than 100 such pairs and each string (key or value) can be at most 4095 characters long.<br/>This map is set by the starter of the Chaos run to optionally store the context about the specific run.<br/> |
| [ChaosEvent](sfclient-v82-model-chaosevent.md) | Represents an event generated during a Chaos run.<br/> |
| [ChaosEventKind enum](sfclient-v82-model-chaoseventkind.md) | The kind of Chaos event.<br/> |
| [ChaosEventsSegment](sfclient-v82-model-chaoseventssegment.md) | Contains the list of Chaos events and the continuation token to get the next segment.<br/> |
| [ChaosEventWrapper](sfclient-v82-model-chaoseventwrapper.md) | Wrapper object for Chaos event.<br/> |
| [ChaosNodeRestartScheduledEvent](sfclient-v82-model-chaosnoderestartscheduledevent.md) | Chaos Restart Node Fault Scheduled event.<br/> |
| [ChaosNodeRestartScheduledEvent](sfclient-v82-model-chaosnoderestartscheduledevent.md) | Chaos Restart Node Fault Scheduled event.<br/> |
| [ChaosParameters](sfclient-v82-model-chaosparameters.md) | Defines all the parameters to configure a Chaos run.<br/> |
| [ChaosParametersDictionaryItem](sfclient-v82-model-chaosparametersdictionaryitem.md) | Defines an item in ChaosParametersDictionary of the Chaos Schedule.<br/> |
| [ChaosPartitionPrimaryMoveScheduledEvent](sfclient-v82-model-chaospartitionprimarymovescheduledevent.md) | Chaos Move Primary Fault Scheduled event.<br/> |
| [ChaosPartitionPrimaryMoveScheduledEvent](sfclient-v82-model-chaospartitionprimarymovescheduledevent.md) | Chaos Move Primary Fault Scheduled event.<br/> |
| [ChaosPartitionSecondaryMoveScheduledEvent](sfclient-v82-model-chaospartitionsecondarymovescheduledevent.md) | Chaos Move Secondary Fault Scheduled event.<br/> |
| [ChaosPartitionSecondaryMoveScheduledEvent](sfclient-v82-model-chaospartitionsecondarymovescheduledevent.md) | Chaos Move Secondary Fault Scheduled event.<br/> |
| [ChaosReplicaRemovalScheduledEvent](sfclient-v82-model-chaosreplicaremovalscheduledevent.md) | Chaos Remove Replica Fault Scheduled event.<br/> |
| [ChaosReplicaRemovalScheduledEvent](sfclient-v82-model-chaosreplicaremovalscheduledevent.md) | Chaos Remove Replica Fault Scheduled event.<br/> |
| [ChaosReplicaRestartScheduledEvent](sfclient-v82-model-chaosreplicarestartscheduledevent.md) | Chaos Restart Replica Fault Scheduled event.<br/> |
| [ChaosReplicaRestartScheduledEvent](sfclient-v82-model-chaosreplicarestartscheduledevent.md) | Chaos Restart Replica Fault Scheduled event.<br/> |
| [ChaosSchedule](sfclient-v82-model-chaosschedule.md) | Defines the schedule used by Chaos.<br/> |
| [ChaosScheduleDescription](sfclient-v82-model-chaosscheduledescription.md) | Defines the Chaos Schedule used by Chaos and the version of the Chaos Schedule. The version value wraps back to 0 after surpassing 2,147,483,647.<br/> |
| [ChaosScheduleJob](sfclient-v82-model-chaosschedulejob.md) | Defines a repetition rule and parameters of Chaos to be used with the Chaos Schedule.<br/> |
| [ChaosScheduleJobActiveDaysOfWeek](sfclient-v82-model-chaosschedulejobactivedaysofweek.md) | Defines the days of the week that a Chaos Schedule Job will run for.<br/> |
| [ChaosScheduleStatus enum](sfclient-v82-model-chaosschedulestatus.md) | Current status of the schedule.<br/> |
| [ChaosStartedEvent](sfclient-v82-model-chaosstartedevent.md) | Chaos Started event.<br/> |
| [ChaosStartedEvent](sfclient-v82-model-chaosstartedevent.md) | Chaos Started event.<br/> |
| [ChaosStatus enum](sfclient-v82-model-chaosstatus.md) | Current status of the Chaos run.<br/> |
| [ChaosStoppedEvent](sfclient-v82-model-chaosstoppedevent.md) | Chaos Stopped event.<br/> |
| [ChaosStoppedEvent](sfclient-v82-model-chaosstoppedevent.md) | Chaos Stopped event.<br/> |
| [ChaosTargetFilter](sfclient-v82-model-chaostargetfilter.md) | Defines all filters for targeted Chaos faults, for example, faulting only certain node types or faulting only certain applications.<br/>If ChaosTargetFilter is not used, Chaos faults all cluster entities. If ChaosTargetFilter is used, Chaos faults only the entities that meet the ChaosTargetFilter<br/>specification. NodeTypeInclusionList and ApplicationInclusionList allow a union semantics only. It is not possible to specify an intersection<br/>of NodeTypeInclusionList and ApplicationInclusionList. For example, it is not possible to specify "fault this application only when it is on that node type."<br/>Once an entity is included in either NodeTypeInclusionList or ApplicationInclusionList, that entity cannot be excluded using ChaosTargetFilter. Even if<br/>applicationX does not appear in ApplicationInclusionList, in some Chaos iteration applicationX can be faulted because it happens to be on a node of nodeTypeY that is included<br/>in NodeTypeInclusionList. If both NodeTypeInclusionList and ApplicationInclusionList are null or empty, an ArgumentException is thrown.<br/> |
| [CheckExistsPropertyBatchOperation](sfclient-v82-model-checkexistspropertybatchoperation.md) | Represents a PropertyBatchOperation that compares the Boolean existence of a property with the Exists argument.<br/>The PropertyBatchOperation operation fails if the property's existence is not equal to the Exists argument.<br/>The CheckExistsPropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [CheckExistsPropertyBatchOperation](sfclient-v82-model-checkexistspropertybatchoperation.md) | Represents a PropertyBatchOperation that compares the Boolean existence of a property with the Exists argument.<br/>The PropertyBatchOperation operation fails if the property's existence is not equal to the Exists argument.<br/>The CheckExistsPropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [CheckSequencePropertyBatchOperation](sfclient-v82-model-checksequencepropertybatchoperation.md) | Compares the Sequence Number of a property with the SequenceNumber argument.<br/>A property's sequence number can be thought of as that property's version.<br/>Every time the property is modified, its sequence number is increased.<br/>The sequence number can be found in a property's metadata.<br/>The comparison fails if the sequence numbers are not equal.<br/>CheckSequencePropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [CheckSequencePropertyBatchOperation](sfclient-v82-model-checksequencepropertybatchoperation.md) | Compares the Sequence Number of a property with the SequenceNumber argument.<br/>A property's sequence number can be thought of as that property's version.<br/>Every time the property is modified, its sequence number is increased.<br/>The sequence number can be found in a property's metadata.<br/>The comparison fails if the sequence numbers are not equal.<br/>CheckSequencePropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [CheckValuePropertyBatchOperation](sfclient-v82-model-checkvaluepropertybatchoperation.md) | Represents a PropertyBatchOperation that compares the value of the property with the expected value.<br/>The CheckValuePropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [CheckValuePropertyBatchOperation](sfclient-v82-model-checkvaluepropertybatchoperation.md) | Represents a PropertyBatchOperation that compares the value of the property with the expected value.<br/>The CheckValuePropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [ClusterConfiguration](sfclient-v82-model-clusterconfiguration.md) | Information about the standalone cluster configuration.<br/> |
| [ClusterConfigurationUpgradeDescription](sfclient-v82-model-clusterconfigurationupgradedescription.md) | Describes the parameters for a standalone cluster configuration upgrade.<br/> |
| [ClusterConfigurationUpgradeStatusInfo](sfclient-v82-model-clusterconfigurationupgradestatusinfo.md) | Information about a standalone cluster configuration upgrade status.<br/> |
| [ClusterEvent](sfclient-v82-model-clusterevent.md) | Represents the base for all Cluster Events.<br/> |
| [ClusterEvent](sfclient-v82-model-clusterevent.md) | Represents the base for all Cluster Events.<br/> |
| [ClusterHealth](sfclient-v82-model-clusterhealth.md) | Represents the health of the cluster.<br/>Contains the cluster aggregated health state, the cluster application and node health states as well as the health events and the unhealthy evaluations.<br/> |
| [ClusterHealth](sfclient-v82-model-clusterhealth.md) | Represents the health of the cluster.<br/>Contains the cluster aggregated health state, the cluster application and node health states as well as the health events and the unhealthy evaluations.<br/> |
| [ClusterHealthChunk](sfclient-v82-model-clusterhealthchunk.md) | Represents the health chunk of the cluster.<br/>Contains the cluster aggregated health state, and the cluster entities that respect the input filter.<br/> |
| [ClusterHealthChunkQueryDescription](sfclient-v82-model-clusterhealthchunkquerydescription.md) | The cluster health chunk query description, which can specify the health policies to evaluate cluster health and very expressive filters to select which cluster entities to include in response.<br/> |
| [ClusterHealthPolicies](sfclient-v82-model-clusterhealthpolicies.md) | Health policies to evaluate cluster health.<br/> |
| [ClusterHealthPolicy](sfclient-v82-model-clusterhealthpolicy.md) | Defines a health policy used to evaluate the health of the cluster or of a cluster node.<br/> |
| [ClusterHealthReportExpiredEvent](sfclient-v82-model-clusterhealthreportexpiredevent.md) | Cluster Health Report Expired event.<br/> |
| [ClusterHealthReportExpiredEvent](sfclient-v82-model-clusterhealthreportexpiredevent.md) | Cluster Health Report Expired event.<br/> |
| [ClusterLoadInfo](sfclient-v82-model-clusterloadinfo.md) | Information about load in a Service Fabric cluster. It holds a summary of all metrics and their load in a cluster.<br/> |
| [ClusterManifest](sfclient-v82-model-clustermanifest.md) | Information about the cluster manifest.<br/> |
| [ClusterNewHealthReportEvent](sfclient-v82-model-clusternewhealthreportevent.md) | Cluster Health Report Created event.<br/> |
| [ClusterNewHealthReportEvent](sfclient-v82-model-clusternewhealthreportevent.md) | Cluster Health Report Created event.<br/> |
| [ClusterUpgradeCompletedEvent](sfclient-v82-model-clusterupgradecompletedevent.md) | Cluster Upgrade Completed event.<br/> |
| [ClusterUpgradeCompletedEvent](sfclient-v82-model-clusterupgradecompletedevent.md) | Cluster Upgrade Completed event.<br/> |
| [ClusterUpgradeDescriptionObject](sfclient-v82-model-clusterupgradedescriptionobject.md) | Represents a ServiceFabric cluster upgrade<br/> |
| [ClusterUpgradeDomainCompletedEvent](sfclient-v82-model-clusterupgradedomaincompletedevent.md) | Cluster Upgrade Domain Completed event.<br/> |
| [ClusterUpgradeDomainCompletedEvent](sfclient-v82-model-clusterupgradedomaincompletedevent.md) | Cluster Upgrade Domain Completed event.<br/> |
| [ClusterUpgradeHealthPolicyObject](sfclient-v82-model-clusterupgradehealthpolicyobject.md) | Defines a health policy used to evaluate the health of the cluster during a cluster upgrade.<br/> |
| [ClusterUpgradeProgressObject](sfclient-v82-model-clusterupgradeprogressobject.md) | Information about a cluster upgrade.<br/> |
| [ClusterUpgradeRollbackCompletedEvent](sfclient-v82-model-clusterupgraderollbackcompletedevent.md) | Cluster Upgrade Rollback Completed event.<br/> |
| [ClusterUpgradeRollbackCompletedEvent](sfclient-v82-model-clusterupgraderollbackcompletedevent.md) | Cluster Upgrade Rollback Completed event.<br/> |
| [ClusterUpgradeRollbackStartedEvent](sfclient-v82-model-clusterupgraderollbackstartedevent.md) | Cluster Upgrade Rollback Started event.<br/> |
| [ClusterUpgradeRollbackStartedEvent](sfclient-v82-model-clusterupgraderollbackstartedevent.md) | Cluster Upgrade Rollback Started event.<br/> |
| [ClusterUpgradeStartedEvent](sfclient-v82-model-clusterupgradestartedevent.md) | Cluster Upgrade Started event.<br/> |
| [ClusterUpgradeStartedEvent](sfclient-v82-model-clusterupgradestartedevent.md) | Cluster Upgrade Started event.<br/> |
| [ClusterVersion](sfclient-v82-model-clusterversion.md) | The cluster version.<br/> |
| [CodePackageEntryPoint](sfclient-v82-model-codepackageentrypoint.md) | Information about setup or main entry point of a code package deployed on a Service Fabric node.<br/> |
| [CodePackageEntryPointStatistics](sfclient-v82-model-codepackageentrypointstatistics.md) | Statistics about setup or main entry point  of a code package deployed on a Service Fabric node.<br/> |
| [ComposeDeploymentStatus enum](sfclient-v82-model-composedeploymentstatus.md) | The status of the compose deployment.<br/> |
| [ComposeDeploymentStatusInfo](sfclient-v82-model-composedeploymentstatusinfo.md) | Information about a Service Fabric compose deployment.<br/> |
| [ComposeDeploymentUpgradeDescription](sfclient-v82-model-composedeploymentupgradedescription.md) | Describes the parameters for a compose deployment upgrade.<br/> |
| [ComposeDeploymentUpgradeProgressInfo](sfclient-v82-model-composedeploymentupgradeprogressinfo.md) | Describes the parameters for a compose deployment upgrade.<br/> |
| [ComposeDeploymentUpgradeState enum](sfclient-v82-model-composedeploymentupgradestate.md) | The state of the compose deployment upgrade.<br/> |
| [ConfigParameterOverride](sfclient-v82-model-configparameteroverride.md) | Information about a configuration parameter override.<br/> |
| [ContainerApiRequestBody](sfclient-v82-model-containerapirequestbody.md) | parameters for making container API call.<br/> |
| [ContainerApiResponse](sfclient-v82-model-containerapiresponse.md) | Response body that wraps container API result.<br/> |
| [ContainerApiResult](sfclient-v82-model-containerapiresult.md) | Container API result.<br/> |
| [ContainerCodePackageProperties](sfclient-v82-model-containercodepackageproperties.md) | Describes a container and its runtime properties.<br/> |
| [ContainerEvent](sfclient-v82-model-containerevent.md) | A container event.<br/> |
| [ContainerInstanceEvent](sfclient-v82-model-containerinstanceevent.md) | Represents the base for all Container Events.<br/> |
| [ContainerInstanceEvent](sfclient-v82-model-containerinstanceevent.md) | Represents the base for all Container Events.<br/> |
| [ContainerInstanceView](sfclient-v82-model-containerinstanceview.md) | Runtime information of a container instance.<br/> |
| [ContainerLabel](sfclient-v82-model-containerlabel.md) | Describes a container label.<br/> |
| [ContainerLogs](sfclient-v82-model-containerlogs.md) | Container logs.<br/> |
| [ContainerState](sfclient-v82-model-containerstate.md) | The container state.<br/> |
| [CreateComposeDeploymentDescription](sfclient-v82-model-createcomposedeploymentdescription.md) | Defines description for creating a Service Fabric compose deployment.<br/> |
| [CreateFabricDump enum](sfclient-v82-model-createfabricdump.md) | Possible values include: 'False', 'True'<br/> |
| [CurrentUpgradeDomainProgressInfo](sfclient-v82-model-currentupgradedomainprogressinfo.md) | Information about the current in-progress upgrade domain. Not applicable to node-by-node upgrades.<br/> |
| [CurrentUpgradeUnitsProgressInfo](sfclient-v82-model-currentupgradeunitsprogressinfo.md) | Information about the current in-progress upgrade units.<br/> |
| [DataLossMode enum](sfclient-v82-model-datalossmode.md) | Possible values include: 'Invalid', 'PartialDataLoss', 'FullDataLoss'<br/> |
| [DayOfWeek enum](sfclient-v82-model-dayofweek.md) | Describes the days in a week.<br/> |
| [DeactivationIntent enum](sfclient-v82-model-deactivationintent.md) | Possible values include: 'Pause', 'Restart', 'RemoveData'<br/> |
| [DeactivationIntentDescription](sfclient-v82-model-deactivationintentdescription.md) | Describes the intent or reason for deactivating the node.<br/> |
| [DefaultExecutionPolicy](sfclient-v82-model-defaultexecutionpolicy.md) | The default execution policy. Always restart the service if an exit occurs.<br/> |
| [DefaultExecutionPolicy](sfclient-v82-model-defaultexecutionpolicy.md) | The default execution policy. Always restart the service if an exit occurs.<br/> |
| [DeletePropertyBatchOperation](sfclient-v82-model-deletepropertybatchoperation.md) | Represents a PropertyBatchOperation that deletes a specified property if it exists.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [DeletePropertyBatchOperation](sfclient-v82-model-deletepropertybatchoperation.md) | Represents a PropertyBatchOperation that deletes a specified property if it exists.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [DeltaNodesCheckHealthEvaluation](sfclient-v82-model-deltanodescheckhealthevaluation.md) | Represents health evaluation for delta nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when the aggregated health state of the cluster is Warning or Error.<br/> |
| [DeltaNodesCheckHealthEvaluation](sfclient-v82-model-deltanodescheckhealthevaluation.md) | Represents health evaluation for delta nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when the aggregated health state of the cluster is Warning or Error.<br/> |
| [DeployedApplicationHealth](sfclient-v82-model-deployedapplicationhealth.md) | Information about the health of an application deployed on a Service Fabric node.<br/> |
| [DeployedApplicationHealth](sfclient-v82-model-deployedapplicationhealth.md) | Information about the health of an application deployed on a Service Fabric node.<br/> |
| [DeployedApplicationHealthEvaluation](sfclient-v82-model-deployedapplicationhealthevaluation.md) | Represents health evaluation for a deployed application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [DeployedApplicationHealthEvaluation](sfclient-v82-model-deployedapplicationhealthevaluation.md) | Represents health evaluation for a deployed application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [DeployedApplicationHealthReportExpiredEvent](sfclient-v82-model-deployedapplicationhealthreportexpiredevent.md) | Deployed Application Health Report Expired event.<br/> |
| [DeployedApplicationHealthReportExpiredEvent](sfclient-v82-model-deployedapplicationhealthreportexpiredevent.md) | Deployed Application Health Report Expired event.<br/> |
| [DeployedApplicationHealthState](sfclient-v82-model-deployedapplicationhealthstate.md) | Represents the health state of a deployed application, which contains the entity identifier and the aggregated health state.<br/> |
| [DeployedApplicationHealthState](sfclient-v82-model-deployedapplicationhealthstate.md) | Represents the health state of a deployed application, which contains the entity identifier and the aggregated health state.<br/> |
| [DeployedApplicationHealthStateChunk](sfclient-v82-model-deployedapplicationhealthstatechunk.md) | Represents the health state chunk of a deployed application, which contains the node where the application is deployed, the aggregated health state and any deployed service packages that respect the chunk query description filters.<br/> |
| [DeployedApplicationHealthStateChunk](sfclient-v82-model-deployedapplicationhealthstatechunk.md) | Represents the health state chunk of a deployed application, which contains the node where the application is deployed, the aggregated health state and any deployed service packages that respect the chunk query description filters.<br/> |
| [DeployedApplicationHealthStateChunkList](sfclient-v82-model-deployedapplicationhealthstatechunklist.md) | The list of deployed application health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [DeployedApplicationHealthStateFilter](sfclient-v82-model-deployedapplicationhealthstatefilter.md) | Defines matching criteria to determine whether a deployed application should be included as a child of an application in the cluster health chunk.<br/>The deployed applications are only returned if the parent application matches a filter specified in the cluster health chunk query description.<br/>One filter can match zero, one or multiple deployed applications, depending on its properties.<br/> |
| [DeployedApplicationInfo](sfclient-v82-model-deployedapplicationinfo.md) | Information about application deployed on the node.<br/> |
| [DeployedApplicationNewHealthReportEvent](sfclient-v82-model-deployedapplicationnewhealthreportevent.md) | Deployed Application Health Report Created event.<br/> |
| [DeployedApplicationNewHealthReportEvent](sfclient-v82-model-deployedapplicationnewhealthreportevent.md) | Deployed Application Health Report Created event.<br/> |
| [DeployedApplicationsHealthEvaluation](sfclient-v82-model-deployedapplicationshealthevaluation.md) | Represents health evaluation for deployed applications, containing health evaluations for each unhealthy deployed application that impacted current aggregated health state.<br/>Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedApplicationsHealthEvaluation](sfclient-v82-model-deployedapplicationshealthevaluation.md) | Represents health evaluation for deployed applications, containing health evaluations for each unhealthy deployed application that impacted current aggregated health state.<br/>Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedApplicationStatus enum](sfclient-v82-model-deployedapplicationstatus.md) | The status of the application deployed on the node. Following are the possible values.<br/> |
| [DeployedCodePackageInfo](sfclient-v82-model-deployedcodepackageinfo.md) | Information about code package deployed on a Service Fabric node.<br/> |
| [DeployedServicePackageHealth](sfclient-v82-model-deployedservicepackagehealth.md) | Information about the health of a service package for a specific application deployed on a Service Fabric node.<br/> |
| [DeployedServicePackageHealth](sfclient-v82-model-deployedservicepackagehealth.md) | Information about the health of a service package for a specific application deployed on a Service Fabric node.<br/> |
| [DeployedServicePackageHealthEvaluation](sfclient-v82-model-deployedservicepackagehealthevaluation.md) | Represents health evaluation for a deployed service package, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [DeployedServicePackageHealthEvaluation](sfclient-v82-model-deployedservicepackagehealthevaluation.md) | Represents health evaluation for a deployed service package, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [DeployedServicePackageHealthReportExpiredEvent](sfclient-v82-model-deployedservicepackagehealthreportexpiredevent.md) | Deployed Service Health Report Expired event.<br/> |
| [DeployedServicePackageHealthReportExpiredEvent](sfclient-v82-model-deployedservicepackagehealthreportexpiredevent.md) | Deployed Service Health Report Expired event.<br/> |
| [DeployedServicePackageHealthState](sfclient-v82-model-deployedservicepackagehealthstate.md) | Represents the health state of a deployed service package, containing the entity identifier and the aggregated health state.<br/> |
| [DeployedServicePackageHealthState](sfclient-v82-model-deployedservicepackagehealthstate.md) | Represents the health state of a deployed service package, containing the entity identifier and the aggregated health state.<br/> |
| [DeployedServicePackageHealthStateChunk](sfclient-v82-model-deployedservicepackagehealthstatechunk.md) | Represents the health state chunk of a deployed service package, which contains the service manifest name and the service package aggregated health state.<br/> |
| [DeployedServicePackageHealthStateChunk](sfclient-v82-model-deployedservicepackagehealthstatechunk.md) | Represents the health state chunk of a deployed service package, which contains the service manifest name and the service package aggregated health state.<br/> |
| [DeployedServicePackageHealthStateChunkList](sfclient-v82-model-deployedservicepackagehealthstatechunklist.md) | The list of deployed service package health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [DeployedServicePackageHealthStateFilter](sfclient-v82-model-deployedservicepackagehealthstatefilter.md) | Defines matching criteria to determine whether a deployed service package should be included as a child of a deployed application in the cluster health chunk.<br/>The deployed service packages are only returned if the parent entities match a filter specified in the cluster health chunk query description. The parent deployed application and its parent application must be included in the cluster health chunk.<br/>One filter can match zero, one or multiple deployed service packages, depending on its properties.<br/> |
| [DeployedServicePackageInfo](sfclient-v82-model-deployedservicepackageinfo.md) | Information about service package deployed on a Service Fabric node.<br/> |
| [DeployedServicePackageNewHealthReportEvent](sfclient-v82-model-deployedservicepackagenewhealthreportevent.md) | Deployed Service Health Report Created event.<br/> |
| [DeployedServicePackageNewHealthReportEvent](sfclient-v82-model-deployedservicepackagenewhealthreportevent.md) | Deployed Service Health Report Created event.<br/> |
| [DeployedServicePackagesHealthEvaluation](sfclient-v82-model-deployedservicepackageshealthevaluation.md) | Represents health evaluation for deployed service packages, containing health evaluations for each unhealthy deployed service package that impacted current aggregated health state. Can be returned when evaluating deployed application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedServicePackagesHealthEvaluation](sfclient-v82-model-deployedservicepackageshealthevaluation.md) | Represents health evaluation for deployed service packages, containing health evaluations for each unhealthy deployed service package that impacted current aggregated health state. Can be returned when evaluating deployed application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedServiceReplicaDetailInfo](sfclient-v82-model-deployedservicereplicadetailinfo.md) | Information about a Service Fabric service replica deployed on a node.<br/> |
| [DeployedServiceReplicaInfo](sfclient-v82-model-deployedservicereplicainfo.md) | Information about a Service Fabric service replica deployed on a node.<br/> |
| [DeployedServiceTypeInfo](sfclient-v82-model-deployedservicetypeinfo.md) | Information about service type deployed on a node, information such as the status of the service type registration on a node.<br/> |
| [DeployedStatefulServiceReplicaDetailInfo](sfclient-v82-model-deployedstatefulservicereplicadetailinfo.md) | Information about a stateful replica running in a code package. Note DeployedServiceReplicaQueryResult will contain duplicate data like ServiceKind, ServiceName, PartitionId and replicaId.<br/> |
| [DeployedStatefulServiceReplicaDetailInfo](sfclient-v82-model-deployedstatefulservicereplicadetailinfo.md) | Information about a stateful replica running in a code package. Note DeployedServiceReplicaQueryResult will contain duplicate data like ServiceKind, ServiceName, PartitionId and replicaId.<br/> |
| [DeployedStatefulServiceReplicaInfo](sfclient-v82-model-deployedstatefulservicereplicainfo.md) | Information about a stateful service replica deployed on a node.<br/> |
| [DeployedStatefulServiceReplicaInfo](sfclient-v82-model-deployedstatefulservicereplicainfo.md) | Information about a stateful service replica deployed on a node.<br/> |
| [DeployedStatelessServiceInstanceDetailInfo](sfclient-v82-model-deployedstatelessserviceinstancedetailinfo.md) | Information about a stateless instance running in a code package. Note that DeployedServiceReplicaQueryResult will contain duplicate data like ServiceKind, ServiceName, PartitionId and InstanceId.<br/> |
| [DeployedStatelessServiceInstanceDetailInfo](sfclient-v82-model-deployedstatelessserviceinstancedetailinfo.md) | Information about a stateless instance running in a code package. Note that DeployedServiceReplicaQueryResult will contain duplicate data like ServiceKind, ServiceName, PartitionId and InstanceId.<br/> |
| [DeployedStatelessServiceInstanceInfo](sfclient-v82-model-deployedstatelessserviceinstanceinfo.md) | Information about a stateless service instance deployed on a node.<br/> |
| [DeployedStatelessServiceInstanceInfo](sfclient-v82-model-deployedstatelessserviceinstanceinfo.md) | Information about a stateless service instance deployed on a node.<br/> |
| [DeploymentStatus enum](sfclient-v82-model-deploymentstatus.md) | Specifies the status of a deployed application or service package on a Service Fabric node.<br/> |
| [DeployServicePackageToNodeDescription](sfclient-v82-model-deployservicepackagetonodedescription.md) | Defines description for downloading packages associated with a service manifest to image cache on a Service Fabric node.<br/> |
| [DiagnosticsDescription](sfclient-v82-model-diagnosticsdescription.md) | Describes the diagnostics options available<br/> |
| [DiagnosticsRef](sfclient-v82-model-diagnosticsref.md) | Reference to sinks in DiagnosticsDescription.<br/> |
| [DiagnosticsSinkKind enum](sfclient-v82-model-diagnosticssinkkind.md) | The kind of DiagnosticsSink.<br/> |
| [DiagnosticsSinkProperties](sfclient-v82-model-diagnosticssinkproperties.md) | Properties of a DiagnosticsSink.<br/> |
| [DisableBackupDescription](sfclient-v82-model-disablebackupdescription.md) | It describes the body parameters while disabling backup of a backup entity(Application/Service/Partition).<br/> |
| [DiskInfo](sfclient-v82-model-diskinfo.md) | Information about the disk<br/> |
| [DoublePropertyValue](sfclient-v82-model-doublepropertyvalue.md) | Describes a Service Fabric property value of type Double.<br/> |
| [DoublePropertyValue](sfclient-v82-model-doublepropertyvalue.md) | Describes a Service Fabric property value of type Double.<br/> |
| [DsmsAzureBlobBackupStorageDescription](sfclient-v82-model-dsmsazureblobbackupstoragedescription.md) | Describes the parameters for Dsms Azure blob store used for storing and enumerating backups.<br/> |
| [DsmsAzureBlobBackupStorageDescription](sfclient-v82-model-dsmsazureblobbackupstoragedescription.md) | Describes the parameters for Dsms Azure blob store used for storing and enumerating backups.<br/> |
| [EnableBackupDescription](sfclient-v82-model-enablebackupdescription.md) | Specifies the parameters needed to enable periodic backup.<br/> |
| [EndpointProperties](sfclient-v82-model-endpointproperties.md) | Describes a container endpoint.<br/> |
| [EndpointRef](sfclient-v82-model-endpointref.md) | Describes a reference to a service endpoint.<br/> |
| [EnsureAvailabilitySafetyCheck](sfclient-v82-model-ensureavailabilitysafetycheck.md) | Safety check that waits to ensure the availability of the partition. It waits until there are replicas available such that bringing down this replica will not cause availability loss for the partition.<br/> |
| [EnsureAvailabilitySafetyCheck](sfclient-v82-model-ensureavailabilitysafetycheck.md) | Safety check that waits to ensure the availability of the partition. It waits until there are replicas available such that bringing down this replica will not cause availability loss for the partition.<br/> |
| [EnsurePartitionQuorumSafetyCheck](sfclient-v82-model-ensurepartitionquorumsafetycheck.md) | Safety check that ensures that a quorum of replicas are not lost for a partition.<br/> |
| [EnsurePartitionQuorumSafetyCheck](sfclient-v82-model-ensurepartitionquorumsafetycheck.md) | Safety check that ensures that a quorum of replicas are not lost for a partition.<br/> |
| [EntityHealth](sfclient-v82-model-entityhealth.md) | Health information common to all entities in the cluster. It contains the aggregated health state, health events and unhealthy evaluation.<br/> |
| [EntityHealthState](sfclient-v82-model-entityhealthstate.md) | A base type for the health state of various entities in the cluster. It contains the aggregated health state.<br/> |
| [EntityHealthStateChunk](sfclient-v82-model-entityhealthstatechunk.md) | A base type for the health state chunk of various entities in the cluster. It contains the aggregated health state.<br/> |
| [EntityHealthStateChunkList](sfclient-v82-model-entityhealthstatechunklist.md) | A base type for the list of health state chunks found in the cluster. It contains the total number of health states that match the input filters.<br/> |
| [EntityKind enum](sfclient-v82-model-entitykind.md) | The entity type of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.<br/> |
| [EntityKindHealthStateCount](sfclient-v82-model-entitykindhealthstatecount.md) | Represents health state count for entities of the specified entity kind.<br/> |
| [EntryPointStatus enum](sfclient-v82-model-entrypointstatus.md) | Specifies the status of the code package entry point deployed on a Service Fabric node.<br/> |
| [EnvironmentVariable](sfclient-v82-model-environmentvariable.md) | Describes an environment variable for the container.<br/> |
| [EnvironmentVariableType enum](sfclient-v82-model-environmentvariabletype.md) | The type of the environment variable being given in value<br/> |
| [Epoch](sfclient-v82-model-epoch.md) | An Epoch is a configuration number for the partition as a whole. When the configuration of the replica set changes, for example when the Primary replica changes, the operations that are replicated from the new Primary replica are said to be a new Epoch from the ones which were sent by the old Primary replica.<br/> |
| [EventHealthEvaluation](sfclient-v82-model-eventhealthevaluation.md) | Represents health evaluation of a HealthEvent that was reported on the entity.<br/>The health evaluation is returned when evaluating health of an entity results in Error or Warning.<br/> |
| [EventHealthEvaluation](sfclient-v82-model-eventhealthevaluation.md) | Represents health evaluation of a HealthEvent that was reported on the entity.<br/>The health evaluation is returned when evaluating health of an entity results in Error or Warning.<br/> |
| [ExecutingFaultsChaosEvent](sfclient-v82-model-executingfaultschaosevent.md) | Describes a Chaos event that gets generated when Chaos has decided on the faults for an iteration. This Chaos event contains the details of the faults as a list of strings.<br/> |
| [ExecutingFaultsChaosEvent](sfclient-v82-model-executingfaultschaosevent.md) | Describes a Chaos event that gets generated when Chaos has decided on the faults for an iteration. This Chaos event contains the details of the faults as a list of strings.<br/> |
| [ExecutionPolicy](sfclient-v82-model-executionpolicy.md) | The execution policy of the service<br/> |
| [ExecutionPolicyType enum](sfclient-v82-model-executionpolicytype.md) | Enumerates the execution policy types for services.<br/> |
| [ExternalStoreProvisionApplicationTypeDescription](sfclient-v82-model-externalstoreprovisionapplicationtypedescription.md) | Describes the operation to register or provision an application type using an application package from an external store instead of a package uploaded to the Service Fabric image store.<br/> |
| [ExternalStoreProvisionApplicationTypeDescription](sfclient-v82-model-externalstoreprovisionapplicationtypedescription.md) | Describes the operation to register or provision an application type using an application package from an external store instead of a package uploaded to the Service Fabric image store.<br/> |
| [FabricCodeVersionInfo](sfclient-v82-model-fabriccodeversioninfo.md) | Information about a Service Fabric code version.<br/> |
| [FabricConfigVersionInfo](sfclient-v82-model-fabricconfigversioninfo.md) | Information about a Service Fabric config version.<br/> |
| [FabricError](sfclient-v82-model-fabricerror.md) | The REST API operations for Service Fabric return standard HTTP status codes. This type defines the additional information returned from the Service Fabric API operations that are not successful.<br/> |
| [FabricErrorCodes enum](sfclient-v82-model-fabricerrorcodes.md) | Defines the fabric error codes that be returned as part of the error object in response to Service Fabric API operations that are not successful. Following are the error code values that can be returned for a specific HTTP status code.<br/><br/>  - Possible values of the error code for HTTP status code 400 (Bad Request)<br/>    - "FABRIC_E_INVALID_PARTITION_KEY"<br/>    - "FABRIC_E_IMAGEBUILDER_VALIDATION_ERROR"<br/>    - "FABRIC_E_INVALID_ADDRESS"<br/>    - "FABRIC_E_APPLICATION_NOT_UPGRADING"<br/>    - "FABRIC_E_APPLICATION_UPGRADE_VALIDATION_ERROR"<br/>    - "FABRIC_E_FABRIC_NOT_UPGRADING"<br/>    - "FABRIC_E_FABRIC_UPGRADE_VALIDATION_ERROR"<br/>    - "FABRIC_E_INVALID_CONFIGURATION"<br/>    - "FABRIC_E_INVALID_NAME_URI"<br/>    - "FABRIC_E_PATH_TOO_LONG"<br/>    - "FABRIC_E_KEY_TOO_LARGE"<br/>    - "FABRIC_E_SERVICE_AFFINITY_CHAIN_NOT_SUPPORTED"<br/>    - "FABRIC_E_INVALID_ATOMIC_GROUP"<br/>    - "FABRIC_E_VALUE_EMPTY"<br/>    - "FABRIC_E_BACKUP_IS_ENABLED"<br/>    - "FABRIC_E_RESTORE_SOURCE_TARGET_PARTITION_MISMATCH"<br/>    - "FABRIC_E_INVALID_FOR_STATELESS_SERVICES"<br/>    - "FABRIC_E_INVALID_SERVICE_SCALING_POLICY"<br/>    - "E_INVALIDARG"<br/><br/>  - Possible values of the error code for HTTP status code 404 (Not Found)<br/>    - "FABRIC_E_NODE_NOT_FOUND"<br/>    - "FABRIC_E_APPLICATION_TYPE_NOT_FOUND"<br/>    - "FABRIC_E_APPLICATION_NOT_FOUND"<br/>    - "FABRIC_E_SERVICE_TYPE_NOT_FOUND"<br/>    - "FABRIC_E_SERVICE_DOES_NOT_EXIST"<br/>    - "FABRIC_E_SERVICE_TYPE_TEMPLATE_NOT_FOUND"<br/>    - "FABRIC_E_CONFIGURATION_SECTION_NOT_FOUND"<br/>    - "FABRIC_E_PARTITION_NOT_FOUND"<br/>    - "FABRIC_E_REPLICA_DOES_NOT_EXIST"<br/>    - "FABRIC_E_SERVICE_GROUP_DOES_NOT_EXIST"<br/>    - "FABRIC_E_CONFIGURATION_PARAMETER_NOT_FOUND"<br/>    - "FABRIC_E_DIRECTORY_NOT_FOUND"<br/>    - "FABRIC_E_FABRIC_VERSION_NOT_FOUND"<br/>    - "FABRIC_E_FILE_NOT_FOUND"<br/>    - "FABRIC_E_NAME_DOES_NOT_EXIST"<br/>    - "FABRIC_E_PROPERTY_DOES_NOT_EXIST"<br/>    - "FABRIC_E_ENUMERATION_COMPLETED"<br/>    - "FABRIC_E_SERVICE_MANIFEST_NOT_FOUND"<br/>    - "FABRIC_E_KEY_NOT_FOUND"<br/>    - "FABRIC_E_HEALTH_ENTITY_NOT_FOUND"<br/>    - "FABRIC_E_BACKUP_NOT_ENABLED"<br/>    - "FABRIC_E_BACKUP_POLICY_NOT_EXISTING"<br/>    - "FABRIC_E_FAULT_ANALYSIS_SERVICE_NOT_EXISTING"<br/>    - "FABRIC_E_IMAGEBUILDER_RESERVED_DIRECTORY_ERROR"<br/><br/>  - Possible values of the error code for HTTP status code 409 (Conflict)<br/>    - "FABRIC_E_APPLICATION_TYPE_ALREADY_EXISTS"<br/>    - "FABRIC_E_APPLICATION_ALREADY_EXISTS"<br/>    - "FABRIC_E_APPLICATION_ALREADY_IN_TARGET_VERSION"<br/>    - "FABRIC_E_APPLICATION_TYPE_PROVISION_IN_PROGRESS"<br/>    - "FABRIC_E_APPLICATION_UPGRADE_IN_PROGRESS"<br/>    - "FABRIC_E_SERVICE_ALREADY_EXISTS"<br/>    - "FABRIC_E_SERVICE_GROUP_ALREADY_EXISTS"<br/>    - "FABRIC_E_APPLICATION_TYPE_IN_USE"<br/>    - "FABRIC_E_FABRIC_ALREADY_IN_TARGET_VERSION"<br/>    - "FABRIC_E_FABRIC_VERSION_ALREADY_EXISTS"<br/>    - "FABRIC_E_FABRIC_VERSION_IN_USE"<br/>    - "FABRIC_E_FABRIC_UPGRADE_IN_PROGRESS"<br/>    - "FABRIC_E_NAME_ALREADY_EXISTS"<br/>    - "FABRIC_E_NAME_NOT_EMPTY"<br/>    - "FABRIC_E_PROPERTY_CHECK_FAILED"<br/>    - "FABRIC_E_SERVICE_METADATA_MISMATCH"<br/>    - "FABRIC_E_SERVICE_TYPE_MISMATCH"<br/>    - "FABRIC_E_HEALTH_STALE_REPORT"<br/>    - "FABRIC_E_SEQUENCE_NUMBER_CHECK_FAILED"<br/>    - "FABRIC_E_NODE_HAS_NOT_STOPPED_YET"<br/>    - "FABRIC_E_INSTANCE_ID_MISMATCH"<br/>    - "FABRIC_E_BACKUP_IN_PROGRESS"<br/>    - "FABRIC_E_RESTORE_IN_PROGRESS"<br/>    - "FABRIC_E_BACKUP_POLICY_ALREADY_EXISTING"<br/><br/>  - Possible values of the error code for HTTP status code 413 (Request Entity Too Large)<br/>    - "FABRIC_E_VALUE_TOO_LARGE"<br/><br/>  - Possible values of the error code for HTTP status code 500 (Internal Server Error)<br/>    - "FABRIC_E_NODE_IS_UP"<br/>    - "E_FAIL"<br/>    - "FABRIC_E_SINGLE_INSTANCE_APPLICATION_ALREADY_EXISTS"<br/>    - "FABRIC_E_SINGLE_INSTANCE_APPLICATION_NOT_FOUND"<br/>    - "FABRIC_E_VOLUME_ALREADY_EXISTS"<br/>    - "FABRIC_E_VOLUME_NOT_FOUND"<br/>    - "SerializationError"<br/><br/>  - Possible values of the error code for HTTP status code 503 (Service Unavailable)<br/>    - "FABRIC_E_NO_WRITE_QUORUM"<br/>    - "FABRIC_E_NOT_PRIMARY"<br/>    - "FABRIC_E_NOT_READY"<br/>    - "FABRIC_E_RECONFIGURATION_PENDING"<br/>    - "FABRIC_E_SERVICE_OFFLINE"<br/>    - "E_ABORT"<br/>    - "FABRIC_E_VALUE_TOO_LARGE"<br/><br/>  - Possible values of the error code for HTTP status code 504 (Gateway Timeout)<br/>    - "FABRIC_E_COMMUNICATION_ERROR"<br/>    - "FABRIC_E_OPERATION_NOT_COMPLETE"<br/>    - "FABRIC_E_TIMEOUT"<br/> |
| [FabricErrorError](sfclient-v82-model-fabricerrorerror.md) | Error object containing error code and error message.<br/> |
| [FabricEvent](sfclient-v82-model-fabricevent.md) | Represents the base for all Fabric Events.<br/> |
| [FabricEventKind enum](sfclient-v82-model-fabriceventkind.md) | The kind of FabricEvent.<br/> |
| [FabricReplicaStatus enum](sfclient-v82-model-fabricreplicastatus.md) | Specifies the status of the replica.<br/> |
| [FailedPropertyBatchInfo](sfclient-v82-model-failedpropertybatchinfo.md) | Derived from PropertyBatchInfo. Represents the property batch failing. Contains information about the specific batch failure.<br/> |
| [FailedPropertyBatchInfo](sfclient-v82-model-failedpropertybatchinfo.md) | Derived from PropertyBatchInfo. Represents the property batch failing. Contains information about the specific batch failure.<br/> |
| [FailedUpgradeDomainProgressObject](sfclient-v82-model-failedupgradedomainprogressobject.md) | The detailed upgrade progress for nodes in the current upgrade domain at the point of failure. Not applicable to node-by-node upgrades.<br/> |
| [FailureAction enum](sfclient-v82-model-failureaction.md) | The compensating action to perform when a Monitored upgrade encounters monitoring policy or health policy violations.<br/>Invalid indicates the failure action is invalid. Rollback specifies that the upgrade will start rolling back automatically.<br/>Manual indicates that the upgrade will switch to UnmonitoredManual upgrade mode.<br/> |
| [FailureReason enum](sfclient-v82-model-failurereason.md) | The cause of an upgrade failure that resulted in FailureAction being executed.<br/> |
| [FailureUpgradeDomainProgressInfo](sfclient-v82-model-failureupgradedomainprogressinfo.md) | Information about the upgrade domain progress at the time of upgrade failure.<br/> |
| [FileInfo](sfclient-v82-model-fileinfo.md) | Information about a image store file.<br/> |
| [FileShareBackupStorageDescription](sfclient-v82-model-filesharebackupstoragedescription.md) | Describes the parameters for file share storage used for storing or enumerating backups.<br/> |
| [FileShareBackupStorageDescription](sfclient-v82-model-filesharebackupstoragedescription.md) | Describes the parameters for file share storage used for storing or enumerating backups.<br/> |
| [FileVersion](sfclient-v82-model-fileversion.md) | Information about the version of image store file.<br/> |
| [FolderInfo](sfclient-v82-model-folderinfo.md) | Information about a image store folder. It includes how many files this folder contains and its image store relative path.<br/> |
| [FolderSizeInfo](sfclient-v82-model-foldersizeinfo.md) | Information of a image store folder size<br/> |
| [FrequencyBasedBackupScheduleDescription](sfclient-v82-model-frequencybasedbackupscheduledescription.md) | Describes the frequency based backup schedule.<br/> |
| [FrequencyBasedBackupScheduleDescription](sfclient-v82-model-frequencybasedbackupscheduledescription.md) | Describes the frequency based backup schedule.<br/> |
| [GatewayDestination](sfclient-v82-model-gatewaydestination.md) | Describes destination endpoint for routing traffic.<br/> |
| [GatewayProperties](sfclient-v82-model-gatewayproperties.md) | Describes properties of a gateway resource.<br/> |
| [GatewayResourceDescription](sfclient-v82-model-gatewayresourcedescription.md) | This type describes a gateway resource.<br/> |
| [GetBackupByStorageQueryDescription](sfclient-v82-model-getbackupbystoragequerydescription.md) | Describes additional filters to be applied, while listing backups, and backup storage details from where to fetch the backups.<br/> |
| [GetPropertyBatchOperation](sfclient-v82-model-getpropertybatchoperation.md) | Represents a PropertyBatchOperation that gets the specified property if it exists.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [GetPropertyBatchOperation](sfclient-v82-model-getpropertybatchoperation.md) | Represents a PropertyBatchOperation that gets the specified property if it exists.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [GuidPropertyValue](sfclient-v82-model-guidpropertyvalue.md) | Describes a Service Fabric property value of type Guid.<br/> |
| [GuidPropertyValue](sfclient-v82-model-guidpropertyvalue.md) | Describes a Service Fabric property value of type Guid.<br/> |
| [HeaderMatchType enum](sfclient-v82-model-headermatchtype.md) | Possible values include: 'exact'<br/> |
| [HealthEvaluation](sfclient-v82-model-healthevaluation.md) | Represents a health evaluation which describes the data and the algorithm used by health manager to evaluate the health of an entity.<br/> |
| [HealthEvaluationKind enum](sfclient-v82-model-healthevaluationkind.md) | The health manager in the cluster performs health evaluations in determining the aggregated health state of an entity. This enumeration provides information on the kind of evaluation that was performed. Following are the possible values.<br/> |
| [HealthEvaluationWrapper](sfclient-v82-model-healthevaluationwrapper.md) | Wrapper object for health evaluation.<br/> |
| [HealthEvent](sfclient-v82-model-healthevent.md) | Represents health information reported on a health entity, such as cluster, application or node, with additional metadata added by the Health Manager.<br/> |
| [HealthEvent](sfclient-v82-model-healthevent.md) | Represents health information reported on a health entity, such as cluster, application or node, with additional metadata added by the Health Manager.<br/> |
| [HealthInformation](sfclient-v82-model-healthinformation.md) | Represents common health report information. It is included in all health reports sent to health store and in all health events returned by health queries.<br/> |
| [HealthState enum](sfclient-v82-model-healthstate.md) | The health state of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.<br/> |
| [HealthStateCount](sfclient-v82-model-healthstatecount.md) | Represents information about how many health entities are in Ok, Warning and Error health state.<br/> |
| [HealthStatistics](sfclient-v82-model-healthstatistics.md) | The health statistics of an entity, returned as part of the health query result when the query description is configured to include statistics.<br/>The statistics include health state counts for all children types of the current entity.<br/>For example, for cluster, the health statistics include health state counts for nodes, applications, services, partitions, replicas, deployed applications and deployed service packages.<br/>For partition, the health statistics include health counts for replicas.<br/> |
| [HostIsolationMode enum](sfclient-v82-model-hostisolationmode.md) | Specifies the isolation mode of main entry point of a code package when it's host type is ContainerHost. This is specified as part of container host policies in application manifest while importing service manifest.<br/> |
| [HostType enum](sfclient-v82-model-hosttype.md) | Specifies the type of host for main entry point of a code package as specified in service manifest.<br/> |
| [HttpConfig](sfclient-v82-model-httpconfig.md) | Describes the http configuration for external connectivity for this network.<br/> |
| [HttpHostConfig](sfclient-v82-model-httphostconfig.md) | Describes the hostname properties for http routing.<br/> |
| [HttpRouteConfig](sfclient-v82-model-httprouteconfig.md) | Describes the hostname properties for http routing.<br/> |
| [HttpRouteMatchHeader](sfclient-v82-model-httproutematchheader.md) | Describes header information for http route matching.<br/> |
| [HttpRouteMatchPath](sfclient-v82-model-httproutematchpath.md) | Path to match for routing.<br/> |
| [HttpRouteMatchRule](sfclient-v82-model-httproutematchrule.md) | Describes a rule for http route matching.<br/> |
| [IdentityDescription](sfclient-v82-model-identitydescription.md) | Information describing the identities associated with this application.<br/> |
| [IdentityItemDescription](sfclient-v82-model-identityitemdescription.md) | Describes a single user-assigned identity associated with the application.<br/> |
| [ImageRegistryCredential](sfclient-v82-model-imageregistrycredential.md) | Image registry credential.<br/> |
| [ImageRegistryPasswordType enum](sfclient-v82-model-imageregistrypasswordtype.md) | The type of the image registry password being given in password<br/> |
| [ImageStoreContent](sfclient-v82-model-imagestorecontent.md) | Information about the image store content.<br/> |
| [ImageStoreCopyDescription](sfclient-v82-model-imagestorecopydescription.md) | Information about how to copy image store content from one image store relative path to another image store relative path.<br/> |
| [ImageStoreInfo](sfclient-v82-model-imagestoreinfo.md) | Information about the ImageStore's resource usage<br/> |
| [ImpactLevel enum](sfclient-v82-model-impactlevel.md) | Possible values include: 'Invalid', 'None', 'Restart', 'RemoveData', 'RemoveNode'<br/> |
| [InlinedValueSecretResourceProperties](sfclient-v82-model-inlinedvaluesecretresourceproperties.md) | Describes the properties of a secret resource whose value is provided explicitly as plaintext. The secret resource may have multiple values, each being uniquely versioned. The secret value of each version is stored encrypted, and delivered as plaintext into the context of applications referencing it.<br/> |
| [InlinedValueSecretResourceProperties](sfclient-v82-model-inlinedvaluesecretresourceproperties.md) | Describes the properties of a secret resource whose value is provided explicitly as plaintext. The secret resource may have multiple values, each being uniquely versioned. The secret value of each version is stored encrypted, and delivered as plaintext into the context of applications referencing it.<br/> |
| [InstanceLifecycleDescription](sfclient-v82-model-instancelifecycledescription.md) | Describes how the instance will behave<br/> |
| [Int64PropertyValue](sfclient-v82-model-int64propertyvalue.md) | Describes a Service Fabric property value of type Int64.<br/> |
| [Int64PropertyValue](sfclient-v82-model-int64propertyvalue.md) | Describes a Service Fabric property value of type Int64.<br/> |
| [Int64RangePartitionInformation](sfclient-v82-model-int64rangepartitioninformation.md) | Describes the partition information for the integer range that is based on partition schemes.<br/> |
| [Int64RangePartitionInformation](sfclient-v82-model-int64rangepartitioninformation.md) | Describes the partition information for the integer range that is based on partition schemes.<br/> |
| [InvokeDataLossResult](sfclient-v82-model-invokedatalossresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [InvokeQuorumLossResult](sfclient-v82-model-invokequorumlossresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [KeyValueStoreReplicaStatus](sfclient-v82-model-keyvaluestorereplicastatus.md) | Key value store related information for the replica.<br/> |
| [KeyValueStoreReplicaStatus](sfclient-v82-model-keyvaluestorereplicastatus.md) | Key value store related information for the replica.<br/> |
| [LoadedPartitionInformationQueryDescription](sfclient-v82-model-loadedpartitioninformationquerydescription.md) | Represents data structure that contains query information.<br/> |
| [LoadedPartitionInformationResult](sfclient-v82-model-loadedpartitioninformationresult.md) | Represents partition information.<br/> |
| [LoadedPartitionInformationResultList](sfclient-v82-model-loadedpartitioninformationresultlist.md) | Represents data structure that contains top/least loaded partitions for a certain metric.<br/> |
| [LoadMetricInformation](sfclient-v82-model-loadmetricinformation.md) | Represents data structure that contains load information for a certain metric in a cluster.<br/> |
| [LoadMetricReport](sfclient-v82-model-loadmetricreport.md) | Represents the load metric report which contains the time metric was reported, its name and value.<br/> |
| [LoadMetricReportInfo](sfclient-v82-model-loadmetricreportinfo.md) | Information about load reported by replica.<br/> |
| [LocalNetworkResourceProperties](sfclient-v82-model-localnetworkresourceproperties.md) | Information about a Service Fabric container network local to a single Service Fabric cluster.<br/> |
| [LocalNetworkResourceProperties](sfclient-v82-model-localnetworkresourceproperties.md) | Information about a Service Fabric container network local to a single Service Fabric cluster.<br/> |
| [ManagedApplicationIdentity](sfclient-v82-model-managedapplicationidentity.md) | Describes a managed application identity.<br/> |
| [ManagedApplicationIdentityDescription](sfclient-v82-model-managedapplicationidentitydescription.md) | Managed application identity description.<br/> |
| [ManagedIdentityAzureBlobBackupStorageDescription](sfclient-v82-model-managedidentityazureblobbackupstoragedescription.md) | Describes the parameters for Azure blob store (connected using managed identity) used for storing and enumerating backups.<br/> |
| [ManagedIdentityAzureBlobBackupStorageDescription](sfclient-v82-model-managedidentityazureblobbackupstoragedescription.md) | Describes the parameters for Azure blob store (connected using managed identity) used for storing and enumerating backups.<br/> |
| [ManagedIdentityType enum](sfclient-v82-model-managedidentitytype.md) | The type of managed identity to be used to connect to Azure Blob Store via Managed Identity.<br/> |
| [MetricLoadDescription](sfclient-v82-model-metricloaddescription.md) | Specifies metric load information.<br/> |
| [MonitoringPolicyDescription](sfclient-v82-model-monitoringpolicydescription.md) | Describes the parameters for monitoring an upgrade in Monitored mode.<br/> |
| [MoveCost enum](sfclient-v82-model-movecost.md) | Specifies the move cost for the service.<br/> |
| [NameDescription](sfclient-v82-model-namedescription.md) | Describes a Service Fabric name.<br/> |
| [NamedPartitionInformation](sfclient-v82-model-namedpartitioninformation.md) | Describes the partition information for the name as a string that is based on partition schemes.<br/> |
| [NamedPartitionInformation](sfclient-v82-model-namedpartitioninformation.md) | Describes the partition information for the name as a string that is based on partition schemes.<br/> |
| [NamedPartitionSchemeDescription](sfclient-v82-model-namedpartitionschemedescription.md) | Describes the named partition scheme of the service.<br/> |
| [NamedPartitionSchemeDescription](sfclient-v82-model-namedpartitionschemedescription.md) | Describes the named partition scheme of the service.<br/> |
| [NetworkKind enum](sfclient-v82-model-networkkind.md) | The type of a Service Fabric container network.<br/> |
| [NetworkRef](sfclient-v82-model-networkref.md) | Describes a network reference in a service.<br/> |
| [NetworkResourceDescription](sfclient-v82-model-networkresourcedescription.md) | This type describes a network resource.<br/> |
| [NetworkResourceProperties](sfclient-v82-model-networkresourceproperties.md) | Describes properties of a network resource.<br/> |
| [NetworkResourcePropertiesBase](sfclient-v82-model-networkresourcepropertiesbase.md) | This type describes the properties of a network resource, including its kind.<br/> |
| [NodeAbortedEvent](sfclient-v82-model-nodeabortedevent.md) | Node Aborted event.<br/> |
| [NodeAbortedEvent](sfclient-v82-model-nodeabortedevent.md) | Node Aborted event.<br/> |
| [NodeAddedToClusterEvent](sfclient-v82-model-nodeaddedtoclusterevent.md) | Node Added event.<br/> |
| [NodeAddedToClusterEvent](sfclient-v82-model-nodeaddedtoclusterevent.md) | Node Added event.<br/> |
| [NodeClosedEvent](sfclient-v82-model-nodeclosedevent.md) | Node Closed event.<br/> |
| [NodeClosedEvent](sfclient-v82-model-nodeclosedevent.md) | Node Closed event.<br/> |
| [NodeDeactivateCompletedEvent](sfclient-v82-model-nodedeactivatecompletedevent.md) | Node Deactivate Completed event.<br/> |
| [NodeDeactivateCompletedEvent](sfclient-v82-model-nodedeactivatecompletedevent.md) | Node Deactivate Completed event.<br/> |
| [NodeDeactivateStartedEvent](sfclient-v82-model-nodedeactivatestartedevent.md) | Node Deactivate Started event.<br/> |
| [NodeDeactivateStartedEvent](sfclient-v82-model-nodedeactivatestartedevent.md) | Node Deactivate Started event.<br/> |
| [NodeDeactivationInfo](sfclient-v82-model-nodedeactivationinfo.md) | Information about the node deactivation. This information is valid for a node that is undergoing deactivation or has already been deactivated.<br/> |
| [NodeDeactivationIntent enum](sfclient-v82-model-nodedeactivationintent.md) | The intent or the reason for deactivating the node. Following are the possible values for it.<br/> |
| [NodeDeactivationStatus enum](sfclient-v82-model-nodedeactivationstatus.md) | The status of node deactivation operation. Following are the possible values.<br/> |
| [NodeDeactivationTask](sfclient-v82-model-nodedeactivationtask.md) | The task representing the deactivation operation on the node.<br/> |
| [NodeDeactivationTaskId](sfclient-v82-model-nodedeactivationtaskid.md) | Identity of the task related to deactivation operation on the node.<br/> |
| [NodeDeactivationTaskType enum](sfclient-v82-model-nodedeactivationtasktype.md) | The type of the task that performed the node deactivation. Following are the possible values.<br/> |
| [NodeDownEvent](sfclient-v82-model-nodedownevent.md) | Node Down event.<br/> |
| [NodeDownEvent](sfclient-v82-model-nodedownevent.md) | Node Down event.<br/> |
| [NodeEvent](sfclient-v82-model-nodeevent.md) | Represents the base for all Node Events.<br/> |
| [NodeEvent](sfclient-v82-model-nodeevent.md) | Represents the base for all Node Events.<br/> |
| [NodeHealth](sfclient-v82-model-nodehealth.md) | Information about the health of a Service Fabric node.<br/> |
| [NodeHealth](sfclient-v82-model-nodehealth.md) | Information about the health of a Service Fabric node.<br/> |
| [NodeHealthEvaluation](sfclient-v82-model-nodehealthevaluation.md) | Represents health evaluation for a node, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [NodeHealthEvaluation](sfclient-v82-model-nodehealthevaluation.md) | Represents health evaluation for a node, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [NodeHealthReportExpiredEvent](sfclient-v82-model-nodehealthreportexpiredevent.md) | Node Health Report Expired event.<br/> |
| [NodeHealthReportExpiredEvent](sfclient-v82-model-nodehealthreportexpiredevent.md) | Node Health Report Expired event.<br/> |
| [NodeHealthState](sfclient-v82-model-nodehealthstate.md) | Represents the health state of a node, which contains the node identifier and its aggregated health state.<br/> |
| [NodeHealthState](sfclient-v82-model-nodehealthstate.md) | Represents the health state of a node, which contains the node identifier and its aggregated health state.<br/> |
| [NodeHealthStateChunk](sfclient-v82-model-nodehealthstatechunk.md) | Represents the health state chunk of a node, which contains the node name and its aggregated health state.<br/> |
| [NodeHealthStateChunk](sfclient-v82-model-nodehealthstatechunk.md) | Represents the health state chunk of a node, which contains the node name and its aggregated health state.<br/> |
| [NodeHealthStateChunkList](sfclient-v82-model-nodehealthstatechunklist.md) | The list of node health state chunks in the cluster that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [NodeHealthStateChunkList](sfclient-v82-model-nodehealthstatechunklist.md) | The list of node health state chunks in the cluster that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [NodeHealthStateFilter](sfclient-v82-model-nodehealthstatefilter.md) | Defines matching criteria to determine whether a node should be included in the returned cluster health chunk.<br/>One filter can match zero, one or multiple nodes, depending on its properties.<br/>Can be specified in the cluster health chunk query description.<br/> |
| [NodeId](sfclient-v82-model-nodeid.md) | An internal ID used by Service Fabric to uniquely identify a node. Node Id is deterministically generated from node name.<br/> |
| [NodeImpact](sfclient-v82-model-nodeimpact.md) | Describes the expected impact of a repair to a particular node.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeInfo](sfclient-v82-model-nodeinfo.md) | Information about a node in Service Fabric cluster.<br/> |
| [NodeLoadInfo](sfclient-v82-model-nodeloadinfo.md) | Information about load on a Service Fabric node. It holds a summary of all metrics and their load on a node.<br/> |
| [NodeLoadMetricInformation](sfclient-v82-model-nodeloadmetricinformation.md) | Represents data structure that contains load information for a certain metric on a node.<br/> |
| [NodeNewHealthReportEvent](sfclient-v82-model-nodenewhealthreportevent.md) | Node Health Report Created event.<br/> |
| [NodeNewHealthReportEvent](sfclient-v82-model-nodenewhealthreportevent.md) | Node Health Report Created event.<br/> |
| [NodeOpenFailedEvent](sfclient-v82-model-nodeopenfailedevent.md) | Node Open Failed event.<br/> |
| [NodeOpenFailedEvent](sfclient-v82-model-nodeopenfailedevent.md) | Node Open Failed event.<br/> |
| [NodeOpenSucceededEvent](sfclient-v82-model-nodeopensucceededevent.md) | Node Opened Succeeded event.<br/> |
| [NodeOpenSucceededEvent](sfclient-v82-model-nodeopensucceededevent.md) | Node Opened Succeeded event.<br/> |
| [NodeRemovedFromClusterEvent](sfclient-v82-model-noderemovedfromclusterevent.md) | Node Removed event.<br/> |
| [NodeRemovedFromClusterEvent](sfclient-v82-model-noderemovedfromclusterevent.md) | Node Removed event.<br/> |
| [NodeRepairImpactDescription](sfclient-v82-model-noderepairimpactdescription.md) | Describes the expected impact of a repair on a set of nodes.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeRepairImpactDescription](sfclient-v82-model-noderepairimpactdescription.md) | Describes the expected impact of a repair on a set of nodes.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeRepairTargetDescription](sfclient-v82-model-noderepairtargetdescription.md) | Describes the list of nodes targeted by a repair action.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeRepairTargetDescription](sfclient-v82-model-noderepairtargetdescription.md) | Describes the list of nodes targeted by a repair action.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeResult](sfclient-v82-model-noderesult.md) | Contains information about a node that was targeted by a user-induced operation.<br/> |
| [NodesHealthEvaluation](sfclient-v82-model-nodeshealthevaluation.md) | Represents health evaluation for nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health and the aggregated health state is either Error or Warning.<br/> |
| [NodesHealthEvaluation](sfclient-v82-model-nodeshealthevaluation.md) | Represents health evaluation for nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health and the aggregated health state is either Error or Warning.<br/> |
| [NodeStatus enum](sfclient-v82-model-nodestatus.md) | The status of the node.<br/> |
| [NodeStatusFilter enum](sfclient-v82-model-nodestatusfilter.md) | Possible values include: 'default', 'all', 'up', 'down', 'enabling', 'disabling', 'disabled', 'unknown', 'removed'<br/> |
| [NodeTagsDescription](sfclient-v82-model-nodetagsdescription.md) | Describes the tags required for placement or running of the service.<br/> |
| [NodeTransitionProgress](sfclient-v82-model-nodetransitionprogress.md) | Information about an NodeTransition operation.  This class contains an OperationState and a NodeTransitionResult.  The NodeTransitionResult is not valid until OperationState<br/>is Completed or Faulted.<br/> |
| [NodeTransitionResult](sfclient-v82-model-nodetransitionresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [NodeTransitionType enum](sfclient-v82-model-nodetransitiontype.md) | Possible values include: 'Invalid', 'Start', 'Stop'<br/> |
| [NodeTypeHealthPolicyMapItem](sfclient-v82-model-nodetypehealthpolicymapitem.md) | Defines an item in NodeTypeHealthPolicyMap.<br/> |
| [NodeTypeNodesHealthEvaluation](sfclient-v82-model-nodetypenodeshealthevaluation.md) | Represents health evaluation for nodes of a particular node type. The node type nodes evaluation can be returned when cluster health evaluation returns unhealthy aggregated health state, either Error or Warning. It contains health evaluations for each unhealthy node of the included node type that impacted current aggregated health state.<br/> |
| [NodeTypeNodesHealthEvaluation](sfclient-v82-model-nodetypenodeshealthevaluation.md) | Represents health evaluation for nodes of a particular node type. The node type nodes evaluation can be returned when cluster health evaluation returns unhealthy aggregated health state, either Error or Warning. It contains health evaluations for each unhealthy node of the included node type that impacted current aggregated health state.<br/> |
| [NodeUpEvent](sfclient-v82-model-nodeupevent.md) | Node Up event.<br/> |
| [NodeUpEvent](sfclient-v82-model-nodeupevent.md) | Node Up event.<br/> |
| [NodeUpgradePhase enum](sfclient-v82-model-nodeupgradephase.md) | The state of the upgrading node.<br/> |
| [NodeUpgradeProgressInfo](sfclient-v82-model-nodeupgradeprogressinfo.md) | Information about the upgrading node and its status<br/> |
| [OperatingSystemType enum](sfclient-v82-model-operatingsystemtype.md) | The operation system required by the code in service.<br/> |
| [OperationState enum](sfclient-v82-model-operationstate.md) | The state of the operation.<br/> |
| [OperationStatus](sfclient-v82-model-operationstatus.md) | Contains the OperationId, OperationState, and OperationType for user-induced operations.<br/> |
| [OperationType enum](sfclient-v82-model-operationtype.md) | The type of the operation.<br/> |
| [Ordering enum](sfclient-v82-model-ordering.md) | Defines the order.<br/> |
| [PackageSharingPolicyInfo](sfclient-v82-model-packagesharingpolicyinfo.md) | Represents a policy for the package sharing.<br/> |
| [PackageSharingPolicyScope enum](sfclient-v82-model-packagesharingpolicyscope.md) | Represents the scope for PackageSharingPolicy. This is specified during DeployServicePackageToNode operation.<br/> |
| [PagedApplicationInfoList](sfclient-v82-model-pagedapplicationinfolist.md) | The list of applications in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedApplicationResourceDescriptionList](sfclient-v82-model-pagedapplicationresourcedescriptionlist.md) | The list of application resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedApplicationTypeInfoList](sfclient-v82-model-pagedapplicationtypeinfolist.md) | The list of application types that are provisioned or being provisioned in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedBackupConfigurationInfoList](sfclient-v82-model-pagedbackupconfigurationinfolist.md) | The list of backup configuration information. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedBackupEntityList](sfclient-v82-model-pagedbackupentitylist.md) | The list of backup entities that are being periodically backed. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedBackupInfoList](sfclient-v82-model-pagedbackupinfolist.md) | The list of backups. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedBackupPolicyDescriptionList](sfclient-v82-model-pagedbackuppolicydescriptionlist.md) | The list of backup policies configured in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedComposeDeploymentStatusInfoList](sfclient-v82-model-pagedcomposedeploymentstatusinfolist.md) | The list of compose deployments in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedDeployedApplicationInfoList](sfclient-v82-model-pageddeployedapplicationinfolist.md) | The list of deployed applications in activating, downloading, or active states on a node.<br/>The list is paged when all of the results cannot fit in a single message.<br/>The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedGatewayResourceDescriptionList](sfclient-v82-model-pagedgatewayresourcedescriptionlist.md) | The list of gateway resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedNetworkResourceDescriptionList](sfclient-v82-model-pagednetworkresourcedescriptionlist.md) | The list of network resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedNodeInfoList](sfclient-v82-model-pagednodeinfolist.md) | The list of nodes in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedPropertyInfoList](sfclient-v82-model-pagedpropertyinfolist.md) | The paged list of Service Fabric properties under a given name. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedReplicaInfoList](sfclient-v82-model-pagedreplicainfolist.md) | The list of replicas in the cluster for a given partition. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedSecretResourceDescriptionList](sfclient-v82-model-pagedsecretresourcedescriptionlist.md) | The list of secret resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedSecretValueResourceDescriptionList](sfclient-v82-model-pagedsecretvalueresourcedescriptionlist.md) | The list of values of a secret resource, paged if the number of results exceeds the limits of a single message. The next set of results can be obtained by executing the same query with the continuation token provided in the previous page.<br/> |
| [PagedServiceInfoList](sfclient-v82-model-pagedserviceinfolist.md) | The list of services in the cluster for an application. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedServicePartitionInfoList](sfclient-v82-model-pagedservicepartitioninfolist.md) | The list of partition in the cluster for a service. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedServiceReplicaDescriptionList](sfclient-v82-model-pagedservicereplicadescriptionlist.md) | The list of service resource replicas in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedServiceResourceDescriptionList](sfclient-v82-model-pagedserviceresourcedescriptionlist.md) | The list of service resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedSubNameInfoList](sfclient-v82-model-pagedsubnameinfolist.md) | A paged list of Service Fabric names. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedUpdatePartitionLoadResultList](sfclient-v82-model-pagedupdatepartitionloadresultlist.md) | The list of results of the call UpdatePartitionLoad. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedVolumeResourceDescriptionList](sfclient-v82-model-pagedvolumeresourcedescriptionlist.md) | The list of volume resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PartitionAccessStatus enum](sfclient-v82-model-partitionaccessstatus.md) | Specifies the access status of the partition.<br/> |
| [PartitionAnalysisEvent](sfclient-v82-model-partitionanalysisevent.md) | Represents the base for all Partition Analysis Events.<br/> |
| [PartitionAnalysisEvent](sfclient-v82-model-partitionanalysisevent.md) | Represents the base for all Partition Analysis Events.<br/> |
| [PartitionBackupConfigurationInfo](sfclient-v82-model-partitionbackupconfigurationinfo.md) | Backup configuration information, for a specific partition, specifying what backup policy is being applied and suspend description, if any.<br/> |
| [PartitionBackupConfigurationInfo](sfclient-v82-model-partitionbackupconfigurationinfo.md) | Backup configuration information, for a specific partition, specifying what backup policy is being applied and suspend description, if any.<br/> |
| [PartitionBackupEntity](sfclient-v82-model-partitionbackupentity.md) | Identifies the Service Fabric stateful partition which is being backed up.<br/> |
| [PartitionBackupEntity](sfclient-v82-model-partitionbackupentity.md) | Identifies the Service Fabric stateful partition which is being backed up.<br/> |
| [PartitionDataLossProgress](sfclient-v82-model-partitiondatalossprogress.md) | Information about a partition data loss user-induced operation.<br/> |
| [PartitionEvent](sfclient-v82-model-partitionevent.md) | Represents the base for all Partition Events.<br/> |
| [PartitionEvent](sfclient-v82-model-partitionevent.md) | Represents the base for all Partition Events.<br/> |
| [PartitionHealth](sfclient-v82-model-partitionhealth.md) | Information about the health of a Service Fabric partition.<br/> |
| [PartitionHealth](sfclient-v82-model-partitionhealth.md) | Information about the health of a Service Fabric partition.<br/> |
| [PartitionHealthEvaluation](sfclient-v82-model-partitionhealthevaluation.md) | Represents health evaluation for a partition, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [PartitionHealthEvaluation](sfclient-v82-model-partitionhealthevaluation.md) | Represents health evaluation for a partition, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [PartitionHealthReportExpiredEvent](sfclient-v82-model-partitionhealthreportexpiredevent.md) | Partition Health Report Expired event.<br/> |
| [PartitionHealthReportExpiredEvent](sfclient-v82-model-partitionhealthreportexpiredevent.md) | Partition Health Report Expired event.<br/> |
| [PartitionHealthState](sfclient-v82-model-partitionhealthstate.md) | Represents the health state of a partition, which contains the partition identifier and its aggregated health state.<br/> |
| [PartitionHealthState](sfclient-v82-model-partitionhealthstate.md) | Represents the health state of a partition, which contains the partition identifier and its aggregated health state.<br/> |
| [PartitionHealthStateChunk](sfclient-v82-model-partitionhealthstatechunk.md) | Represents the health state chunk of a partition, which contains the partition ID, its aggregated health state and any replicas that respect the filters in the cluster health chunk query description.<br/> |
| [PartitionHealthStateChunk](sfclient-v82-model-partitionhealthstatechunk.md) | Represents the health state chunk of a partition, which contains the partition ID, its aggregated health state and any replicas that respect the filters in the cluster health chunk query description.<br/> |
| [PartitionHealthStateChunkList](sfclient-v82-model-partitionhealthstatechunklist.md) | The list of partition health state chunks that respect the input filters in the chunk query description.<br/>Returned by get cluster health state chunks query as part of the parent application hierarchy.<br/> |
| [PartitionHealthStateFilter](sfclient-v82-model-partitionhealthstatefilter.md) | Defines matching criteria to determine whether a partition should be included as a child of a service in the cluster health chunk.<br/>The partitions are only returned if the parent entities match a filter specified in the cluster health chunk query description. The parent service and application must be included in the cluster health chunk.<br/>One filter can match zero, one or multiple partitions, depending on its properties.<br/> |
| [PartitionInformation](sfclient-v82-model-partitioninformation.md) | Information about the partition identity, partitioning scheme and keys supported by it.<br/> |
| [PartitionInstanceCountScaleMechanism](sfclient-v82-model-partitioninstancecountscalemechanism.md) | Represents a scaling mechanism for adding or removing instances of stateless service partition.<br/> |
| [PartitionInstanceCountScaleMechanism](sfclient-v82-model-partitioninstancecountscalemechanism.md) | Represents a scaling mechanism for adding or removing instances of stateless service partition.<br/> |
| [PartitionLoadInformation](sfclient-v82-model-partitionloadinformation.md) | Represents load information for a partition, which contains the primary, secondary and auxiliary reported load metrics.<br/>In case there is no load reported, PartitionLoadInformation will contain the default load for the service of the partition.<br/>For default loads, LoadMetricReport's LastReportedUtc is set to 0.<br/> |
| [PartitionMetricLoadDescription](sfclient-v82-model-partitionmetricloaddescription.md) | Represents load information for a partition, which contains the metrics load information about primary, all secondary replicas/instances or a specific secondary replica/instance on a specific node , all auxiliary replicas or a specific auxiliary replica on a specific node.<br/> |
| [PartitionNewHealthReportEvent](sfclient-v82-model-partitionnewhealthreportevent.md) | Partition Health Report Created event.<br/> |
| [PartitionNewHealthReportEvent](sfclient-v82-model-partitionnewhealthreportevent.md) | Partition Health Report Created event.<br/> |
| [PartitionPrimaryMoveAnalysisEvent](sfclient-v82-model-partitionprimarymoveanalysisevent.md) | Partition Primary Move Analysis event.<br/> |
| [PartitionPrimaryMoveAnalysisEvent](sfclient-v82-model-partitionprimarymoveanalysisevent.md) | Partition Primary Move Analysis event.<br/> |
| [PartitionQuorumLossProgress](sfclient-v82-model-partitionquorumlossprogress.md) | Information about a partition quorum loss user-induced operation.<br/> |
| [PartitionReconfiguredEvent](sfclient-v82-model-partitionreconfiguredevent.md) | Partition Reconfiguration event.<br/> |
| [PartitionReconfiguredEvent](sfclient-v82-model-partitionreconfiguredevent.md) | Partition Reconfiguration event.<br/> |
| [PartitionRestartProgress](sfclient-v82-model-partitionrestartprogress.md) | Information about a partition restart user-induced operation.<br/> |
| [PartitionSafetyCheck](sfclient-v82-model-partitionsafetycheck.md) | Represents a safety check for the service partition being performed by service fabric before continuing with operations.<br/> |
| [PartitionScheme enum](sfclient-v82-model-partitionscheme.md) | Enumerates the ways that a service can be partitioned.<br/> |
| [PartitionSchemeDescription](sfclient-v82-model-partitionschemedescription.md) | Describes how the service is partitioned.<br/> |
| [PartitionsHealthEvaluation](sfclient-v82-model-partitionshealthevaluation.md) | Represents health evaluation for the partitions of a service, containing health evaluations for each unhealthy partition that impacts current aggregated health state. Can be returned when evaluating service health and the aggregated health state is either Error or Warning.<br/> |
| [PartitionsHealthEvaluation](sfclient-v82-model-partitionshealthevaluation.md) | Represents health evaluation for the partitions of a service, containing health evaluations for each unhealthy partition that impacts current aggregated health state. Can be returned when evaluating service health and the aggregated health state is either Error or Warning.<br/> |
| [PrimaryReplicatorStatus](sfclient-v82-model-primaryreplicatorstatus.md) | Provides statistics about the Service Fabric Replicator, when it is functioning in a Primary role.<br/> |
| [PrimaryReplicatorStatus](sfclient-v82-model-primaryreplicatorstatus.md) | Provides statistics about the Service Fabric Replicator, when it is functioning in a Primary role.<br/> |
| [Probe](sfclient-v82-model-probe.md) | Probes have a number of fields that you can use to control their behavior.<br/> |
| [ProbeExec](sfclient-v82-model-probeexec.md) | Exec command to run inside the container.<br/> |
| [ProbeHttpGet](sfclient-v82-model-probehttpget.md) | Http probe for the container.<br/> |
| [ProbeHttpGetHeaders](sfclient-v82-model-probehttpgetheaders.md) | Http headers.<br/> |
| [ProbeTcpSocket](sfclient-v82-model-probetcpsocket.md) | Tcp port to probe inside the container.<br/> |
| [PropertyBatchDescriptionList](sfclient-v82-model-propertybatchdescriptionlist.md) | Describes a list of property batch operations to be executed. Either all or none of the operations will be committed.<br/> |
| [PropertyBatchInfo](sfclient-v82-model-propertybatchinfo.md) | Information about the results of a property batch.<br/> |
| [PropertyBatchInfoKind enum](sfclient-v82-model-propertybatchinfokind.md) | The kind of property batch info, determined by the results of a property batch. The following are the possible values.<br/> |
| [PropertyBatchOperation](sfclient-v82-model-propertybatchoperation.md) | Represents the base type for property operations that can be put into a batch and submitted.<br/> |
| [PropertyBatchOperationKind enum](sfclient-v82-model-propertybatchoperationkind.md) | The kind of property batch operation, determined by the operation to be performed. The following are the possible values.<br/> |
| [PropertyDescription](sfclient-v82-model-propertydescription.md) | Description of a Service Fabric property.<br/> |
| [PropertyInfo](sfclient-v82-model-propertyinfo.md) | Information about a Service Fabric property.<br/> |
| [PropertyMetadata](sfclient-v82-model-propertymetadata.md) | The metadata associated with a property, including the property's name.<br/> |
| [PropertyValue](sfclient-v82-model-propertyvalue.md) | Describes a Service Fabric property value.<br/> |
| [PropertyValueKind enum](sfclient-v82-model-propertyvaluekind.md) | The kind of property, determined by the type of data. Following are the possible values.<br/> |
| [ProvisionApplicationTypeDescription](sfclient-v82-model-provisionapplicationtypedescription.md) | Describes the operation to register or provision an application type using an application package uploaded to the Service Fabric image store.<br/> |
| [ProvisionApplicationTypeDescription](sfclient-v82-model-provisionapplicationtypedescription.md) | Describes the operation to register or provision an application type using an application package uploaded to the Service Fabric image store.<br/> |
| [ProvisionApplicationTypeDescriptionBase](sfclient-v82-model-provisionapplicationtypedescriptionbase.md) | Represents the type of registration or provision requested, and if the operation needs to be asynchronous or not. Supported types of provision operations are from either image store or external store.<br/> |
| [ProvisionApplicationTypeKind enum](sfclient-v82-model-provisionapplicationtypekind.md) | The kind of application type registration or provision requested. The application package can be registered or provisioned either from the image store or from an external store. Following are the kinds of the application type provision.<br/> |
| [ProvisionFabricDescription](sfclient-v82-model-provisionfabricdescription.md) | Describes the parameters for provisioning a cluster.<br/> |
| [PutPropertyBatchOperation](sfclient-v82-model-putpropertybatchoperation.md) | Puts the specified property under the specified name.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [PutPropertyBatchOperation](sfclient-v82-model-putpropertybatchoperation.md) | Puts the specified property under the specified name.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [QuorumLossMode enum](sfclient-v82-model-quorumlossmode.md) | Possible values include: 'Invalid', 'QuorumReplicas', 'AllReplicas'<br/> |
| [ReconfigurationInformation](sfclient-v82-model-reconfigurationinformation.md) | Information about current reconfiguration like phase, type, previous configuration role of replica and reconfiguration start date time.<br/> |
| [ReconfigurationPhase enum](sfclient-v82-model-reconfigurationphase.md) | The reconfiguration phase of a replica of a stateful service.<br/> |
| [ReconfigurationType enum](sfclient-v82-model-reconfigurationtype.md) | The type of reconfiguration for replica of a stateful service.<br/> |
| [RegistryCredential](sfclient-v82-model-registrycredential.md) | Credential information to connect to container registry.<br/> |
| [ReliableCollectionsRef](sfclient-v82-model-reliablecollectionsref.md) | Specifying this parameter adds support for reliable collections<br/> |
| [RemoteReplicatorAcknowledgementDetail](sfclient-v82-model-remotereplicatoracknowledgementdetail.md) | Provides various statistics of the acknowledgements that are being received from the remote replicator.<br/> |
| [RemoteReplicatorAcknowledgementStatus](sfclient-v82-model-remotereplicatoracknowledgementstatus.md) | Provides details about the remote replicators from the primary replicator's point of view.<br/> |
| [RemoteReplicatorStatus](sfclient-v82-model-remotereplicatorstatus.md) | Represents the state of the secondary replicator from the primary replicator’s point of view.<br/> |
| [RepairImpactDescriptionBase](sfclient-v82-model-repairimpactdescriptionbase.md) | Describes the expected impact of executing a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairImpactKind enum](sfclient-v82-model-repairimpactkind.md) | Specifies the kind of the impact. This type supports the Service Fabric platform; it is not meant to be used directly from your code.'<br/> |
| [RepairTargetDescriptionBase](sfclient-v82-model-repairtargetdescriptionbase.md) | Describes the entities targeted by a repair action.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTargetKind enum](sfclient-v82-model-repairtargetkind.md) | Specifies the kind of the repair target. This type supports the Service Fabric platform; it is not meant to be used directly from your code.'<br/> |
| [RepairTask](sfclient-v82-model-repairtask.md) | Represents a repair task, which includes information about what kind of repair was requested, what its progress is, and what its final result was.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskApproveDescription](sfclient-v82-model-repairtaskapprovedescription.md) | Describes a request for forced approval of a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskCancelDescription](sfclient-v82-model-repairtaskcanceldescription.md) | Describes a request to cancel a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskDeleteDescription](sfclient-v82-model-repairtaskdeletedescription.md) | Describes a request to delete a completed repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskHealthCheckState enum](sfclient-v82-model-repairtaskhealthcheckstate.md) | Specifies the workflow state of a repair task's health check. This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskHistory](sfclient-v82-model-repairtaskhistory.md) | A record of the times when the repair task entered each state.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskUpdateHealthPolicyDescription](sfclient-v82-model-repairtaskupdatehealthpolicydescription.md) | Describes a request to update the health policy of a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskUpdateInfo](sfclient-v82-model-repairtaskupdateinfo.md) | Describes the result of an operation that created or updated a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [ReplicaEvent](sfclient-v82-model-replicaevent.md) | Represents the base for all Replica Events.<br/> |
| [ReplicaEvent](sfclient-v82-model-replicaevent.md) | Represents the base for all Replica Events.<br/> |
| [ReplicaHealth](sfclient-v82-model-replicahealth.md) | Represents a base class for stateful service replica or stateless service instance health.<br/>Contains the replica aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [ReplicaHealthEvaluation](sfclient-v82-model-replicahealthevaluation.md) | Represents health evaluation for a replica, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ReplicaHealthEvaluation](sfclient-v82-model-replicahealthevaluation.md) | Represents health evaluation for a replica, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ReplicaHealthReportServiceKind enum](sfclient-v82-model-replicahealthreportservicekind.md) | Possible values include: 'Stateless', 'Stateful'<br/> |
| [ReplicaHealthState](sfclient-v82-model-replicahealthstate.md) | Represents a base class for stateful service replica or stateless service instance health state.<br/> |
| [ReplicaHealthStateChunk](sfclient-v82-model-replicahealthstatechunk.md) | Represents the health state chunk of a stateful service replica or a stateless service instance.<br/>The replica health state contains the replica ID and its aggregated health state.<br/> |
| [ReplicaHealthStateChunk](sfclient-v82-model-replicahealthstatechunk.md) | Represents the health state chunk of a stateful service replica or a stateless service instance.<br/>The replica health state contains the replica ID and its aggregated health state.<br/> |
| [ReplicaHealthStateChunkList](sfclient-v82-model-replicahealthstatechunklist.md) | The list of replica health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ReplicaHealthStateFilter](sfclient-v82-model-replicahealthstatefilter.md) | Defines matching criteria to determine whether a replica should be included as a child of a partition in the cluster health chunk.<br/>The replicas are only returned if the parent entities match a filter specified in the cluster health chunk query description. The parent partition, service and application must be included in the cluster health chunk.<br/>One filter can match zero, one or multiple replicas, depending on its properties.<br/> |
| [ReplicaInfo](sfclient-v82-model-replicainfo.md) | Information about the identity, status, health, node name, uptime, and other details about the replica.<br/> |
| [ReplicaKind enum](sfclient-v82-model-replicakind.md) | The role of a replica of a stateful service.<br/> |
| [ReplicaLifecycleDescription](sfclient-v82-model-replicalifecycledescription.md) | Describes how the replica will behave<br/> |
| [ReplicaMetricLoadDescription](sfclient-v82-model-replicametricloaddescription.md) | Specifies metric loads of a partition's specific secondary replica or instance.<br/> |
| [ReplicaRole enum](sfclient-v82-model-replicarole.md) | The role of a replica of a stateful service.<br/> |
| [ReplicasHealthEvaluation](sfclient-v82-model-replicashealthevaluation.md) | Represents health evaluation for replicas, containing health evaluations for each unhealthy replica that impacted current aggregated health state. Can be returned when evaluating partition health and the aggregated health state is either Error or Warning.<br/> |
| [ReplicasHealthEvaluation](sfclient-v82-model-replicashealthevaluation.md) | Represents health evaluation for replicas, containing health evaluations for each unhealthy replica that impacted current aggregated health state. Can be returned when evaluating partition health and the aggregated health state is either Error or Warning.<br/> |
| [ReplicaStatus enum](sfclient-v82-model-replicastatus.md) | The status of a replica of a service.<br/> |
| [ReplicaStatusBase](sfclient-v82-model-replicastatusbase.md) | Information about the replica.<br/> |
| [ReplicatorOperationName enum](sfclient-v82-model-replicatoroperationname.md) | Specifies the operation currently being executed by the Replicator.<br/> |
| [ReplicatorQueueStatus](sfclient-v82-model-replicatorqueuestatus.md) | Provides various statistics of the queue used in the service fabric replicator.<br/>Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.<br/>Depending on the role of the replicator, the properties in this type imply different meanings.<br/> |
| [ReplicatorStatus](sfclient-v82-model-replicatorstatus.md) | Represents a base class for primary or secondary replicator status.<br/>Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.<br/> |
| [ResolvedServiceEndpoint](sfclient-v82-model-resolvedserviceendpoint.md) | Endpoint of a resolved service partition.<br/> |
| [ResolvedServicePartition](sfclient-v82-model-resolvedservicepartition.md) | Information about a service partition and its associated endpoints.<br/> |
| [ResourceLimits](sfclient-v82-model-resourcelimits.md) | This type describes the resource limits for a given container. It describes the most amount of resources a container is allowed to use before being restarted.<br/> |
| [ResourceRequests](sfclient-v82-model-resourcerequests.md) | This type describes the requested resources for a given container. It describes the least amount of resources required for the container. A container can consume more than requested resources up to the specified limits before being restarted. Currently, the requested resources are treated as limits.<br/> |
| [ResourceRequirements](sfclient-v82-model-resourcerequirements.md) | This type describes the resource requirements for a container or a service.<br/> |
| [ResourceStatus enum](sfclient-v82-model-resourcestatus.md) | Status of the resource.<br/> |
| [RestartDeployedCodePackageDescription](sfclient-v82-model-restartdeployedcodepackagedescription.md) | Defines description for restarting a deployed code package on Service Fabric node.<br/> |
| [RestartNodeDescription](sfclient-v82-model-restartnodedescription.md) | Describes the parameters to restart a Service Fabric node.<br/> |
| [RestartPartitionMode enum](sfclient-v82-model-restartpartitionmode.md) | Possible values include: 'Invalid', 'AllReplicasOrInstances', 'OnlyActiveSecondaries'<br/> |
| [RestartPartitionResult](sfclient-v82-model-restartpartitionresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [RestartPolicy enum](sfclient-v82-model-restartpolicy.md) | Enumerates the restart policy for RunToCompletionExecutionPolicy<br/> |
| [RestorePartitionDescription](sfclient-v82-model-restorepartitiondescription.md) | Specifies the parameters needed to trigger a restore of a specific partition.<br/> |
| [RestoreProgressInfo](sfclient-v82-model-restoreprogressinfo.md) | Describes the progress of a restore operation on a partition.<br/> |
| [RestoreState enum](sfclient-v82-model-restorestate.md) | Represents the current state of the partition restore operation.<br/> |
| [ResultStatus enum](sfclient-v82-model-resultstatus.md) | Possible values include: 'Invalid', 'Succeeded', 'Cancelled', 'Interrupted', 'Failed', 'Pending'<br/> |
| [ResumeApplicationUpgradeDescription](sfclient-v82-model-resumeapplicationupgradedescription.md) | Describes the parameters for resuming an unmonitored manual Service Fabric application upgrade<br/> |
| [ResumeClusterUpgradeDescription](sfclient-v82-model-resumeclusterupgradedescription.md) | Describes the parameters for resuming a cluster upgrade.<br/> |
| [RetentionPolicyDescription](sfclient-v82-model-retentionpolicydescription.md) | Describes the retention policy configured.<br/> |
| [RetentionPolicyType enum](sfclient-v82-model-retentionpolicytype.md) | The type of retention policy. Currently only "Basic" retention policy is supported.<br/> |
| [RollingUpgradeMode enum](sfclient-v82-model-rollingupgrademode.md) | The mode used to monitor health during a rolling upgrade. The values are UnmonitoredAuto, UnmonitoredManual, and Monitored.<br/> |
| [RollingUpgradeUpdateDescription](sfclient-v82-model-rollingupgradeupdatedescription.md) | Describes the parameters for updating a rolling upgrade of application or cluster.<br/> |
| [RunToCompletionExecutionPolicy](sfclient-v82-model-runtocompletionexecutionpolicy.md) | The run to completion execution policy, the service will perform its desired operation and complete successfully. If the service encounters failure, it will restarted based on restart policy specified. If the service completes its operation successfully, it will not be restarted again.<br/> |
| [RunToCompletionExecutionPolicy](sfclient-v82-model-runtocompletionexecutionpolicy.md) | The run to completion execution policy, the service will perform its desired operation and complete successfully. If the service encounters failure, it will restarted based on restart policy specified. If the service completes its operation successfully, it will not be restarted again.<br/> |
| [SafetyCheck](sfclient-v82-model-safetycheck.md) | Represents a safety check performed by service fabric before continuing with the operations. These checks ensure the availability of the service and the reliability of the state.<br/> |
| [SafetyCheckKind enum](sfclient-v82-model-safetycheckkind.md) | The kind of safety check performed by service fabric before continuing with the operations. These checks ensure the availability of the service and the reliability of the state. Following are the kinds of safety checks.<br/> |
| [SafetyCheckWrapper](sfclient-v82-model-safetycheckwrapper.md) | A wrapper for the safety check object. Safety checks are performed by service fabric before continuing with the operations. These checks ensure the availability of the service and the reliability of the state.<br/> |
| [ScalingMechanismDescription](sfclient-v82-model-scalingmechanismdescription.md) | Describes the mechanism for performing a scaling operation.<br/> |
| [ScalingMechanismKind enum](sfclient-v82-model-scalingmechanismkind.md) | Enumerates the ways that a service can be scaled.<br/> |
| [ScalingPolicyDescription](sfclient-v82-model-scalingpolicydescription.md) | Describes how the scaling should be performed<br/> |
| [ScalingTriggerDescription](sfclient-v82-model-scalingtriggerdescription.md) | Describes the trigger for performing a scaling operation.<br/> |
| [ScalingTriggerKind enum](sfclient-v82-model-scalingtriggerkind.md) | Enumerates the ways that a service can be scaled.<br/> |
| [Scheme enum](sfclient-v82-model-scheme.md) | Possible values include: 'http', 'https'<br/> |
| [SecondaryActiveReplicatorStatus](sfclient-v82-model-secondaryactivereplicatorstatus.md) | Status of the secondary replicator when it is in active mode and is part of the replica set.<br/> |
| [SecondaryActiveReplicatorStatus](sfclient-v82-model-secondaryactivereplicatorstatus.md) | Status of the secondary replicator when it is in active mode and is part of the replica set.<br/> |
| [SecondaryIdleReplicatorStatus](sfclient-v82-model-secondaryidlereplicatorstatus.md) | Status of the secondary replicator when it is in idle mode and is being built by the primary.<br/> |
| [SecondaryIdleReplicatorStatus](sfclient-v82-model-secondaryidlereplicatorstatus.md) | Status of the secondary replicator when it is in idle mode and is being built by the primary.<br/> |
| [SecondaryReplicatorStatus](sfclient-v82-model-secondaryreplicatorstatus.md) | Provides statistics about the Service Fabric Replicator, when it is functioning in a ActiveSecondary role.<br/> |
| [SecretKind enum](sfclient-v82-model-secretkind.md) | Describes the kind of secret.<br/> |
| [SecretResourceDescription](sfclient-v82-model-secretresourcedescription.md) | This type describes a secret resource.<br/> |
| [SecretResourceProperties](sfclient-v82-model-secretresourceproperties.md) | Describes the properties of a secret resource.<br/> |
| [SecretResourcePropertiesBase](sfclient-v82-model-secretresourcepropertiesbase.md) | This type describes the properties of a secret resource, including its kind.<br/> |
| [SecretValue](sfclient-v82-model-secretvalue.md) | This type represents the unencrypted value of the secret.<br/> |
| [SecretValueProperties](sfclient-v82-model-secretvalueproperties.md) | This type describes properties of secret value resource.<br/> |
| [SecretValueResourceDescription](sfclient-v82-model-secretvalueresourcedescription.md) | This type describes a value of a secret resource. The name of this resource is the version identifier corresponding to this secret value.<br/> |
| [SecretValueResourceProperties](sfclient-v82-model-secretvalueresourceproperties.md) | This type describes properties of a secret value resource.<br/> |
| [SecretValueResourceProperties](sfclient-v82-model-secretvalueresourceproperties.md) | This type describes properties of a secret value resource.<br/> |
| [SeedNodeSafetyCheck](sfclient-v82-model-seednodesafetycheck.md) | Represents a safety check for the seed nodes being performed by service fabric before continuing with node level operations.<br/> |
| [SeedNodeSafetyCheck](sfclient-v82-model-seednodesafetycheck.md) | Represents a safety check for the seed nodes being performed by service fabric before continuing with node level operations.<br/> |
| [SelectedPartition](sfclient-v82-model-selectedpartition.md) | This class returns information about the partition that the user-induced operation acted upon.<br/> |
| [ServiceBackupConfigurationInfo](sfclient-v82-model-servicebackupconfigurationinfo.md) | Backup configuration information for a specific Service Fabric service specifying what backup policy is being applied and suspend description, if any.<br/> |
| [ServiceBackupConfigurationInfo](sfclient-v82-model-servicebackupconfigurationinfo.md) | Backup configuration information for a specific Service Fabric service specifying what backup policy is being applied and suspend description, if any.<br/> |
| [ServiceBackupEntity](sfclient-v82-model-servicebackupentity.md) | Identifies the Service Fabric stateful service which is being backed up.<br/> |
| [ServiceBackupEntity](sfclient-v82-model-servicebackupentity.md) | Identifies the Service Fabric stateful service which is being backed up.<br/> |
| [ServiceCorrelationDescription](sfclient-v82-model-servicecorrelationdescription.md) | Creates a particular correlation between services.<br/> |
| [ServiceCorrelationScheme enum](sfclient-v82-model-servicecorrelationscheme.md) | The service correlation scheme.<br/> |
| [ServiceCreatedEvent](sfclient-v82-model-servicecreatedevent.md) | Service Created event.<br/> |
| [ServiceCreatedEvent](sfclient-v82-model-servicecreatedevent.md) | Service Created event.<br/> |
| [ServiceDeletedEvent](sfclient-v82-model-servicedeletedevent.md) | Service Deleted event.<br/> |
| [ServiceDeletedEvent](sfclient-v82-model-servicedeletedevent.md) | Service Deleted event.<br/> |
| [ServiceDescription](sfclient-v82-model-servicedescription.md) | A ServiceDescription contains all of the information necessary to create a service.<br/> |
| [ServiceEndpointRole enum](sfclient-v82-model-serviceendpointrole.md) | The role of the replica where the endpoint is reported.<br/> |
| [ServiceEvent](sfclient-v82-model-serviceevent.md) | Represents the base for all Service Events.<br/> |
| [ServiceEvent](sfclient-v82-model-serviceevent.md) | Represents the base for all Service Events.<br/> |
| [ServiceFromTemplateDescription](sfclient-v82-model-servicefromtemplatedescription.md) | Defines description for creating a Service Fabric service from a template defined in the application manifest.<br/> |
| [ServiceHealth](sfclient-v82-model-servicehealth.md) | Information about the health of a Service Fabric service.<br/> |
| [ServiceHealth](sfclient-v82-model-servicehealth.md) | Information about the health of a Service Fabric service.<br/> |
| [ServiceHealthEvaluation](sfclient-v82-model-servicehealthevaluation.md) | Represents health evaluation for a service, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ServiceHealthEvaluation](sfclient-v82-model-servicehealthevaluation.md) | Represents health evaluation for a service, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ServiceHealthReportExpiredEvent](sfclient-v82-model-servicehealthreportexpiredevent.md) | Service Health Report Expired event.<br/> |
| [ServiceHealthReportExpiredEvent](sfclient-v82-model-servicehealthreportexpiredevent.md) | Service Health Report Expired event.<br/> |
| [ServiceHealthState](sfclient-v82-model-servicehealthstate.md) | Represents the health state of a service, which contains the service identifier and its aggregated health state.<br/> |
| [ServiceHealthState](sfclient-v82-model-servicehealthstate.md) | Represents the health state of a service, which contains the service identifier and its aggregated health state.<br/> |
| [ServiceHealthStateChunk](sfclient-v82-model-servicehealthstatechunk.md) | Represents the health state chunk of a service, which contains the service name, its aggregated health state and any partitions that respect the filters in the cluster health chunk query description.<br/> |
| [ServiceHealthStateChunk](sfclient-v82-model-servicehealthstatechunk.md) | Represents the health state chunk of a service, which contains the service name, its aggregated health state and any partitions that respect the filters in the cluster health chunk query description.<br/> |
| [ServiceHealthStateChunkList](sfclient-v82-model-servicehealthstatechunklist.md) | The list of service health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ServiceHealthStateFilter](sfclient-v82-model-servicehealthstatefilter.md) | Defines matching criteria to determine whether a service should be included as a child of an application in the cluster health chunk.<br/>The services are only returned if the parent application matches a filter specified in the cluster health chunk query description.<br/>One filter can match zero, one or multiple services, depending on its properties.<br/> |
| [ServiceHostUpgradeImpact enum](sfclient-v82-model-servicehostupgradeimpact.md) | The expected impact of the upgrade.<br/> |
| [ServiceIdentity](sfclient-v82-model-serviceidentity.md) | Map service identity friendly name to an application identity.<br/> |
| [ServiceInfo](sfclient-v82-model-serviceinfo.md) | Information about a Service Fabric service.<br/> |
| [ServiceKind enum](sfclient-v82-model-servicekind.md) | The kind of service (Stateless or Stateful).<br/> |
| [ServiceLoadMetricDescription](sfclient-v82-model-serviceloadmetricdescription.md) | Specifies a metric to load balance a service during runtime.<br/> |
| [ServiceLoadMetricWeight enum](sfclient-v82-model-serviceloadmetricweight.md) | Determines the metric weight relative to the other metrics that are configured for this service. During runtime, if two metrics end up in conflict, the Cluster Resource Manager prefers the metric with the higher weight.<br/> |
| [ServiceNameInfo](sfclient-v82-model-servicenameinfo.md) | Information about the service name.<br/> |
| [ServiceNewHealthReportEvent](sfclient-v82-model-servicenewhealthreportevent.md) | Service Health Report Created event.<br/> |
| [ServiceNewHealthReportEvent](sfclient-v82-model-servicenewhealthreportevent.md) | Service Health Report Created event.<br/> |
| [ServiceOperationName enum](sfclient-v82-model-serviceoperationname.md) | Specifies the current active life-cycle operation on a stateful service replica or stateless service instance.<br/> |
| [ServicePackageActivationMode enum](sfclient-v82-model-servicepackageactivationmode.md) | The activation mode of service package to be used for a Service Fabric service. This is specified at the time of creating the Service.<br/> |
| [ServicePartitionInfo](sfclient-v82-model-servicepartitioninfo.md) | Information about a partition of a Service Fabric service.<br/> |
| [ServicePartitionKind enum](sfclient-v82-model-servicepartitionkind.md) | The kind of partitioning scheme used to partition the service.<br/> |
| [ServicePartitionStatus enum](sfclient-v82-model-servicepartitionstatus.md) | The status of the service fabric service partition.<br/> |
| [ServicePlacementAllowMultipleStatelessInstancesOnNodePolicyDescription](sfclient-v82-model-serviceplacementallowmultiplestatelessinstancesonnodepolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service allowing multiple stateless instances of a partition of the service to be placed on a node.<br/> |
| [ServicePlacementAllowMultipleStatelessInstancesOnNodePolicyDescription](sfclient-v82-model-serviceplacementallowmultiplestatelessinstancesonnodepolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service allowing multiple stateless instances of a partition of the service to be placed on a node.<br/> |
| [ServicePlacementInvalidDomainPolicyDescription](sfclient-v82-model-serviceplacementinvaliddomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where a particular fault or upgrade domain should not be used for placement of the instances or replicas of that service.<br/> |
| [ServicePlacementInvalidDomainPolicyDescription](sfclient-v82-model-serviceplacementinvaliddomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where a particular fault or upgrade domain should not be used for placement of the instances or replicas of that service.<br/> |
| [ServicePlacementNonPartiallyPlaceServicePolicyDescription](sfclient-v82-model-serviceplacementnonpartiallyplaceservicepolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where all replicas must be able to be placed in order for any replicas to be created.<br/> |
| [ServicePlacementNonPartiallyPlaceServicePolicyDescription](sfclient-v82-model-serviceplacementnonpartiallyplaceservicepolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where all replicas must be able to be placed in order for any replicas to be created.<br/> |
| [ServicePlacementPolicyDescription](sfclient-v82-model-serviceplacementpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service.<br/> |
| [ServicePlacementPolicyType enum](sfclient-v82-model-serviceplacementpolicytype.md) | The type of placement policy for a service fabric service. Following are the possible values.<br/> |
| [ServicePlacementPreferPrimaryDomainPolicyDescription](sfclient-v82-model-serviceplacementpreferprimarydomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where the service's Primary replicas should optimally be placed in a particular domain.<br/><br/>This placement policy is usually used with fault domains in scenarios where the Service Fabric cluster is geographically distributed in order to indicate that a service's primary replica should be located in a particular fault domain, which in geo-distributed scenarios usually aligns with regional or datacenter boundaries. Note that since this is an optimization it is possible that the Primary replica may not end up located in this domain due to failures, capacity limits, or other constraints.<br/> |
| [ServicePlacementPreferPrimaryDomainPolicyDescription](sfclient-v82-model-serviceplacementpreferprimarydomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where the service's Primary replicas should optimally be placed in a particular domain.<br/><br/>This placement policy is usually used with fault domains in scenarios where the Service Fabric cluster is geographically distributed in order to indicate that a service's primary replica should be located in a particular fault domain, which in geo-distributed scenarios usually aligns with regional or datacenter boundaries. Note that since this is an optimization it is possible that the Primary replica may not end up located in this domain due to failures, capacity limits, or other constraints.<br/> |
| [ServicePlacementRequiredDomainPolicyDescription](sfclient-v82-model-serviceplacementrequireddomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where the instances or replicas of that service must be placed in a particular domain<br/> |
| [ServicePlacementRequiredDomainPolicyDescription](sfclient-v82-model-serviceplacementrequireddomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where the instances or replicas of that service must be placed in a particular domain<br/> |
| [ServicePlacementRequireDomainDistributionPolicyDescription](sfclient-v82-model-serviceplacementrequiredomaindistributionpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where two replicas from the same partition should never be placed in the same fault or upgrade domain.<br/><br/>While this is not common it can expose the service to an increased risk of concurrent failures due to unplanned outages or other cases of subsequent/concurrent failures. As an example, consider a case where replicas are deployed across different data center, with one replica per location. In the event that one of the datacenters goes offline, normally the replica that was placed in that datacenter will be packed into one of the remaining datacenters. If this is not desirable then this policy should be set.<br/> |
| [ServicePlacementRequireDomainDistributionPolicyDescription](sfclient-v82-model-serviceplacementrequiredomaindistributionpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where two replicas from the same partition should never be placed in the same fault or upgrade domain.<br/><br/>While this is not common it can expose the service to an increased risk of concurrent failures due to unplanned outages or other cases of subsequent/concurrent failures. As an example, consider a case where replicas are deployed across different data center, with one replica per location. In the event that one of the datacenters goes offline, normally the replica that was placed in that datacenter will be packed into one of the remaining datacenters. If this is not desirable then this policy should be set.<br/> |
| [ServiceProperties](sfclient-v82-model-serviceproperties.md) | Describes properties of a service resource.<br/> |
| [ServiceReplicaDescription](sfclient-v82-model-servicereplicadescription.md) | Describes a replica of a service resource.<br/> |
| [ServiceReplicaDescription](sfclient-v82-model-servicereplicadescription.md) | Describes a replica of a service resource.<br/> |
| [ServiceReplicaProperties](sfclient-v82-model-servicereplicaproperties.md) | Describes the properties of a service replica.<br/> |
| [ServiceResourceDescription](sfclient-v82-model-serviceresourcedescription.md) | This type describes a service resource.<br/> |
| [ServiceResourceProperties](sfclient-v82-model-serviceresourceproperties.md) | This type describes properties of a service resource.<br/> |
| [ServicesHealthEvaluation](sfclient-v82-model-serviceshealthevaluation.md) | Represents health evaluation for services of a certain service type belonging to an application, containing health evaluations for each unhealthy service that impacted current aggregated health state. Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [ServicesHealthEvaluation](sfclient-v82-model-serviceshealthevaluation.md) | Represents health evaluation for services of a certain service type belonging to an application, containing health evaluations for each unhealthy service that impacted current aggregated health state. Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [ServiceStatus enum](sfclient-v82-model-servicestatus.md) | The status of the application.<br/> |
| [ServiceTypeDescription](sfclient-v82-model-servicetypedescription.md) | Describes a service type defined in the service manifest of a provisioned application type. The properties the ones defined in the service manifest.<br/> |
| [ServiceTypeExtensionDescription](sfclient-v82-model-servicetypeextensiondescription.md) | Describes extension of a service type defined in the service manifest.<br/> |
| [ServiceTypeHealthPolicy](sfclient-v82-model-servicetypehealthpolicy.md) | Represents the health policy used to evaluate the health of services belonging to a service type.<br/> |
| [ServiceTypeHealthPolicyMapItem](sfclient-v82-model-servicetypehealthpolicymapitem.md) | Defines an item in ServiceTypeHealthPolicyMap.<br/> |
| [ServiceTypeInfo](sfclient-v82-model-servicetypeinfo.md) | Information about a service type that is defined in a service manifest of a provisioned application type.<br/> |
| [ServiceTypeManifest](sfclient-v82-model-servicetypemanifest.md) | Contains the manifest describing a service type registered as part of an application in a Service Fabric cluster.<br/> |
| [ServiceTypeRegistrationStatus enum](sfclient-v82-model-servicetyperegistrationstatus.md) | The status of the service type registration on the node.<br/> |
| [ServiceUpdateDescription](sfclient-v82-model-serviceupdatedescription.md) | A ServiceUpdateDescription contains all of the information necessary to update a service.<br/> |
| [ServiceUpgradeProgress](sfclient-v82-model-serviceupgradeprogress.md) | Information about how many replicas are completed or pending for a specific service during upgrade.<br/> |
| [Setting](sfclient-v82-model-setting.md) | Describes a setting for the container. The setting file path can be fetched from environment variable "Fabric_SettingPath". The path for Windows container is "C:\\secrets". The path for Linux container is "/var/secrets".<br/> |
| [SettingType enum](sfclient-v82-model-settingtype.md) | The type of the setting being given in value<br/> |
| [SingletonPartitionInformation](sfclient-v82-model-singletonpartitioninformation.md) | Information about a partition that is singleton. The services with singleton partitioning scheme are effectively non-partitioned. They only have one partition.<br/> |
| [SingletonPartitionInformation](sfclient-v82-model-singletonpartitioninformation.md) | Information about a partition that is singleton. The services with singleton partitioning scheme are effectively non-partitioned. They only have one partition.<br/> |
| [SingletonPartitionSchemeDescription](sfclient-v82-model-singletonpartitionschemedescription.md) | Describes the partition scheme of a singleton-partitioned, or non-partitioned service.<br/> |
| [SingletonPartitionSchemeDescription](sfclient-v82-model-singletonpartitionschemedescription.md) | Describes the partition scheme of a singleton-partitioned, or non-partitioned service.<br/> |
| [SizeTypes enum](sfclient-v82-model-sizetypes.md) | Possible values include: 'Small', 'Medium', 'Large'<br/> |
| [StartClusterUpgradeDescription](sfclient-v82-model-startclusterupgradedescription.md) | Describes the parameters for starting a cluster upgrade.<br/> |
| [StartedChaosEvent](sfclient-v82-model-startedchaosevent.md) | Describes a Chaos event that gets generated when Chaos is started.<br/> |
| [StartedChaosEvent](sfclient-v82-model-startedchaosevent.md) | Describes a Chaos event that gets generated when Chaos is started.<br/> |
| [State enum](sfclient-v82-model-state.md) | Possible values include: 'Invalid', 'Created', 'Claimed', 'Preparing', 'Approved', 'Executing', 'Restoring', 'Completed'<br/> |
| [StatefulReplicaHealthReportExpiredEvent](sfclient-v82-model-statefulreplicahealthreportexpiredevent.md) | Stateful Replica Health Report Expired event.<br/> |
| [StatefulReplicaHealthReportExpiredEvent](sfclient-v82-model-statefulreplicahealthreportexpiredevent.md) | Stateful Replica Health Report Expired event.<br/> |
| [StatefulReplicaNewHealthReportEvent](sfclient-v82-model-statefulreplicanewhealthreportevent.md) | Stateful Replica Health Report Created event.<br/> |
| [StatefulReplicaNewHealthReportEvent](sfclient-v82-model-statefulreplicanewhealthreportevent.md) | Stateful Replica Health Report Created event.<br/> |
| [StatefulServiceDescription](sfclient-v82-model-statefulservicedescription.md) | Describes a stateful service.<br/> |
| [StatefulServiceDescription](sfclient-v82-model-statefulservicedescription.md) | Describes a stateful service.<br/> |
| [StatefulServiceInfo](sfclient-v82-model-statefulserviceinfo.md) | Information about a stateful Service Fabric service.<br/> |
| [StatefulServiceInfo](sfclient-v82-model-statefulserviceinfo.md) | Information about a stateful Service Fabric service.<br/> |
| [StatefulServicePartitionInfo](sfclient-v82-model-statefulservicepartitioninfo.md) | Information about a partition of a stateful Service Fabric service..<br/> |
| [StatefulServicePartitionInfo](sfclient-v82-model-statefulservicepartitioninfo.md) | Information about a partition of a stateful Service Fabric service..<br/> |
| [StatefulServiceReplicaHealth](sfclient-v82-model-statefulservicereplicahealth.md) | Represents the health of the stateful service replica.<br/>Contains the replica aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatefulServiceReplicaHealth](sfclient-v82-model-statefulservicereplicahealth.md) | Represents the health of the stateful service replica.<br/>Contains the replica aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatefulServiceReplicaHealthState](sfclient-v82-model-statefulservicereplicahealthstate.md) | Represents the health state of the stateful service replica, which contains the replica ID and the aggregated health state.<br/> |
| [StatefulServiceReplicaHealthState](sfclient-v82-model-statefulservicereplicahealthstate.md) | Represents the health state of the stateful service replica, which contains the replica ID and the aggregated health state.<br/> |
| [StatefulServiceReplicaInfo](sfclient-v82-model-statefulservicereplicainfo.md) | Represents a stateful service replica. This includes information about the identity, role, status, health, node name, uptime, and other details about the replica.<br/> |
| [StatefulServiceReplicaInfo](sfclient-v82-model-statefulservicereplicainfo.md) | Represents a stateful service replica. This includes information about the identity, role, status, health, node name, uptime, and other details about the replica.<br/> |
| [StatefulServiceTypeDescription](sfclient-v82-model-statefulservicetypedescription.md) | Describes a stateful service type defined in the service manifest of a provisioned application type.<br/> |
| [StatefulServiceTypeDescription](sfclient-v82-model-statefulservicetypedescription.md) | Describes a stateful service type defined in the service manifest of a provisioned application type.<br/> |
| [StatefulServiceUpdateDescription](sfclient-v82-model-statefulserviceupdatedescription.md) | Describes an update for a stateful service.<br/> |
| [StatefulServiceUpdateDescription](sfclient-v82-model-statefulserviceupdatedescription.md) | Describes an update for a stateful service.<br/> |
| [StatelessReplicaHealthReportExpiredEvent](sfclient-v82-model-statelessreplicahealthreportexpiredevent.md) | Stateless Replica Health Report Expired event.<br/> |
| [StatelessReplicaHealthReportExpiredEvent](sfclient-v82-model-statelessreplicahealthreportexpiredevent.md) | Stateless Replica Health Report Expired event.<br/> |
| [StatelessReplicaNewHealthReportEvent](sfclient-v82-model-statelessreplicanewhealthreportevent.md) | Stateless Replica Health Report Created event.<br/> |
| [StatelessReplicaNewHealthReportEvent](sfclient-v82-model-statelessreplicanewhealthreportevent.md) | Stateless Replica Health Report Created event.<br/> |
| [StatelessServiceDescription](sfclient-v82-model-statelessservicedescription.md) | Describes a stateless service.<br/> |
| [StatelessServiceDescription](sfclient-v82-model-statelessservicedescription.md) | Describes a stateless service.<br/> |
| [StatelessServiceInfo](sfclient-v82-model-statelessserviceinfo.md) | Information about a stateless Service Fabric service.<br/> |
| [StatelessServiceInfo](sfclient-v82-model-statelessserviceinfo.md) | Information about a stateless Service Fabric service.<br/> |
| [StatelessServiceInstanceHealth](sfclient-v82-model-statelessserviceinstancehealth.md) | Represents the health of the stateless service instance.<br/>Contains the instance aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatelessServiceInstanceHealth](sfclient-v82-model-statelessserviceinstancehealth.md) | Represents the health of the stateless service instance.<br/>Contains the instance aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatelessServiceInstanceHealthState](sfclient-v82-model-statelessserviceinstancehealthstate.md) | Represents the health state of the stateless service instance, which contains the instance ID and the aggregated health state.<br/> |
| [StatelessServiceInstanceHealthState](sfclient-v82-model-statelessserviceinstancehealthstate.md) | Represents the health state of the stateless service instance, which contains the instance ID and the aggregated health state.<br/> |
| [StatelessServiceInstanceInfo](sfclient-v82-model-statelessserviceinstanceinfo.md) | Represents a stateless service instance. This includes information about the identity, status, health, node name, uptime, and other details about the instance.<br/> |
| [StatelessServiceInstanceInfo](sfclient-v82-model-statelessserviceinstanceinfo.md) | Represents a stateless service instance. This includes information about the identity, status, health, node name, uptime, and other details about the instance.<br/> |
| [StatelessServicePartitionInfo](sfclient-v82-model-statelessservicepartitioninfo.md) | Information about a partition of a stateless Service Fabric service.<br/> |
| [StatelessServicePartitionInfo](sfclient-v82-model-statelessservicepartitioninfo.md) | Information about a partition of a stateless Service Fabric service.<br/> |
| [StatelessServiceTypeDescription](sfclient-v82-model-statelessservicetypedescription.md) | Describes a stateless service type defined in the service manifest of a provisioned application type.<br/> |
| [StatelessServiceTypeDescription](sfclient-v82-model-statelessservicetypedescription.md) | Describes a stateless service type defined in the service manifest of a provisioned application type.<br/> |
| [StatelessServiceUpdateDescription](sfclient-v82-model-statelessserviceupdatedescription.md) | Describes an update for a stateless service.<br/> |
| [StatelessServiceUpdateDescription](sfclient-v82-model-statelessserviceupdatedescription.md) | Describes an update for a stateless service.<br/> |
| [StoppedChaosEvent](sfclient-v82-model-stoppedchaosevent.md) | Describes a Chaos event that gets generated when Chaos stops because either the user issued a stop or the time to run was up.<br/> |
| [StoppedChaosEvent](sfclient-v82-model-stoppedchaosevent.md) | Describes a Chaos event that gets generated when Chaos stops because either the user issued a stop or the time to run was up.<br/> |
| [StringPropertyValue](sfclient-v82-model-stringpropertyvalue.md) | Describes a Service Fabric property value of type String.<br/> |
| [StringPropertyValue](sfclient-v82-model-stringpropertyvalue.md) | Describes a Service Fabric property value of type String.<br/> |
| [SuccessfulPropertyBatchInfo](sfclient-v82-model-successfulpropertybatchinfo.md) | Derived from PropertyBatchInfo. Represents the property batch succeeding. Contains the results of any "Get" operations in the batch.<br/> |
| [SuccessfulPropertyBatchInfo](sfclient-v82-model-successfulpropertybatchinfo.md) | Derived from PropertyBatchInfo. Represents the property batch succeeding. Contains the results of any "Get" operations in the batch.<br/> |
| [SystemApplicationHealthEvaluation](sfclient-v82-model-systemapplicationhealthevaluation.md) | Represents health evaluation for the fabric:/System application, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state of the cluster is either Error or Warning.<br/> |
| [SystemApplicationHealthEvaluation](sfclient-v82-model-systemapplicationhealthevaluation.md) | Represents health evaluation for the fabric:/System application, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state of the cluster is either Error or Warning.<br/> |
| [TcpConfig](sfclient-v82-model-tcpconfig.md) | Describes the tcp configuration for external connectivity for this network.<br/> |
| [TestErrorChaosEvent](sfclient-v82-model-testerrorchaosevent.md) | Describes a Chaos event that gets generated when an unexpected event occurs in the Chaos engine.<br/>For example, due to the cluster snapshot being inconsistent, while faulting an entity, Chaos found that the entity was already faulted -- which would be an unexpected event.<br/> |
| [TestErrorChaosEvent](sfclient-v82-model-testerrorchaosevent.md) | Describes a Chaos event that gets generated when an unexpected event occurs in the Chaos engine.<br/>For example, due to the cluster snapshot being inconsistent, while faulting an entity, Chaos found that the entity was already faulted -- which would be an unexpected event.<br/> |
| [TimeBasedBackupScheduleDescription](sfclient-v82-model-timebasedbackupscheduledescription.md) | Describes the time based backup schedule.<br/> |
| [TimeBasedBackupScheduleDescription](sfclient-v82-model-timebasedbackupscheduledescription.md) | Describes the time based backup schedule.<br/> |
| [TimeOfDay](sfclient-v82-model-timeofday.md) | Defines an hour and minute of the day specified in 24 hour time.<br/> |
| [TimeRange](sfclient-v82-model-timerange.md) | Defines a time range in a 24 hour day specified by a start and end time.<br/> |
| [UniformInt64RangePartitionSchemeDescription](sfclient-v82-model-uniformint64rangepartitionschemedescription.md) | Describes a partitioning scheme where an integer range is allocated evenly across a number of partitions.<br/> |
| [UniformInt64RangePartitionSchemeDescription](sfclient-v82-model-uniformint64rangepartitionschemedescription.md) | Describes a partitioning scheme where an integer range is allocated evenly across a number of partitions.<br/> |
| [UnplacedReplicaInformation](sfclient-v82-model-unplacedreplicainformation.md) | Contains information for an unplaced replica.<br/> |
| [UnprovisionApplicationTypeDescriptionInfo](sfclient-v82-model-unprovisionapplicationtypedescriptioninfo.md) | Describes the operation to unregister or unprovision an application type and its version that was registered with the Service Fabric.<br/> |
| [UnprovisionFabricDescription](sfclient-v82-model-unprovisionfabricdescription.md) | Describes the parameters for unprovisioning a cluster.<br/> |
| [UpdateClusterUpgradeDescription](sfclient-v82-model-updateclusterupgradedescription.md) | Parameters for updating a cluster upgrade.<br/> |
| [UpdatePartitionLoadResult](sfclient-v82-model-updatepartitionloadresult.md) | Specifies result of updating load for specified partitions. The output will be ordered based on the partition ID.<br/> |
| [UpgradeDomainDeltaNodesCheckHealthEvaluation](sfclient-v82-model-upgradedomaindeltanodescheckhealthevaluation.md) | Represents health evaluation for delta unhealthy cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when cluster aggregated health state is Warning or Error.<br/> |
| [UpgradeDomainDeltaNodesCheckHealthEvaluation](sfclient-v82-model-upgradedomaindeltanodescheckhealthevaluation.md) | Represents health evaluation for delta unhealthy cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when cluster aggregated health state is Warning or Error.<br/> |
| [UpgradeDomainDeployedApplicationsHealthEvaluation](sfclient-v82-model-upgradedomaindeployedapplicationshealthevaluation.md) | Represents health evaluation for deployed applications in an upgrade domain, containing health evaluations for each unhealthy deployed application that impacted current aggregated health state. Can be returned when evaluating cluster health during cluster upgrade and the aggregated health state is either Error or Warning.<br/> |
| [UpgradeDomainDeployedApplicationsHealthEvaluation](sfclient-v82-model-upgradedomaindeployedapplicationshealthevaluation.md) | Represents health evaluation for deployed applications in an upgrade domain, containing health evaluations for each unhealthy deployed application that impacted current aggregated health state. Can be returned when evaluating cluster health during cluster upgrade and the aggregated health state is either Error or Warning.<br/> |
| [UpgradeDomainInfo](sfclient-v82-model-upgradedomaininfo.md) | Information about an upgrade domain.<br/> |
| [UpgradeDomainNodesHealthEvaluation](sfclient-v82-model-upgradedomainnodeshealthevaluation.md) | Represents health evaluation for cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health during cluster upgrade and the aggregated health state is either Error or Warning.<br/> |
| [UpgradeDomainNodesHealthEvaluation](sfclient-v82-model-upgradedomainnodeshealthevaluation.md) | Represents health evaluation for cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health during cluster upgrade and the aggregated health state is either Error or Warning.<br/> |
| [UpgradeDomainState enum](sfclient-v82-model-upgradedomainstate.md) | The state of the upgrade domain.<br/> |
| [UpgradeKind enum](sfclient-v82-model-upgradekind.md) | The kind of upgrade out of the following possible values.<br/> |
| [UpgradeMode enum](sfclient-v82-model-upgrademode.md) | The mode used to monitor health during a rolling upgrade. The values are UnmonitoredAuto, UnmonitoredManual, Monitored, and UnmonitoredDeferred.<br/> |
| [UpgradeOrchestrationServiceState](sfclient-v82-model-upgradeorchestrationservicestate.md) | Service state of Service Fabric Upgrade Orchestration Service.<br/> |
| [UpgradeOrchestrationServiceStateSummary](sfclient-v82-model-upgradeorchestrationservicestatesummary.md) | Service state summary of Service Fabric Upgrade Orchestration Service.<br/> |
| [UpgradeSortOrder enum](sfclient-v82-model-upgradesortorder.md) | Defines the order in which an upgrade proceeds through the cluster.<br/> |
| [UpgradeState enum](sfclient-v82-model-upgradestate.md) | The state of the upgrade domain.<br/> |
| [UpgradeType enum](sfclient-v82-model-upgradetype.md) | The type of upgrade out of the following possible values.<br/> |
| [UpgradeUnitInfo](sfclient-v82-model-upgradeunitinfo.md) | Information about an upgrade unit.<br/> |
| [UpgradeUnitState enum](sfclient-v82-model-upgradeunitstate.md) | The state of the upgrade unit.<br/> |
| [UploadChunkRange](sfclient-v82-model-uploadchunkrange.md) | Information about which portion of the file to upload.<br/> |
| [UploadSession](sfclient-v82-model-uploadsession.md) | Information about a image store upload session<br/> |
| [UploadSessionInfo](sfclient-v82-model-uploadsessioninfo.md) | Information about an image store upload session. A session is associated with a relative path in the image store.<br/> |
| [UsageInfo](sfclient-v82-model-usageinfo.md) | Information about how much space and how many files in the file system the ImageStore is using in this category<br/> |
| [ValidateClusterUpgradeResult](sfclient-v82-model-validateclusterupgraderesult.md) | Specifies result of validating a cluster upgrade.<br/> |
| [ValidationFailedChaosEvent](sfclient-v82-model-validationfailedchaosevent.md) | Chaos event corresponding to a failure during validation.<br/> |
| [ValidationFailedChaosEvent](sfclient-v82-model-validationfailedchaosevent.md) | Chaos event corresponding to a failure during validation.<br/> |
| [VolumeProperties](sfclient-v82-model-volumeproperties.md) | Describes properties of a volume resource.<br/> |
| [VolumeProvider enum](sfclient-v82-model-volumeprovider.md) | Describes the provider of the volume resource.<br/> |
| [VolumeProviderParametersAzureFile](sfclient-v82-model-volumeproviderparametersazurefile.md) | This type describes a volume provided by an Azure Files file share.<br/> |
| [VolumeReference](sfclient-v82-model-volumereference.md) | Describes a reference to a volume resource.<br/> |
| [VolumeResourceDescription](sfclient-v82-model-volumeresourcedescription.md) | This type describes a volume resource.<br/> |
| [WaitForInbuildReplicaSafetyCheck](sfclient-v82-model-waitforinbuildreplicasafetycheck.md) | Safety check that waits for the replica build operation to finish. This indicates that there is a replica that is going through the copy or is providing data for building another replica. Bring the node down will abort this copy operation which are typically expensive involving data movements.<br/> |
| [WaitForInbuildReplicaSafetyCheck](sfclient-v82-model-waitforinbuildreplicasafetycheck.md) | Safety check that waits for the replica build operation to finish. This indicates that there is a replica that is going through the copy or is providing data for building another replica. Bring the node down will abort this copy operation which are typically expensive involving data movements.<br/> |
| [WaitForPrimaryPlacementSafetyCheck](sfclient-v82-model-waitforprimaryplacementsafetycheck.md) | Safety check that waits for the primary replica that was moved out of the node due to upgrade to be placed back again on that node.<br/> |
| [WaitForPrimaryPlacementSafetyCheck](sfclient-v82-model-waitforprimaryplacementsafetycheck.md) | Safety check that waits for the primary replica that was moved out of the node due to upgrade to be placed back again on that node.<br/> |
| [WaitForPrimarySwapSafetyCheck](sfclient-v82-model-waitforprimaryswapsafetycheck.md) | Safety check that waits for the primary replica to be moved out of the node before starting an upgrade to ensure the availability of the primary replica for the partition.<br/> |
| [WaitForPrimarySwapSafetyCheck](sfclient-v82-model-waitforprimaryswapsafetycheck.md) | Safety check that waits for the primary replica to be moved out of the node before starting an upgrade to ensure the availability of the primary replica for the partition.<br/> |
| [WaitForReconfigurationSafetyCheck](sfclient-v82-model-waitforreconfigurationsafetycheck.md) | Safety check that waits for the current reconfiguration of the partition to be completed before starting an upgrade.<br/> |
| [WaitForReconfigurationSafetyCheck](sfclient-v82-model-waitforreconfigurationsafetycheck.md) | Safety check that waits for the current reconfiguration of the partition to be completed before starting an upgrade.<br/> |
| [WaitingChaosEvent](sfclient-v82-model-waitingchaosevent.md) | Describes a Chaos event that gets generated when Chaos is waiting for the cluster to become ready for faulting, for example, Chaos may be waiting for the on-going upgrade to finish.<br/> |
| [WaitingChaosEvent](sfclient-v82-model-waitingchaosevent.md) | Describes a Chaos event that gets generated when Chaos is waiting for the cluster to become ready for faulting, for example, Chaos may be waiting for the on-going upgrade to finish.<br/> |

