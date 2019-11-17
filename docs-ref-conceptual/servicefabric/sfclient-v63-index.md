---
title: "Service Fabric Client REST API Reference"
ms.date: 07/20/2018
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


# Service Fabric Client REST API Reference

[Service Fabric](https://aka.ms/ServiceFabric) is a distributed systems platform that makes it easy to package, deploy, and manage scalable and reliable microservices. 

Service Fabric Client APIs allow deploying and managing microservices based applications and containers in a Service Fabric cluster on Azure, on-premise, on local development machine or in other cloud. This document provides a reference for these APIs.


> [!IMPORTANT]
>  These APIs work with Service Fabric clusters running runtime version 6.3.0 and above.
>

## Versioning
The REST APIs are versioned using the api-version query parameter in the URI.
All the REST APIs will always support api-version=MajorVersion.MinorVersion where the Major and Minor version number correspond to the version of the Service Fabric cluster runtime being targeted. 
For instance, while sending requests to a 6.0 cluster, api-version=6.0 is always guaranteed to work, with the latest contract supported by the REST API.
However, requests with api-version=6.0 will fail against a 5.5 cluster.
To maintain backward compatibility, the cluster will always support any previously supported api-version. So requests with api-version=1.0 or 2.0 or 3.0 will succeed against a 6.0 cluster. The response output will depend on the contract specified for the specific api-version.



## Protocol
All task operations conform to the HTTP/1.1 protocol specification. All task operations return standard HTTP status codes and may also return additional [Status and Error Codes](sfclient-v63-status-and-error-codes.md) in the response body. See [Service Fabric Names and JSON Serialization](sfclient-v63-service-fabric-names-and-json-serialization.md) for special considerations when serializing and de-serializing names and identities of various entities such as nodes, applications, services, partitions, and replicas in the Service Fabric cluster, to and from request and response. It is recommended that you secure request and responses. For more information, see [Authenticating Service Fabric REST Requests](sfclient-v63-authenticating-service-fabric-rest-requests.md). 


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

Service Fabric Resource APIs allows deploying and managed [Service Fabric Mesh](https://aka.ms/sfmesh) applications in a Service Fabric Cluster. 

* Service Fabric Application Resource APIs
* Service Fabric Volume Resource APIs

## Client API Reference
Following is a list of Service Fabric Client REST APIs.


----
## [Cluster APIs](sfclient-v63-index-cluster.md)

| Name | Description |
| --- | --- |
| [Get Cluster Manifest](sfclient-v63-api-getclustermanifest.md) | Get the Service Fabric cluster manifest.<br/> |
| [Get Cluster Health](sfclient-v63-api-getclusterhealth.md) | Gets the health of a Service Fabric cluster.<br/> |
| [Get Cluster Health Using Policy](sfclient-v63-api-getclusterhealthusingpolicy.md) | Gets the health of a Service Fabric cluster using the specified policy.<br/> |
| [Get Cluster Health Chunk](sfclient-v63-api-getclusterhealthchunk.md) | Gets the health of a Service Fabric cluster using health chunks.<br/> |
| [Get Cluster Health Chunk Using Policy And Advanced Filters](sfclient-v63-api-getclusterhealthchunkusingpolicyandadvancedfilters.md) | Gets the health of a Service Fabric cluster using health chunks.<br/> |
| [Report Cluster Health](sfclient-v63-api-reportclusterhealth.md) | Sends a health report on the Service Fabric cluster.<br/> |
| [Get Provisioned Fabric Code Version Info List](sfclient-v63-api-getprovisionedfabriccodeversioninfolist.md) | Gets a list of fabric code versions that are provisioned in a Service Fabric cluster.<br/> |
| [Get Provisioned Fabric Config Version Info List](sfclient-v63-api-getprovisionedfabricconfigversioninfolist.md) | Gets a list of fabric config versions that are provisioned in a Service Fabric cluster.<br/> |
| [Get Cluster Upgrade Progress](sfclient-v63-api-getclusterupgradeprogress.md) | Gets the progress of the current cluster upgrade.<br/> |
| [Get Cluster Configuration](sfclient-v63-api-getclusterconfiguration.md) | Get the Service Fabric standalone cluster configuration.<br/> |
| [Get Cluster Configuration Upgrade Status](sfclient-v63-api-getclusterconfigurationupgradestatus.md) | Get the cluster configuration upgrade status of a Service Fabric standalone cluster.<br/> |
| [Get Upgrade Orchestration Service State](sfclient-v63-api-getupgradeorchestrationservicestate.md) | Get the service state of Service Fabric Upgrade Orchestration Service.<br/> |
| [Set Upgrade Orchestration Service State](sfclient-v63-api-setupgradeorchestrationservicestate.md) | Update the service state of Service Fabric Upgrade Orchestration Service.<br/> |
| [Provision Cluster](sfclient-v63-api-provisioncluster.md) | Provision the code or configuration packages of a Service Fabric cluster.<br/> |
| [Unprovision Cluster](sfclient-v63-api-unprovisioncluster.md) | Unprovision the code or configuration packages of a Service Fabric cluster.<br/> |
| [Rollback Cluster Upgrade](sfclient-v63-api-rollbackclusterupgrade.md) | Rollback the upgrade of a Service Fabric cluster.<br/> |
| [Resume Cluster Upgrade](sfclient-v63-api-resumeclusterupgrade.md) | Make the cluster upgrade move on to the next upgrade domain.<br/> |
| [Start Cluster Upgrade](sfclient-v63-api-startclusterupgrade.md) | Start upgrading the code or configuration version of a Service Fabric cluster.<br/> |
| [Start Cluster Configuration Upgrade](sfclient-v63-api-startclusterconfigurationupgrade.md) | Start upgrading the configuration of a Service Fabric standalone cluster.<br/> |
| [Update Cluster Upgrade](sfclient-v63-api-updateclusterupgrade.md) | Update the upgrade parameters of a Service Fabric cluster upgrade.<br/> |
| [Get Aad Metadata](sfclient-v63-api-getaadmetadata.md) | Gets the Azure Active Directory metadata used for secured connection to cluster.<br/> |

----
## [Node APIs](sfclient-v63-index-node.md)

| Name | Description |
| --- | --- |
| [Get Node Info List](sfclient-v63-api-getnodeinfolist.md) | Gets the list of nodes in the Service Fabric cluster.<br/> |
| [Get Node Info](sfclient-v63-api-getnodeinfo.md) | Gets the information about a specific node in the Service Fabric cluster.<br/> |
| [Get Node Health](sfclient-v63-api-getnodehealth.md) | Gets the health of a Service Fabric node.<br/> |
| [Get Node Health Using Policy](sfclient-v63-api-getnodehealthusingpolicy.md) | Gets the health of a Service Fabric node, by using the specified health policy.<br/> |
| [Report Node Health](sfclient-v63-api-reportnodehealth.md) | Sends a health report on the Service Fabric node.<br/> |
| [Get Node Load Info](sfclient-v63-api-getnodeloadinfo.md) | Gets the load information of a Service Fabric node.<br/> |
| [Disable Node](sfclient-v63-api-disablenode.md) | Deactivate a Service Fabric cluster node with the specified deactivation intent.<br/> |
| [Enable Node](sfclient-v63-api-enablenode.md) | Activate a Service Fabric cluster node that is currently deactivated.<br/> |
| [Remove Node State](sfclient-v63-api-removenodestate.md) | Notifies Service Fabric that the persisted state on a node has been permanently removed or lost.<br/> |
| [Restart Node](sfclient-v63-api-restartnode.md) | Restarts a Service Fabric cluster node.<br/> |

----
## [ApplicationType APIs](sfclient-v63-index-applicationtype.md)

| Name | Description |
| --- | --- |
| [Get Application Type Info List](sfclient-v63-api-getapplicationtypeinfolist.md) | Gets the list of application types in the Service Fabric cluster.<br/> |
| [Get Application Type Info List By Name](sfclient-v63-api-getapplicationtypeinfolistbyname.md) | Gets the list of application types in the Service Fabric cluster matching exactly the specified name.<br/> |
| [Provision Application Type](sfclient-v63-api-provisionapplicationtype.md) | Provisions or registers a Service Fabric application type with the cluster using the '.sfpkg' package in the external store or using the application package in the image store.<br/> |
| [Unprovision Application Type](sfclient-v63-api-unprovisionapplicationtype.md) | Removes or unregisters a Service Fabric application type from the cluster.<br/> |
| [Get Application Manifest](sfclient-v63-api-getapplicationmanifest.md) | Gets the manifest describing an application type.<br/> |

----
## [ServiceType APIs](sfclient-v63-index-servicetype.md)

| Name | Description |
| --- | --- |
| [Get Service Type Info List](sfclient-v63-api-getservicetypeinfolist.md) | Gets the list containing the information about service types that are supported by a provisioned application type in a Service Fabric cluster.<br/> |
| [Get Service Type Info By Name](sfclient-v63-api-getservicetypeinfobyname.md) | Gets the information about a specific service type that is supported by a provisioned application type in a Service Fabric cluster.<br/> |
| [Get Service Manifest](sfclient-v63-api-getservicemanifest.md) | Gets the manifest describing a service type.<br/> |
| [Get Deployed Service Type Info List](sfclient-v63-api-getdeployedservicetypeinfolist.md) | Gets the list containing the information about service types from the applications deployed on a node in a Service Fabric cluster.<br/> |
| [Get Deployed Service Type Info By Name](sfclient-v63-api-getdeployedservicetypeinfobyname.md) | Gets the information about a specified service type of the application deployed on a node in a Service Fabric cluster.<br/> |

----
## [Application APIs](sfclient-v63-index-application.md)

| Name | Description |
| --- | --- |
| [Create Application](sfclient-v63-api-createapplication.md) | Creates a Service Fabric application.<br/> |
| [Delete Application](sfclient-v63-api-deleteapplication.md) | Deletes an existing Service Fabric application.<br/> |
| [Get Application Load Info](sfclient-v63-api-getapplicationloadinfo.md) | Gets load information about a Service Fabric application.<br/> |
| [Get Application Info List](sfclient-v63-api-getapplicationinfolist.md) | Gets the list of applications created in the Service Fabric cluster that match the specified filters.<br/> |
| [Get Application Info](sfclient-v63-api-getapplicationinfo.md) | Gets information about a Service Fabric application.<br/> |
| [Get Application Health](sfclient-v63-api-getapplicationhealth.md) | Gets the health of the service fabric application.<br/> |
| [Get Application Health Using Policy](sfclient-v63-api-getapplicationhealthusingpolicy.md) | Gets the health of a Service Fabric application using the specified policy.<br/> |
| [Report Application Health](sfclient-v63-api-reportapplicationhealth.md) | Sends a health report on the Service Fabric application.<br/> |
| [Start Application Upgrade](sfclient-v63-api-startapplicationupgrade.md) | Starts upgrading an application in the Service Fabric cluster.<br/> |
| [Get Application Upgrade](sfclient-v63-api-getapplicationupgrade.md) | Gets details for the latest upgrade performed on this application.<br/> |
| [Update Application Upgrade](sfclient-v63-api-updateapplicationupgrade.md) | Updates an ongoing application upgrade in the Service Fabric cluster.<br/> |
| [Resume Application Upgrade](sfclient-v63-api-resumeapplicationupgrade.md) | Resumes upgrading an application in the Service Fabric cluster.<br/> |
| [Rollback Application Upgrade](sfclient-v63-api-rollbackapplicationupgrade.md) | Starts rolling back the currently on-going upgrade of an application in the Service Fabric cluster.<br/> |
| [Get Deployed Application Info List](sfclient-v63-api-getdeployedapplicationinfolist.md) | Gets the list of applications deployed on a Service Fabric node.<br/> |
| [Get Deployed Application Info](sfclient-v63-api-getdeployedapplicationinfo.md) | Gets the information about an application deployed on a Service Fabric node.<br/> |
| [Get Deployed Application Health](sfclient-v63-api-getdeployedapplicationhealth.md) | Gets the information about health of an application deployed on a Service Fabric node.<br/> |
| [Get Deployed Application Health Using Policy](sfclient-v63-api-getdeployedapplicationhealthusingpolicy.md) | Gets the information about health of an application deployed on a Service Fabric node. using the specified policy.<br/> |
| [Report Deployed Application Health](sfclient-v63-api-reportdeployedapplicationhealth.md) | Sends a health report on the Service Fabric application deployed on a Service Fabric node.<br/> |

----
## [Service APIs](sfclient-v63-index-service.md)

| Name | Description |
| --- | --- |
| [Get Service Info List](sfclient-v63-api-getserviceinfolist.md) | Gets the information about all services belonging to the application specified by the application ID.<br/> |
| [Get Service Info](sfclient-v63-api-getserviceinfo.md) | Gets the information about the specific service belonging to the Service Fabric application.<br/> |
| [Get Application Name Info](sfclient-v63-api-getapplicationnameinfo.md) | Gets the name of the Service Fabric application for a service.<br/> |
| [Create Service](sfclient-v63-api-createservice.md) | Creates the specified Service Fabric service.<br/> |
| [Create Service From Template](sfclient-v63-api-createservicefromtemplate.md) | Creates a Service Fabric service from the service template.<br/> |
| [Delete Service](sfclient-v63-api-deleteservice.md) | Deletes an existing Service Fabric service.<br/> |
| [Update Service](sfclient-v63-api-updateservice.md) | Updates a Service Fabric service using the specified update description.<br/> |
| [Get Service Description](sfclient-v63-api-getservicedescription.md) | Gets the description of an existing Service Fabric service.<br/> |
| [Get Service Health](sfclient-v63-api-getservicehealth.md) | Gets the health of the specified Service Fabric service.<br/> |
| [Get Service Health Using Policy](sfclient-v63-api-getservicehealthusingpolicy.md) | Gets the health of the specified Service Fabric service, by using the specified health policy.<br/> |
| [Report Service Health](sfclient-v63-api-reportservicehealth.md) | Sends a health report on the Service Fabric service.<br/> |
| [Resolve Service](sfclient-v63-api-resolveservice.md) | Resolve a Service Fabric partition.<br/> |

----
## [Partition APIs](sfclient-v63-index-partition.md)

| Name | Description |
| --- | --- |
| [Get Partition Info List](sfclient-v63-api-getpartitioninfolist.md) | Gets the list of partitions of a Service Fabric service.<br/> |
| [Get Partition Info](sfclient-v63-api-getpartitioninfo.md) | Gets the information about a Service Fabric partition.<br/> |
| [Get Service Name Info](sfclient-v63-api-getservicenameinfo.md) | Gets the name of the Service Fabric service for a partition.<br/> |
| [Get Partition Health](sfclient-v63-api-getpartitionhealth.md) | Gets the health of the specified Service Fabric partition.<br/> |
| [Get Partition Health Using Policy](sfclient-v63-api-getpartitionhealthusingpolicy.md) | Gets the health of the specified Service Fabric partition, by using the specified health policy.<br/> |
| [Report Partition Health](sfclient-v63-api-reportpartitionhealth.md) | Sends a health report on the Service Fabric partition.<br/> |
| [Get Partition Load Information](sfclient-v63-api-getpartitionloadinformation.md) | Gets the load information of the specified Service Fabric partition.<br/> |
| [Reset Partition Load](sfclient-v63-api-resetpartitionload.md) | Resets the current load of a Service Fabric partition.<br/> |
| [Recover Partition](sfclient-v63-api-recoverpartition.md) | Indicates to the Service Fabric cluster that it should attempt to recover a specific partition that is currently stuck in quorum loss.<br/> |
| [Recover Service Partitions](sfclient-v63-api-recoverservicepartitions.md) | Indicates to the Service Fabric cluster that it should attempt to recover the specified service that is currently stuck in quorum loss.<br/> |
| [Recover System Partitions](sfclient-v63-api-recoversystempartitions.md) | Indicates to the Service Fabric cluster that it should attempt to recover the system services that are currently stuck in quorum loss.<br/> |
| [Recover All Partitions](sfclient-v63-api-recoverallpartitions.md) | Indicates to the Service Fabric cluster that it should attempt to recover any services (including system services) which are currently stuck in quorum loss.<br/> |

----
## [RepairManagement APIs](sfclient-v63-index-repairmanagement.md)

| Name | Description |
| --- | --- |
| [Create Repair Task](sfclient-v63-api-createrepairtask.md) | Creates a new repair task.<br/> |
| [Cancel Repair Task](sfclient-v63-api-cancelrepairtask.md) | Requests the cancellation of the given repair task.<br/> |
| [Delete Repair Task](sfclient-v63-api-deleterepairtask.md) | Deletes a completed repair task.<br/> |
| [Get Repair Task List](sfclient-v63-api-getrepairtasklist.md) | Gets a list of repair tasks matching the given filters.<br/> |
| [Force Approve Repair Task](sfclient-v63-api-forceapproverepairtask.md) | Forces the approval of the given repair task.<br/> |
| [Update Repair Task Health Policy](sfclient-v63-api-updaterepairtaskhealthpolicy.md) | Updates the health policy of the given repair task.<br/> |
| [Update Repair Execution State](sfclient-v63-api-updaterepairexecutionstate.md) | Updates the execution state of a repair task.<br/> |

----
## [Replica APIs](sfclient-v63-index-replica.md)

| Name | Description |
| --- | --- |
| [Get Replica Info List](sfclient-v63-api-getreplicainfolist.md) | Gets the information about replicas of a Service Fabric service partition.<br/> |
| [Get Replica Info](sfclient-v63-api-getreplicainfo.md) | Gets the information about a replica of a Service Fabric partition.<br/> |
| [Get Replica Health](sfclient-v63-api-getreplicahealth.md) | Gets the health of a Service Fabric stateful service replica or stateless service instance.<br/> |
| [Get Replica Health Using Policy](sfclient-v63-api-getreplicahealthusingpolicy.md) | Gets the health of a Service Fabric stateful service replica or stateless service instance using the specified policy.<br/> |
| [Report Replica Health](sfclient-v63-api-reportreplicahealth.md) | Sends a health report on the Service Fabric replica.<br/> |
| [Get Deployed Service Replica Info List](sfclient-v63-api-getdeployedservicereplicainfolist.md) | Gets the list of replicas deployed on a Service Fabric node.<br/> |
| [Get Deployed Service Replica Detail Info](sfclient-v63-api-getdeployedservicereplicadetailinfo.md) | Gets the details of replica deployed on a Service Fabric node.<br/> |
| [Get Deployed Service Replica Detail Info By Partition Id](sfclient-v63-api-getdeployedservicereplicadetailinfobypartitionid.md) | Gets the details of replica deployed on a Service Fabric node.<br/> |
| [Restart Replica](sfclient-v63-api-restartreplica.md) | Restarts a service replica of a persisted service running on a node.<br/> |
| [Remove Replica](sfclient-v63-api-removereplica.md) | Removes a service replica running on a node.<br/> |

----
## [Service Package APIs](sfclient-v63-index-service-package.md)

| Name | Description |
| --- | --- |
| [Get Deployed Service Package Info List](sfclient-v63-api-getdeployedservicepackageinfolist.md) | Gets the list of service packages deployed on a Service Fabric node.<br/> |
| [Get Deployed Service Package Info List By Name](sfclient-v63-api-getdeployedservicepackageinfolistbyname.md) | Gets the list of service packages deployed on a Service Fabric node matching exactly the specified name.<br/> |
| [Get Deployed Service Package Health](sfclient-v63-api-getdeployedservicepackagehealth.md) | Gets the information about health of a service package for a specific application deployed for a Service Fabric node and application.<br/> |
| [Get Deployed Service Package Health Using Policy](sfclient-v63-api-getdeployedservicepackagehealthusingpolicy.md) | Gets the information about health of service package for a specific application deployed on a Service Fabric node using the specified policy.<br/> |
| [Report Deployed Service Package Health](sfclient-v63-api-reportdeployedservicepackagehealth.md) | Sends a health report on the Service Fabric deployed service package.<br/> |
| [Deploy Service Package To Node](sfclient-v63-api-deployservicepackagetonode.md) | Downloads all of the code packages associated with specified service manifest on the specified node.<br/> |

----
## [Code Package APIs](sfclient-v63-index-code-package.md)

| Name | Description |
| --- | --- |
| [Get Deployed Code Package Info List](sfclient-v63-api-getdeployedcodepackageinfolist.md) | Gets the list of code packages deployed on a Service Fabric node.<br/> |
| [Restart Deployed Code Package](sfclient-v63-api-restartdeployedcodepackage.md) | Restarts a code package deployed on a Service Fabric node in a cluster.<br/> |
| [Get Container Logs Deployed On Node](sfclient-v63-api-getcontainerlogsdeployedonnode.md) | Gets the container logs for container deployed on a Service Fabric node.<br/> |
| [Invoke Container Api](sfclient-v63-api-invokecontainerapi.md) | Invoke container API on a container deployed on a Service Fabric node.<br/> |

----
## [Compose Deployment APIs](sfclient-v63-index-compose-deployment.md)

| Name | Description |
| --- | --- |
| [Create Compose Deployment](sfclient-v63-api-createcomposedeployment.md) | Creates a Service Fabric compose deployment.<br/> |
| [Get Compose Deployment Status](sfclient-v63-api-getcomposedeploymentstatus.md) | Gets information about a Service Fabric compose deployment.<br/> |
| [Get Compose Deployment Status List](sfclient-v63-api-getcomposedeploymentstatuslist.md) | Gets the list of compose deployments created in the Service Fabric cluster.<br/> |
| [Get Compose Deployment Upgrade Progress](sfclient-v63-api-getcomposedeploymentupgradeprogress.md) | Gets details for the latest upgrade performed on this Service Fabric compose deployment.<br/> |
| [Remove Compose Deployment](sfclient-v63-api-removecomposedeployment.md) | Deletes an existing Service Fabric compose deployment from cluster.<br/> |
| [Start Compose Deployment Upgrade](sfclient-v63-api-startcomposedeploymentupgrade.md) | Starts upgrading a compose deployment in the Service Fabric cluster.<br/> |

----
## [Chaos APIs](sfclient-v63-index-chaos.md)

| Name | Description |
| --- | --- |
| [Get Chaos](sfclient-v63-api-getchaos.md) | Get the status of Chaos.<br/> |
| [Start Chaos](sfclient-v63-api-startchaos.md) | Starts Chaos in the cluster.<br/> |
| [Stop Chaos](sfclient-v63-api-stopchaos.md) | Stops Chaos if it is running in the cluster and put the Chaos Schedule in a stopped state.<br/> |
| [Get Chaos Events](sfclient-v63-api-getchaosevents.md) | Gets the next segment of the Chaos events based on the continuation token or the time range.<br/> |
| [Get Chaos Schedule](sfclient-v63-api-getchaosschedule.md) | Get the Chaos Schedule defining when and how to run Chaos.<br/> |
| [Post Chaos Schedule](sfclient-v63-api-postchaosschedule.md) | Set the schedule used by Chaos.<br/> |

----
## [ImageStore APIs](sfclient-v63-index-imagestore.md)

| Name | Description |
| --- | --- |
| [Upload File](sfclient-v63-api-uploadfile.md) | Uploads contents of the file to the image store.<br/> |
| [Get Image Store Content](sfclient-v63-api-getimagestorecontent.md) | Gets the image store content information.<br/> |
| [Delete Image Store Content](sfclient-v63-api-deleteimagestorecontent.md) | Deletes existing image store content.<br/> |
| [Get Image Store Root Content](sfclient-v63-api-getimagestorerootcontent.md) | Gets the content information at the root of the image store.<br/> |
| [Copy Image Store Content](sfclient-v63-api-copyimagestorecontent.md) | Copies image store content internally<br/> |
| [Delete Image Store Upload Session](sfclient-v63-api-deleteimagestoreuploadsession.md) | Cancels an image store upload session.<br/> |
| [Commit Image Store Upload Session](sfclient-v63-api-commitimagestoreuploadsession.md) | Commit an image store upload session.<br/> |
| [Get Image Store Upload Session By Id](sfclient-v63-api-getimagestoreuploadsessionbyid.md) | Get the image store upload session by ID.<br/> |
| [Get Image Store Upload Session By Path](sfclient-v63-api-getimagestoreuploadsessionbypath.md) | Get the image store upload session by relative path.<br/> |
| [Upload File Chunk](sfclient-v63-api-uploadfilechunk.md) | Uploads a file chunk to the image store relative path.<br/> |

----
## [Infrastructure APIs](sfclient-v63-index-infrastructure.md)

| Name | Description |
| --- | --- |
| [Invoke Infrastructure Command](sfclient-v63-api-invokeinfrastructurecommand.md) | Invokes an administrative command on the given Infrastructure Service instance.<br/> |
| [Invoke Infrastructure Query](sfclient-v63-api-invokeinfrastructurequery.md) | Invokes a read-only query on the given infrastructure service instance.<br/> |

----
## [Faults APIs](sfclient-v63-index-faults.md)

| Name | Description |
| --- | --- |
| [Start Data Loss](sfclient-v63-api-startdataloss.md) | This API will induce data loss for the specified partition. It will trigger a call to the OnDataLossAsync API of the partition.<br/> |
| [Get Data Loss Progress](sfclient-v63-api-getdatalossprogress.md) | Gets the progress of a partition data loss operation started using the StartDataLoss API.<br/> |
| [Start Quorum Loss](sfclient-v63-api-startquorumloss.md) | Induces quorum loss for a given stateful service partition.<br/> |
| [Get Quorum Loss Progress](sfclient-v63-api-getquorumlossprogress.md) | Gets the progress of a quorum loss operation on a partition started using the StartQuorumLoss API.<br/> |
| [Start Partition Restart](sfclient-v63-api-startpartitionrestart.md) | This API will restart some or all replicas or instances of the specified partition.<br/> |
| [Get Partition Restart Progress](sfclient-v63-api-getpartitionrestartprogress.md) | Gets the progress of a PartitionRestart operation started using StartPartitionRestart.<br/> |
| [Start Node Transition](sfclient-v63-api-startnodetransition.md) | Starts or stops a cluster node.<br/> |
| [Get Node Transition Progress](sfclient-v63-api-getnodetransitionprogress.md) | Gets the progress of an operation started using StartNodeTransition.<br/> |
| [Get Fault Operation List](sfclient-v63-api-getfaultoperationlist.md) | Gets a list of user-induced fault operations filtered by provided input.<br/> |
| [Cancel Operation](sfclient-v63-api-canceloperation.md) | Cancels a user-induced fault operation.<br/> |

----
## [BackupRestore APIs](sfclient-v63-index-backuprestore.md)

| Name | Description |
| --- | --- |
| [Create Backup Policy](sfclient-v63-api-createbackuppolicy.md) | Creates a backup policy.<br/> |
| [Delete Backup Policy](sfclient-v63-api-deletebackuppolicy.md) | Deletes the backup policy.<br/> |
| [Get Backup Policy List](sfclient-v63-api-getbackuppolicylist.md) | Gets all the backup policies configured.<br/> |
| [Get Backup Policy By Name](sfclient-v63-api-getbackuppolicybyname.md) | Gets a particular backup policy by name.<br/> |
| [Get All Entities Backed Up By Policy](sfclient-v63-api-getallentitiesbackedupbypolicy.md) | Gets the list of backup entities that are associated with this policy.<br/> |
| [Update Backup Policy](sfclient-v63-api-updatebackuppolicy.md) | Updates the backup policy.<br/> |
| [Enable Application Backup](sfclient-v63-api-enableapplicationbackup.md) | Enables periodic backup of stateful partitions under this Service Fabric application.<br/> |
| [Disable Application Backup](sfclient-v63-api-disableapplicationbackup.md) | Disables periodic backup of Service Fabric application.<br/> |
| [Get Application Backup Configuration Info](sfclient-v63-api-getapplicationbackupconfigurationinfo.md) | Gets the Service Fabric application backup configuration information.<br/> |
| [Get Application Backup List](sfclient-v63-api-getapplicationbackuplist.md) | Gets the list of backups available for every partition in this application.<br/> |
| [Suspend Application Backup](sfclient-v63-api-suspendapplicationbackup.md) | Suspends periodic backup for the specified Service Fabric application.<br/> |
| [Resume Application Backup](sfclient-v63-api-resumeapplicationbackup.md) | Resumes periodic backup of a Service Fabric application which was previously suspended.<br/> |
| [Enable Service Backup](sfclient-v63-api-enableservicebackup.md) | Enables periodic backup of stateful partitions under this Service Fabric service.<br/> |
| [Disable Service Backup](sfclient-v63-api-disableservicebackup.md) | Disables periodic backup of Service Fabric service which was previously enabled.<br/> |
| [Get Service Backup Configuration Info](sfclient-v63-api-getservicebackupconfigurationinfo.md) | Gets the Service Fabric service backup configuration information.<br/> |
| [Get Service Backup List](sfclient-v63-api-getservicebackuplist.md) | Gets the list of backups available for every partition in this service.<br/> |
| [Suspend Service Backup](sfclient-v63-api-suspendservicebackup.md) | Suspends periodic backup for the specified Service Fabric service.<br/> |
| [Resume Service Backup](sfclient-v63-api-resumeservicebackup.md) | Resumes periodic backup of a Service Fabric service which was previously suspended.<br/> |
| [Enable Partition Backup](sfclient-v63-api-enablepartitionbackup.md) | Enables periodic backup of the stateful persisted partition.<br/> |
| [Disable Partition Backup](sfclient-v63-api-disablepartitionbackup.md) | Disables periodic backup of Service Fabric partition which was previously enabled.<br/> |
| [Get Partition Backup Configuration Info](sfclient-v63-api-getpartitionbackupconfigurationinfo.md) | Gets the partition backup configuration information<br/> |
| [Get Partition Backup List](sfclient-v63-api-getpartitionbackuplist.md) | Gets the list of backups available for the specified partition.<br/> |
| [Suspend Partition Backup](sfclient-v63-api-suspendpartitionbackup.md) | Suspends periodic backup for the specified partition.<br/> |
| [Resume Partition Backup](sfclient-v63-api-resumepartitionbackup.md) | Resumes periodic backup of partition which was previously suspended.<br/> |
| [Backup Partition](sfclient-v63-api-backuppartition.md) | Triggers backup of the partition's state.<br/> |
| [Get Partition Backup Progress](sfclient-v63-api-getpartitionbackupprogress.md) | Gets details for the latest backup triggered for this partition.<br/> |
| [Restore Partition](sfclient-v63-api-restorepartition.md) | Triggers restore of the state of the partition using the specified restore partition description.<br/> |
| [Get Partition Restore Progress](sfclient-v63-api-getpartitionrestoreprogress.md) | Gets details for the latest restore operation triggered for this partition.<br/> |
| [Get Backups From Backup Location](sfclient-v63-api-getbackupsfrombackuplocation.md) | Gets the list of backups available for the specified backed up entity at the specified backup location.<br/> |

----
## [Property Management APIs](sfclient-v63-index-property-management.md)

| Name | Description |
| --- | --- |
| [Create Name](sfclient-v63-api-createname.md) | Creates a Service Fabric name.<br/> |
| [Get Name Exists Info](sfclient-v63-api-getnameexistsinfo.md) | Returns whether the Service Fabric name exists.<br/> |
| [Delete Name](sfclient-v63-api-deletename.md) | Deletes a Service Fabric name.<br/> |
| [Get Sub Name Info List](sfclient-v63-api-getsubnameinfolist.md) | Enumerates all the Service Fabric names under a given name.<br/> |
| [Get Property Info List](sfclient-v63-api-getpropertyinfolist.md) | Gets information on all Service Fabric properties under a given name.<br/> |
| [Put Property](sfclient-v63-api-putproperty.md) | Creates or updates a Service Fabric property.<br/> |
| [Get Property Info](sfclient-v63-api-getpropertyinfo.md) | Gets the specified Service Fabric property.<br/> |
| [Delete Property](sfclient-v63-api-deleteproperty.md) | Deletes the specified Service Fabric property.<br/> |
| [Submit Property Batch](sfclient-v63-api-submitpropertybatch.md) | Submits a property batch.<br/> |

----
## [EventsStore APIs](sfclient-v63-index-eventsstore.md)

| Name | Description |
| --- | --- |
| [Get Cluster Event List](sfclient-v63-api-getclustereventlist.md) | Gets all Cluster-related events.<br/> |
| [Get Containers Event List](sfclient-v63-api-getcontainerseventlist.md) | Gets all Containers-related events.<br/> |
| [Get Node Event List](sfclient-v63-api-getnodeeventlist.md) | Gets a Node-related events.<br/> |
| [Get Nodes Event List](sfclient-v63-api-getnodeseventlist.md) | Gets all Nodes-related Events.<br/> |
| [Get Application Event List](sfclient-v63-api-getapplicationeventlist.md) | Gets an Application-related events.<br/> |
| [Get Applications Event List](sfclient-v63-api-getapplicationseventlist.md) | Gets all Applications-related events.<br/> |
| [Get Service Event List](sfclient-v63-api-getserviceeventlist.md) | Gets a Service-related events.<br/> |
| [Get Services Event List](sfclient-v63-api-getserviceseventlist.md) | Gets all Services-related events.<br/> |
| [Get Partition Event List](sfclient-v63-api-getpartitioneventlist.md) | Gets a Partition-related events.<br/> |
| [Get Partitions Event List](sfclient-v63-api-getpartitionseventlist.md) | Gets all Partitions-related events.<br/> |
| [Get Partition Replica Event List](sfclient-v63-api-getpartitionreplicaeventlist.md) | Gets a Partition Replica-related events.<br/> |
| [Get Partition Replicas Event List](sfclient-v63-api-getpartitionreplicaseventlist.md) | Gets all Replicas-related events for a Partition.<br/> |
| [Get Correlated Event List](sfclient-v63-api-getcorrelatedeventlist.md) | Gets all correlated events for a given event.<br/> |

----
## [ApplicationResource APIs](sfclient-v63-index-applicationresource.md)

| Name | Description |
| --- | --- |
| [Create Application Resource](sfclient-v63-api-createapplicationresource.md) | Creates or updates an application resource.<br/> |
| [Get Application Resource](sfclient-v63-api-getapplicationresource.md) | Gets the application with the given name.<br/> |
| [Delete Application Resource](sfclient-v63-api-deleteapplicationresource.md) | Deletes the specified application.<br/> |
| [Get Services](sfclient-v63-api-getservices.md) | Gets all the services in the application resource.<br/> |
| [Get Service](sfclient-v63-api-getservice.md) | Gets the description of the specified service in an application resource.<br/> |
| [Get Replicas](sfclient-v63-api-getreplicas.md) | Gets replicas of a given service in an applciation resource.<br/> |
| [Get Replica](sfclient-v63-api-getreplica.md) | Gets a specific replica of a given service in an application resource.<br/> |

----
## [VolumeResource APIs](sfclient-v63-index-volumeresource.md)

| Name | Description |
| --- | --- |
| [Create Volume Resource](sfclient-v63-api-createvolumeresource.md) | Creates or updates a volume resource.<br/> |
| [Get Volume Resource](sfclient-v63-api-getvolumeresource.md) | Gets the volume resource.<br/> |
| [Delete Volume Resource](sfclient-v63-api-deletevolumeresource.md) | Deletes the volume resource.<br/> |

----
## [Models](sfclient-v63-index-models.md)

| Name | Description |
| --- | --- |
| [AadMetadata](sfclient-v63-model-aadmetadata.md) | Azure Active Directory metadata used for secured connection to cluster.<br/> |
| [AadMetadataObject](sfclient-v63-model-aadmetadataobject.md) | Azure Active Directory metadata object used for secured connection to cluster.<br/> |
| [AddRemoveIncrementalNamedPartitionScalingMechanism](sfclient-v63-model-addremoveincrementalnamedpartitionscalingmechanism.md) | Represents a scaling mechanism for adding or removing named partitions of a stateless service. Partition names are in the format '0','1''N-1'<br/> |
| [AnalysisEventMetadata](sfclient-v63-model-analysiseventmetadata.md) | Metadata about an Analysis Event.<br/> |
| [ApplicationBackupConfigurationInfo](sfclient-v63-model-applicationbackupconfigurationinfo.md) | Backup configuration information for a specific Service Fabric application specifying what backup policy is being applied and suspend description, if any.<br/> |
| [ApplicationBackupEntity](sfclient-v63-model-applicationbackupentity.md) | Identifies the Service Fabric application which is being backed up.<br/> |
| [ApplicationCapacityDescription](sfclient-v63-model-applicationcapacitydescription.md) | Describes capacity information for services of this application. This description can be used for describing the following.<br/>- Reserving the capacity for the services on the nodes<br/>- Limiting the total number of nodes that services of this application can run on<br/>- Limiting the custom capacity metrics to limit the total consumption of this metric by the services of this application<br/> |
| [ApplicationCreatedEvent](sfclient-v63-model-applicationcreatedevent.md) | Application Created event.<br/> |
| [ApplicationDefinitionKind enum](sfclient-v63-model-applicationdefinitionkind.md) | The mechanism used to define a Service Fabric application.<br/> |
| [ApplicationDeletedEvent](sfclient-v63-model-applicationdeletedevent.md) | Application Deleted event.<br/> |
| [ApplicationDescription](sfclient-v63-model-applicationdescription.md) | Describes a Service Fabric application.<br/> |
| [ApplicationEvent](sfclient-v63-model-applicationevent.md) | Represents the base for all Application Events.<br/> |
| [ApplicationHealth](sfclient-v63-model-applicationhealth.md) | Represents the health of the application. Contains the application aggregated health state and the service and deployed application health states.<br/> |
| [ApplicationHealthEvaluation](sfclient-v63-model-applicationhealthevaluation.md) | Represents health evaluation for an application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [ApplicationHealthPolicies](sfclient-v63-model-applicationhealthpolicies.md) | Defines the application health policy map used to evaluate the health of an application or one of its children entities.<br/> |
| [ApplicationHealthPolicy](sfclient-v63-model-applicationhealthpolicy.md) | Defines a health policy used to evaluate the health of an application or one of its children entities.<br/> |
| [ApplicationHealthPolicyMapItem](sfclient-v63-model-applicationhealthpolicymapitem.md) | Defines an item in ApplicationHealthPolicyMap.<br/> |
| [ApplicationHealthReportCreatedEvent](sfclient-v63-model-applicationhealthreportcreatedevent.md) | Application Health Report Created event.<br/> |
| [ApplicationHealthReportExpiredEvent](sfclient-v63-model-applicationhealthreportexpiredevent.md) | Application Health Report Expired event.<br/> |
| [ApplicationHealthState](sfclient-v63-model-applicationhealthstate.md) | Represents the health state of an application, which contains the application identifier and the aggregated health state.<br/> |
| [ApplicationHealthStateChunk](sfclient-v63-model-applicationhealthstatechunk.md) | Represents the health state chunk of a application.<br/>The application health state chunk contains the application name, its aggregated health state and any children services and deployed applications that respect the filters in cluster health chunk query description.<br/> |
| [ApplicationHealthStateChunkList](sfclient-v63-model-applicationhealthstatechunklist.md) | The list of application health state chunks in the cluster that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ApplicationHealthStateFilter](sfclient-v63-model-applicationhealthstatefilter.md) | Defines matching criteria to determine whether a application should be included in the cluster health chunk.<br/>One filter can match zero, one or multiple applications, depending on its properties.<br/> |
| [ApplicationInfo](sfclient-v63-model-applicationinfo.md) | Information about a Service Fabric application.<br/> |
| [ApplicationLoadInfo](sfclient-v63-model-applicationloadinfo.md) | Load Information about a Service Fabric application.<br/> |
| [ApplicationMetricDescription](sfclient-v63-model-applicationmetricdescription.md) | Describes capacity information for a custom resource balancing metric. This can be used to limit the total consumption of this metric by the services of this application.<br/> |
| [ApplicationNameInfo](sfclient-v63-model-applicationnameinfo.md) | Information about the application name.<br/> |
| [ApplicationPackageCleanupPolicy enum](sfclient-v63-model-applicationpackagecleanuppolicy.md) | The kind of action that needs to be taken for cleaning up the application package after successful provision.<br/> |
| [ApplicationParameter](sfclient-v63-model-applicationparameter.md) | Describes an application parameter override to be applied when creating or upgrading an application.<br/> |
| [ApplicationProperties](sfclient-v63-model-applicationproperties.md) | This type describes properties of an application resource.<br/> |
| [ApplicationResourceDescription](sfclient-v63-model-applicationresourcedescription.md) | Describes a service fabric application resource.<br/> |
| [ApplicationResourceStatus enum](sfclient-v63-model-applicationresourcestatus.md) | Possible values include: 'Invalid', 'Ready', 'Upgrading', 'Creating', 'Deleting', 'Failed'<br/> |
| [ApplicationsHealthEvaluation](sfclient-v63-model-applicationshealthevaluation.md) | Represents health evaluation for applications, containing health evaluations for each unhealthy application that impacted current aggregated health state.<br/> |
| [ApplicationStatus enum](sfclient-v63-model-applicationstatus.md) | The status of the application.<br/> |
| [ApplicationTypeApplicationsHealthEvaluation](sfclient-v63-model-applicationtypeapplicationshealthevaluation.md) | Represents health evaluation for applications of a particular application type. The application type applications evaluation can be returned when cluster health evaluation returns unhealthy aggregated health state, either Error or Warning. It contains health evaluations for each unhealthy application of the included application type that impacted current aggregated health state.<br/> |
| [ApplicationTypeDefinitionKind enum](sfclient-v63-model-applicationtypedefinitionkind.md) | The mechanism used to define a Service Fabric application type.<br/> |
| [ApplicationTypeHealthPolicyMapItem](sfclient-v63-model-applicationtypehealthpolicymapitem.md) | Defines an item in ApplicationTypeHealthPolicyMap.<br/> |
| [ApplicationTypeImageStorePath](sfclient-v63-model-applicationtypeimagestorepath.md) | Path description for the application package in the image store specified during the prior copy operation.<br/> |
| [ApplicationTypeInfo](sfclient-v63-model-applicationtypeinfo.md) | Information about an application type.<br/> |
| [ApplicationTypeManifest](sfclient-v63-model-applicationtypemanifest.md) | Contains the manifest describing an application type registered in a Service Fabric cluster.<br/> |
| [ApplicationTypeStatus enum](sfclient-v63-model-applicationtypestatus.md) | The status of the application type.<br/> |
| [ApplicationUpgradeCompleteEvent](sfclient-v63-model-applicationupgradecompleteevent.md) | Application Upgrade Complete event.<br/> |
| [ApplicationUpgradeDescription](sfclient-v63-model-applicationupgradedescription.md) | Describes the parameters for an application upgrade. Note that upgrade description replaces the existing application description. This means that if the parameters are not specified, the existing parameters on the applications will be overwritten with the empty parameters list. This would result in the application using the default value of the parameters from the application manifest. If you do not want to change any existing parameter values, please get the application parameters first using the GetApplicationInfo query and then supply those values as Parameters in this ApplicationUpgradeDescription.<br/> |
| [ApplicationUpgradeDomainCompleteEvent](sfclient-v63-model-applicationupgradedomaincompleteevent.md) | Application Upgrade Domain Complete event.<br/> |
| [ApplicationUpgradeProgressInfo](sfclient-v63-model-applicationupgradeprogressinfo.md) | Describes the parameters for an application upgrade.<br/> |
| [ApplicationUpgradeRollbackCompleteEvent](sfclient-v63-model-applicationupgraderollbackcompleteevent.md) | Application Upgrade Rollback Complete event.<br/> |
| [ApplicationUpgradeRollbackStartEvent](sfclient-v63-model-applicationupgraderollbackstartevent.md) | Application Upgrade Rollback Start event.<br/> |
| [ApplicationUpgradeStartEvent](sfclient-v63-model-applicationupgradestartevent.md) | Application Upgrade Start event.<br/> |
| [ApplicationUpgradeUpdateDescription](sfclient-v63-model-applicationupgradeupdatedescription.md) | Describes the parameters for updating an ongoing application upgrade.<br/> |
| [AveragePartitionLoadScalingTrigger](sfclient-v63-model-averagepartitionloadscalingtrigger.md) | Represents a scaling trigger related to an average load of a metric/resource of a partition.<br/> |
| [AverageServiceLoadScalingTrigger](sfclient-v63-model-averageserviceloadscalingtrigger.md) | Represents a scaling policy related to an average load of a metric/resource of a service.<br/> |
| [AzureBlobBackupStorageDescription](sfclient-v63-model-azureblobbackupstoragedescription.md) | Describes the parameters for Azure blob store used for storing and enumerating backups.<br/> |
| [BackupConfigurationInfo](sfclient-v63-model-backupconfigurationinfo.md) | Describes the backup configuration information.<br/> |
| [BackupEntity](sfclient-v63-model-backupentity.md) | Describes the Service Fabric entity that is configured for backup.<br/> |
| [BackupEntityKind enum](sfclient-v63-model-backupentitykind.md) | The entity type of a Service Fabric entity such as Application, Service or a Partition where periodic backups can be enabled.<br/> |
| [BackupEpoch](sfclient-v63-model-backupepoch.md) | An Epoch is a configuration number for the partition as a whole. When the configuration of the replica set changes, for example when the Primary replica changes, the operations that are replicated from the new Primary replica are said to be a new Epoch from the ones which were sent by the old Primary replica.<br/> |
| [BackupInfo](sfclient-v63-model-backupinfo.md) | Represents a backup point which can be used to trigger a restore.<br/> |
| [BackupPartitionDescription](sfclient-v63-model-backuppartitiondescription.md) | Describes the parameters for triggering partition's backup.<br/> |
| [BackupPolicyDescription](sfclient-v63-model-backuppolicydescription.md) | Describes a backup policy for configuring periodic backup.<br/> |
| [BackupPolicyScope enum](sfclient-v63-model-backuppolicyscope.md) | Specifies the scope at which the backup policy is applied.<br/> |
| [BackupProgressInfo](sfclient-v63-model-backupprogressinfo.md) | Describes the progress of a partition's backup.<br/> |
| [BackupScheduleDescription](sfclient-v63-model-backupscheduledescription.md) | Describes the backup schedule parameters.<br/> |
| [BackupScheduleFrequencyType enum](sfclient-v63-model-backupschedulefrequencytype.md) | Describes the frequency with which to run the time based backup schedule.<br/> |
| [BackupScheduleKind enum](sfclient-v63-model-backupschedulekind.md) | The kind of backup schedule, time based or frequency based.<br/> |
| [BackupState enum](sfclient-v63-model-backupstate.md) | Represents the current state of the partition backup operation.<br/> |
| [BackupStorageDescription](sfclient-v63-model-backupstoragedescription.md) | Describes the parameters for the backup storage.<br/> |
| [BackupStorageKind enum](sfclient-v63-model-backupstoragekind.md) | The kind of backup storage, where backups are saved.<br/> |
| [BackupSuspensionInfo](sfclient-v63-model-backupsuspensioninfo.md) | Describes the backup suspension details.<br/> |
| [BackupSuspensionScope enum](sfclient-v63-model-backupsuspensionscope.md) | Specifies the scope at which the backup suspension was applied.<br/> |
| [BackupType enum](sfclient-v63-model-backuptype.md) | Describes the type of backup, whether its full or incremental.<br/> |
| [BinaryPropertyValue](sfclient-v63-model-binarypropertyvalue.md) | Describes a Service Fabric property value of type Binary.<br/> |
| [Chaos](sfclient-v63-model-chaos.md) | Contains a description of Chaos.<br/> |
| [ChaosContext](sfclient-v63-model-chaoscontext.md) | Describes a map, which is a collection of (string, string) type key-value pairs. The map can be used to record information about<br/>the Chaos run. There cannot be more than 100 such pairs and each string (key or value) can be at most 4095 characters long.<br/>This map is set by the starter of the Chaos run to optionally store the context about the specific run.<br/> |
| [ChaosEvent](sfclient-v63-model-chaosevent.md) | Represents an event generated during a Chaos run.<br/> |
| [ChaosEventKind enum](sfclient-v63-model-chaoseventkind.md) | The kind of Chaos event.<br/> |
| [ChaosEventsSegment](sfclient-v63-model-chaoseventssegment.md) | Contains the list of Chaos events and the continuation token to get the next segment.<br/> |
| [ChaosEventWrapper](sfclient-v63-model-chaoseventwrapper.md) | Wrapper object for Chaos event.<br/> |
| [ChaosMovePrimaryFaultScheduledEvent](sfclient-v63-model-chaosmoveprimaryfaultscheduledevent.md) | Chaos Move Primary Fault Scheduled event.<br/> |
| [ChaosMoveSecondaryFaultScheduledEvent](sfclient-v63-model-chaosmovesecondaryfaultscheduledevent.md) | Chaos Move Secondary Fault Scheduled event.<br/> |
| [ChaosParameters](sfclient-v63-model-chaosparameters.md) | Defines all the parameters to configure a Chaos run.<br/> |
| [ChaosParametersDictionaryItem](sfclient-v63-model-chaosparametersdictionaryitem.md) | Defines an item in ChaosParametersDictionary of the Chaos Schedule.<br/> |
| [ChaosRemoveReplicaFaultCompletedEvent](sfclient-v63-model-chaosremovereplicafaultcompletedevent.md) | Chaos Remove Replica Fault Completed event.<br/> |
| [ChaosRemoveReplicaFaultScheduledEvent](sfclient-v63-model-chaosremovereplicafaultscheduledevent.md) | Chaos Remove Replica Fault Scheduled event.<br/> |
| [ChaosRestartCodePackageFaultCompletedEvent](sfclient-v63-model-chaosrestartcodepackagefaultcompletedevent.md) | Chaos Restart Code Package Fault Completed event.<br/> |
| [ChaosRestartCodePackageFaultScheduledEvent](sfclient-v63-model-chaosrestartcodepackagefaultscheduledevent.md) | Chaos Restart Code Package Fault Scheduled event.<br/> |
| [ChaosRestartNodeFaultCompletedEvent](sfclient-v63-model-chaosrestartnodefaultcompletedevent.md) | Chaos Restart Node Fault Completed event.<br/> |
| [ChaosRestartNodeFaultScheduledEvent](sfclient-v63-model-chaosrestartnodefaultscheduledevent.md) | Chaos Restart Node Fault Scheduled event.<br/> |
| [ChaosRestartReplicaFaultScheduledEvent](sfclient-v63-model-chaosrestartreplicafaultscheduledevent.md) | Chaos Restart Replica Fault Scheduled event.<br/> |
| [ChaosSchedule](sfclient-v63-model-chaosschedule.md) | Defines the schedule used by Chaos.<br/> |
| [ChaosScheduleDescription](sfclient-v63-model-chaosscheduledescription.md) | Defines the Chaos Schedule used by Chaos and the version of the Chaos Schedule. The version value wraps back to 0 after surpassing 2,147,483,647.<br/> |
| [ChaosScheduleJob](sfclient-v63-model-chaosschedulejob.md) | Defines a repetition rule and parameters of Chaos to be used with the Chaos Schedule.<br/> |
| [ChaosScheduleJobActiveDaysOfWeek](sfclient-v63-model-chaosschedulejobactivedaysofweek.md) | Defines the days of the week that a Chaos Schedule Job will run for.<br/> |
| [ChaosScheduleStatus enum](sfclient-v63-model-chaosschedulestatus.md) | Current status of the schedule.<br/> |
| [ChaosStartedEvent](sfclient-v63-model-chaosstartedevent.md) | Chaos Started event.<br/> |
| [ChaosStatus enum](sfclient-v63-model-chaosstatus.md) | Current status of the Chaos run.<br/> |
| [ChaosStoppedEvent](sfclient-v63-model-chaosstoppedevent.md) | Chaos Stopped event.<br/> |
| [ChaosTargetFilter](sfclient-v63-model-chaostargetfilter.md) | Defines all filters for targeted Chaos faults, for example, faulting only certain node types or faulting only certain applications.<br/>If ChaosTargetFilter is not used, Chaos faults all cluster entities. If ChaosTargetFilter is used, Chaos faults only the entities that meet the ChaosTargetFilter<br/>specification. NodeTypeInclusionList and ApplicationInclusionList allow a union semantics only. It is not possible to specify an intersection<br/>of NodeTypeInclusionList and ApplicationInclusionList. For example, it is not possible to specify "fault this application only when it is on that node type."<br/>Once an entity is included in either NodeTypeInclusionList or ApplicationInclusionList, that entity cannot be excluded using ChaosTargetFilter. Even if<br/>applicationX does not appear in ApplicationInclusionList, in some Chaos iteration applicationX can be faulted because it happens to be on a node of nodeTypeY that is included<br/>in NodeTypeInclusionList. If both NodeTypeInclusionList and ApplicationInclusionList are null or empty, an ArgumentException is thrown.<br/> |
| [CheckExistsPropertyBatchOperation](sfclient-v63-model-checkexistspropertybatchoperation.md) | Represents a PropertyBatchOperation that compares the Boolean existence of a property with the Exists argument.<br/>The PropertyBatchOperation operation fails if the property's existence is not equal to the Exists argument.<br/>The CheckExistsPropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [CheckSequencePropertyBatchOperation](sfclient-v63-model-checksequencepropertybatchoperation.md) | Compares the Sequence Number of a property with the SequenceNumber argument.<br/>A property's sequence number can be thought of as that property's version.<br/>Every time the property is modified, its sequence number is increased.<br/>The sequence number can be found in a property's metadata.<br/>The comparison fails if the sequence numbers are not equal.<br/>CheckSequencePropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [CheckValuePropertyBatchOperation](sfclient-v63-model-checkvaluepropertybatchoperation.md) | Represents a PropertyBatchOperation that compares the value of the property with the expected value.<br/>The CheckValuePropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [ClusterConfiguration](sfclient-v63-model-clusterconfiguration.md) | Information about the standalone cluster configuration.<br/> |
| [ClusterConfigurationUpgradeDescription](sfclient-v63-model-clusterconfigurationupgradedescription.md) | Describes the parameters for a standalone cluster configuration upgrade.<br/> |
| [ClusterConfigurationUpgradeStatusInfo](sfclient-v63-model-clusterconfigurationupgradestatusinfo.md) | Information about a standalone cluster configuration upgrade status.<br/> |
| [ClusterEvent](sfclient-v63-model-clusterevent.md) | Represents the base for all Cluster Events.<br/> |
| [ClusterHealth](sfclient-v63-model-clusterhealth.md) | Represents the health of the cluster.<br/>Contains the cluster aggregated health state, the cluster application and node health states as well as the health events and the unhealthy evaluations.<br/> |
| [ClusterHealthChunk](sfclient-v63-model-clusterhealthchunk.md) | Represents the health chunk of the cluster.<br/>Contains the cluster aggregated health state, and the cluster entities that respect the input filter.<br/> |
| [ClusterHealthChunkQueryDescription](sfclient-v63-model-clusterhealthchunkquerydescription.md) | The cluster health chunk query description, which can specify the health policies to evaluate cluster health and very expressive filters to select which cluster entities to include in response.<br/> |
| [ClusterHealthPolicies](sfclient-v63-model-clusterhealthpolicies.md) | Health policies to evaluate cluster health.<br/> |
| [ClusterHealthPolicy](sfclient-v63-model-clusterhealthpolicy.md) | Defines a health policy used to evaluate the health of the cluster or of a cluster node.<br/> |
| [ClusterHealthReportCreatedEvent](sfclient-v63-model-clusterhealthreportcreatedevent.md) | Cluster Health Report Created event.<br/> |
| [ClusterHealthReportExpiredEvent](sfclient-v63-model-clusterhealthreportexpiredevent.md) | Cluster Health Report Expired event.<br/> |
| [ClusterManifest](sfclient-v63-model-clustermanifest.md) | Information about the cluster manifest.<br/> |
| [ClusterUpgradeCompleteEvent](sfclient-v63-model-clusterupgradecompleteevent.md) | Cluster Upgrade Complete event.<br/> |
| [ClusterUpgradeDescriptionObject](sfclient-v63-model-clusterupgradedescriptionobject.md) | Represents a ServiceFabric cluster upgrade<br/> |
| [ClusterUpgradeDomainCompleteEvent](sfclient-v63-model-clusterupgradedomaincompleteevent.md) | Cluster Upgrade Domain Complete event.<br/> |
| [ClusterUpgradeHealthPolicyObject](sfclient-v63-model-clusterupgradehealthpolicyobject.md) | Defines a health policy used to evaluate the health of the cluster during a cluster upgrade.<br/> |
| [ClusterUpgradeProgressObject](sfclient-v63-model-clusterupgradeprogressobject.md) | Information about a cluster upgrade.<br/> |
| [ClusterUpgradeRollbackCompleteEvent](sfclient-v63-model-clusterupgraderollbackcompleteevent.md) | Cluster Upgrade Rollback Complete event.<br/> |
| [ClusterUpgradeRollbackStartEvent](sfclient-v63-model-clusterupgraderollbackstartevent.md) | Cluster Upgrade Rollback Start event.<br/> |
| [ClusterUpgradeStartEvent](sfclient-v63-model-clusterupgradestartevent.md) | Cluster Upgrade Start event.<br/> |
| [CodePackageEntryPoint](sfclient-v63-model-codepackageentrypoint.md) | Information about setup or main entry point of a code package deployed on a Service Fabric node.<br/> |
| [CodePackageEntryPointStatistics](sfclient-v63-model-codepackageentrypointstatistics.md) | Statistics about setup or main entry point  of a code package deployed on a Service Fabric node.<br/> |
| [ComposeDeploymentStatus enum](sfclient-v63-model-composedeploymentstatus.md) | The status of the compose deployment.<br/> |
| [ComposeDeploymentStatusInfo](sfclient-v63-model-composedeploymentstatusinfo.md) | Information about a Service Fabric compose deployment.<br/> |
| [ComposeDeploymentUpgradeDescription](sfclient-v63-model-composedeploymentupgradedescription.md) | Describes the parameters for a compose deployment upgrade.<br/> |
| [ComposeDeploymentUpgradeProgressInfo](sfclient-v63-model-composedeploymentupgradeprogressinfo.md) | Describes the parameters for a compose deployment upgrade.<br/> |
| [ComposeDeploymentUpgradeState enum](sfclient-v63-model-composedeploymentupgradestate.md) | The state of the compose deployment upgrade.<br/> |
| [ContainerApiRequestBody](sfclient-v63-model-containerapirequestbody.md) | parameters for making container API call.<br/> |
| [ContainerApiResponse](sfclient-v63-model-containerapiresponse.md) | Response body that wraps container API result.<br/> |
| [ContainerApiResult](sfclient-v63-model-containerapiresult.md) | Container API result.<br/> |
| [ContainerCodePackageProperties](sfclient-v63-model-containercodepackageproperties.md) | Describes a container and its runtime properties.<br/> |
| [ContainerDeactivatedEvent](sfclient-v63-model-containerdeactivatedevent.md) | Container Deactivated event.<br/> |
| [ContainerEvent](sfclient-v63-model-containerevent.md) | A container event.<br/> |
| [ContainerInstanceEvent](sfclient-v63-model-containerinstanceevent.md) | Represents the base for all Container Events.<br/> |
| [ContainerInstanceView](sfclient-v63-model-containerinstanceview.md) | Runtime information of a container instance.<br/> |
| [ContainerLabel](sfclient-v63-model-containerlabel.md) | Describes a container label.<br/> |
| [ContainerLogs](sfclient-v63-model-containerlogs.md) | Container logs.<br/> |
| [ContainerState](sfclient-v63-model-containerstate.md) | The container state.<br/> |
| [ContainerVolume](sfclient-v63-model-containervolume.md) | Describes how a volume is attached to a container.<br/> |
| [CreateComposeDeploymentDescription](sfclient-v63-model-createcomposedeploymentdescription.md) | Defines description for creating a Service Fabric compose deployment.<br/> |
| [CreateFabricDump enum](sfclient-v63-model-createfabricdump.md) | Possible values include: 'False', 'True'<br/> |
| [CurrentUpgradeDomainProgressInfo](sfclient-v63-model-currentupgradedomainprogressinfo.md) | Information about the current in-progress upgrade domain.<br/> |
| [DataLossMode enum](sfclient-v63-model-datalossmode.md) | Possible values include: 'Invalid', 'PartialDataLoss', 'FullDataLoss'<br/> |
| [DayOfWeek enum](sfclient-v63-model-dayofweek.md) | Describes the days in a week.<br/> |
| [DeactivationIntent enum](sfclient-v63-model-deactivationintent.md) | Possible values include: 'Pause', 'Restart', 'RemoveData'<br/> |
| [DeactivationIntentDescription](sfclient-v63-model-deactivationintentdescription.md) | Describes the intent or reason for deactivating the node.<br/> |
| [DeletePropertyBatchOperation](sfclient-v63-model-deletepropertybatchoperation.md) | Represents a PropertyBatchOperation that deletes a specified property if it exists.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [DeltaNodesCheckHealthEvaluation](sfclient-v63-model-deltanodescheckhealthevaluation.md) | Represents health evaluation for delta nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when the aggregated health state of the cluster is Warning or Error.<br/> |
| [DeployedApplicationHealth](sfclient-v63-model-deployedapplicationhealth.md) | Information about the health of an application deployed on a Service Fabric node.<br/> |
| [DeployedApplicationHealthEvaluation](sfclient-v63-model-deployedapplicationhealthevaluation.md) | Represents health evaluation for a deployed application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [DeployedApplicationHealthReportCreatedEvent](sfclient-v63-model-deployedapplicationhealthreportcreatedevent.md) | Deployed Application Health Report Created event.<br/> |
| [DeployedApplicationHealthReportExpiredEvent](sfclient-v63-model-deployedapplicationhealthreportexpiredevent.md) | Deployed Application Health Report Expired event.<br/> |
| [DeployedApplicationHealthState](sfclient-v63-model-deployedapplicationhealthstate.md) | Represents the health state of a deployed application, which contains the entity identifier and the aggregated health state.<br/> |
| [DeployedApplicationHealthStateChunk](sfclient-v63-model-deployedapplicationhealthstatechunk.md) | Represents the health state chunk of a deployed application, which contains the node where the application is deployed, the aggregated health state and any deployed service packages that respect the chunk query description filters.<br/> |
| [DeployedApplicationHealthStateChunkList](sfclient-v63-model-deployedapplicationhealthstatechunklist.md) | The list of deployed application health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [DeployedApplicationHealthStateFilter](sfclient-v63-model-deployedapplicationhealthstatefilter.md) | Defines matching criteria to determine whether a deployed application should be included as a child of an application in the cluster health chunk.<br/>The deployed applications are only returned if the parent application matches a filter specified in the cluster health chunk query description.<br/>One filter can match zero, one or multiple deployed applications, depending on its properties.<br/> |
| [DeployedApplicationInfo](sfclient-v63-model-deployedapplicationinfo.md) | Information about application deployed on the node.<br/> |
| [DeployedApplicationsHealthEvaluation](sfclient-v63-model-deployedapplicationshealthevaluation.md) | Represents health evaluation for deployed applications, containing health evaluations for each unhealthy deployed application that impacted current aggregated health state.<br/>Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedApplicationStatus enum](sfclient-v63-model-deployedapplicationstatus.md) | The status of the application deployed on the node. Following are the possible values.<br/> |
| [DeployedCodePackageInfo](sfclient-v63-model-deployedcodepackageinfo.md) | Information about code package deployed on a Service Fabric node.<br/> |
| [DeployedServiceHealthReportCreatedEvent](sfclient-v63-model-deployedservicehealthreportcreatedevent.md) | Deployed Service Health Report Created event.<br/> |
| [DeployedServiceHealthReportExpiredEvent](sfclient-v63-model-deployedservicehealthreportexpiredevent.md) | Deployed Service Health Report Expired event.<br/> |
| [DeployedServicePackageHealth](sfclient-v63-model-deployedservicepackagehealth.md) | Information about the health of a service package for a specific application deployed on a Service Fabric node.<br/> |
| [DeployedServicePackageHealthEvaluation](sfclient-v63-model-deployedservicepackagehealthevaluation.md) | Represents health evaluation for a deployed service package, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [DeployedServicePackageHealthState](sfclient-v63-model-deployedservicepackagehealthstate.md) | Represents the health state of a deployed service package, containing the entity identifier and the aggregated health state.<br/> |
| [DeployedServicePackageHealthStateChunk](sfclient-v63-model-deployedservicepackagehealthstatechunk.md) | Represents the health state chunk of a deployed service package, which contains the service manifest name and the service package aggregated health state.<br/> |
| [DeployedServicePackageHealthStateChunkList](sfclient-v63-model-deployedservicepackagehealthstatechunklist.md) | The list of deployed service package health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [DeployedServicePackageHealthStateFilter](sfclient-v63-model-deployedservicepackagehealthstatefilter.md) | Defines matching criteria to determine whether a deployed service package should be included as a child of a deployed application in the cluster health chunk.<br/>The deployed service packages are only returned if the parent entities match a filter specified in the cluster health chunk query description. The parent deployed application and its parent application must be included in the cluster health chunk.<br/>One filter can match zero, one or multiple deployed service packages, depending on its properties.<br/> |
| [DeployedServicePackageInfo](sfclient-v63-model-deployedservicepackageinfo.md) | Information about service package deployed on a Service Fabric node.<br/> |
| [DeployedServicePackagesHealthEvaluation](sfclient-v63-model-deployedservicepackageshealthevaluation.md) | Represents health evaluation for deployed service packages, containing health evaluations for each unhealthy deployed service package that impacted current aggregated health state. Can be returned when evaluating deployed application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedServiceReplicaDetailInfo](sfclient-v63-model-deployedservicereplicadetailinfo.md) | Information about a Service Fabric service replica deployed on a node.<br/> |
| [DeployedServiceReplicaInfo](sfclient-v63-model-deployedservicereplicainfo.md) | Information about a Service Fabric service replica deployed on a node.<br/> |
| [DeployedServiceTypeInfo](sfclient-v63-model-deployedservicetypeinfo.md) | Information about service type deployed on a node, information such as the status of the service type registration on a node.<br/> |
| [DeployedStatefulServiceReplicaDetailInfo](sfclient-v63-model-deployedstatefulservicereplicadetailinfo.md) | Information about a stateful replica running in a code package. Note DeployedServiceReplicaQueryResult will contain duplicate data like ServiceKind, ServiceName, PartitionId and replicaId.<br/> |
| [DeployedStatefulServiceReplicaInfo](sfclient-v63-model-deployedstatefulservicereplicainfo.md) | Information about a stateful service replica deployed on a node.<br/> |
| [DeployedStatelessServiceInstanceDetailInfo](sfclient-v63-model-deployedstatelessserviceinstancedetailinfo.md) | Information about a stateless instance running in a code package. Note that DeployedServiceReplicaQueryResult will contain duplicate data like ServiceKind, ServiceName, PartitionId and InstanceId.<br/> |
| [DeployedStatelessServiceInstanceInfo](sfclient-v63-model-deployedstatelessserviceinstanceinfo.md) | Information about a stateless service instance deployed on a node.<br/> |
| [DeploymentStatus enum](sfclient-v63-model-deploymentstatus.md) | Specifies the status of a deployed application or service package on a Service Fabric node.<br/> |
| [DeployServicePackageToNodeDescription](sfclient-v63-model-deployservicepackagetonodedescription.md) | Defines description for downloading packages associated with a service manifest to image cache on a Service Fabric node.<br/> |
| [DiagnosticsDescription](sfclient-v63-model-diagnosticsdescription.md) | Describes the diagnostics options available<br/> |
| [DiagnosticsRef](sfclient-v63-model-diagnosticsref.md) | Reference to sinks in DiagnosticsDescription.<br/> |
| [DiagnosticsSinkKind enum](sfclient-v63-model-diagnosticssinkkind.md) | The kind of DiagnosticsSink.<br/> |
| [DiagnosticsSinkProperties](sfclient-v63-model-diagnosticssinkproperties.md) | Properties of a DiagnosticsSink.<br/> |
| [DoublePropertyValue](sfclient-v63-model-doublepropertyvalue.md) | Describes a Service Fabric property value of type Double.<br/> |
| [EnableBackupDescription](sfclient-v63-model-enablebackupdescription.md) | Specifies the parameters needed to enable periodic backup.<br/> |
| [EndpointProperties](sfclient-v63-model-endpointproperties.md) | Describes a container endpoint.<br/> |
| [EnsureAvailabilitySafetyCheck](sfclient-v63-model-ensureavailabilitysafetycheck.md) | Safety check that waits to ensure the availability of the partition. It waits until there are replicas available such that bringing down this replica will not cause availability loss for the partition.<br/> |
| [EnsurePartitionQurumSafetyCheck](sfclient-v63-model-ensurepartitionqurumsafetycheck.md) | Safety check that ensures that a quorum of replicas are not lost for a partition.<br/> |
| [EntityHealth](sfclient-v63-model-entityhealth.md) | Health information common to all entities in the cluster. It contains the aggregated health state, health events and unhealthy evaluation.<br/> |
| [EntityHealthState](sfclient-v63-model-entityhealthstate.md) | A base type for the health state of various entities in the cluster. It contains the aggregated health state.<br/> |
| [EntityHealthStateChunk](sfclient-v63-model-entityhealthstatechunk.md) | A base type for the health state chunk of various entities in the cluster. It contains the aggregated health state.<br/> |
| [EntityHealthStateChunkList](sfclient-v63-model-entityhealthstatechunklist.md) | A base type for the list of health state chunks found in the cluster. It contains the total number of health states that match the input filters.<br/> |
| [EntityKind enum](sfclient-v63-model-entitykind.md) | The entity type of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.<br/> |
| [EntityKindHealthStateCount](sfclient-v63-model-entitykindhealthstatecount.md) | Represents health state count for entities of the specified entity kind.<br/> |
| [EntryPointStatus enum](sfclient-v63-model-entrypointstatus.md) | Specifies the status of the code package entry point deployed on a Service Fabric node.<br/> |
| [EnvironmentVariable](sfclient-v63-model-environmentvariable.md) | Describes an environment variable for the container.<br/> |
| [Epoch](sfclient-v63-model-epoch.md) | An Epoch is a configuration number for the partition as a whole. When the configuration of the replica set changes, for example when the Primary replica changes, the operations that are replicated from the new Primary replica are said to be a new Epoch from the ones which were sent by the old Primary replica.<br/> |
| [EventHealthEvaluation](sfclient-v63-model-eventhealthevaluation.md) | Represents health evaluation of a HealthEvent that was reported on the entity.<br/>The health evaluation is returned when evaluating health of an entity results in Error or Warning.<br/> |
| [ExecutingFaultsChaosEvent](sfclient-v63-model-executingfaultschaosevent.md) | Describes a Chaos event that gets generated when Chaos has decided on the faults for an iteration. This Chaos event contains the details of the faults as a list of strings.<br/> |
| [ExternalStoreProvisionApplicationTypeDescription](sfclient-v63-model-externalstoreprovisionapplicationtypedescription.md) | Describes the operation to register or provision an application type using an application package from an external store instead of a package uploaded to the Service Fabric image store.<br/> |
| [FabricCodeVersionInfo](sfclient-v63-model-fabriccodeversioninfo.md) | Information about a Service Fabric code version.<br/> |
| [FabricConfigVersionInfo](sfclient-v63-model-fabricconfigversioninfo.md) | Information about a Service Fabric config version.<br/> |
| [FabricError](sfclient-v63-model-fabricerror.md) | The REST API operations for Service Fabric return standard HTTP status codes. This type defines the additional information returned from the Service Fabric API operations that are not successful.<br/> |
| [FabricErrorCodes enum](sfclient-v63-model-fabricerrorcodes.md) | Defines the fabric error codes that be returned as part of the error object in response to Service Fabric API operations that are not successful. Following are the error code values that can be returned for a specific HTTP status code.<br/><br/>  - Possible values of the error code for HTTP status code 400 (Bad Request)<br/>    - "FABRIC_E_INVALID_PARTITION_KEY"<br/>    - "FABRIC_E_IMAGEBUILDER_VALIDATION_ERROR"<br/>    - "FABRIC_E_INVALID_ADDRESS"<br/>    - "FABRIC_E_APPLICATION_NOT_UPGRADING"<br/>    - "FABRIC_E_APPLICATION_UPGRADE_VALIDATION_ERROR"<br/>    - "FABRIC_E_FABRIC_NOT_UPGRADING"<br/>    - "FABRIC_E_FABRIC_UPGRADE_VALIDATION_ERROR"<br/>    - "FABRIC_E_INVALID_CONFIGURATION"<br/>    - "FABRIC_E_INVALID_NAME_URI"<br/>    - "FABRIC_E_PATH_TOO_LONG"<br/>    - "FABRIC_E_KEY_TOO_LARGE"<br/>    - "FABRIC_E_SERVICE_AFFINITY_CHAIN_NOT_SUPPORTED"<br/>    - "FABRIC_E_INVALID_ATOMIC_GROUP"<br/>    - "FABRIC_E_VALUE_EMPTY"<br/>    - "FABRIC_E_BACKUP_IS_ENABLED"<br/>    - "FABRIC_E_RESTORE_SOURCE_TARGET_PARTITION_MISMATCH"<br/>    - "FABRIC_E_INVALID_FOR_STATELESS_SERVICES"<br/>    - "FABRIC_E_INVALID_SERVICE_SCALING_POLICY"<br/>    - "E_INVALIDARG"<br/><br/>  - Possible values of the error code for HTTP status code 404 (Not Found)<br/>    - "FABRIC_E_NODE_NOT_FOUND"<br/>    - "FABRIC_E_APPLICATION_TYPE_NOT_FOUND"<br/>    - "FABRIC_E_APPLICATION_NOT_FOUND"<br/>    - "FABRIC_E_SERVICE_TYPE_NOT_FOUND"<br/>    - "FABRIC_E_SERVICE_DOES_NOT_EXIST"<br/>    - "FABRIC_E_SERVICE_TYPE_TEMPLATE_NOT_FOUND"<br/>    - "FABRIC_E_CONFIGURATION_SECTION_NOT_FOUND"<br/>    - "FABRIC_E_PARTITION_NOT_FOUND"<br/>    - "FABRIC_E_REPLICA_DOES_NOT_EXIST"<br/>    - "FABRIC_E_SERVICE_GROUP_DOES_NOT_EXIST"<br/>    - "FABRIC_E_CONFIGURATION_PARAMETER_NOT_FOUND"<br/>    - "FABRIC_E_DIRECTORY_NOT_FOUND"<br/>    - "FABRIC_E_FABRIC_VERSION_NOT_FOUND"<br/>    - "FABRIC_E_FILE_NOT_FOUND"<br/>    - "FABRIC_E_NAME_DOES_NOT_EXIST"<br/>    - "FABRIC_E_PROPERTY_DOES_NOT_EXIST"<br/>    - "FABRIC_E_ENUMERATION_COMPLETED"<br/>    - "FABRIC_E_SERVICE_MANIFEST_NOT_FOUND"<br/>    - "FABRIC_E_KEY_NOT_FOUND"<br/>    - "FABRIC_E_HEALTH_ENTITY_NOT_FOUND"<br/>    - "FABRIC_E_BACKUP_NOT_ENABLED"<br/>    - "FABRIC_E_BACKUP_POLICY_NOT_EXISTING"<br/>    - "FABRIC_E_FAULT_ANALYSIS_SERVICE_NOT_EXISTING"<br/><br/>  - Possible values of the error code for HTTP status code 409 (Conflict)<br/>    - "FABRIC_E_APPLICATION_TYPE_ALREADY_EXISTS"<br/>    - "FABRIC_E_APPLICATION_ALREADY_EXISTS"<br/>    - "FABRIC_E_APPLICATION_ALREADY_IN_TARGET_VERSION"<br/>    - "FABRIC_E_APPLICATION_TYPE_PROVISION_IN_PROGRESS"<br/>    - "FABRIC_E_APPLICATION_UPGRADE_IN_PROGRESS"<br/>    - "FABRIC_E_SERVICE_ALREADY_EXISTS"<br/>    - "FABRIC_E_SERVICE_GROUP_ALREADY_EXISTS"<br/>    - "FABRIC_E_APPLICATION_TYPE_IN_USE"<br/>    - "FABRIC_E_FABRIC_ALREADY_IN_TARGET_VERSION"<br/>    - "FABRIC_E_FABRIC_VERSION_ALREADY_EXISTS"<br/>    - "FABRIC_E_FABRIC_VERSION_IN_USE"<br/>    - "FABRIC_E_FABRIC_UPGRADE_IN_PROGRESS"<br/>    - "FABRIC_E_NAME_ALREADY_EXISTS"<br/>    - "FABRIC_E_NAME_NOT_EMPTY"<br/>    - "FABRIC_E_PROPERTY_CHECK_FAILED"<br/>    - "FABRIC_E_SERVICE_METADATA_MISMATCH"<br/>    - "FABRIC_E_SERVICE_TYPE_MISMATCH"<br/>    - "FABRIC_E_HEALTH_STALE_REPORT"<br/>    - "FABRIC_E_SEQUENCE_NUMBER_CHECK_FAILED"<br/>    - "FABRIC_E_NODE_HAS_NOT_STOPPED_YET"<br/>    - "FABRIC_E_INSTANCE_ID_MISMATCH"<br/>    - "FABRIC_E_BACKUP_IN_PROGRESS"<br/>    - "FABRIC_E_RESTORE_IN_PROGRESS"<br/>    - "FABRIC_E_BACKUP_POLICY_ALREADY_EXISTING"<br/><br/>  - Possible values of the error code for HTTP status code 413 (Request Entity Too Large)<br/>    - "FABRIC_E_VALUE_TOO_LARGE"<br/><br/>  - Possible values of the error code for HTTP status code 500 (Internal Server Error)<br/>    - "FABRIC_E_NODE_IS_UP"<br/>    - "E_FAIL"<br/>    - "FABRIC_E_SINGLE_INSTANCE_APPLICATION_ALREADY_EXISTS"<br/>    - "FABRIC_E_SINGLE_INSTANCE_APPLICATION_NOT_FOUND"<br/>    - "FABRIC_E_VOLUME_ALREADY_EXISTS"<br/>    - "ABRIC_E_VOLUME_NOT_FOUND"<br/>    - "SerializationError"<br/><br/>  - Possible values of the error code for HTTP status code 503 (Service Unavailable)<br/>    - "FABRIC_E_NO_WRITE_QUORUM"<br/>    - "FABRIC_E_NOT_PRIMARY"<br/>    - "FABRIC_E_NOT_READY"<br/>    - "FABRIC_E_RECONFIGURATION_PENDING"<br/>    - "FABRIC_E_SERVICE_OFFLINE"<br/>    - "E_ABORT"<br/>    - "FABRIC_E_VALUE_TOO_LARGE"<br/><br/>  - Possible values of the error code for HTTP status code 504 (Gateway Timeout)<br/>    - "FABRIC_E_COMMUNICATION_ERROR"<br/>    - "FABRIC_E_OPERATION_NOT_COMPLETE"<br/>    - "FABRIC_E_TIMEOUT"<br/> |
| [FabricErrorError](sfclient-v63-model-fabricerrorerror.md) | Error object containing error code and error message.<br/> |
| [FabricEvent](sfclient-v63-model-fabricevent.md) | Represents the base for all Fabric Events.<br/> |
| [FabricEventKind enum](sfclient-v63-model-fabriceventkind.md) | The kind of FabricEvent.<br/> |
| [FabricReplicaStatus enum](sfclient-v63-model-fabricreplicastatus.md) | Specifies the status of the replica.<br/> |
| [FailedPropertyBatchInfo](sfclient-v63-model-failedpropertybatchinfo.md) | Derived from PropertyBatchInfo. Represents the property batch failing. Contains information about the specific batch failure.<br/> |
| [FailedUpgradeDomainProgressObject](sfclient-v63-model-failedupgradedomainprogressobject.md) | The detailed upgrade progress for nodes in the current upgrade domain at the point of failure.<br/> |
| [FailureAction enum](sfclient-v63-model-failureaction.md) | The compensating action to perform when a Monitored upgrade encounters monitoring policy or health policy violations.<br/>Invalid indicates the failure action is invalid. Rollback specifies that the upgrade will start rolling back automatically.<br/>Manual indicates that the upgrade will switch to UnmonitoredManual upgrade mode.<br/> |
| [FailureReason enum](sfclient-v63-model-failurereason.md) | The cause of an upgrade failure that resulted in FailureAction being executed.<br/> |
| [FailureUpgradeDomainProgressInfo](sfclient-v63-model-failureupgradedomainprogressinfo.md) | Information about the upgrade domain progress at the time of upgrade failure.<br/> |
| [FileInfo](sfclient-v63-model-fileinfo.md) | Information about a image store file.<br/> |
| [FileShareBackupStorageDescription](sfclient-v63-model-filesharebackupstoragedescription.md) | Describes the parameters for file share storage used for storing or enumerating backups.<br/> |
| [FileVersion](sfclient-v63-model-fileversion.md) | Information about the version of image store file.<br/> |
| [FolderInfo](sfclient-v63-model-folderinfo.md) | Information about a image store folder. It includes how many files this folder contains and its image store relative path.<br/> |
| [FrequencyBasedBackupScheduleDescription](sfclient-v63-model-frequencybasedbackupscheduledescription.md) | Describes the frequency based backup schedule.<br/> |
| [GetBackupByStorageQueryDescription](sfclient-v63-model-getbackupbystoragequerydescription.md) | Describes additional filters to be applied, while listing backups, and backup storage details from where to fetch the backups.<br/> |
| [GetPropertyBatchOperation](sfclient-v63-model-getpropertybatchoperation.md) | Represents a PropertyBatchOperation that gets the specified property if it exists.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [GuidPropertyValue](sfclient-v63-model-guidpropertyvalue.md) | Describes a Service Fabric property value of type Guid.<br/> |
| [HealthEvaluation](sfclient-v63-model-healthevaluation.md) | Represents a health evaluation which describes the data and the algorithm used by health manager to evaluate the health of an entity.<br/> |
| [HealthEvaluationKind enum](sfclient-v63-model-healthevaluationkind.md) | The health manager in the cluster performs health evaluations in determining the aggregated health state of an entity. This enumeration provides information on the kind of evaluation that was performed. Following are the possible values.<br/> |
| [HealthEvaluationWrapper](sfclient-v63-model-healthevaluationwrapper.md) | Wrapper object for health evaluation.<br/> |
| [HealthEvent](sfclient-v63-model-healthevent.md) | Represents health information reported on a health entity, such as cluster, application or node, with additional metadata added by the Health Manager.<br/> |
| [HealthInformation](sfclient-v63-model-healthinformation.md) | Represents common health report information. It is included in all health reports sent to health store and in all health events returned by health queries.<br/> |
| [HealthState enum](sfclient-v63-model-healthstate.md) | The health state of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.<br/> |
| [HealthStateCount](sfclient-v63-model-healthstatecount.md) | Represents information about how many health entities are in Ok, Warning and Error health state.<br/> |
| [HealthStatistics](sfclient-v63-model-healthstatistics.md) | The health statistics of an entity, returned as part of the health query result when the query description is configured to include statistics.<br/>The statistics include health state counts for all children types of the current entity.<br/>For example, for cluster, the health statistics include health state counts for nodes, applications, services, partitions, replicas, deployed applications and deployed service packages.<br/>For partition, the health statistics include health counts for replicas.<br/> |
| [HostIsolationMode enum](sfclient-v63-model-hostisolationmode.md) | Specifies the isolation mode of main entry point of a code package when it's host type is ContainerHost. This is specified as part of container host policies in application manifest while importing service manifest.<br/> |
| [HostType enum](sfclient-v63-model-hosttype.md) | Specifies the type of host for main entry point of a code package as specified in service manifest.<br/> |
| [ImageRegistryCredential](sfclient-v63-model-imageregistrycredential.md) | Image registry credential.<br/> |
| [ImageStoreContent](sfclient-v63-model-imagestorecontent.md) | Information about the image store content.<br/> |
| [ImageStoreCopyDescription](sfclient-v63-model-imagestorecopydescription.md) | Information about how to copy image store content from one image store relative path to another image store relative path.<br/> |
| [ImpactLevel enum](sfclient-v63-model-impactlevel.md) | Possible values include: 'Invalid', 'None', 'Restart', 'RemoveData', 'RemoveNode'<br/> |
| [Int64PropertyValue](sfclient-v63-model-int64propertyvalue.md) | Describes a Service Fabric property value of type Int64.<br/> |
| [Int64RangePartitionInformation](sfclient-v63-model-int64rangepartitioninformation.md) | Describes the partition information for the integer range that is based on partition schemes.<br/> |
| [InvokeDataLossResult](sfclient-v63-model-invokedatalossresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [InvokeQuorumLossResult](sfclient-v63-model-invokequorumlossresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [KeyValueStoreReplicaStatus](sfclient-v63-model-keyvaluestorereplicastatus.md) | Key value store related information for the replica.<br/> |
| [LoadMetricReport](sfclient-v63-model-loadmetricreport.md) | Represents the load metric report which contains the time metric was reported, its name and value.<br/> |
| [LoadMetricReportInfo](sfclient-v63-model-loadmetricreportinfo.md) | Information about load reported by replica.<br/> |
| [MonitoringPolicyDescription](sfclient-v63-model-monitoringpolicydescription.md) | Describes the parameters for monitoring an upgrade in Monitored mode.<br/> |
| [MoveCost enum](sfclient-v63-model-movecost.md) | Specifies the move cost for the service.<br/> |
| [NameDescription](sfclient-v63-model-namedescription.md) | Describes a Service Fabric name.<br/> |
| [NamedPartitionInformation](sfclient-v63-model-namedpartitioninformation.md) | Describes the partition information for the name as a string that is based on partition schemes.<br/> |
| [NamedPartitionSchemeDescription](sfclient-v63-model-namedpartitionschemedescription.md) | Describes the named partition scheme of the service.<br/> |
| [NetworkRef](sfclient-v63-model-networkref.md) | Describes a network reference in a service.<br/> |
| [NodeAbortedEvent](sfclient-v63-model-nodeabortedevent.md) | Node Aborted event.<br/> |
| [NodeAbortingEvent](sfclient-v63-model-nodeabortingevent.md) | Node Aborting event.<br/> |
| [NodeAddedEvent](sfclient-v63-model-nodeaddedevent.md) | Node Added event.<br/> |
| [NodeCloseEvent](sfclient-v63-model-nodecloseevent.md) | Node Close event.<br/> |
| [NodeClosingEvent](sfclient-v63-model-nodeclosingevent.md) | Node Closing event.<br/> |
| [NodeDeactivateCompleteEvent](sfclient-v63-model-nodedeactivatecompleteevent.md) | Node Deactivate Complete event.<br/> |
| [NodeDeactivateStartEvent](sfclient-v63-model-nodedeactivatestartevent.md) | Node Deactivate Start event.<br/> |
| [NodeDeactivationInfo](sfclient-v63-model-nodedeactivationinfo.md) | Information about the node deactivation. This information is valid for a node that is undergoing deactivation or has already been deactivated.<br/> |
| [NodeDeactivationIntent enum](sfclient-v63-model-nodedeactivationintent.md) | The intent or the reason for deactivating the node. Following are the possible values for it.<br/> |
| [NodeDeactivationStatus enum](sfclient-v63-model-nodedeactivationstatus.md) | The status of node deactivation operation. Following are the possible values.<br/> |
| [NodeDeactivationTask](sfclient-v63-model-nodedeactivationtask.md) | The task representing the deactivation operation on the node.<br/> |
| [NodeDeactivationTaskId](sfclient-v63-model-nodedeactivationtaskid.md) | Identity of the task related to deactivation operation on the node.<br/> |
| [NodeDeactivationTaskType enum](sfclient-v63-model-nodedeactivationtasktype.md) | The type of the task that performed the node deactivation. Following are the possible values.<br/> |
| [NodeDownEvent](sfclient-v63-model-nodedownevent.md) | Node Down event.<br/> |
| [NodeEvent](sfclient-v63-model-nodeevent.md) | Represents the base for all Node Events.<br/> |
| [NodeHealth](sfclient-v63-model-nodehealth.md) | Information about the health of a Service Fabric node.<br/> |
| [NodeHealthEvaluation](sfclient-v63-model-nodehealthevaluation.md) | Represents health evaluation for a node, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [NodeHealthReportCreatedEvent](sfclient-v63-model-nodehealthreportcreatedevent.md) | Node Health Report Created event.<br/> |
| [NodeHealthReportExpiredEvent](sfclient-v63-model-nodehealthreportexpiredevent.md) | Node Health Report Expired event.<br/> |
| [NodeHealthState](sfclient-v63-model-nodehealthstate.md) | Represents the health state of a node, which contains the node identifier and its aggregated health state.<br/> |
| [NodeHealthStateChunk](sfclient-v63-model-nodehealthstatechunk.md) | Represents the health state chunk of a node, which contains the node name and its aggregated health state.<br/> |
| [NodeHealthStateChunkList](sfclient-v63-model-nodehealthstatechunklist.md) | The list of node health state chunks in the cluster that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [NodeHealthStateFilter](sfclient-v63-model-nodehealthstatefilter.md) | Defines matching criteria to determine whether a node should be included in the returned cluster health chunk.<br/>One filter can match zero, one or multiple nodes, depending on its properties.<br/>Can be specified in the cluster health chunk query description.<br/> |
| [NodeId](sfclient-v63-model-nodeid.md) | An internal ID used by Service Fabric to uniquely identify a node. Node Id is deterministically generated from node name.<br/> |
| [NodeImpact](sfclient-v63-model-nodeimpact.md) | Describes the expected impact of a repair to a particular node.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeInfo](sfclient-v63-model-nodeinfo.md) | Information about a node in Service Fabric cluster.<br/> |
| [NodeLoadInfo](sfclient-v63-model-nodeloadinfo.md) | Information about load on a Service Fabric node. It holds a summary of all metrics and their load on a node.<br/> |
| [NodeLoadMetricInformation](sfclient-v63-model-nodeloadmetricinformation.md) | Represents data structure that contains load information for a certain metric on a node.<br/> |
| [NodeOpenedSuccessEvent](sfclient-v63-model-nodeopenedsuccessevent.md) | Node Opened Success event.<br/> |
| [NodeOpenFailedEvent](sfclient-v63-model-nodeopenfailedevent.md) | Node Open Failed event.<br/> |
| [NodeOpeningEvent](sfclient-v63-model-nodeopeningevent.md) | Node Opening event.<br/> |
| [NodeRemovedEvent](sfclient-v63-model-noderemovedevent.md) | Node Removed event.<br/> |
| [NodeRepairImpactDescription](sfclient-v63-model-noderepairimpactdescription.md) | Describes the expected impact of a repair on a set of nodes.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeRepairTargetDescription](sfclient-v63-model-noderepairtargetdescription.md) | Describes the list of nodes targeted by a repair action.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeResult](sfclient-v63-model-noderesult.md) | Contains information about a node that was targeted by a user-induced operation.<br/> |
| [NodesHealthEvaluation](sfclient-v63-model-nodeshealthevaluation.md) | Represents health evaluation for nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health and the aggregated health state is either Error or Warning.<br/> |
| [NodeStatus enum](sfclient-v63-model-nodestatus.md) | The status of the node.<br/> |
| [NodeStatusFilter enum](sfclient-v63-model-nodestatusfilter.md) | Possible values include: 'default', 'all', 'up', 'down', 'enabling', 'disabling', 'disabled', 'unknown', 'removed'<br/> |
| [NodeTransitionProgress](sfclient-v63-model-nodetransitionprogress.md) | Information about an NodeTransition operation.  This class contains an OperationState and a NodeTransitionResult.  The NodeTransitionResult is not valid until OperationState<br/>is Completed or Faulted.<br/> |
| [NodeTransitionResult](sfclient-v63-model-nodetransitionresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [NodeTransitionType enum](sfclient-v63-model-nodetransitiontype.md) | Possible values include: 'Invalid', 'Start', 'Stop'<br/> |
| [NodeUpEvent](sfclient-v63-model-nodeupevent.md) | Node Up event.<br/> |
| [NodeUpgradePhase enum](sfclient-v63-model-nodeupgradephase.md) | The state of the upgrading node.<br/> |
| [NodeUpgradeProgressInfo](sfclient-v63-model-nodeupgradeprogressinfo.md) | Information about the upgrading node and its status<br/> |
| [OperatingSystemTypes enum](sfclient-v63-model-operatingsystemtypes.md) | Possible values include: 'Linux', 'Windows'<br/> |
| [OperationState enum](sfclient-v63-model-operationstate.md) | The state of the operation.<br/> |
| [OperationStatus](sfclient-v63-model-operationstatus.md) | Contains the OperationId, OperationState, and OperationType for user-induced operations.<br/> |
| [OperationType enum](sfclient-v63-model-operationtype.md) | The type of the operation.<br/> |
| [PackageSharingPolicyInfo](sfclient-v63-model-packagesharingpolicyinfo.md) | Represents a policy for the package sharing.<br/> |
| [PackageSharingPolicyScope enum](sfclient-v63-model-packagesharingpolicyscope.md) | Represents the scope for PackageSharingPolicy. This is specified during DeployServicePackageToNode operation.<br/> |
| [PagedApplicationInfoList](sfclient-v63-model-pagedapplicationinfolist.md) | The list of applications in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedApplicationTypeInfoList](sfclient-v63-model-pagedapplicationtypeinfolist.md) | The list of application types that are provisioned or being provisioned in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedBackupConfigurationInfoList](sfclient-v63-model-pagedbackupconfigurationinfolist.md) | The list of backup configuration information. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedBackupEntityList](sfclient-v63-model-pagedbackupentitylist.md) | The list of backup entities that are being periodically backed. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedBackupInfoList](sfclient-v63-model-pagedbackupinfolist.md) | The list of backups. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedBackupPolicyDescriptionList](sfclient-v63-model-pagedbackuppolicydescriptionlist.md) | The list of backup policies configured in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedComposeDeploymentStatusInfoList](sfclient-v63-model-pagedcomposedeploymentstatusinfolist.md) | The list of compose deployments in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedDeployedApplicationInfoList](sfclient-v63-model-pageddeployedapplicationinfolist.md) | The list of deployed applications in activating, downloading, or active states on a node.<br/>The list is paged when all of the results cannot fit in a single message.<br/>The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedNodeInfoList](sfclient-v63-model-pagednodeinfolist.md) | The list of nodes in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedPropertyInfoList](sfclient-v63-model-pagedpropertyinfolist.md) | The paged list of Service Fabric properties under a given name. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedReplicaInfoList](sfclient-v63-model-pagedreplicainfolist.md) | The list of replicas in the cluster for a given partition. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedServiceInfoList](sfclient-v63-model-pagedserviceinfolist.md) | The list of services in the cluster for an application. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedServicePartitionInfoList](sfclient-v63-model-pagedservicepartitioninfolist.md) | The list of partition in the cluster for a service. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedServiceResourceDescriptionList](sfclient-v63-model-pagedserviceresourcedescriptionlist.md) | The list of service resources in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedServiceResourceReplicaDescriptionList](sfclient-v63-model-pagedserviceresourcereplicadescriptionlist.md) | The list of service resources in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedSubNameInfoList](sfclient-v63-model-pagedsubnameinfolist.md) | A paged list of Service Fabric names. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PartitionAccessStatus enum](sfclient-v63-model-partitionaccessstatus.md) | Specifies the access status of the partition.<br/> |
| [PartitionAnalysisEvent](sfclient-v63-model-partitionanalysisevent.md) | Represents the base for all Partition Analysis Events.<br/> |
| [PartitionBackupConfigurationInfo](sfclient-v63-model-partitionbackupconfigurationinfo.md) | Backup configuration information, for a specific partition, specifying what backup policy is being applied and suspend description, if any.<br/> |
| [PartitionBackupEntity](sfclient-v63-model-partitionbackupentity.md) | Identifies the Service Fabric stateful partition which is being backed up.<br/> |
| [PartitionDataLossProgress](sfclient-v63-model-partitiondatalossprogress.md) | Information about a partition data loss user-induced operation.<br/> |
| [PartitionEvent](sfclient-v63-model-partitionevent.md) | Represents the base for all Partition Events.<br/> |
| [PartitionHealth](sfclient-v63-model-partitionhealth.md) | Information about the health of a Service Fabric partition.<br/> |
| [PartitionHealthEvaluation](sfclient-v63-model-partitionhealthevaluation.md) | Represents health evaluation for a partition, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [PartitionHealthReportCreatedEvent](sfclient-v63-model-partitionhealthreportcreatedevent.md) | Partition Health Report Created event.<br/> |
| [PartitionHealthReportExpiredEvent](sfclient-v63-model-partitionhealthreportexpiredevent.md) | Partition Health Report Expired event.<br/> |
| [PartitionHealthState](sfclient-v63-model-partitionhealthstate.md) | Represents the health state of a partition, which contains the partition identifier and its aggregated health state.<br/> |
| [PartitionHealthStateChunk](sfclient-v63-model-partitionhealthstatechunk.md) | Represents the health state chunk of a partition, which contains the partition ID, its aggregated health state and any replicas that respect the filters in the cluster health chunk query description.<br/> |
| [PartitionHealthStateChunkList](sfclient-v63-model-partitionhealthstatechunklist.md) | The list of partition health state chunks that respect the input filters in the chunk query description.<br/>Returned by get cluster health state chunks query as part of the parent application hierarchy.<br/> |
| [PartitionHealthStateFilter](sfclient-v63-model-partitionhealthstatefilter.md) | Defines matching criteria to determine whether a partition should be included as a child of a service in the cluster health chunk.<br/>The partitions are only returned if the parent entities match a filter specified in the cluster health chunk query description. The parent service and application must be included in the cluster health chunk.<br/>One filter can match zero, one or multiple partitions, depending on its properties.<br/> |
| [PartitionInformation](sfclient-v63-model-partitioninformation.md) | Information about the partition identity, partitioning scheme and keys supported by it.<br/> |
| [PartitionInstanceCountScaleMechanism](sfclient-v63-model-partitioninstancecountscalemechanism.md) | Represents a scaling mechanism for adding or removing instances of stateless service partition.<br/> |
| [PartitionLoadInformation](sfclient-v63-model-partitionloadinformation.md) | Represents load information for a partition, which contains the primary and secondary reported load metrics.<br/>In case there is no load reported, PartitionLoadInformation will contain the default load for the service of the partition.<br/>For default loads, LoadMetricReport's LastReportedUtc is set to 0.<br/> |
| [PartitionPrimaryMoveAnalysisEvent](sfclient-v63-model-partitionprimarymoveanalysisevent.md) | Partition Primary Move Analysis event.<br/> |
| [PartitionQuorumLossProgress](sfclient-v63-model-partitionquorumlossprogress.md) | Information about a partition quorum loss user-induced operation.<br/> |
| [PartitionReconfigurationCompletedEvent](sfclient-v63-model-partitionreconfigurationcompletedevent.md) | Partition Reconfiguration Completed event.<br/> |
| [PartitionRestartProgress](sfclient-v63-model-partitionrestartprogress.md) | Information about a partition restart user-induced operation.<br/> |
| [PartitionScheme enum](sfclient-v63-model-partitionscheme.md) | Enumerates the ways that a service can be partitioned.<br/> |
| [PartitionSchemeDescription](sfclient-v63-model-partitionschemedescription.md) | Describes how the service is partitioned.<br/> |
| [PartitionsHealthEvaluation](sfclient-v63-model-partitionshealthevaluation.md) | Represents health evaluation for the partitions of a service, containing health evaluations for each unhealthy partition that impacts current aggregated health state. Can be returned when evaluating service health and the aggregated health state is either Error or Warning.<br/> |
| [PrimaryReplicatorStatus](sfclient-v63-model-primaryreplicatorstatus.md) | Provides statistics about the Service Fabric Replicator, when it is functioning in a Primary role.<br/> |
| [ProcessDeactivatedEvent](sfclient-v63-model-processdeactivatedevent.md) | Process Deactivated event.<br/> |
| [PropertyBatchDescriptionList](sfclient-v63-model-propertybatchdescriptionlist.md) | Describes a list of property batch operations to be executed. Either all or none of the operations will be committed.<br/> |
| [PropertyBatchInfo](sfclient-v63-model-propertybatchinfo.md) | Information about the results of a property batch.<br/> |
| [PropertyBatchInfoKind enum](sfclient-v63-model-propertybatchinfokind.md) | The kind of property batch info, determined by the results of a property batch. The following are the possible values.<br/> |
| [PropertyBatchOperation](sfclient-v63-model-propertybatchoperation.md) | Represents the base type for property operations that can be put into a batch and submitted.<br/> |
| [PropertyBatchOperationKind enum](sfclient-v63-model-propertybatchoperationkind.md) | The kind of property batch operation, determined by the operation to be performed. The following are the possible values.<br/> |
| [PropertyDescription](sfclient-v63-model-propertydescription.md) | Description of a Service Fabric property.<br/> |
| [PropertyInfo](sfclient-v63-model-propertyinfo.md) | Information about a Service Fabric property.<br/> |
| [PropertyMetadata](sfclient-v63-model-propertymetadata.md) | The metadata associated with a property, including the property's name.<br/> |
| [PropertyValue](sfclient-v63-model-propertyvalue.md) | Describes a Service Fabric property value.<br/> |
| [PropertyValueKind enum](sfclient-v63-model-propertyvaluekind.md) | The kind of property, determined by the type of data. Following are the possible values.<br/> |
| [ProvisionApplicationTypeDescription](sfclient-v63-model-provisionapplicationtypedescription.md) | Describes the operation to register or provision an application type using an application package uploaded to the Service Fabric image store.<br/> |
| [ProvisionApplicationTypeDescriptionBase](sfclient-v63-model-provisionapplicationtypedescriptionbase.md) | Represents the type of registration or provision requested, and if the operation needs to be asynchronous or not. Supported types of provision operations are from either image store or external store.<br/> |
| [ProvisionApplicationTypeKind enum](sfclient-v63-model-provisionapplicationtypekind.md) | The kind of application type registration or provision requested. The application package can be registered or provisioned either from the image store or from an external store. Following are the kinds of the application type provision.<br/> |
| [ProvisionFabricDescription](sfclient-v63-model-provisionfabricdescription.md) | Describes the parameters for provisioning a cluster.<br/> |
| [PutPropertyBatchOperation](sfclient-v63-model-putpropertybatchoperation.md) | Puts the specified property under the specified name.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [QuorumLossMode enum](sfclient-v63-model-quorumlossmode.md) | Possible values include: 'Invalid', 'QuorumReplicas', 'AllReplicas'<br/> |
| [ReconfigurationInformation](sfclient-v63-model-reconfigurationinformation.md) | Information about current reconfiguration like phase, type, previous configuration role of replica and reconfiguration start date time.<br/> |
| [ReconfigurationPhase enum](sfclient-v63-model-reconfigurationphase.md) | The reconfiguration phase of a replica of a stateful service.<br/> |
| [ReconfigurationType enum](sfclient-v63-model-reconfigurationtype.md) | The type of reconfiguration for replica of a stateful service.<br/> |
| [RegistryCredential](sfclient-v63-model-registrycredential.md) | Credential information to connect to container registry.<br/> |
| [RemoteReplicatorAcknowledgementDetail](sfclient-v63-model-remotereplicatoracknowledgementdetail.md) | Provides various statistics of the acknowledgements that are being received from the remote replicator.<br/> |
| [RemoteReplicatorAcknowledgementStatus](sfclient-v63-model-remotereplicatoracknowledgementstatus.md) | Provides details about the remote replicators from the primary replicator's point of view.<br/> |
| [RemoteReplicatorStatus](sfclient-v63-model-remotereplicatorstatus.md) | Represents the state of the secondary replicator from the primary replicator’s point of view.<br/> |
| [RepairImpactDescriptionBase](sfclient-v63-model-repairimpactdescriptionbase.md) | Describes the expected impact of executing a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairImpactKind enum](sfclient-v63-model-repairimpactkind.md) | Specifies the kind of the impact. This type supports the Service Fabric platform; it is not meant to be used directly from your code.'<br/> |
| [RepairTargetDescriptionBase](sfclient-v63-model-repairtargetdescriptionbase.md) | Describes the entities targeted by a repair action.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTargetKind enum](sfclient-v63-model-repairtargetkind.md) | Specifies the kind of the repair target. This type supports the Service Fabric platform; it is not meant to be used directly from your code.'<br/> |
| [RepairTask](sfclient-v63-model-repairtask.md) | Represents a repair task, which includes information about what kind of repair was requested, what its progress is, and what its final result was.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskApproveDescription](sfclient-v63-model-repairtaskapprovedescription.md) | Describes a request for forced approval of a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskCancelDescription](sfclient-v63-model-repairtaskcanceldescription.md) | Describes a request to cancel a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskDeleteDescription](sfclient-v63-model-repairtaskdeletedescription.md) | Describes a request to delete a completed repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskHealthCheckState enum](sfclient-v63-model-repairtaskhealthcheckstate.md) | Specifies the workflow state of a repair task's health check. This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskHistory](sfclient-v63-model-repairtaskhistory.md) | A record of the times when the repair task entered each state.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskUpdateHealthPolicyDescription](sfclient-v63-model-repairtaskupdatehealthpolicydescription.md) | Describes a request to update the health policy of a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskUpdateInfo](sfclient-v63-model-repairtaskupdateinfo.md) | Describes the result of an operation that created or updated a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [ReplicaEvent](sfclient-v63-model-replicaevent.md) | Represents the base for all Replica Events.<br/> |
| [ReplicaHealth](sfclient-v63-model-replicahealth.md) | Represents a base class for stateful service replica or stateless service instance health.<br/>Contains the replica aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [ReplicaHealthEvaluation](sfclient-v63-model-replicahealthevaluation.md) | Represents health evaluation for a replica, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ReplicaHealthReportServiceKind enum](sfclient-v63-model-replicahealthreportservicekind.md) | Possible values include: 'Stateless', 'Stateful'<br/> |
| [ReplicaHealthState](sfclient-v63-model-replicahealthstate.md) | Represents a base class for stateful service replica or stateless service instance health state.<br/> |
| [ReplicaHealthStateChunk](sfclient-v63-model-replicahealthstatechunk.md) | Represents the health state chunk of a stateful service replica or a stateless service instance.<br/>The replica health state contains the replica ID and its aggregated health state.<br/> |
| [ReplicaHealthStateChunkList](sfclient-v63-model-replicahealthstatechunklist.md) | The list of replica health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ReplicaHealthStateFilter](sfclient-v63-model-replicahealthstatefilter.md) | Defines matching criteria to determine whether a replica should be included as a child of a partition in the cluster health chunk.<br/>The replicas are only returned if the parent entities match a filter specified in the cluster health chunk query description. The parent partition, service and application must be included in the cluster health chunk.<br/>One filter can match zero, one or multiple replicas, depending on its properties.<br/> |
| [ReplicaInfo](sfclient-v63-model-replicainfo.md) | Information about the identity, status, health, node name, uptime, and other details about the replica.<br/> |
| [ReplicaKind enum](sfclient-v63-model-replicakind.md) | The role of a replica of a stateful service.<br/> |
| [ReplicaRole enum](sfclient-v63-model-replicarole.md) | The role of a replica of a stateful service.<br/> |
| [ReplicasHealthEvaluation](sfclient-v63-model-replicashealthevaluation.md) | Represents health evaluation for replicas, containing health evaluations for each unhealthy replica that impacted current aggregated health state. Can be returned when evaluating partition health and the aggregated health state is either Error or Warning.<br/> |
| [ReplicaStatus enum](sfclient-v63-model-replicastatus.md) | The status of a replica of a service.<br/> |
| [ReplicaStatusBase](sfclient-v63-model-replicastatusbase.md) | Information about the replica.<br/> |
| [ReplicatorOperationName enum](sfclient-v63-model-replicatoroperationname.md) | Specifies the operation currently being executed by the Replicator.<br/> |
| [ReplicatorQueueStatus](sfclient-v63-model-replicatorqueuestatus.md) | Provides various statistics of the queue used in the service fabric replicator.<br/>Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.<br/>Depending on the role of the replicator, the properties in this type imply different meanings.<br/> |
| [ReplicatorStatus](sfclient-v63-model-replicatorstatus.md) | Represents a base class for primary or secondary replicator status.<br/>Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.<br/> |
| [ResolvedServiceEndpoint](sfclient-v63-model-resolvedserviceendpoint.md) | Endpoint of a resolved service partition.<br/> |
| [ResolvedServicePartition](sfclient-v63-model-resolvedservicepartition.md) | Information about a service partition and its associated endpoints.<br/> |
| [ResourceLimits](sfclient-v63-model-resourcelimits.md) | This type describes the resource limits for a given container. It describes the most amount of resources a container is allowed to use before being restarted.<br/> |
| [ResourceRequests](sfclient-v63-model-resourcerequests.md) | This type describes the requested resources for a given container. It describes the least amount of resources required for the container. A container can consume more than requested resources up to the specified limits before being restarted. Currently, the requested resources are treated as limits.<br/> |
| [ResourceRequirements](sfclient-v63-model-resourcerequirements.md) | This type describes the resource requirements for a container or a service.<br/> |
| [RestartDeployedCodePackageDescription](sfclient-v63-model-restartdeployedcodepackagedescription.md) | Defines description for restarting a deployed code package on Service Fabric node.<br/> |
| [RestartNodeDescription](sfclient-v63-model-restartnodedescription.md) | Describes the parameters to restart a Service Fabric node.<br/> |
| [RestartPartitionMode enum](sfclient-v63-model-restartpartitionmode.md) | Possible values include: 'Invalid', 'AllReplicasOrInstances', 'OnlyActiveSecondaries'<br/> |
| [RestartPartitionResult](sfclient-v63-model-restartpartitionresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [RestorePartitionDescription](sfclient-v63-model-restorepartitiondescription.md) | Specifies the parameters needed to trigger a restore of a specific partition.<br/> |
| [RestoreProgressInfo](sfclient-v63-model-restoreprogressinfo.md) | Describes the progress of a restore operation on a partition.<br/> |
| [RestoreState enum](sfclient-v63-model-restorestate.md) | Represents the current state of the partition restore operation.<br/> |
| [ResultStatus enum](sfclient-v63-model-resultstatus.md) | Possible values include: 'Invalid', 'Succeeded', 'Cancelled', 'Interrupted', 'Failed', 'Pending'<br/> |
| [ResumeApplicationUpgradeDescription](sfclient-v63-model-resumeapplicationupgradedescription.md) | Describes the parameters for resuming an unmonitored manual Service Fabric application upgrade<br/> |
| [ResumeClusterUpgradeDescription](sfclient-v63-model-resumeclusterupgradedescription.md) | Describes the parameters for resuming a cluster upgrade.<br/> |
| [RollingUpgradeUpdateDescription](sfclient-v63-model-rollingupgradeupdatedescription.md) | Describes the parameters for updating a rolling upgrade of application or cluster.<br/> |
| [SafetyCheck](sfclient-v63-model-safetycheck.md) | Represents a safety check performed by service fabric before continuing with the operations. These checks ensure the availability of the service and the reliability of the state.<br/> |
| [SafetyCheckKind enum](sfclient-v63-model-safetycheckkind.md) | The kind of safety check performed by service fabric before continuing with the operations. These checks ensure the availability of the service and the reliability of the state. Following are the kinds of safety checks.<br/> |
| [SafetyCheckWrapper](sfclient-v63-model-safetycheckwrapper.md) | A wrapper for the safety check object. Safety checks are performed by service fabric before continuing with the operations. These checks ensure the availability of the service and the reliability of the state.<br/> |
| [ScalingMechanismDescription](sfclient-v63-model-scalingmechanismdescription.md) | Describes the mechanism for performing a scaling operation.<br/> |
| [ScalingMechanismKind enum](sfclient-v63-model-scalingmechanismkind.md) | Enumerates the ways that a service can be scaled.<br/> |
| [ScalingPolicyDescription](sfclient-v63-model-scalingpolicydescription.md) | Describes how the scaling should be performed<br/> |
| [ScalingTriggerDescription](sfclient-v63-model-scalingtriggerdescription.md) | Describes the trigger for performing a scaling operation.<br/> |
| [ScalingTriggerKind enum](sfclient-v63-model-scalingtriggerkind.md) | Enumerates the ways that a service can be scaled.<br/> |
| [SecondaryActiveReplicatorStatus](sfclient-v63-model-secondaryactivereplicatorstatus.md) | Status of the secondary replicator when it is in active mode and is part of the replica set.<br/> |
| [SecondaryIdleReplicatorStatus](sfclient-v63-model-secondaryidlereplicatorstatus.md) | Status of the secondary replicator when it is in idle mode and is being built by the primary.<br/> |
| [SeedNodeSafetyCheck](sfclient-v63-model-seednodesafetycheck.md) | Represents a safety check for the seed nodes being performed by service fabric before continuing with node level operations.<br/> |
| [SelectedPartition](sfclient-v63-model-selectedpartition.md) | This class returns information about the partition that the user-induced operation acted upon.<br/> |
| [ServiceBackupConfigurationInfo](sfclient-v63-model-servicebackupconfigurationinfo.md) | Backup configuration information for a specific Service Fabric service specifying what backup policy is being applied and suspend description, if any.<br/> |
| [ServiceBackupEntity](sfclient-v63-model-servicebackupentity.md) | Identifies the Service Fabric stateful service which is being backed up.<br/> |
| [ServiceCorrelationDescription](sfclient-v63-model-servicecorrelationdescription.md) | Creates a particular correlation between services.<br/> |
| [ServiceCorrelationScheme enum](sfclient-v63-model-servicecorrelationscheme.md) | The service correlation scheme.<br/> |
| [ServiceCreatedEvent](sfclient-v63-model-servicecreatedevent.md) | Service Created event.<br/> |
| [ServiceDeletedEvent](sfclient-v63-model-servicedeletedevent.md) | Service Deleted event.<br/> |
| [ServiceDescription](sfclient-v63-model-servicedescription.md) | A ServiceDescription contains all of the information necessary to create a service.<br/> |
| [ServiceEndpointRole enum](sfclient-v63-model-serviceendpointrole.md) | The role of the replica where the endpoint is reported.<br/> |
| [ServiceEvent](sfclient-v63-model-serviceevent.md) | Represents the base for all Service Events.<br/> |
| [ServiceFromTemplateDescription](sfclient-v63-model-servicefromtemplatedescription.md) | Defines description for creating a Service Fabric service from a template defined in the application manifest.<br/> |
| [ServiceHealth](sfclient-v63-model-servicehealth.md) | Information about the health of a Service Fabric service.<br/> |
| [ServiceHealthEvaluation](sfclient-v63-model-servicehealthevaluation.md) | Represents health evaluation for a service, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ServiceHealthReportCreatedEvent](sfclient-v63-model-servicehealthreportcreatedevent.md) | Service Health Report Created event.<br/> |
| [ServiceHealthReportExpiredEvent](sfclient-v63-model-servicehealthreportexpiredevent.md) | Service Health Report Expired event.<br/> |
| [ServiceHealthState](sfclient-v63-model-servicehealthstate.md) | Represents the health state of a service, which contains the service identifier and its aggregated health state.<br/> |
| [ServiceHealthStateChunk](sfclient-v63-model-servicehealthstatechunk.md) | Represents the health state chunk of a service, which contains the service name, its aggregated health state and any partitions that respect the filters in the cluster health chunk query description.<br/> |
| [ServiceHealthStateChunkList](sfclient-v63-model-servicehealthstatechunklist.md) | The list of service health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ServiceHealthStateFilter](sfclient-v63-model-servicehealthstatefilter.md) | Defines matching criteria to determine whether a service should be included as a child of an application in the cluster health chunk.<br/>The services are only returned if the parent application matches a filter specified in the cluster health chunk query description.<br/>One filter can match zero, one or multiple services, depending on its properties.<br/> |
| [ServiceInfo](sfclient-v63-model-serviceinfo.md) | Information about a Service Fabric service.<br/> |
| [ServiceKind enum](sfclient-v63-model-servicekind.md) | The kind of service (Stateless or Stateful).<br/> |
| [ServiceLoadMetricDescription](sfclient-v63-model-serviceloadmetricdescription.md) | Specifies a metric to load balance a service during runtime.<br/> |
| [ServiceLoadMetricWeight enum](sfclient-v63-model-serviceloadmetricweight.md) | Determines the metric weight relative to the other metrics that are configured for this service. During runtime, if two metrics end up in conflict, the Cluster Resource Manager prefers the metric with the higher weight.<br/> |
| [ServiceNameInfo](sfclient-v63-model-servicenameinfo.md) | Information about the service name.<br/> |
| [ServiceOperationName enum](sfclient-v63-model-serviceoperationname.md) | Specifies the current active life-cycle operation on a stateful service replica or stateless service instance.<br/> |
| [ServicePackageActivationMode enum](sfclient-v63-model-servicepackageactivationmode.md) | The activation mode of service package to be used for a Service Fabric service. This is specified at the time of creating the Service.<br/> |
| [ServicePartitionInfo](sfclient-v63-model-servicepartitioninfo.md) | Information about a partition of a Service Fabric service.<br/> |
| [ServicePartitionKind enum](sfclient-v63-model-servicepartitionkind.md) | The kind of partitioning scheme used to partition the service.<br/> |
| [ServicePartitionStatus enum](sfclient-v63-model-servicepartitionstatus.md) | The status of the service fabric service partition.<br/> |
| [ServicePlacementInvalidDomainPolicyDescription](sfclient-v63-model-serviceplacementinvaliddomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where a particular fault or upgrade domain should not be used for placement of the instances or replicas of that service.<br/> |
| [ServicePlacementNonPartiallyPlaceServicePolicyDescription](sfclient-v63-model-serviceplacementnonpartiallyplaceservicepolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where all replicas must be able to be placed in order for any replicas to be created.<br/> |
| [ServicePlacementPolicyDescription](sfclient-v63-model-serviceplacementpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service.<br/> |
| [ServicePlacementPolicyType enum](sfclient-v63-model-serviceplacementpolicytype.md) | The type of placement policy for a service fabric service. Following are the possible values.<br/> |
| [ServicePlacementPreferPrimaryDomainPolicyDescription](sfclient-v63-model-serviceplacementpreferprimarydomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where the service's Primary replicas should optimally be placed in a particular domain.<br/><br/>This placement policy is usually used with fault domains in scenarios where the Service Fabric cluster is geographically distributed in order to indicate that a service�s primary replica should be located in a particular fault domain, which in geo-distributed scenarios usually aligns with regional or datacenter boundaries. Note that since this is an optimization it is possible that the Primary replica may not end up located in this domain due to failures, capacity limits, or other constraints.<br/> |
| [ServicePlacementRequiredDomainPolicyDescription](sfclient-v63-model-serviceplacementrequireddomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where the instances or replicas of that service must be placed in a particular domain<br/> |
| [ServicePlacementRequireDomainDistributionPolicyDescription](sfclient-v63-model-serviceplacementrequiredomaindistributionpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where two replicas from the same partition should never be placed in the same fault or upgrade domain.<br/><br/>While this is not common it can expose the service to an increased risk of concurrent failures due to unplanned outages or other cases of subsequent/concurrent failures. As an example, consider a case where replicas are deployed across different data center, with one replica per location. In the event that one of the datacenters goes offline, normally the replica that was placed in that datacenter will be packed into one of the remaining datacenters. If this is not desirable then this policy should be set.<br/> |
| [ServiceReplicaProperties](sfclient-v63-model-servicereplicaproperties.md) | Describes the properties of a service replica.<br/> |
| [ServiceResourceDescription](sfclient-v63-model-serviceresourcedescription.md) | Describes a service fabric service resource.<br/> |
| [ServiceResourceProperties](sfclient-v63-model-serviceresourceproperties.md) | This type describes properties of a service resource.<br/> |
| [ServiceResourceReplicaDescription](sfclient-v63-model-serviceresourcereplicadescription.md) | Describes a replica of a service resource.<br/> |
| [ServiceResourceStatus enum](sfclient-v63-model-serviceresourcestatus.md) | Possible values include: 'Unknown', 'Active', 'Upgrading', 'Deleting', 'Creating', 'Failed'<br/> |
| [ServicesHealthEvaluation](sfclient-v63-model-serviceshealthevaluation.md) | Represents health evaluation for services of a certain service type belonging to an application, containing health evaluations for each unhealthy service that impacted current aggregated health state. Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [ServiceStatus enum](sfclient-v63-model-servicestatus.md) | The status of the application.<br/> |
| [ServiceTypeDescription](sfclient-v63-model-servicetypedescription.md) | Describes a service type defined in the service manifest of a provisioned application type. The properties the ones defined in the service manifest.<br/> |
| [ServiceTypeExtensionDescription](sfclient-v63-model-servicetypeextensiondescription.md) | Describes extension of a service type defined in the service manifest.<br/> |
| [ServiceTypeHealthPolicy](sfclient-v63-model-servicetypehealthpolicy.md) | Represents the health policy used to evaluate the health of services belonging to a service type.<br/> |
| [ServiceTypeHealthPolicyMapItem](sfclient-v63-model-servicetypehealthpolicymapitem.md) | Defines an item in ServiceTypeHealthPolicyMap.<br/> |
| [ServiceTypeInfo](sfclient-v63-model-servicetypeinfo.md) | Information about a service type that is defined in a service manifest of a provisioned application type.<br/> |
| [ServiceTypeManifest](sfclient-v63-model-servicetypemanifest.md) | Contains the manifest describing a service type registered as part of an application in a Service Fabric cluster.<br/> |
| [ServiceTypeRegistrationStatus enum](sfclient-v63-model-servicetyperegistrationstatus.md) | The status of the service type registration on the node.<br/> |
| [ServiceUpdateDescription](sfclient-v63-model-serviceupdatedescription.md) | A ServiceUpdateDescription contains all of the information necessary to update a service.<br/> |
| [Setting](sfclient-v63-model-setting.md) | Describes a setting for the container.<br/> |
| [SingletonPartitionInformation](sfclient-v63-model-singletonpartitioninformation.md) | Information about a partition that is singleton. The services with singleton partitioning scheme are effectively non-partitioned. They only have one partition.<br/> |
| [SingletonPartitionSchemeDescription](sfclient-v63-model-singletonpartitionschemedescription.md) | Describes the partition scheme of a singleton-partitioned, or non-partitioned service.<br/> |
| [StartClusterUpgradeDescription](sfclient-v63-model-startclusterupgradedescription.md) | Describes the parameters for starting a cluster upgrade.<br/> |
| [StartedChaosEvent](sfclient-v63-model-startedchaosevent.md) | Describes a Chaos event that gets generated when Chaos is started.<br/> |
| [State enum](sfclient-v63-model-state.md) | Possible values include: 'Invalid', 'Created', 'Claimed', 'Preparing', 'Approved', 'Executing', 'Restoring', 'Completed'<br/> |
| [StatefulReplicaHealthReportCreatedEvent](sfclient-v63-model-statefulreplicahealthreportcreatedevent.md) | Stateful Replica Health Report Created event.<br/> |
| [StatefulReplicaHealthReportExpiredEvent](sfclient-v63-model-statefulreplicahealthreportexpiredevent.md) | Stateful Replica Health Report Expired event.<br/> |
| [StatefulServiceDescription](sfclient-v63-model-statefulservicedescription.md) | Describes a stateful service.<br/> |
| [StatefulServiceInfo](sfclient-v63-model-statefulserviceinfo.md) | Information about a stateful Service Fabric service.<br/> |
| [StatefulServicePartitionInfo](sfclient-v63-model-statefulservicepartitioninfo.md) | Information about a partition of a stateful Service Fabric service..<br/> |
| [StatefulServiceReplicaHealth](sfclient-v63-model-statefulservicereplicahealth.md) | Represents the health of the stateful service replica.<br/>Contains the replica aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatefulServiceReplicaHealthState](sfclient-v63-model-statefulservicereplicahealthstate.md) | Represents the health state of the stateful service replica, which contains the replica ID and the aggregated health state.<br/> |
| [StatefulServiceReplicaInfo](sfclient-v63-model-statefulservicereplicainfo.md) | Represents a stateful service replica. This includes information about the identity, role, status, health, node name, uptime, and other details about the replica.<br/> |
| [StatefulServiceTypeDescription](sfclient-v63-model-statefulservicetypedescription.md) | Describes a stateful service type defined in the service manifest of a provisioned application type.<br/> |
| [StatefulServiceUpdateDescription](sfclient-v63-model-statefulserviceupdatedescription.md) | Describes an update for a stateful service.<br/> |
| [StatelessReplicaHealthReportCreatedEvent](sfclient-v63-model-statelessreplicahealthreportcreatedevent.md) | Stateless Replica Health Report Created event.<br/> |
| [StatelessReplicaHealthReportExpiredEvent](sfclient-v63-model-statelessreplicahealthreportexpiredevent.md) | Stateless Replica Health Report Expired event.<br/> |
| [StatelessServiceDescription](sfclient-v63-model-statelessservicedescription.md) | Describes a stateless service.<br/> |
| [StatelessServiceInfo](sfclient-v63-model-statelessserviceinfo.md) | Information about a stateless Service Fabric service.<br/> |
| [StatelessServiceInstanceHealth](sfclient-v63-model-statelessserviceinstancehealth.md) | Represents the health of the stateless service instance.<br/>Contains the instance aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatelessServiceInstanceHealthState](sfclient-v63-model-statelessserviceinstancehealthstate.md) | Represents the health state of the stateless service instance, which contains the instance ID and the aggregated health state.<br/> |
| [StatelessServiceInstanceInfo](sfclient-v63-model-statelessserviceinstanceinfo.md) | Represents a stateless service instance. This includes information about the identity, status, health, node name, uptime, and other details about the instance.<br/> |
| [StatelessServicePartitionInfo](sfclient-v63-model-statelessservicepartitioninfo.md) | Information about a partition of a stateless Service Fabric service.<br/> |
| [StatelessServiceTypeDescription](sfclient-v63-model-statelessservicetypedescription.md) | Describes a stateless service type defined in the service manifest of a provisioned application type.<br/> |
| [StatelessServiceUpdateDescription](sfclient-v63-model-statelessserviceupdatedescription.md) | Describes an update for a stateless service.<br/> |
| [StoppedChaosEvent](sfclient-v63-model-stoppedchaosevent.md) | Describes a Chaos event that gets generated when Chaos stops because either the user issued a stop or the time to run was up.<br/> |
| [StringPropertyValue](sfclient-v63-model-stringpropertyvalue.md) | Describes a Service Fabric property value of type String.<br/> |
| [SuccessfulPropertyBatchInfo](sfclient-v63-model-successfulpropertybatchinfo.md) | Derived from PropertyBatchInfo. Represents the property batch succeeding. Contains the results of any "Get" operations in the batch.<br/> |
| [SystemApplicationHealthEvaluation](sfclient-v63-model-systemapplicationhealthevaluation.md) | Represents health evaluation for the fabric:/System application, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state of the cluster is either Error or Warning.<br/> |
| [TestErrorChaosEvent](sfclient-v63-model-testerrorchaosevent.md) | Describes a Chaos event that gets generated when an unexpected event occurs in the Chaos engine.<br/>For example, due to the cluster snapshot being inconsistent, while faulting an entity, Chaos found that the entity was already faulted -- which would be an unexpected event.<br/> |
| [TimeBasedBackupScheduleDescription](sfclient-v63-model-timebasedbackupscheduledescription.md) | Describes the time based backup schedule.<br/> |
| [TimeOfDay](sfclient-v63-model-timeofday.md) | Defines an hour and minute of the day specified in 24 hour time.<br/> |
| [TimeRange](sfclient-v63-model-timerange.md) | Defines a time range in a 24 hour day specified by a start and end time.<br/> |
| [UniformInt64RangePartitionSchemeDescription](sfclient-v63-model-uniformint64rangepartitionschemedescription.md) | Describes a partitioning scheme where an integer range is allocated evenly across a number of partitions.<br/> |
| [UnprovisionApplicationTypeDescriptionInfo](sfclient-v63-model-unprovisionapplicationtypedescriptioninfo.md) | Describes the operation to unregister or unprovision an application type and its version that was registered with the Service Fabric.<br/> |
| [UnprovisionFabricDescription](sfclient-v63-model-unprovisionfabricdescription.md) | Describes the parameters for unprovisioning a cluster.<br/> |
| [UpdateClusterUpgradeDescription](sfclient-v63-model-updateclusterupgradedescription.md) | Parameters for updating a cluster upgrade.<br/> |
| [UpgradeDomainDeltaNodesCheckHealthEvaluation](sfclient-v63-model-upgradedomaindeltanodescheckhealthevaluation.md) | Represents health evaluation for delta unhealthy cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when cluster aggregated health state is Warning or Error.<br/> |
| [UpgradeDomainInfo](sfclient-v63-model-upgradedomaininfo.md) | Information about an upgrade domain.<br/> |
| [UpgradeDomainNodesHealthEvaluation](sfclient-v63-model-upgradedomainnodeshealthevaluation.md) | Represents health evaluation for cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health during cluster upgrade and the aggregated health state is either Error or Warning.<br/> |
| [UpgradeDomainState enum](sfclient-v63-model-upgradedomainstate.md) | The state of the upgrade domain.<br/> |
| [UpgradeKind enum](sfclient-v63-model-upgradekind.md) | The kind of upgrade out of the following possible values.<br/> |
| [UpgradeMode enum](sfclient-v63-model-upgrademode.md) | The mode used to monitor health during a rolling upgrade. The values are UnmonitoredAuto, UnmonitoredManual, and Monitored.<br/> |
| [UpgradeOrchestrationServiceState](sfclient-v63-model-upgradeorchestrationservicestate.md) | Service state of Service Fabric Upgrade Orchestration Service.<br/> |
| [UpgradeOrchestrationServiceStateSummary](sfclient-v63-model-upgradeorchestrationservicestatesummary.md) | Service state summary of Service Fabric Upgrade Orchestration Service.<br/> |
| [UpgradeState enum](sfclient-v63-model-upgradestate.md) | The state of the upgrade domain.<br/> |
| [UpgradeType enum](sfclient-v63-model-upgradetype.md) | The type of upgrade out of the following possible values.<br/> |
| [UploadChunkRange](sfclient-v63-model-uploadchunkrange.md) | Information about which portion of the file to upload.<br/> |
| [UploadSession](sfclient-v63-model-uploadsession.md) | Information about a image store upload session<br/> |
| [UploadSessionInfo](sfclient-v63-model-uploadsessioninfo.md) | Information about an image store upload session. A session is associated with a relative path in the image store.<br/> |
| [ValidationFailedChaosEvent](sfclient-v63-model-validationfailedchaosevent.md) | Chaos event corresponding to a failure during validation.<br/> |
| [VolumeProperties](sfclient-v63-model-volumeproperties.md) | This type describes properties of a volume resource.<br/> |
| [VolumeProviderParametersAzureFile](sfclient-v63-model-volumeproviderparametersazurefile.md) | This type describes a volume provided by an Azure Files file share.<br/> |
| [VolumeResourceDescription](sfclient-v63-model-volumeresourcedescription.md) | Describes a service fabric volume resource.<br/> |
| [WaitForInbuildReplicaSafetyCheck](sfclient-v63-model-waitforinbuildreplicasafetycheck.md) | Safety check that waits for the replica build operation to finish. This indicates that there is a replica that is going through the copy or is providing data for building another replica. Bring the node down will abort this copy operation which are typically expensive involving data movements.<br/> |
| [WaitForPrimaryPlacementSafetyCheck](sfclient-v63-model-waitforprimaryplacementsafetycheck.md) | Safety check that waits for the primary replica that was moved out of the node due to upgrade to be placed back again on that node.<br/> |
| [WaitForPrimarySwapSafetyCheck](sfclient-v63-model-waitforprimaryswapsafetycheck.md) | Safety check that waits for the primary replica to be moved out of the node before starting an upgrade to ensure the availability of the primary replica for the partition.<br/> |
| [WaitForReconfigurationSafetyCheck](sfclient-v63-model-waitforreconfigurationsafetycheck.md) | Safety check that waits for the current reconfiguration of the partition to be completed before starting an upgrade.<br/> |
| [WaitingChaosEvent](sfclient-v63-model-waitingchaosevent.md) | Describes a Chaos event that gets generated when Chaos is waiting for the cluster to become ready for faulting, for example, Chaos may be waiting for the on-going upgrade to finish.<br/> |

