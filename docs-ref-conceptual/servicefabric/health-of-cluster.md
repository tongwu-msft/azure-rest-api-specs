---
title: "Get the health of a cluster using health chunks with advanced health state filters and health policies"
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
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
ms.assetid: b52888f0-9084-4427-9e80-8d2c7afa38c6
caps.latest.revision: 4
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
# Get the health of a cluster using health chunks with advanced health state filters and health policies
Gets the health of a Service Fabric cluster using health chunks.  
  
## Request  
 See [Cluster](cluster.md) for headers and parameters that are used by all requests related to the cluster.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|The following URI gets the cluster health chunk: \<URI>$/GetClusterHealthChunk?api-version={api-version}|  
  
 Request body:  
  
 The request body contains the ClusterHealthChunkQueryDescription, which has the following fields:  
  
-   ClusterHealthPolicy which describes the health policy used to evaluate the cluster and nodes. If not present, the health evaluation uses the health policy from cluster manifest or the default health policy. Fields:  
  
    ```  
    {  
            "ConsiderWarningAsError": false|true,  
            "MaxPercentUnhealthyNodes": <value>,  
            "MaxPercentUnhealthyApplications": <value>  
            "ApplicationTypeHealthPolicyMap":[{"Key":"<value>","Value":<value>}]  
    }  
    ```  
  
    |Element Name|Required|Type|Description|  
    |------------------|--------------|----------|-----------------|  
    |ConsiderWarningAsError|Yes|Boolean|Determines whether warnings should be treated with the same severity as errors. Value of `true` to treat warnings as errors; `false` to not treat warnings as errors.|  
    |MaxPercentUnhealthyNodes|Yes|Number|The maximum allowed percentage of unhealthy applications before reporting an error. For example, to allow 10% of applications to be unhealthy, this value would be 10.|  
    |MaxPercentUnhealthyApplications|Yes|Number|The maximum allowed percentage of unhealthy nodes before reporting an error. For example, to allow 10% of nodes to be unhealthy, this value would be 10.|  
    |ApplicationTypeHealthPolicyMap|Yes||Specifies the map that defines the maximum percentage of unhealthy applications that are allowed per application type. Application types in this map are evaluated using specific percentages rather than the global MaxPercentUnhealthyApplications percentage. For example, if some applications of a type are critical, the cluster administrator can add an entry to the map for that application type and assign it a value of 0% (that is, do not tolerate any failures). All other applications can be evaluated with MaxPercentUnhealthyApplications set to 20% to tolerate some failures out of the thousands of application instances.The application type health policy map is used only if the cluster manifest enables application type health evaluation using the configuration entry for HealthManager/EnableApplicationTypeHealthEvaluation.|  
  
-   ApplicationHealthPolicies containing application health policies to be used to evaluate specific applications. If an application has no entry in this map, it is evaluated with the health policy from the application manifest or with default application health policy. Fields:  
  
    -   ApplicationHealthPolicyMap – map with ApplicationHealthPolicy per application name.  
  
        ```  
        "ApplicationHealthPolicies":  
        {  
        "ApplicationHealthPolicyMap":[  
        {"Key":”<value>”,  
        "Value":{  
        "ConsiderWarningAsError":false|true,  
        "MaxPercentUnhealthyDeployedApplications":<value>,  
        "DefaultServiceTypeHealthPolicy":{  
        "MaxPercentUnhealthyServices":<value>,  
        "MaxPercentUnhealthyPartitionsPerService":<value>,  
        "MaxPercentUnhealthyReplicasPerPartition":<value>  
        },  
        "ServiceTypeHealthPolicyMap":[  
        {"Key":"value",  
        "Value":{  
        "MaxPercentUnhealthyServices":<value>,  
        "MaxPercentUnhealthyPartitionsPerService":<value>,  
        "MaxPercentUnhealthyReplicasPerPartition":<value>  
        }  
        }]  
        }  
        }]  
        }  
        ```  
  
    -   “Key” represents the Application name used to identify the application.  
  
    -   “Value” represents the application health policy for specified application. The ApplicationHealthPolicy fields are:  
  
        |Element name|Required|Type|Description|  
        |------------------|--------------|----------|-----------------|  
        |ConsiderWarningAsError|Yes|Boolean|Determines whether warnings should be treated with the same severity as errors.|  
        |MaxPercentUnhealthyDeployedApplications|Yes|Number|The maximum allowed percentage of unhealthy deployed applications.|  
        |DefaultServiceTypeHealthPolicy|Yes|Number|The health policy used by default to evaluate the health of a service type.|  
        |MaxPercentUnhealthyServices|Yes|Number|The maximum allowed percentage of unhealthy services.|  
        |MaxPercentUnhealthyPartitionsPerService|Yes|Number|The maximum allowed percentage of unhealthy partitions per service.|  
        |MaxPercentUnhealthyReplicasPerPartition|Yes|Number|The maximum allowed percentage of unhealthy replicas per partition.|  
  
-   NodeFilters which represent a list of node filters (NodeHealthStateFilters) used to determine what nodes are returned in the result. By default, no nodes are returned. Fields:  
  
    ```  
    "NodeFilters":[  
    	{  
    “NodeNameFilter":"<value>",  
    "HealthStateFilter":<value>  
        }  
    ]  
    ```  
  
    |Element Name|Required|Type|Description|  
    |------------------|--------------|----------|-----------------|  
    |NodeNameFilter|No|String|Identifies the node to which the filter applies to. If not specified, the filter applies to all nodes.|  
    |HealthStateFilter|Yes|Number|The health state filter used to select nodes based on their aggregated health state. The value can be obtained from members or bitwise operations on members of HealthStateFilter. Only nodes that match the filter will be returned. All nodes will be used to evaluate the aggregated health state. If not specified, defaults to None. Possible values are:<br /><br /> -   Default - Default value. Matches any HealthState. The value is zero.<br />-   None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.<br />-   Ok - Filter that matches input with HealthState value Ok. The value is 2.<br />-   Warning - Filter that matches input with HealthState value Warning. The value is 4.<br />-   Error - Filter that matches input with HealthState value Error. The value is 8.<br />-   All - Filter that matches input with any HealthState value. The value is 65535.|  
  
-   ApplicationFilters which represent a list of application filters (ApplicationHealthStateFilters) used to determine what application and children of applications are returned in the result. By default, no applications are returned. Fields:  
  
    ```  
    "ApplicationFilters":[  
    	{  
    "HealthStateFilter":<value>,  
      "ApplicationNameFilter":"<value>",  
    		"ApplicationTypeFilter":"<value>",  
    		"ServiceFilters":[  
    		{  
    "HealthStateFilter":<value>,  
    			"ServiceNameFilter":"<value>",  
    			"PartitionFilters":[  
    			{  
    "HealthStateFilter":<value>,  
    				“PartitionIdFilter”:”<value”>,  
    				"ReplicaFilters":[  
    				{  
    "HealthStateFilter":<value>,  
     "ReplicaOrInstanceIdFilter":"<value>"  
    }]  
    			}]  
    		}],  
    	"DeployedApplicationFilters":[  
    		{  
    "NodeNameFilter":"<value>",  
    			"DeployedServicePackageFilters":[  
    			{  
    "HealthStateFilter":<value>,  
    				"ServiceManifestNameFilter":"<value>"  
    			}]  
    		}]  
    }]  
  
    ```  
  
    |Element Name|Required|Type|Description|  
    |------------------|--------------|----------|-----------------|  
    |ApplicationNameFilter|No|String|Identifies the application to which the filter applies to. The most specific filter. If not specified, the filter is not specific to an application but to all applications as specified by the other fields.|  
    |ApplicationTypeNameFilter|No|String|Identifies the application type to which the filter applies to.|  
    |HealthStateFilter|Yes|Number|The health state filter used to select applications based on their aggregated health state. The value can be obtained from members or bitwise operations on members of HealthStateFilter. Only applications that match the filter will be returned. All applications will be used to evaluate the aggregated health state. If not specified, defaults to None. Possible values are:<br /><br /> -   Default - Default value. Matches any HealthState. The value is zero.<br />-   None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.<br />-   Ok - Filter that matches input with HealthState value Ok. The value is 2.<br />-   Warning - Filter that matches input with HealthState value Warning. The value is 4.<br />-   Error - Filter that matches input with HealthState value Error. The value is 8.<br />-   All - Filter that matches input with any HealthState value. The value is 65535.|  
    |ServiceFilters|No|Object|List of service health state filters used to determine which service children are returned in result.|  
    |ServiceNameFilter|No|String|Identifies the service to which the filter applies to. If not specified, the filter applies to all services.|  
    |HealthStateFilter|Yes|Number|The health state filter used to select services based on their aggregated health state. The value can be obtained from members or bitwise operations on members of HealthStateFilter. Only services that match the filter will be returned. All services will be used to evaluate the aggregated health state. If not specified, defaults to None. Possible values are:<br /><br /> -   Default - Default value. Matches any HealthState. The value is zero.<br />-   None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.<br />-   Ok - Filter that matches input with HealthState value Ok. The value is 2.<br />-   Warning - Filter that matches input with HealthState value Warning. The value is 4.<br />-   Error - Filter that matches input with HealthState value Error. The value is 8.<br />-   All - Filter that matches input with any HealthState value. The value is 65535.|  
    |PartitionFilters|No|No|List of partition health state filters used to determine which partition children are returned in result.|  
    |PartitionIdFilter|No|Guid|Identifies the partition to which the filter applies to. If not specified, the filter applies to all partitions.|  
    |HealthStateFilter|Yes|Number|The health state filter used to select partitions based on their aggregated health state. The value can be obtained from members or bitwise operations on members of HealthStateFilter. Only partitions that match the filter will be returned. All partitions will be used to evaluate the aggregated health state. If not specified, defaults to None. Possible values are:<br /><br /> -   Default - Default value. Matches any HealthState. The value is zero.<br />-   None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.<br />-   Ok - Filter that matches input with HealthState value Ok. The value is 2.<br />-   Warning - Filter that matches input with HealthState value Warning. The value is 4.<br />-   Error - Filter that matches input with HealthState value Error. The value is 8.<br />-   All - Filter that matches input with any HealthState value. The value is 65535.|  
    |ReplicaFilters|No|Object|List of replica health state filters used to determine which replica children are returned in result.|  
    |ReplicaOrInstanceIdFilter|No|Guid|Identifies the replica to which the filter applies to. If not specified, the filter applies to all replicas.|  
    |HealthStateFilter|Yes|Number|The health state filter used to select replicas based on their aggregated health state. The value can be obtained from members or bitwise operations on members of HealthStateFilter. Only replicas that match the filter will be returned. All replicas will be used to evaluate the aggregated health state. If not specified, defaults to None. Possible values are:<br /><br /> -   Default - Default value. Matches any HealthState. The value is zero.<br />-   None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.<br />-   Ok - Filter that matches input with HealthState value Ok. The value is 2.<br />-   Warning - Filter that matches input with HealthState value Warning. The value is 4.<br />-   Error - Filter that matches input with HealthState value Error. The value is 8.<br />-   All - Filter that matches input with any HealthState value. The value is 65535.|  
    |DeployedApplicationFilters|No|Object|List of deployed application health state filters used to determine which deployed application children are returned in result.|  
    |NodeNameFilter|No|String|Identifies the node name where the application is deployed. If not specified, the filter applies to all deployed applications.|  
    |HealthStateFilter|Yes|Number|The health state filter used to select deployed applications based on their aggregated health state. The value can be obtained from members or bitwise operations on members of HealthStateFilter. Only deployed applications that match the filter will be returned. All deployed applications will be used to evaluate the aggregated health state. If not specified, defaults to None. Possible values are:<br /><br /> -   Default - Default value. Matches any HealthState. The value is zero.<br />-   None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.<br />-   Ok - Filter that matches input with HealthState value Ok. The value is 2.<br />-   Warning - Filter that matches input with HealthState value Warning. The value is 4.<br />-   Error - Filter that matches input with HealthState value Error. The value is 8.<br />-   All - Filter that matches input with any HealthState value. The value is 65535.|  
    |DeployedServicePackageFilters|No|Object|List of deployed service package health state filters used to determine which deployed service package children are returned in result.|  
    |ServiceManifestNameFilter|No|String|Identifies the service manifest name of the deployed service package. If not specified, the filter applies to all deployed service packages.|  
    |HealthStateFilter|Yes|Number|The health state filter used to select deployed service packages based on their aggregated health state. The value can be obtained from members or bitwise operations on members of HealthStateFilter. Only deployed service packages that match the filter will be returned. All deployed service packages will be used to evaluate the aggregated health state. If not specified, defaults to None. Possible values are:<br /><br /> -   Default - Default value. Matches any HealthState. The value is zero.<br />-   None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.<br />-   Ok - Filter that matches input with HealthState value Ok. The value is 2.<br />-   Warning - Filter that matches input with HealthState value Warning. The value is 4.<br />-   Error - Filter that matches input with HealthState value Error. The value is 8.<br />-   All - Filter that matches input with any HealthState value. The value is 65535.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see Status and Error Codes.  
  
```  
{  
  "HealthState": 1,  
  "NodeHealthStateChunks":  
     {  
	"TotalCount": 2,  
     "Items":  
     [  
     	{  
            		"NodeName": "N0020",  
			"HealthState": 1  
            },  
            {  
                    "NodeName": "N0050",  
                    "HealthState": 1  
             }  
	]  
     },  
     "ApplicationHealthStateChunks":  
     {  
  	"TotalCount": 2,  
     "Items":  
	 [  
		{  
             	"ApplicationName": "fabric:/System",  
              "ApplicationTypeName": "",  
                    "HealthState": 1,  
                    "ServiceHealthStateChunks":  
                    {  
                        "TotalCount": 0,  
                        "Items":  
                        [  
                        ]  
                    },  
                    "DeployedApplicationHealthStateChunks":  
                    {  
                        "TotalCount": 0,  
                        "Items":  
                        [  
                        ]  
                    }  
              },  
              {  
                    "ApplicationName": "fabric:/TestApp1",  
                    "ApplicationTypeName": "MyAppType",  
                    "HealthState": 1,  
                    "ServiceHealthStateChunks":  
                    {  
                        "TotalCount": 3,  
                        "Items":  
                        [  
                            {  
                                "ServiceName": "fabric:/TestApp1/VolatileServ",  
                                "HealthState": 1,  
                                "PartitionHealthStateChunks":  
                                {  
                                    "TotalCount": 3,  
                                    "Items":  
                                    [  
                                        {  
                                            "PartitionId": "d15c2c8d-2c2f-4bfb-b2f2-5f76d81bae7a",  
                                            "HealthState": 1,  
                                            "ReplicaHealthStateChunks":  
                                            {  
                                                "TotalCount": 3,  
                                                "Items":  
                                                [  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172906026736",  
                                                        "HealthState": 1  
                                                    },  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172993708082",  
                                                        "HealthState": 1  
                                                    },  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172993708081",  
                                                        "HealthState": 1  
                                                    }  
                                                ]  
                                            }  
                                        },  
                                        {  
                                            "PartitionId": "8aafae20-fe91-4d44-9d86-58c733b92679",  
                                            "HealthState": 1,  
                                            "ReplicaHealthStateChunks":  
                                            {  
                                                "TotalCount": 3,  
                                                "Items":  
                                                [  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982173026461639",  
                                                        "HealthState": 1  
                                                    },  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172978447170",  
                                                        "HealthState": 1  
                                                    },  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172906026736",  
                                                        "HealthState": 1  
                                                    }  
                                                ]  
                                            }  
                                        },  
                                        {  
                                            "PartitionId": "ded91228-1f4c-4afe-b00f-a4054ff3cf40",  
                                            "HealthState": 1,  
                                            "ReplicaHealthStateChunks":  
                                            {  
                                                "TotalCount": 3,  
                                                "Items":  
                                                [  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172993708082",  
                                                        "HealthState": 1  
                                                    },  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172906026736",  
                                                        "HealthState": 1  
                                                    },  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172993708081",  
                                                        "HealthState": 1  
                                                    }  
                                                ]  
                                            }  
                                        }  
                                    ]  
                                }  
                            },  
                            {  
                                "ServiceName": "fabric:/TestApp1/PersistServ",  
                                "HealthState": 1,  
                                "PartitionHealthStateChunks":  
                                {  
                                    "TotalCount": 3,  
                                    "Items":  
                                    [  
                                        {  
                                            "PartitionId": "3a21e4f4-79eb-4f6a-ac10-00b901cc1a27",  
                                            "HealthState": 1,  
                                            "ReplicaHealthStateChunks":  
                                            {  
                                                "TotalCount": 3,  
                                                "Items":  
                                                [  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172993708082",  
                                                        "HealthState": 1  
                                                    },  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172906026736",  
                                                        "HealthState": 1  
                                                    },  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172993708081",  
                                                        "HealthState": 1  
                                                    }  
                                                ]  
                                            }  
                                        },  
                                        {  
                                            "PartitionId": "1611a3bc-f7a8-4b4e-af1f-96e8f4f545c2",  
                                            "HealthState": 1,  
                                            "ReplicaHealthStateChunks":  
                                            {  
                                                "TotalCount": 3,  
                                                "Items":  
                                                [  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172993708082",  
                                                        "HealthState": 1  
                                                    },  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172993708081",  
                                                        "HealthState": 1  
                                                    },  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172906026736",  
                                                        "HealthState": 1  
                                                    }  
                                                ]  
                                            }  
                                        },  
                                        {  
                                            "PartitionId": "2248e683-9771-4730-8a75-5b19efa8e637",  
                                            "HealthState": 1,  
                                            "ReplicaHealthStateChunks":  
                                            {  
                                                "TotalCount": 3,  
                                                "Items":  
                                                [  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172906026736",  
                                                        "HealthState": 1  
                                                    },  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172993708082",  
                                                        "HealthState": 1  
                                                    },  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172993708081",  
                                                        "HealthState": 1  
                                                    }  
                                                ]  
                                            }  
                                        }  
                                    ]  
                                }  
                            },  
                            {  
                                "ServiceName": "fabric:/TestApp1/StatelessServ",  
                                "HealthState": 1,  
                                "PartitionHealthStateChunks":  
                                {  
                                    "TotalCount": 1,  
                                    "Items":  
                                    [  
                                        {  
                                            "PartitionId": "c6f9115c-eccd-409d-a541-d8277fccaddd",  
                                            "HealthState": 1,  
                                            "ReplicaHealthStateChunks":  
                                            {  
                                                "TotalCount": 3,  
                                                "Items":  
                                                [  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172906026738",  
                                                        "HealthState": 1  
                                                    },  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172906026737",  
                                                        "HealthState": 1  
                                                    },  
                                                    {  
                                                        "ReplicaOrInstanceId": "130982172906026736",  
                                                        "HealthState": 1  
                                                    }  
                                                ]  
                                            }  
                                        }  
                                    ]  
                                }  
                            }  
                        ]  
                    },  
                    "DeployedApplicationHealthStateChunks":  
                    {  
                        "TotalCount": 1,  
                        "Items":  
                        [  
                            {  
                                "NodeName": "N0010",  
                                "HealthState": 1,  
                                "DeployedServicePackageHealthStateChunks":  
                                {  
                                    "TotalCount": 1,  
                                    "Items":  
                                    [  
                                        {  
                                            "ServiceManifestName": "SP1",  
                                            "HealthState": 1  
                                        }  
                                    ]  
                                }  
                            }  
                        ]  
                    }  
                }  
            ]  
        }  
    }  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|HealthState|The aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|NodeHealthStateChunks|The node health state chunk list as an object that contains an array of node health state chunks as JSON objects and the total count.|  
|TotalCount|The total number of node health state chunks that respect query input filters.|  
|Items|The node health state chunks as JSON list.|  
|NodeName|The node name.|  
|HealthState|The node aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|ApplicationHealthStateChunks|The application health state chunk list as an object that contains an array of application health state chunks as JSON objects and the total count.|  
|TotalCount|The total number of application health state chunks that respect query input filters.|  
|Items|The application health state chunks as JSON list.|  
|ApplicationName|The application name.|  
|ApplicationTypeName|The application type.|  
|HealthState|The application aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|ServiceHealthStateChunks|The service health state chunk list as an object that contains an array of service health state chunks as JSON objects and the total count.|  
|TotalCount|The total number of service health state chunks that respect query input filters.|  
|Items|The service health state chunks as JSON list.|  
|ServiceName|The service name.|  
|HealthState|The service aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|PartitionHealthStateChunks|The partition health state chunk list as an object that contains an array of partition health state chunks as JSON objects and the total count.|  
|TotalCount|The total number of partition health state chunks that respect query input filters.|  
|Items|The partition health state chunks as JSON list.|  
|PartitionId|Guid that represents the partition id.|  
|HealthState|The partition aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|ReplicaHealthStateChunks|The replica health state chunk list as an object that contains an array of replica health state chunks as JSON objects and the total count.|  
|TotalCount|The total number of replica health state chunks that respect query input filters.|  
|Items|The replica health state chunks as JSON list.|  
|ReplicaOrInstanceId|The stateful service replica id or stateless service instance id.|  
|HealthState|The replica or instance aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|DeployedApplicationHealthStateChunks|The deployed application health state chunk list as an object that contains an array of deployed application health state chunks as JSON objects and the total count.|  
|TotalCount|The total number of deployed application health state chunks that respect query input filters.|  
|Items|The deployed application health state chunks as JSON list.|  
|NodeName|The node where the application is deployed.|  
|HealthState|The deployed application aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|DeployedServicePackageHealthStateChunks|The deployed service package health state chunk list as an object that contains an array of deployed service package health state chunks as JSON objects and the total count.|  
|TotalCount|The total number of deployed service package health state chunks that respect query input filters.|  
|Items|The deployed service package health state chunks as JSON list.|  
|ServiceManifestName|The service manifest name of the deployed service package.|  
|HealthState|The deployed service package aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|