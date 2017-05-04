---
title: "Service Fabric Client REST API Reference"
ms.date: "2017-05-04"
ms.prod: "azure"
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

[Service Fabric](http://aka.ms/ServiceFabric) is a distributed systems platform that makes it easy to package, deploy, and manage scalable and reliable microservices. 

Service Fabric Client APIs allows deploying and managing microservices based applications and containers in a Service Fabric cluster on Azure, on-premise, on local development machine or in other cloud. This document provides a reference for these APIs.

All task operations conform to the HTTP/1.1 protocol specification. All task operations return standard HTTP status codes and may also return additional [Status and Error Codes](sfclient-status-and-error-codes.md) in the response body. See [Service Fabric Names and JSON Serialization](sfclient-service-fabric-names-and-json-serialization.md) for special considerations when serializing and de-serializing names and identities of various entities such as nodes, applications, services, partitions and replicas in the Service Fabric cluster, to and from request and response. You must make sure that requests and responses are secure. For more information, see [Authenticating Service Fabric REST Requests](sfclient-authenticating-service-fabric-rest-requests.md). 

 To connect to the local development cluster, you must use the correct URI with the correct client connection port, identified by {connection-port} in the URIs listed below. The client connection port is specified by HttpGatewayEndpoint in the cluster manifest file.  
  
 Though the examples show http, both http and https protocols are supported by Service Fabric. The protocol is specified by HttpGatewayEndpoint in the cluster manifest file.  
  
 To connect to the local development cluster, use the following URI:  
  
```  
http://localhost:{connection-port}  
```  
  
 To connect to a cluster by fully-qualified domain name, use a URI similar to the following:  
  
```  
http://MyCluster.cloudapp.net:{connection-port}  
```  
  
 To connect to a cluster by IP address, use a URI similar to the following:  
  
```  
http://65.52.117.43:{connection-port}  
```  

Following is a list of Service Fabric Client REST APIs.

> [!IMPORTANT]
>  These APIs work with Service Fabric clusters running runtime version 5.6.* and above.
>


----
## [Cluster APIs](sfclient-index-cluster.md)

| Name | Description |
| --- | --- |
| [Get Cluster Manifest](sfclient-api-getclustermanifest.md) | Get the Service Fabric cluster manifest.<br/> |
| [Get Cluster Health](sfclient-api-getclusterhealth.md) | Gets the health of a Service Fabric cluster.<br/> |
| [Get Cluster Health Using Policy](sfclient-api-getclusterhealthusingpolicy.md) | Gets the health of a Service Fabric cluster using the specified policy.<br/> |
| [Get Cluster Health Chunk](sfclient-api-getclusterhealthchunk.md) | Gets the health of a Service Fabric cluster using health chunks.<br/> |
| [Get Cluster Health Chunk Using Policy And Advanced Filters](sfclient-api-getclusterhealthchunkusingpolicyandadvancedfilters.md) | Gets the health of a Service Fabric cluster using health chunks.<br/> |
| [Report Cluster Health](sfclient-api-reportclusterhealth.md) | Sends a health report on the Service Fabric cluster.<br/> |
| [Get Provisioned Fabric Code Version Info List](sfclient-api-getprovisionedfabriccodeversioninfolist.md) | Gets a list of fabric code versions that are provisioned in a Service Fabric cluster.<br/> |
| [Get Provisioned Fabric Config Version Info List](sfclient-api-getprovisionedfabricconfigversioninfolist.md) | Gets a list of fabric config versions that are provisioned in a Service Fabric cluster.<br/> |
| [Get Cluster Upgrade Progress](sfclient-api-getclusterupgradeprogress.md) | Gets the progress of the current cluster upgrade.<br/> |
| [Get Cluster Configuration](sfclient-api-getclusterconfiguration.md) | Get the Service Fabric standalone cluster configuration.<br/> |
| [Get Aad Metadata](sfclient-api-getaadmetadata.md) | Gets the Azure Active Directory metadata used for secured connection to cluster.<br/> |

----
## [Node APIs](sfclient-index-node.md)

| Name | Description |
| --- | --- |
| [Get Node Info List](sfclient-api-getnodeinfolist.md) | Gets the list of nodes in the Service Fabric cluster.<br/> |
| [Get Node Info](sfclient-api-getnodeinfo.md) | Gets the list of nodes in the Service Fabric cluster.<br/> |
| [Get Node Health](sfclient-api-getnodehealth.md) | Gets the health of a Service Fabric node.<br/> |
| [Get Node Health Using Policy](sfclient-api-getnodehealthusingpolicy.md) | Gets the health of a Service Fabric node, by using the specified health policy.<br/> |
| [Report Node Health](sfclient-api-reportnodehealth.md) | Sends a health report on the Service Fabric node.<br/> |
| [Get Node Load Info](sfclient-api-getnodeloadinfo.md) | Gets the load information of a Service Fabric node.<br/> |
| [Disable Node](sfclient-api-disablenode.md) | Deactivate a Service Fabric cluster node with the specified deactivation intent.<br/> |
| [Enable Node](sfclient-api-enablenode.md) | Activate a Service Fabric cluster node which is currently deactivated.<br/> |
| [Remove Node State](sfclient-api-removenodestate.md) | Notifies Service Fabric that the persisted state on a node has been permanently removed or lost.<br/> |
| [Start Node](sfclient-api-startnode.md) | Starts a Service Fabric cluster node.<br/> |
| [Stop Node](sfclient-api-stopnode.md) | Stops a Service Fabric cluster node.<br/> |
| [Restart Node](sfclient-api-restartnode.md) | Restarts a Service Fabric cluster node.<br/> |

----
## [ApplicationType APIs](sfclient-index-applicationtype.md)

| Name | Description |
| --- | --- |
| [Get Application Type Info List](sfclient-api-getapplicationtypeinfolist.md) | Gets the list of application types in the Service Fabric cluster.<br/> |
| [Get Application Type Info List By Name](sfclient-api-getapplicationtypeinfolistbyname.md) | Gets the list of application types in the Service Fabric cluster matching exactly the specified name.<br/> |
| [Provision Application Type](sfclient-api-provisionapplicationtype.md) | Provisions or registers a Service Fabric application type with the cluster.<br/> |
| [Unprovision Application Type](sfclient-api-unprovisionapplicationtype.md) | Removes or unregisters a Service Fabric application type from the cluster.<br/> |
| [Get Application Manifest](sfclient-api-getapplicationmanifest.md) | Gets the manifest describing an application type.<br/> |

----
## [ServiceType APIs](sfclient-index-servicetype.md)

| Name | Description |
| --- | --- |
| [Get Service Type Info List](sfclient-api-getservicetypeinfolist.md) | Gets the list containing the information about service types that are supported by a provisioned application type in a Service Fabric cluster.<br/> |
| [Get Service Manifest](sfclient-api-getservicemanifest.md) | Gets the manifest describing a service type.<br/> |
| [Get Deployed Service Type Info List](sfclient-api-getdeployedservicetypeinfolist.md) | Gets the list containing the information about service types from the applications deployed on a node in a Service Fabric cluster.<br/> |
| [Get Deployed Service Type Info By Name](sfclient-api-getdeployedservicetypeinfobyname.md) | Gets the information about a specified service type of the application deployed on a node in a Service Fabric cluster.<br/> |

----
## [Application APIs](sfclient-index-application.md)

| Name | Description |
| --- | --- |
| [Create Application](sfclient-api-createapplication.md) | Creates a Service Fabric application.<br/> |
| [Delete Application](sfclient-api-deleteapplication.md) | Deletes an existing Service Fabric application.<br/> |
| [Get Application Info List](sfclient-api-getapplicationinfolist.md) | Gets the list of applications created in the Service Fabric cluster that match filters specified as the parameter.<br/> |
| [Get Application Info](sfclient-api-getapplicationinfo.md) | Gets information about a Service Fabric application.<br/> |
| [Get Application Health](sfclient-api-getapplicationhealth.md) | Gets the health of the service fabric application.<br/> |
| [Get Application Health Using Policy](sfclient-api-getapplicationhealthusingpolicy.md) | Gets the health of a Service Fabric application using the specified policy.<br/> |
| [Report Application Health](sfclient-api-reportapplicationhealth.md) | Sends a health report on the Service Fabric application.<br/> |
| [Start Application Upgrade](sfclient-api-startapplicationupgrade.md) | Starts upgrading an application in the Service Fabric cluster.<br/> |
| [Get Application Upgrade](sfclient-api-getapplicationupgrade.md) | Gets details for the latest upgrade performed on this application.<br/> |
| [Update Application Upgrade](sfclient-api-updateapplicationupgrade.md) | Updates an ongoing application upgrade in the Service Fabric cluster.<br/> |
| [Resume Application Upgrade](sfclient-api-resumeapplicationupgrade.md) | Resumes upgrading an application in the Service Fabric cluster.<br/> |
| [Rollback Application Upgrade](sfclient-api-rollbackapplicationupgrade.md) | Starts rolling back the currently on-going upgrade of an application in the Service Fabric cluster.<br/> |
| [Get Deployed Application Info List](sfclient-api-getdeployedapplicationinfolist.md) | Gets the list of applications deployed on a Service Fabric node.<br/> |
| [Get Deployed Application Info](sfclient-api-getdeployedapplicationinfo.md) | Gets the information about an application deployed on a Service Fabric node.<br/> |
| [Get Deployed Application Health](sfclient-api-getdeployedapplicationhealth.md) | Gets the information about health of an application deployed on a Service Fabric node.<br/> |
| [Get Deployed Application Health Using Policy](sfclient-api-getdeployedapplicationhealthusingpolicy.md) | Gets the information about health of an application deployed on a Service Fabric node. using the specified policy.<br/> |
| [Report Deployed Application Health](sfclient-api-reportdeployedapplicationhealth.md) | Sends a health report on the Service Fabric application deployed on a Service Fabric node.<br/> |

----
## [Service APIs](sfclient-index-service.md)

| Name | Description |
| --- | --- |
| [Get Service Info List](sfclient-api-getserviceinfolist.md) | Gets the information about all services belonging to the application specified by the application id.<br/> |
| [Get Service Info](sfclient-api-getserviceinfo.md) | Gets the information about the specific service belonging to a Service Fabric application.<br/> |
| [Get Application Name Info](sfclient-api-getapplicationnameinfo.md) | Gets the name of the Service Fabric application for a service.<br/> |
| [Create Service](sfclient-api-createservice.md) | Creates the specified service.<br/> |
| [Create Service From Template](sfclient-api-createservicefromtemplate.md) | Creates a Service Fabric service from the service template defined in the application manifest.<br/> |
| [Delete Service](sfclient-api-deleteservice.md) | Deletes an existing Service Fabric service.<br/> |
| [Update Service](sfclient-api-updateservice.md) | Updates the specified service using the given update description.<br/> |
| [Get Service Description](sfclient-api-getservicedescription.md) | Gets the description of an existing Service Fabric service.<br/> |
| [Get Service Health](sfclient-api-getservicehealth.md) | Gets the health of the specified Service Fabric service.<br/> |
| [Get Service Health Using Policy](sfclient-api-getservicehealthusingpolicy.md) | Gets the health of the specified Service Fabric service, by using the specified health policy.<br/> |
| [Report Service Health](sfclient-api-reportservicehealth.md) | Sends a health report on the Service Fabric service.<br/> |
| [Resolve Service](sfclient-api-resolveservice.md) | Resolve a Service Fabric partition.<br/> |

----
## [Partition APIs](sfclient-index-partition.md)

| Name | Description |
| --- | --- |
| [Get Partition Info List](sfclient-api-getpartitioninfolist.md) | Gets the list of partitions of a Service Fabric service.<br/> |
| [Get Partition Info](sfclient-api-getpartitioninfo.md) | Gets the information about a Service Fabric partition.<br/> |
| [Get Service Name Info](sfclient-api-getservicenameinfo.md) | Gets the name of the Service Fabric service for a partition.<br/> |
| [Get Partition Health](sfclient-api-getpartitionhealth.md) | Gets the health of the specified Service Fabric partition.<br/> |
| [Get Partition Health Using Policy](sfclient-api-getpartitionhealthusingpolicy.md) | Gets the health of the specified Service Fabric partition, by using the specified health policy.<br/> |
| [Report Partition Health](sfclient-api-reportpartitionhealth.md) | Sends a health report on the Service Fabric partition.<br/> |
| [Get Partition Load Information](sfclient-api-getpartitionloadinformation.md) | Gets the load of the specified Service Fabric partition.<br/> |
| [Reset Partition Load](sfclient-api-resetpartitionload.md) | Resets the current load of a Service Fabric partition.<br/> |
| [Recover Partition](sfclient-api-recoverpartition.md) | Indicates to the Service Fabric cluster that it should attempt to recover a specific partition which is currently stuck in quorum loss.<br/> |
| [Recover Service Partitions](sfclient-api-recoverservicepartitions.md) | Indicates to the Service Fabric cluster that it should attempt to recover the specified service which is currently stuck in quorum loss.<br/> |
| [Recover System Partitions](sfclient-api-recoversystempartitions.md) | Indicates to the Service Fabric cluster that it should attempt to recover the system services which are currently stuck in quorum loss.<br/> |
| [Recover All Partitions](sfclient-api-recoverallpartitions.md) | Indicates to the Service Fabric cluster that it should attempt to recover any services (including system services) which are currently stuck in quorum loss.<br/> |

----
## [Replica APIs](sfclient-index-replica.md)

| Name | Description |
| --- | --- |
| [Get Replica Info List](sfclient-api-getreplicainfolist.md) | Gets the information about replicas of a Service Fabric service partition.<br/> |
| [Get Replica Info](sfclient-api-getreplicainfo.md) | Gets the information about a replica of a Service Fabric partition.<br/> |
| [Get Replica Health](sfclient-api-getreplicahealth.md) | Gets the health of a Service Fabric stateful service replica or stateless service instance.<br/> |
| [Get Replica Health Using Policy](sfclient-api-getreplicahealthusingpolicy.md) | Gets the health of a Service Fabric stateful service replica or stateless service instance using the specified policy.<br/> |
| [Report Replica Health](sfclient-api-reportreplicahealth.md) | Sends a health report on the Service Fabric replica.<br/> |
| [Get Deployed Service Replica Info List](sfclient-api-getdeployedservicereplicainfolist.md) | Gets the list of replicas deployed on a Service Fabric node.<br/> |
| [Get Deployed Service Replica Detail Info](sfclient-api-getdeployedservicereplicadetailinfo.md) | Gets the details of replica deployed on a Service Fabric node.<br/> |
| [Restart Replica](sfclient-api-restartreplica.md) | Restarts a service replica of a persisted service running on a node.<br/> |
| [Remove Replica](sfclient-api-removereplica.md) | Removes a service replica running on a node.<br/> |

----
## [Service Package APIs](sfclient-index-service-package.md)

| Name | Description |
| --- | --- |
| [Get Deployed Service Package Info List](sfclient-api-getdeployedservicepackageinfolist.md) | Gets the list of service packages deployed on a Service Fabric node.<br/> |
| [Get Deployed Service Package Info List By Name](sfclient-api-getdeployedservicepackageinfolistbyname.md) | Gets the list of service packages deployed on a Service Fabric node matching exactly the specified name.<br/> |
| [Get Deployed Service Package Health](sfclient-api-getdeployedservicepackagehealth.md) | Gets the information about health of an service package for a specific application deployed for a Service Fabric node and application.<br/> |
| [Get Deployed Service Package Health Using Policy](sfclient-api-getdeployedservicepackagehealthusingpolicy.md) | Gets the information about health of service package for a specific application deployed on a Service Fabric node using the specified policy.<br/> |
| [Report Deployed Service Package Health](sfclient-api-reportdeployedservicepackagehealth.md) | Sends a health report on the Service Fabric deployed service package.<br/> |
| [Deployed Service Package To Node](sfclient-api-deployedservicepackagetonode.md) | Downloads packages associated with specified service manifest to image cache on specified node.<br/> |

----
## [Code Package APIs](sfclient-index-code-package.md)

| Name | Description |
| --- | --- |
| [Get Deployed Code Package Info List](sfclient-api-getdeployedcodepackageinfolist.md) | Gets the list of code packages deployed on a Service Fabric node.<br/> |
| [Restart Deployed Code Package](sfclient-api-restartdeployedcodepackage.md) | Restarts a code package deployed on a Service Fabric node in a cluster.<br/> |

----
## [Compose Deployment APIs](sfclient-index-compose-deployment.md)

| Name | Description |
| --- | --- |
| [Create Compose Application](sfclient-api-createcomposeapplication.md) | Creates a Service Fabric compose application.<br/> |
| [Get Compose Application Status](sfclient-api-getcomposeapplicationstatus.md) | Gets information about a Service Fabric compose application.<br/> |
| [Get Compose Application Status List](sfclient-api-getcomposeapplicationstatuslist.md) | Gets the list of compose applications created in the Service Fabric cluster.<br/> |
| [Remove Compose Application](sfclient-api-removecomposeapplication.md) | Deletes an existing Service Fabric compose application from cluster.<br/> |

----
## [Chaos APIs](sfclient-index-chaos.md)

| Name | Description |
| --- | --- |
| [Start Chaos](sfclient-api-startchaos.md) | Starts Chaos in the cluster.<br/> |
| [Stop Chaos](sfclient-api-stopchaos.md) | Stops Chaos in the cluster if it is already running, otherwise it does nothing.<br/> |
| [Get Chaos Report](sfclient-api-getchaosreport.md) | Gets the next segment of the Chaos report based on the passed-in continuation token or the passed-in time-range.<br/> |

----
## [ImageStore APIs](sfclient-index-imagestore.md)

| Name | Description |
| --- | --- |
| [Upload File](sfclient-api-uploadfile.md) | Uploads contents of the file to the image store.<br/> |
| [Get Image Store Content](sfclient-api-getimagestorecontent.md) | Gets the image store content information.<br/> |
| [Delete Image Store Content](sfclient-api-deleteimagestorecontent.md) | Deletes existing image store content.<br/> |
| [Get Image Store Root Content](sfclient-api-getimagestorerootcontent.md) | Gets the content information at the root of the image store.<br/> |
| [Copy Image Store Content](sfclient-api-copyimagestorecontent.md) | Copies image store content internally<br/> |

----
## [Infrastructure APIs](sfclient-index-infrastructure.md)

| Name | Description |
| --- | --- |
| [Invoke Infrastructure Command](sfclient-api-invokeinfrastructurecommand.md) | Invokes an administrative command on the given Infrastructure Service instance.<br/> |
| [Invoke Infrastructure Query](sfclient-api-invokeinfrastructurequery.md) | Invokes a read-only query on the given infrastructure service instance.<br/> |

----
## [Faults APIs](sfclient-index-faults.md)

| Name | Description |
| --- | --- |
| [Start Data Loss](sfclient-api-startdataloss.md) | This API will induce data loss for the specified partition. It will trigger a call to the OnDataLossAsync API of the partition.<br/> |
| [Get Data Loss Progress](sfclient-api-getdatalossprogress.md) | Gets the progress of a partition data loss operation started using the StartDataLoss API.<br/> |
| [Start Quorum Loss](sfclient-api-startquorumloss.md) | Induces quorum loss for a given stateful service partition.<br/> |
| [Get Quorum Loss Progress](sfclient-api-getquorumlossprogress.md) | Gets the progress of a quorum loss operation on a partition started using the StartQuorumLoss API.<br/> |
| [Start Partition Restart](sfclient-api-startpartitionrestart.md) | This API will restart some or all replicas or instances of the specified partition.<br/> |
| [Get Partition Restart Progress](sfclient-api-getpartitionrestartprogress.md) | Gets the progress of a PartitionRestart operation started using StartPartitionRestart.<br/> |
| [Start Node Transition](sfclient-api-startnodetransition.md) | Starts or stops a cluster node.<br/> |
| [Get Node Transition Progress](sfclient-api-getnodetransitionprogress.md) | Gets the progress of an operation started using StartNodeTransition.<br/> |
| [Get Fault Operation List](sfclient-api-getfaultoperationlist.md) | Gets a list of user-induced fault operations filtered by provided input.<br/> |
| [Cancel Operation](sfclient-api-canceloperation.md) | Cancels a user-induced fault operation.<br/> |

----
## [Models](sfclient-index-models.md)

| Name | Description |
| --- | --- |
| [AadMetadata](sfclient-model-aadmetadata.md) | Azure Active Directory metadata used for secured connection to cluster.<br/> |
| [AadMetadataObject](sfclient-model-aadmetadataobject.md) | Azure Active Directory metadata object used for secured connection to cluster.<br/> |
| [ApplicationCapacityDescription](sfclient-model-applicationcapacitydescription.md) | Describes capacity information for services of this application. This description can be used for describing the following.<br/>- Reserving the capacity for the services on the nodes<br/>- Limiting the total number of nodes that services of this application can run on<br/>- Limiting the custom capacity metrics to limit the total consumption of this metric by the services of this application<br/> |
| [ApplicationDescription](sfclient-model-applicationdescription.md) | Describes a Service Fabric application.<br/> |
| [ApplicationHealth](sfclient-model-applicationhealth.md) | Represents the health of the application. Contains the application aggregated health state and the service and deployed application health states.<br/> |
| [ApplicationHealthEvaluation](sfclient-model-applicationhealthevaluation.md) | Represents health evaluation for an application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [ApplicationHealthPolicies](sfclient-model-applicationhealthpolicies.md) | Defines the application health policy map used to evaluate the health of an application or one of its children entities.<br/> |
| [ApplicationHealthPolicy](sfclient-model-applicationhealthpolicy.md) | Defines a health policy used to evaluate the health of an application or one of its children entities.<br/> |
| [ApplicationHealthPolicyMapItem](sfclient-model-applicationhealthpolicymapitem.md) | Defines an item in ApplicationHealthPolicyMap.<br/> |
| [ApplicationHealthState](sfclient-model-applicationhealthstate.md) | Represents the health state of an application, which contains the application identifier and the aggregated health state.<br/> |
| [ApplicationHealthStateChunk](sfclient-model-applicationhealthstatechunk.md) | Represents the health state chunk of a application.<br/>The application health state chunk contains the application name, its aggregated health state and any children services and deployed applications that respect the filters in cluster health chunk query description.<br/> |
| [ApplicationHealthStateChunkList](sfclient-model-applicationhealthstatechunklist.md) | The list of application health state chunks in the cluster that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ApplicationHealthStateFilter](sfclient-model-applicationhealthstatefilter.md) | Defines matching criteria to determine whether a application should be included in the cluster health chunk.<br/>One filter can match zero, one or multiple applications, depending on its properties.<br/> |
| [ApplicationInfo](sfclient-model-applicationinfo.md) | Information about a Service Fabric application.<br/> |
| [ApplicationMetricDescription](sfclient-model-applicationmetricdescription.md) | Describes capacity information for a custom resource balancing metric. This can be used to limit the total consumption of this metric by the services of this application.<br/> |
| [ApplicationNameInfo](sfclient-model-applicationnameinfo.md) | Information about the application name.<br/> |
| [ApplicationParameter](sfclient-model-applicationparameter.md) | Describes an application parameter override to be applied when creating or upgrading an application.<br/> |
| [ApplicationsHealthEvaluation](sfclient-model-applicationshealthevaluation.md) | Represents health evaluation for applications, containing health evaluations for each unhealthy application that impacted current aggregated health state.<br/> |
| [ApplicationTypeApplicationsHealthEvaluation](sfclient-model-applicationtypeapplicationshealthevaluation.md) | Represents health evaluation for applications of a particular application type. The application type applications evaluation can be returned when cluster health evaluation returns unhealthy aggregated health state, either Error or Warning. It contains health evaluations for each unhealthy application of the included application type that impacted current aggregated health state.<br/> |
| [ApplicationTypeHealthPolicyMapItem](sfclient-model-applicationtypehealthpolicymapitem.md) | Defines an item in ApplicationTypeHealthPolicyMap.<br/> |
| [ApplicationTypeImageStorePath](sfclient-model-applicationtypeimagestorepath.md) | Path description for the application package in the image store specified during the prior copy operation.<br/> |
| [ApplicationTypeImageStoreVersion](sfclient-model-applicationtypeimagestoreversion.md) | A version description for the application type<br/> |
| [ApplicationTypeInfo](sfclient-model-applicationtypeinfo.md) | Information about an application type.<br/> |
| [ApplicationTypeManifest](sfclient-model-applicationtypemanifest.md) | Contains the manifest describing an application type registered in a Service Fabric cluster.<br/> |
| [ApplicationUpgradeDescription](sfclient-model-applicationupgradedescription.md) | Describes the parameters for an application upgrade. Please note that upgrade description replaces the existing application description. This means that if the parameters are not specified, the existing parameters on the applications will be overwritten with the empty parameters list. This would results in application using the default value of the parameters from the application manifest. If you do not want to change any existing parameter values, please get the application parameters first using the GetApplicationInfo query and then supply those values as Parameters in this ApplicationUpgradeDescription.<br/> |
| [ApplicationUpgradeProgressInfo](sfclient-model-applicationupgradeprogressinfo.md) | Describes the parameters for an application upgrade.<br/> |
| [ApplicationUpgradeUpdateDescription](sfclient-model-applicationupgradeupdatedescription.md) | Describes the parameters for updating an ongoing application upgrade.<br/> |
| [ChaosContext](sfclient-model-chaoscontext.md) | Describes a map, which is a collection of (string, string) type key-value pairs. The map can be used to record information about<br/>the Chaos run. There cannot be more than 100 such pairs and each string (key or value) can be at most 4095 characters long. <br/>This map is set by the starter of the Chaos run to optionally store the context about the specific run.<br/> |
| [ChaosContextMapItem](sfclient-model-chaoscontextmapitem.md) | Describes an item in the ChaosContextMap in ChaosParameters.<br/> |
| [ChaosEvent](sfclient-model-chaosevent.md) | Represents an event generated during a Chaos run.<br/> |
| [ChaosEventWrapper](sfclient-model-chaoseventwrapper.md) | Wrapper object for Chaos event.<br/> |
| [ChaosParameters](sfclient-model-chaosparameters.md) | Defines all the parameters to configure a Chaos run.<br/> |
| [ChaosReport](sfclient-model-chaosreport.md) | Contains detailed Chaos report.<br/> |
| [ClusterConfiguration](sfclient-model-clusterconfiguration.md) | Information about the standalone cluster configuration.<br/> |
| [ClusterHealth](sfclient-model-clusterhealth.md) | Represents the health of the cluster.<br/>Contains the cluster aggregated health state, the cluster application and node health states as well as the health events and the unhealthy evaluations.<br/> |
| [ClusterHealthChunk](sfclient-model-clusterhealthchunk.md) | Represents the health chunk of the cluster.<br/>Contains the cluster aggregated health state, and the cluster entities that respect the input filter.<br/> |
| [ClusterHealthChunkQueryDescription](sfclient-model-clusterhealthchunkquerydescription.md) | The cluster health chunk query description, which can specify the health policies to evaluate cluster health and very expressive filters to select which cluster entities to include in response.<br/> |
| [ClusterHealthPolicies](sfclient-model-clusterhealthpolicies.md) | Health policies to evaluate cluster health.<br/> |
| [ClusterHealthPolicy](sfclient-model-clusterhealthpolicy.md) | Defines a health policy used to evaluate the health of the cluster or of a cluster node.<br/> |
| [ClusterManifest](sfclient-model-clustermanifest.md) | Information about the cluster manifest.<br/> |
| [ClusterUpgradeDescriptionObject](sfclient-model-clusterupgradedescriptionobject.md) | Represents a ServiceFabric cluster upgrade<br/> |
| [ClusterUpgradeHealthPolicyObject](sfclient-model-clusterupgradehealthpolicyobject.md) | Defines a health policy used to evaluate the health of the cluster during a cluster upgrade.<br/> |
| [ClusterUpgradeProgressObject](sfclient-model-clusterupgradeprogressobject.md) | Information about a cluster upgrade.<br/> |
| [CodePackageEntryPoint](sfclient-model-codepackageentrypoint.md) | Information about setup or main entry point of a code package deployed on a Service Fabric node.<br/> |
| [CodePackageEntryPointStatistics](sfclient-model-codepackageentrypointstatistics.md) | Statistics about setup or main entry point  of a code package deployed on a Service Fabric node.<br/> |
| [ComposeApplicationStatusInfo](sfclient-model-composeapplicationstatusinfo.md) | Information about a Service Fabric compose application.<br/> |
| [CreateComposeApplicationDescription](sfclient-model-createcomposeapplicationdescription.md) | Defines description for creating a Service Fabric compose application.<br/> |
| [CurrentUpgradeDomainProgressInfo](sfclient-model-currentupgradedomainprogressinfo.md) | Information about the current in-progress upgrade domain.<br/> |
| [DeactivationIntentDescription](sfclient-model-deactivationintentdescription.md) | Describes the intent or reason for deactivating the node.<br/> |
| [DeltaNodesCheckHealthEvaluation](sfclient-model-deltanodescheckhealthevaluation.md) | Represents health evaluation for delta nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when the aggregated health state of the cluster is Warning or Error.<br/> |
| [DeployedApplicationHealth](sfclient-model-deployedapplicationhealth.md) | Information about the health of an application deployed on a Service Fabric node.<br/> |
| [DeployedApplicationHealthEvaluation](sfclient-model-deployedapplicationhealthevaluation.md) | Represents health evaluation for a deployed application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [DeployedApplicationHealthState](sfclient-model-deployedapplicationhealthstate.md) | Represents the health state of a deployed application, which contains the entity identifier and the aggregated health state.<br/> |
| [DeployedApplicationHealthStateChunk](sfclient-model-deployedapplicationhealthstatechunk.md) | Represents the health state chunk of a deployed application, which contains the node where the application is deployed, the aggregated health state and any deployed service packages that respect the chunk query description filters.<br/> |
| [DeployedApplicationHealthStateChunkList](sfclient-model-deployedapplicationhealthstatechunklist.md) | The list of deployed application health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [DeployedApplicationHealthStateFilter](sfclient-model-deployedapplicationhealthstatefilter.md) | Defines matching criteria to determine whether a deployed application should be included as a child of an application in the cluster health chunk.<br/>The deployed applications are only returned if the parent application matches a filter specified in the cluster health chunk query description.<br/>One filter can match zero, one or multiple deployed applications, depending on its properties.<br/> |
| [DeployedApplicationInfo](sfclient-model-deployedapplicationinfo.md) | Information about application deployed on the node.<br/> |
| [DeployedApplicationsHealthEvaluation](sfclient-model-deployedapplicationshealthevaluation.md) | Represents health evaluation for deployed applications, containing health evaluations for each unhealthy deployed application that impacted current aggregated health state.<br/>Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedCodePackageInfo](sfclient-model-deployedcodepackageinfo.md) | Information about code package deployed on a Service Fabric node.<br/> |
| [DeployedServicePackageHealth](sfclient-model-deployedservicepackagehealth.md) | Information about the health of a service package for a specific application deployed on a Service Fabric node.<br/> |
| [DeployedServicePackageHealthEvaluation](sfclient-model-deployedservicepackagehealthevaluation.md) | Represents health evaluation for a deployed service package, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [DeployedServicePackageHealthState](sfclient-model-deployedservicepackagehealthstate.md) | Represents the health state of a deployed service package, containing the entity identifier and the aggregated health state.<br/> |
| [DeployedServicePackageHealthStateChunk](sfclient-model-deployedservicepackagehealthstatechunk.md) | Represents the health state chunk of a deployed service package, which contains the service manifest name and the service package aggregated health state.<br/> |
| [DeployedServicePackageHealthStateChunkList](sfclient-model-deployedservicepackagehealthstatechunklist.md) | The list of deployed service package health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [DeployedServicePackageHealthStateFilter](sfclient-model-deployedservicepackagehealthstatefilter.md) | Defines matching criteria to determine whether a deployed service package should be included as a child of a deployed application in the cluster health chunk.<br/>The deployed service packages are only returned if the parent entities match a filter specified in the cluster health chunk query description. The parent deployed application and its parent application must be included in the cluster health chunk.<br/>One filter can match zero, one or multiple deployed service packages, depending on its properties.<br/> |
| [DeployedServicePackageInfo](sfclient-model-deployedservicepackageinfo.md) | Information about service package deployed on a Service Fabric node.<br/> |
| [DeployedServicePackagesHealthEvaluation](sfclient-model-deployedservicepackageshealthevaluation.md) | Represents health evaluation for deployed service packages, containing health evaluations for each unhealthy deployed service package that impacted current aggregated health state. Can be returned when evaluating deployed application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedServiceReplicaDetailInfo](sfclient-model-deployedservicereplicadetailinfo.md) | Information about a Service Fabric service replica deployed on a node.<br/> |
| [DeployedServiceReplicaInfo](sfclient-model-deployedservicereplicainfo.md) | Information about a Service Fabric service replica deployed on a node.<br/> |
| [DeployedServiceTypeInfo](sfclient-model-deployedservicetypeinfo.md) | Information about service type deployed on a node, information such as the status of the service type registration on a node.<br/> |
| [DeployedStatefulServiceReplicaDetailInfo](sfclient-model-deployedstatefulservicereplicadetailinfo.md) | Information about a stateful replica running in a code package.<br/> |
| [DeployedStatefulServiceReplicaInfo](sfclient-model-deployedstatefulservicereplicainfo.md) | Information about a stateful service replica deployed on a node.<br/> |
| [DeployedStatelessServiceInstanceDetailInfo](sfclient-model-deployedstatelessserviceinstancedetailinfo.md) | Information about a stateless instance running in a code package.<br/> |
| [DeployedStatelessServiceInstanceInfo](sfclient-model-deployedstatelessserviceinstanceinfo.md) | Information about a stateless service instance deployed on a node.<br/> |
| [DeployServicePackageToNodeDescription](sfclient-model-deployservicepackagetonodedescription.md) | Defines description for downloading packages associated with a service manifest to image cache on a Service Fabric node.<br/> |
| [EnsureAvailabilitySafetyCheck](sfclient-model-ensureavailabilitysafetycheck.md) | Safety check that waits for ensures the avaiability of the partition. It waits until there are replicas avaiabile such that bring down this replica will not cause avaiability loss for the partition.<br/> |
| [EnsurePartitionQurumSafetyCheck](sfclient-model-ensurepartitionqurumsafetycheck.md) | Safety check that ensures that a quorum of replicas are not lost for a partition.<br/> |
| [EntityHealth](sfclient-model-entityhealth.md) | Health information common to all entities in the cluster. It contains the aggregated health state, health events and unhealthy evaluation.<br/> |
| [EntityHealthState](sfclient-model-entityhealthstate.md) | A base type for the health state of various entities in the cluster. It contains the aggregated health state.<br/> |
| [EntityHealthStateChunk](sfclient-model-entityhealthstatechunk.md) | A base type for the health state chunk of various entities in the cluster. It contains the aggregated health state.<br/> |
| [EntityHealthStateChunkList](sfclient-model-entityhealthstatechunklist.md) | A base type for the list of health state chunks found in the cluster. It contains the total number of health states that match the input filters.<br/> |
| [Epoch](sfclient-model-epoch.md) | An Epoch is a configuration number for the partition as a whole. When the configuration of the replica set changes, for example when the Primary replica changes, the operations that are replicated from the new Primary replica are said to be a new Epoch from the ones which were sent by the old Primary replica.<br/> |
| [EventHealthEvaluation](sfclient-model-eventhealthevaluation.md) | Represents health evaluation of a HealthEvent that was reported on the entity.<br/>The health evaluation is returned when evaluating health of an entity results in Error or Warning.<br/> |
| [ExecutingFaultsChaosEvent](sfclient-model-executingfaultschaosevent.md) | Describes a Chaos event that gets generated when Chaos has decided on the faults for an iteration. This Chaos event contains the details of the faults as a list of strings.<br/> |
| [FabricCodeVersionInfo](sfclient-model-fabriccodeversioninfo.md) | Information about a Service Fabric code version.<br/> |
| [FabricConfigVersionInfo](sfclient-model-fabricconfigversioninfo.md) | Information about a Service Fabric config version.<br/> |
| [FabricError](sfclient-model-fabricerror.md) | The REST API operations for Service Fabric return standard HTTP status codes. This type defines the additional information returned from the Service Fabric API operations that are not successful.<br/> |
| [FabricError_Error](sfclient-model-fabricerror_error.md) | Error object containing error code and error message.<br/> |
| [FailedUpgradeDomainProgressObject](sfclient-model-failedupgradedomainprogressobject.md) | The detailed upgrade progress for nodes in the current upgrade domain at the point of failure.<br/> |
| [FailureUpgradeDomainProgressInfo](sfclient-model-failureupgradedomainprogressinfo.md) | Information about the upgrade domain progress at the time of upgrade failure.<br/> |
| [FileInfo](sfclient-model-fileinfo.md) | Information about a image store file.<br/> |
| [FileVersion](sfclient-model-fileversion.md) | Information about the version of image store file.<br/> |
| [FolderInfo](sfclient-model-folderinfo.md) | Information about a image store folder. It inclues how many files this folder contains and its image store relative path.<br/> |
| [HealthEvaluation](sfclient-model-healthevaluation.md) | Represents a health evaluation which describes the data and the algorithm used by health manager to evaluate the health of an entity.<br/> |
| [HealthEvaluationWrapper](sfclient-model-healthevaluationwrapper.md) | Wrapper object for health evaluation.<br/> |
| [HealthEvent](sfclient-model-healthevent.md) | Represents health information reported on a health entity, such as cluster, application or node, with additional metadata added by the Health Manager.<br/> |
| [HealthInformation](sfclient-model-healthinformation.md) | Represents common health report information. It is included in all health reports sent to health store and in all health events returned by health queries.<br/> |
| [ImageStoreContent](sfclient-model-imagestorecontent.md) | Information about the image store content.<br/> |
| [ImageStoreCopyDescription](sfclient-model-imagestorecopydescription.md) | Information about how to copy image store content from one image store relative path to another image store relative path.<br/> |
| [Int64RangePartitionInformation](sfclient-model-int64rangepartitioninformation.md) | Describes the partition information for the integer range that is based on partition schemes.<br/> |
| [InvokeDataLossResult](sfclient-model-invokedatalossresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [InvokeQuorumLossResult](sfclient-model-invokequorumlossresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [KeyValueStoreReplicaStatus](sfclient-model-keyvaluestorereplicastatus.md) | Key value store related information for the replica.<br/> |
| [LoadMetricReport](sfclient-model-loadmetricreport.md) | Represents the load metric report which contains the time metric was reported, its name and value.<br/> |
| [LoadMetricReportInfo](sfclient-model-loadmetricreportinfo.md) | Information about load reported by replica.<br/> |
| [MonitoringPolicyDescription](sfclient-model-monitoringpolicydescription.md) | Describes the parameters for monitoring an upgrade in Monitored mode.<br/> |
| [NamedPartitionInformation](sfclient-model-namedpartitioninformation.md) | Describes the partition information for the name as a string that is based on partition schemes.<br/> |
| [NamedPartitionSchemeDescription](sfclient-model-namedpartitionschemedescription.md) | Describes the named partition scheme of the service.<br/> |
| [NodeDeactivationInfo](sfclient-model-nodedeactivationinfo.md) | Information about the node deactivation. This information is valid for a node that is undergoing deactivation or has already been deactivated.<br/> |
| [NodeDeactivationTask](sfclient-model-nodedeactivationtask.md) | The task representing the deactivation operation on the node.<br/> |
| [NodeDeactivationTaskId](sfclient-model-nodedeactivationtaskid.md) | Identity of the task related to deactivation operation on the node.<br/> |
| [NodeHealth](sfclient-model-nodehealth.md) | Information about the health of a Service Fabric node.<br/> |
| [NodeHealthEvaluation](sfclient-model-nodehealthevaluation.md) | Represents health evaluation for a node, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [NodeHealthState](sfclient-model-nodehealthstate.md) | Represents the health state of a node, which contains the node identifier and its aggregated health state.<br/> |
| [NodeHealthStateChunk](sfclient-model-nodehealthstatechunk.md) | Represents the health state chunk of a node, which contains the node name and its aggregated health state.<br/> |
| [NodeHealthStateChunkList](sfclient-model-nodehealthstatechunklist.md) | The list of node health state chunks in the cluster that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [NodeHealthStateFilter](sfclient-model-nodehealthstatefilter.md) | Defines matching criteria to determine whether a node should be included in the returned cluster health chunk.<br/>One filter can match zero, one or multiple nodes, depending on its properties.<br/>Can be specified in the cluster health chunk query description.<br/> |
| [NodeId](sfclient-model-nodeid.md) | An internal ID used by Service Fabric to uniquely identify a node. Node Id is deterministically generated from node name.<br/> |
| [NodeInfo](sfclient-model-nodeinfo.md) | Information about a node in Service Fabric cluster.<br/> |
| [NodeLoadInfo](sfclient-model-nodeloadinfo.md) | Information about load on a Service Fabric node. It holds a summary of all metrics and their load on a node.<br/> |
| [NodeLoadMetricInformation](sfclient-model-nodeloadmetricinformation.md) | Represents data structure that contains load information for a certain metric on a node.<br/> |
| [NodeResult](sfclient-model-noderesult.md) | Contains information about a node that was targeted by a user-induced operation.<br/> |
| [NodesHealthEvaluation](sfclient-model-nodeshealthevaluation.md) | Represents health evaluation for nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health and the aggregated health state is either Error or Warning.<br/> |
| [NodeTransitionProgress](sfclient-model-nodetransitionprogress.md) | Information about an NodeTransition operation.  This class contains an OperationState and a NodeTransitionResult.  The NodeTransitionResult is not valid until OperationState<br/>is Completed or Faulted.<br/> |
| [NodeTransitionResult](sfclient-model-nodetransitionresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [NodeUpgradeProgressInfo](sfclient-model-nodeupgradeprogressinfo.md) | Information about the upgrading node and its status<br/> |
| [OperationStatus](sfclient-model-operationstatus.md) | Contains the OperationId, OperationState, and OperationType for user-induced operations.<br/> |
| [PackageSharingPolicyInfo](sfclient-model-packagesharingpolicyinfo.md) | Represents a policy for the package sharing.<br/> |
| [PagedApplicationInfoList](sfclient-model-pagedapplicationinfolist.md) | The list of applications in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedApplicationTypeInfoList](sfclient-model-pagedapplicationtypeinfolist.md) | The list of application types that are provisioned or being provisioned in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedComposeApplicationStatusInfoList](sfclient-model-pagedcomposeapplicationstatusinfolist.md) | The list of compose applications in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedNodeInfoList](sfclient-model-pagednodeinfolist.md) | The list of nodes in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedReplicaInfoList](sfclient-model-pagedreplicainfolist.md) | The list of replicas in the cluster for a given partition. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedServiceInfoList](sfclient-model-pagedserviceinfolist.md) | The list of services in the cluster for an application. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedServicePartitionInfoList](sfclient-model-pagedservicepartitioninfolist.md) | The list of partition in the cluster for a service. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PartitionDataLossProgress](sfclient-model-partitiondatalossprogress.md) | Information about a partition data loss user-induced operation.<br/> |
| [PartitionHealth](sfclient-model-partitionhealth.md) | Information about the health of a Service Fabric partition.<br/> |
| [PartitionHealthEvaluation](sfclient-model-partitionhealthevaluation.md) | Represents health evaluation for a partition, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [PartitionHealthState](sfclient-model-partitionhealthstate.md) | Represents the health state of a partition, which contains the partition identifier and its aggregated health state.<br/> |
| [PartitionHealthStateChunk](sfclient-model-partitionhealthstatechunk.md) | Represents the health state chunk of a partition, which contains the partition id, its aggregated health state and any replicas that respect the filters in the cluster health chunk query description.<br/> |
| [PartitionHealthStateChunkList](sfclient-model-partitionhealthstatechunklist.md) | The list of partition health state chunks that respect the input filters in the chunk query description.<br/>Returned by get cluster health state chunks query as part of the parent application hierarchy.<br/> |
| [PartitionHealthStateFilter](sfclient-model-partitionhealthstatefilter.md) | Defines matching criteria to determine whether a partition should be included as a child of a service in the cluster health chunk.<br/>The partitions are only returned if the parent entities match a filter specified in the cluster health chunk query description. The parent service and application must be included in the cluster health chunk.<br/>One filter can match zero, one or multiple partitions, depending on its properties.<br/> |
| [PartitionInformation](sfclient-model-partitioninformation.md) | Information about the partition identity, partitioning scheme and keys supported by it.<br/> |
| [PartitionLoadInformation](sfclient-model-partitionloadinformation.md) | Represents load information for a partition, which contains the primary and secondary reported load metrics.<br/>In case there is no load reported, PartitionLoadInformation will contain the default load for the service of the partition.<br/>For default loads, LoadMetricReport's LastReportedUtc is set to 0.<br/> |
| [PartitionQuorumLossProgress](sfclient-model-partitionquorumlossprogress.md) | Information about a partition quorum loss user-induced operation.<br/> |
| [PartitionRestartProgress](sfclient-model-partitionrestartprogress.md) | Information about a partition restart user-induced operation.<br/> |
| [PartitionSchemeDescription](sfclient-model-partitionschemedescription.md) | Describes how the service is partitioned.<br/> |
| [PartitionsHealthEvaluation](sfclient-model-partitionshealthevaluation.md) | Represents health evaluation for the partitions of a service, containing health evaluations for each unhealthy partition that impacts current aggregated health state. Can be returned when evaluating service health and the aggregated health state is either Error or Warning.<br/> |
| [PrimaryReplicatorStatus](sfclient-model-primaryreplicatorstatus.md) |  |
| [RemoteReplicatorAcknowledgementDetail](sfclient-model-remotereplicatoracknowledgementdetail.md) | Provides various statistics of the acknowledgements that are being received from the remote replicator.<br/> |
| [RemoteReplicatorAcknowledgementStatus](sfclient-model-remotereplicatoracknowledgementstatus.md) | Provides details about the remote replicators from the primary replicator's point of view.<br/> |
| [RemoteReplicatorStatus](sfclient-model-remotereplicatorstatus.md) | Represents the state of the secondary replicator from the primary replicator’s point of view.<br/> |
| [ReplicaHealth](sfclient-model-replicahealth.md) | Represents a base class for stateful service replica or stateless service instance health.<br/>Contains the replica aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [ReplicaHealthEvaluation](sfclient-model-replicahealthevaluation.md) | Represents health evaluation for a replica, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ReplicaHealthState](sfclient-model-replicahealthstate.md) | Represents a base class for stateful service replica or stateless service instance health state.<br/> |
| [ReplicaHealthStateChunk](sfclient-model-replicahealthstatechunk.md) | Represents the health state chunk of a stateful service replica or a stateless service instance.<br/>The replica health state contains the replica ID and its aggregated health state.<br/> |
| [ReplicaHealthStateChunkList](sfclient-model-replicahealthstatechunklist.md) | The list of replica health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ReplicaHealthStateFilter](sfclient-model-replicahealthstatefilter.md) | Defines matching criteria to determine whether a replica should be included as a child of a partition in the cluster health chunk.<br/>The replicas are only returned if the parent entities match a filter specified in the cluster health chunk query description. The parent partition, service and application must be included in the cluster health chunk.<br/>One filter can match zero, one or multiple replicas, depending on its properties.<br/> |
| [ReplicaInfo](sfclient-model-replicainfo.md) | Information about the identity, status, health, node name, uptime, and other details about the replica.<br/> |
| [ReplicasHealthEvaluation](sfclient-model-replicashealthevaluation.md) | Represents health evaluation for replicas, containing health evaluations for each unhealthy replica that impacted current aggregated health state. Can be returned when evaluating partition health and the aggregated health state is either Error or Warning.<br/> |
| [ReplicaStatusBase](sfclient-model-replicastatusbase.md) | Information about the replica.<br/> |
| [ReplicatorQueueStatus](sfclient-model-replicatorqueuestatus.md) | Provides various statistics of the queue used in the service fabric replicator.<br/>Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.<br/>Depending on the role of the replicator, the properties in this type imply different meanings.<br/> |
| [ReplicatorStatus](sfclient-model-replicatorstatus.md) | Represents a base class for primary or secondary replicator status.<br/>Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.<br/> |
| [RepositoryCredential](sfclient-model-repositorycredential.md) | Credential information to connect to container repository.<br/> |
| [ResolvedServiceEndpoint](sfclient-model-resolvedserviceendpoint.md) | Endpoint of a resolved service partition.<br/> |
| [ResolvedServicePartition](sfclient-model-resolvedservicepartition.md) | Information about a service partition and its associated endpoints.<br/> |
| [RestartDeployedCodePackageDescription](sfclient-model-restartdeployedcodepackagedescription.md) | Defines description for restarting a deloyed code package on Service Fabric node.<br/> |
| [RestartNodeDescription](sfclient-model-restartnodedescription.md) | Describes the parameters to restart a Service Fabric node.<br/> |
| [RestartPartitionResult](sfclient-model-restartpartitionresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [ResumeApplicationUpgradeDescription](sfclient-model-resumeapplicationupgradedescription.md) | Describes the parameters for resuming an unmonitored manual Service Fabric application upgrade<br/> |
| [RollingUpgradeUpdateDescription](sfclient-model-rollingupgradeupdatedescription.md) | Describes the parameters for updating a rolling upgrade of application or cluster.<br/> |
| [SafetyCheck](sfclient-model-safetycheck.md) | Represents a safety check performed by service fabric before continuing with the operations. These checks ensure the avaiability of the service and the reliability of the state.<br/> |
| [SafetyCheckWrapper](sfclient-model-safetycheckwrapper.md) | A wrapper for the safety check object. Safety checks are performed by service fabric before continuing with the operations. These checks ensure the avaiability of the service and the reliability of the state.<br/> |
| [SecondaryActiveReplicatorStatus](sfclient-model-secondaryactivereplicatorstatus.md) | Status of the secondary replicator when it is in active mode and is part of the replica set.<br/> |
| [SecondaryIdleReplicatorStatus](sfclient-model-secondaryidlereplicatorstatus.md) | Status of the secondary replicator when it is in idle mode and is being built by the primary.<br/> |
| [SeedNodeSafetyCheck](sfclient-model-seednodesafetycheck.md) | Represents a safety check for the seed nodes being performed by service fabric before continuing with node level operations.<br/> |
| [SelectedPartition](sfclient-model-selectedpartition.md) | This class returns information about the partition that the user-induced operation acted upon.<br/> |
| [ServiceCorrelationDescription](sfclient-model-servicecorrelationdescription.md) | Creates a particular correlation between services.<br/> |
| [ServiceDescription](sfclient-model-servicedescription.md) | A ServiceDescription contains all of the information necessary to create a service.<br/> |
| [ServiceFromTemplateDescription](sfclient-model-servicefromtemplatedescription.md) | Defines description for creating a Service Fabric service from a template defined in the application manifest.<br/> |
| [ServiceHealth](sfclient-model-servicehealth.md) | Information about the health of a Service Fabric service.<br/> |
| [ServiceHealthEvaluation](sfclient-model-servicehealthevaluation.md) | Represents health evaluation for a service, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ServiceHealthState](sfclient-model-servicehealthstate.md) | Represents the health state of a service, which contains the service identifier and its aggregated health state.<br/> |
| [ServiceHealthStateChunk](sfclient-model-servicehealthstatechunk.md) | Represents the health state chunk of a service, which contains the service name, its aggregated health state and any partitions that respect the filters in the cluster health chunk query description.<br/> |
| [ServiceHealthStateChunkList](sfclient-model-servicehealthstatechunklist.md) | The list of service health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ServiceHealthStateFilter](sfclient-model-servicehealthstatefilter.md) | Defines matching criteria to determine whether a service should be included as a child of an application in the cluster health chunk.<br/>The services are only returned if the parent application matches a filter specified in the cluster health chunk query description.<br/>One filter can match zero, one or multiple services, depending on its properties.<br/> |
| [ServiceInfo](sfclient-model-serviceinfo.md) | Information about a Service Fabric service.<br/> |
| [ServiceLoadMetricDescription](sfclient-model-serviceloadmetricdescription.md) | Specifies a metric to load balance a service during runtime.<br/> |
| [ServiceNameInfo](sfclient-model-servicenameinfo.md) | Information about the service name.<br/> |
| [ServicePartitionInfo](sfclient-model-servicepartitioninfo.md) | Information about a partition of a Service Fabric service.<br/> |
| [ServicePlacementInvalidDomainPolicyDescription](sfclient-model-serviceplacementinvaliddomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where a particular fault or upgrade domain should not be used for placement of the instances or replicas of that service.<br/> |
| [ServicePlacementNonPartiallyPlaceServicePolicyDescription](sfclient-model-serviceplacementnonpartiallyplaceservicepolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where all replicas must be able to be placed in order for any replicas to be created.<br/> |
| [ServicePlacementPolicyDescription](sfclient-model-serviceplacementpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service.<br/> |
| [ServicePlacementPreferPrimaryDomainPolicyDescription](sfclient-model-serviceplacementpreferprimarydomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where the service's Primary replicas should optimally be placed in a particular domain.<br/><br/>This placement policy is usually used with fault domains in scenarios where the Service Fabric cluster is geographically distributed in order to indicate that a service�s primary replica should be located in a particular fault domain, which in geo-distributed scenarios usually aligns with regional or datacenter boundaries. Note that since this is an optimization it is possible that the Primary replica may not end up located in this domain due to failures, capacity limits, or other constraints.<br/> |
| [ServicePlacementRequiredDomainPolicyDescription](sfclient-model-serviceplacementrequireddomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where the instances or replicas of that service must be placed in a particular domain<br/> |
| [ServicePlacementRequireDomainDistributionPolicyDescription](sfclient-model-serviceplacementrequiredomaindistributionpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where two replicas from the same partition should never be placed in the same fault or upgrade domain.<br/><br/>While this is not common it can expose the service to an increased risk of concurrent failures due to unplanned outages or other cases of subsequent/concurrent failures. As an example, consider a case where replicas are deployed across different data center, with one replica per location. In the event that one of the datacenters goes offline, normally the replica that was placed in that datacenter will be packed into one of the remaining datacenters. If this is not desirable then this policy should be set.<br/> |
| [ServicesHealthEvaluation](sfclient-model-serviceshealthevaluation.md) | Represents health evaluation for services of a certain service type belonging to an application, containing health evaluations for each unhealthy service that impacted current aggregated health state. Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [ServiceTypeDescription](sfclient-model-servicetypedescription.md) | Describes a service type defined in the service manifest of a provisioned application type. The properties the the ones defined in the service manifest.<br/> |
| [ServiceTypeExtensionDescription](sfclient-model-servicetypeextensiondescription.md) | Describes extension of a service type defined in the service manifest.<br/> |
| [ServiceTypeHealthPolicy](sfclient-model-servicetypehealthpolicy.md) | Represents the health policy used to evaluate the health of services belonging to a service type.<br/> |
| [ServiceTypeHealthPolicyMapItem](sfclient-model-servicetypehealthpolicymapitem.md) | Defines an item in ServiceTypeHealthPolicyMap.<br/> |
| [ServiceTypeInfo](sfclient-model-servicetypeinfo.md) | Information about a service type that is defined in a service manifest of a provisioned application type.<br/> |
| [ServiceTypeManifest](sfclient-model-servicetypemanifest.md) | Contains the manifest describing a service type registered as part of an application in a Service Fabric cluster.<br/> |
| [ServiceUpdateDescription](sfclient-model-serviceupdatedescription.md) | A ServiceUpdateDescription contains all of the information necessary to update a service.<br/> |
| [SingletonPartitionInformation](sfclient-model-singletonpartitioninformation.md) | Information about a partition that is singleton. The services with singletone partitioning scheme are effectively non-partitioned. They only have one partition.<br/> |
| [SingletonPartitionSchemeDescription](sfclient-model-singletonpartitionschemedescription.md) | Describes the partition scheme of a singleton-partitioned, or non-partitioned service.<br/> |
| [StartedChaosEvent](sfclient-model-startedchaosevent.md) | Describes a Chaos event that gets generated when Chaos is started.<br/> |
| [StartNodeDescription](sfclient-model-startnodedescription.md) | Describes the parameter for starting a stopped Service Fabric node.<br/> |
| [StatefulServiceDescription](sfclient-model-statefulservicedescription.md) | Describes a stateful service.<br/> |
| [StatefulServiceInfo](sfclient-model-statefulserviceinfo.md) | Information about a stateful Service Fabric service.<br/> |
| [StatefulServicePartitionInfo](sfclient-model-statefulservicepartitioninfo.md) | Information about a partition of a stateful Service Fabric service..<br/> |
| [StatefulServiceReplicaHealth](sfclient-model-statefulservicereplicahealth.md) | Represents the health of the stateful service replica.<br/>Contains the replica aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatefulServiceReplicaHealthState](sfclient-model-statefulservicereplicahealthstate.md) | Represents the health state of the stateful service replica, which contains the replica id and the aggregated health state.<br/> |
| [StatefulServiceReplicaInfo](sfclient-model-statefulservicereplicainfo.md) | Represents a stateful service replica. This includes information about the identity, role, status, health, node name, uptime, and other details about the replica.<br/> |
| [StatefulServiceTypeDescription](sfclient-model-statefulservicetypedescription.md) | Describes a stateful service type defined in the service manifest of a provisioned application type.<br/> |
| [StatefulServiceUpdateDescription](sfclient-model-statefulserviceupdatedescription.md) | Describes an update for a stateful service.<br/> |
| [StatelessServiceDescription](sfclient-model-statelessservicedescription.md) | Describes a stateless service.<br/> |
| [StatelessServiceInfo](sfclient-model-statelessserviceinfo.md) | Information about a stateless Service Fabric service.<br/> |
| [StatelessServiceInstanceHealth](sfclient-model-statelessserviceinstancehealth.md) | Represents the health of the statelss service instance.<br/>Contains the instance aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatelessServiceInstanceHealthState](sfclient-model-statelessserviceinstancehealthstate.md) | Represents the health state of the stateless service instance, which contains the instance id and the aggregated health state.<br/> |
| [StatelessServiceInstanceInfo](sfclient-model-statelessserviceinstanceinfo.md) | Represents a stateless service instance. This includes information about the identity, status, health, node name, uptime, and other details about the instance.<br/> |
| [StatelessServicePartitionInfo](sfclient-model-statelessservicepartitioninfo.md) | Information about a partition of a stateless Service Fabric service.<br/> |
| [StatelessServiceTypeDescription](sfclient-model-statelessservicetypedescription.md) | Describes a stateless service type defined in the service manifest of a provisioned application type.<br/> |
| [StatelessServiceUpdateDescription](sfclient-model-statelessserviceupdatedescription.md) | Describes an update for a stateless service.<br/> |
| [StopNodeDescription](sfclient-model-stopnodedescription.md) | Describes the parameter for stopping a Service Fabric node.<br/> |
| [StoppedChaosEvent](sfclient-model-stoppedchaosevent.md) | Describes a Chaos event that gets generated when Chaos stops because either the user issued a stop or the time to run was up.<br/> |
| [SystemApplicationHealthEvaluation](sfclient-model-systemapplicationhealthevaluation.md) | Represents health evaluation for the fabric:/System application, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state of the cluster is either Error or Warning.<br/> |
| [TestErrorChaosEvent](sfclient-model-testerrorchaosevent.md) | Describes a Chaos event that gets generated when an unexpected event occurs in the Chaos engine.<br/>For example, due to the cluster snapshot being inconsistent, while faulting a faultable entity, Chaos found that the entity was alreay faulted -- which would be an unexpected event.<br/> |
| [UniformInt64RangePartitionSchemeDescription](sfclient-model-uniformint64rangepartitionschemedescription.md) | Describes a partitioning scheme where an integer range is allocated evenly across a number of partitions.<br/> |
| [UpgradeDomainDeltaNodesCheckHealthEvaluation](sfclient-model-upgradedomaindeltanodescheckhealthevaluation.md) | Represents health evaluation for delta unhealthy cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when cluster aggregated health state is Warning or Error.<br/> |
| [UpgradeDomainInfo](sfclient-model-upgradedomaininfo.md) | Information about an upgrade domain.<br/> |
| [UpgradeDomainNodesHealthEvaluation](sfclient-model-upgradedomainnodeshealthevaluation.md) | Represents health evaluation for cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health during cluster upgrade and the aggregated health state is either Error or Warning.<br/> |
| [ValidationFailedChaosEvent](sfclient-model-validationfailedchaosevent.md) | Chaos event corresponding to a failure during validation.<br/> |
| [WaitForInbuildReplicaSafetyCheck](sfclient-model-waitforinbuildreplicasafetycheck.md) | Safety check that waits for the replica build operation to finish. This indiciates that there is a replica that is going through the copy or is providing data for building another replica. Bring the node down will abort this copy operation which are typoically expensive involving data movements.<br/> |
| [WaitForPrimaryPlacementSafetyCheck](sfclient-model-waitforprimaryplacementsafetycheck.md) | Safety check that waits for the primary replica that was moved out of the node due to upgrade to be placed back again on that node.<br/> |
| [WaitForPrimarySwapSafetyCheck](sfclient-model-waitforprimaryswapsafetycheck.md) | Safety check that waits for the primary replica to be moved out of the node before starting an upgrade to ensure the avaiability of the primary replica for the partition.<br/> |
| [WaitForReconfigurationSafetyCheck](sfclient-model-waitforreconfigurationsafetycheck.md) | Safety check that waits for the current reconfiguration of the partition to be completed before starting an upgrade.<br/> |
| [WaitingChaosEvent](sfclient-model-waitingchaosevent.md) | Describes a Chaos event that gets generated when Chaos is waiting for the cluster to become ready for faulting, for example, Chaos may be waiting for the on-going upgrade to finish.<br/> |

