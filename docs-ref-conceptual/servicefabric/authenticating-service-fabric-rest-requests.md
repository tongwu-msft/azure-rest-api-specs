---
title: "Authenticating Service Fabric REST Requests"
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
ms.assetid: 62e8780d-a106-4d28-8b1e-4a78790013e0
caps.latest.revision: 9
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
# Authenticating Service Fabric REST Requests
A Service Fabric cluster can be secured using X.509 certificates, Kerberos, or a combination of X.509 certificates and Kerberos. This topic describes:  
  
-   How to edit the cluster manifest to make the HttpGatewayEndpoints (REST endpoint) adhere the specific security solution.  
  
-   How to modify the REST calls to work with each solution (X.509, Kerberos, or X.509 with Kerberos).  
  
## Http Gateway with X.509 Security  
 On Azure and on-premises, REST endpoints of Service Fabric support using X.509 certificates for:  
  
1.  Authentication and authorization of clients: Service Fabric can be configured to give user access, admin access or no access to a REST client, depending on the certificates.  
  
2.  Authentication of Service Fabric nodes: REST clients can verify that they are communicating with one of the correct Service Fabric nodes.  
  
3.  Encryption of messages (REST requests and responses).  
  
> [!NOTE]
>  Clients with user access only have permission for read requests (for example, `https://localhost:19007/Nodes?api-version=1.0`). Clients with admin access have permission for read requests and write requests (write request example, `https://localhost:19007/Nodes/<NodeName>/$/Deactivate`).  
  
### Cluster Manifest Changes  
 This section assumes that you already have a cluster manifest configured to use X.509 certificates. To learn more please read [Secure a Cluster Using X.509 Certificates](http://msdn.microsoft.com/en-us/4a60dcdd-e4ac-49f2-a3f2-454bcb047900).  
  
 To configure a cluster to support authentication and authorization of clients (User and Admin) and authentication of Service Fabric nodes, the following parameters must be set in the cluster manifest:  
  
-   Thumbprint of server and client certificates for each node type  
  
    -   \<ClientCertificate X509FindValue="…" />  
  
    -   \<ServerCertificate X509FindValue="…" />  
  
-   Security section  
  
    -   \<Parameter Name="ClientRoleEnabled" Value="true" />  
  
    -   \<Parameter Name="ServerAuthCredentialType" Value="X509" />  
  
    -   ClientAuthAllowedCommonNames parameter  
  
    -   AdminAllowedCommonNames parameter  
  
    -   ServerAuthAllowedCommonNames parameter  
  
 To enable HttpGateway on a cluster manifest which is already secured with X.509 (i.e. cluster and client/server security are already enabled), only these changes are required:  
  
-   Set Protocol of all HttpGatewayEndpoint elements to "https". For example, \<HttpGatewayEndpoint Port="19017" Protocol="https"/>  
  
-   Enable HttpGateway in the HttpGateway section. For example, \<Parameter Name="IsEnabled" Value="true"/>  
  
### How to Use REST APIs with X.509  
 For an X.509 secured HTTPS Request, create the relevant client certificate (whose common name is specified in the ClientAuthAllowedCommonNames or AdminAllowedCommonNames) and the server certificate thumbprint.  
  
 For an X.509 secured HTTP endpoint, the REST APIs do not change. The URLs, HTTP Headers, Request and Response Bodies of the REST call will be unchanged.  
  
## Http Gateway with Kerberos (or NTLM) Security  
 On-premises, Service Fabric clusters can use Kerberos and NTLM to authenticate and authorize the user and admin clients, as well as authenticating servers (Service Fabric nodes). However, Kerberos or NTLM cannot be used to encrypt the messages.  
  
> [!NOTE]
>  It is recommended to use HTTPS and to ensure the cluster manifest includes server certificates when using Kerberos.  
  
 We highly recommend customers who use Kerberos security to also use HTTPS. This means that the cluster needs to have X.509 server certificates. This way the server certificates will be used to encrypt communication.  
  
 The primary benefit of using Kerberos authentication instead of X.509 certificates for clients is that Kerberos simplifies client certificate management.  
  
 Service Fabric allows clients to be authenticated through NTLM instead of Kerberos. Microsoft does not recommend the use of NTLM. For more information, see [Security Considerations for Implementers](http://msdn.microsoft.com/library/cc236715.aspx).  
  
 Use Kerberos instead of NTLM whenever possible.  
  
### Cluster Manifest Changes  
 This section assumes that you already have a cluster manifest configured to use Kerberos for client authentication and X.509 certificates for server authentication and encryption. To learn more please read [Secure a Cluster Using Windows Kerberos](http://msdn.microsoft.com/en-us/6cbf595b-215c-4d43-a5b4-46f25b361739).  
  
### How to Use the REST APIs with Kerberos  
 REST APIs do not change when using REST APIs to communicate with a Kerberos enabled cluster. The URLs, HTTP Headers, Request and Response Bodies of the REST call will be unchanged.  
  
 However, you will need to follow the standard Kerberos and NTLM HTTP Authentication process. Note that:  
  
-   Most HTTP clients automatically follow this process.  
  
-   If the server is known to be secured with Kerberos/NTLM, one can start at step 3. This will remove one network hop.  
  
#### REST with Kerberos Authentication Process  
 The following is an example sequence of a Kerberos authentication process using REST.  
  
1.  Call a REST API without any additional HTTP headers:  
  
    ```  
    GET http://localhost:19007/Nodes?api-version=1.0 HTTP/1.1  
    User-Agent: Fiddler  
    Host: localhost:19007  
  
    ```  
  
2.  A Kerberos enables cluster will reply back with 401 Unauthorized and set the www-authenticate header to "Negotiate":  
  
    ```  
    HTTP/1.1 401 Unauthorized  
    Server: Microsoft-HTTPAPI/2.0  
    WWW-Authenticate: Negotiate  
    Date: Thu, 09 Jan 2014 08:20:55 GMT  
    Content-Length: 0  
  
    ```  
  
3.  Client now needs to get the Token by contacting its AD (federated or mutual) with the SPN of the service.  
  
     The SPN of the service is HTTP\FQDN of the Service Fabric node being contacted".  
  
4.  Token returned by the AD should be used in the Authorization Header with the format of "Negotiate \<token>"  
  
    ```  
    GET http://localhost:19007/Nodes?api-version=1.0 HTTP/1.1  
    User-Agent: Fiddler  
    Host: localhost:19007  
    Authorization: Negotiate YH8GBisG<…>CSqGSIb3EgECAgYKKwYBBAGCNwICHqI/BD1OVE<…>RNT05E  
  
    ```  
  
5.  Server will authenticate the token and if the client is authorized to complete the operation, it will start executing the request.  
  
    ```  
    HTTP/1.1 200 OK  
    Content-Type: application/json; charset=utf-8  
    Server: Microsoft-HTTPAPI/2.0  
    Date: Thu, 09 Jan 2014 08:38:43 GMT  
    Content-Length: 1457  
  
    [{"Name":"Node4","IpAddressOrFQDN":"localhost","Type":"NodeType04","CodeVersion":"2.0.283.0","ConfigVersion":"1.0","NodeStatus":1,"NodeUpTimeInSeconds":"4335",NodeDownTimeInSeconds":"0","HealthState":1,"IsSeedNode":false,"UpgradeDomain":"MYUD1","FaultDomain":"fd:\/RACK2","Id":{"Id":"b5bd41bc26a079f4df3791b2b5d42e5"}},{"Name":"Node1","IpAddressOrFQDN":"localhost","Type":"NodeType01","CodeVersion":"2.0.283.0","ConfigVersion":"1.0","NodeStatus":1,"NodeUpTimeInSeconds":"4335",NodeDownTimeInSeconds":"0","HealthState":1,"IsSeedNode":true,"UpgradeDomain":"MYUD1","FaultDomain":"fd:\/RACK1","Id":{"Id":"10152272d1e44a94356a41d96dc9b466"}},{"Name":"Node2","IpAddressOrFQDN":"localhost","Type":"NodeType02","CodeVersion":"2.0.283.0","ConfigVersion":"1.0","NodeStatus":1,"NodeUpTimeInSeconds":"4335",NodeDownTimeInSeconds":"0","HealthState":1,"IsSeedNode":true,"UpgradeDomain":"MYUD2","FaultDomain":"fd:\/RACK2","Id":{"Id":"15091e9851978afe10f2f3ab37c1d2f0"}},{"Name":"Node5","IpAddressOrFQDN":"localhost","Type":"NodeType05","CodeVersion":"2.0.283.0","ConfigVersion":"1.0","NodeStatus":1,"NodeUpTimeInSeconds":"4335",NodeDownTimeInSeconds":"0","HealthState":1,"IsSeedNode":false,"UpgradeDomain":"MYUD2","FaultDomain":"fd:\/RACK1","Id":{"Id":"6e48b9c722325a66f805e2890bb7dd30"}},{"Name":"Node3","IpAddressOrFQDN":"localhost","Type":"NodeType03","CodeVersion":"2.0.283.0","ConfigVersion":"1.0","NodeStatus":1,"NodeUpTimeInSeconds":"4335",NodeDownTimeInSeconds":"0","HealthState":1,"IsSeedNode":true,"UpgradeDomain":"MYUD3","FaultDomain":"fd:\/RACK1","Id":{"Id":"880f1f5072c2c4805e9cb15ec710d083"}}]  
  
    ```  
  
## Additional REST Examples  
  
### Get Cluster Manifest with Kerberos  
 Request:  
  
```  
GET http://localhost:19007/$/GetClusterManifest?api-version=1.0 HTTP/1.1  
User-Agent: Fiddler  
Host: localhost:19007  
Content-Length: 0  
Authorization: Negotiate oXcwdaADCgEBoloE…AtIpqEAAAAAA==  
  
```  
  
 Response:  
  
```  
HTTP/1.1 200 OK  
Content-Type: application/json; charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Sun, 12 Jan 2014 03:19:09 GMT  
Content-Length: 5560  
  
{"Manifest":"<ClusterManifest xmlns:xsd=\"http:\/\/www.w3.org\/2001\/XMLSchema\" xmlns:xsi=\"http:\/\/www.w3.org\/2001\/XMLSchema-instance\" Name=\"Server-ScaleMin-FiveNodes-Kerberos\" Version=\"1.0\" xmlns=\"http:\/\/schemas.microsoft.com\/2011\/01\/fabric\">\r\n  <NodeTypes>\r\n    <NodeType Name=\"NodeType01\">\r\n      <Endpoints>\r\n        <ClientConnectionEndpoint Port=\"19000\" \/>\r\n        <LeaseDriverEndpoint Port=\"19001\" \/>\r\n        <ClusterConnectionEndpoint Port=\"19002\" \/>\r\n        <HttpGatewayEndpoint Port=\"19007\" Protocol=\"http\" \/>\r\n        <ServiceConnectionEndpoint Port=\"19006\" \/>\r\n        <ApplicationEndpoints StartPort=\"30001\" EndPort=\"31000\" \/>\r\n      <\/Endpoints>\r\n    <\/NodeType>\r\n    <NodeType Name=\"NodeType02\">\r\n      <Endpoints>\r\n        <ClientConnectionEndpoint Port=\"19010\" \/>\r\n        <LeaseDriverEndpoint Port=\"19011\" \/>\r\n        <ClusterConnectionEndpoint Port=\"19012\" \/>\r\n        <HttpGatewayEndpoint Port=\"19017\" Protocol=\"http\" \/>\r\n        <ServiceConnectionEndpoint Port=\"19016\" \/>\r\n        <ApplicationEndpoints StartPort=\"31001\" EndPort=\"32000\" \/>\r\n      <\/Endpoints>\r\n    <\/NodeType>\r\n    <NodeType Name=\"NodeType03\">\r\n      <Endpoints>\r\n        <ClientConnectionEndpoint Port=\"19020\" \/>\r\n        <LeaseDriverEndpoint Port=\"19021\" \/>\r\n        <ClusterConnectionEndpoint Port=\"19022\" \/>\r\n        <HttpGatewayEndpoint Port=\"19027\" Protocol=\"http\" \/>\r\n        <ServiceConnectionEndpoint Port=\"19026\" \/>\r\n        <ApplicationEndpoints StartPort=\"32001\" EndPort=\"33000\" \/>\r\n      <\/Endpoints>\r\n    <\/NodeType>\r\n    <NodeType Name=\"NodeType04\">\r\n      <Endpoints>\r\n        <ClientConnectionEndpoint Port=\"19030\" \/>\r\n        <LeaseDriverEndpoint Port=\"19031\" \/>\r\n        <ClusterConnectionEndpoint Port=\"19032\" \/>\r\n        <HttpGatewayEndpoint Port=\"19037\" Protocol=\"http\" \/>\r\n        <ServiceConnectionEndpoint Port=\"19036\" \/>\r\n        <ApplicationEndpoints StartPort=\"33001\" EndPort=\"34000\" \/>\r\n      <\/Endpoints>\r\n    <\/NodeType>\r\n    <NodeType Name=\"NodeType05\">\r\n      <Endpoints>\r\n        <ClientConnectionEndpoint Port=\"19040\" \/>\r\n        <LeaseDriverEndpoint Port=\"19041\" \/>\r\n        <ClusterConnectionEndpoint Port=\"19042\" \/>\r\n        <HttpGatewayEndpoint Port=\"19047\" Protocol=\"http\" \/>\r\n        <ServiceConnectionEndpoint Port=\"19046\" \/>\r\n        <ApplicationEndpoints StartPort=\"34001\" EndPort=\"35000\" \/>\r\n      <\/Endpoints>\r\n    <\/NodeType>\r\n  <\/NodeTypes>\r\n  <Infrastructure>\r\n    <WindowsServer IsScaleMin=\"true\">\r\n      <NodeList>\r\n        <Node NodeName=\"Node1\" IPAddressOrFQDN=\"localhost\" IsSeedNode=\"true\" NodeTypeRef=\"NodeType01\" FaultDomain=\"fd:\/RACK1\" UpgradeDomain=\"MYUD1\" \/>\r\n        <Node NodeName=\"Node2\" IPAddressOrFQDN=\"localhost\" IsSeedNode=\"true\" NodeTypeRef=\"NodeType02\" FaultDomain=\"fd:\/RACK2\" UpgradeDomain=\"MYUD2\" \/>\r\n        <Node NodeName=\"Node3\" IPAddressOrFQDN=\"localhost\" IsSeedNode=\"true\" NodeTypeRef=\"NodeType03\" FaultDomain=\"fd:\/RACK1\" UpgradeDomain=\"MYUD3\" \/>\r\n        <Node NodeName=\"Node4\" IPAddressOrFQDN=\"localhost\" NodeTypeRef=\"NodeType04\" FaultDomain=\"fd:\/RACK2\" UpgradeDomain=\"MYUD1\" \/>\r\n        <Node NodeName=\"Node5\" IPAddressOrFQDN=\"localhost\" NodeTypeRef=\"NodeType05\" FaultDomain=\"fd:\/RACK1\" UpgradeDomain=\"MYUD2\" \/>\r\n      <\/NodeList>\r\n    <\/WindowsServer>\r\n  <\/Infrastructure>\r\n  <FabricSettings>\r\n    <Section Name=\"Security\">\r\n      <Parameter Name=\"ClusterCredentialType\" Value=\"Windows\" \/>\r\n      <Parameter Name=\"ClusterSpn\" Value=\"\" \/>\r\n      <Parameter Name=\"ClusterIdentities\" Value=\"\" \/>\r\n      <Parameter Name=\"ServerAuthCredentialType\" Value=\"Windows\" \/>\r\n      <Parameter Name=\"ClientIdentities\" Value=\"redmond\\mcoskun\" \/>\r\n      <Parameter Name=\"AdminClientIdentities\" Value=\"redmond\\mcoskun\" \/>\r\n    <\/Section>\r\n    <Section Name=\"NamingService\">\r\n      <Parameter Name=\"PartitionCount\" Value=\"1\" \/>\r\n    <\/Section>\r\n    <Section Name=\"FailoverManager\">\r\n      <Parameter Name=\"ExpectedClusterSize\" Value=\"4\" \/>\r\n      <Parameter Name=\"ClusterStableWaitDuration\" Value=\"0\" \/>\r\n      <Parameter Name=\"RebuildRetryInterval\" Value=\"1\" \/>\r\n      <Parameter Name=\"PeriodicStateScanInterval\" Value=\"1\" \/>\r\n      <Parameter Name=\"MinActionRetryIntervalPerReplica\" Value=\"1\" \/>\r\n      <Parameter Name=\"StandByReplicaKeepDuration\" Value=\"60\" \/>\r\n    <\/Section>\r\n    <Section Name=\"ClusterManager\" \/>\r\n    <Section Name=\"Management\">\r\n      <Parameter Name=\"ImageStoreConnectionString\" Value=\"file:C:\\ProgramData\\Service Fabric\\ImageStore\" \/>\r\n    <\/Section>\r\n    <Section Name=\"Hosting\">\r\n      <Parameter Name=\"EndpointProviderEnabled\" Value=\"true\" \/>\r\n      <Parameter Name=\"RunAsPolicyEnabled\" Value=\"true\" \/>\r\n    <\/Section>\r\n    <Section Name=\"EseStore\">\r\n      <Parameter Name=\"EseLogFileSizeInKB\" Value=\"64\" \/>\r\n      <Parameter Name=\"EseLogBufferSizeInKB\" Value=\"64\" \/>\r\n    <\/Section>\r\n    <Section Name=\"Trace\/Etw\">\r\n      <Parameter Name=\"Level\" Value=\"4\" \/>\r\n    <\/Section>\r\n    <Section Name=\"HttpGateway\">\r\n      <Parameter Name=\"IsEnabled\" Value=\"true\" \/>\r\n    <\/Section>\r\n  <\/FabricSettings>\r\n<\/ClusterManifest>"}  
  
```  
  
### Get Nodes  
 Request:  
  
```  
GET http://localhost:19007/Nodes?api-version=1.0 HTTP/1.1  
User-Agent: Fiddler  
Host: localhost:19007  
Authorization: Negotiate oXcwdaADCg…AtIpqEAAAAAA==  
  
```  
  
 Response:  
  
```  
HTTP/1.1 200 OK  
Content-Type: application/json; charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Sun, 12 Jan 2014 02:23:41 GMT  
Content-Length: 1457  
  
[{"Name":"Node4","IpAddressOrFQDN":"localhost","Type":"NodeType04","CodeVersion":"2.0.310.0","ConfigVersion":"1.0","NodeStatus":1,"NodeUpTimeInSeconds":"1183",NodeDownTimeInSeconds":"0","HealthState":1,"IsSeedNode":false,"UpgradeDomain":"MYUD1","FaultDomain":"fd:\/RACK2","Id":{"Id":"b5bd41bc26a079f4df3791b2b5d42e5"}},{"Name":"Node1","IpAddressOrFQDN":"localhost","Type":"NodeType01","CodeVersion":"2.0.310.0","ConfigVersion":"1.0","NodeStatus":1,"NodeUpTimeInSeconds":"1183",NodeDownTimeInSeconds":"0","HealthState":1,"IsSeedNode":true,"UpgradeDomain":"MYUD1","FaultDomain":"fd:\/RACK1","Id":{"Id":"10152272d1e44a94356a41d96dc9b466"}},{"Name":"Node2","IpAddressOrFQDN":"localhost","Type":"NodeType02","CodeVersion":"2.0.310.0","ConfigVersion":"1.0","NodeStatus":1,"NodeUpTimeInSeconds":"1183",NodeDownTimeInSeconds":"0","HealthState":1,"IsSeedNode":true,"UpgradeDomain":"MYUD2","FaultDomain":"fd:\/RACK2","Id":{"Id":"15091e9851978afe10f2f3ab37c1d2f0"}},{"Name":"Node5","IpAddressOrFQDN":"localhost","Type":"NodeType05","CodeVersion":"2.0.310.0","ConfigVersion":"1.0","NodeStatus":1,"NodeUpTimeInSeconds":"1183",NodeDownTimeInSeconds":"0","HealthState":1,"IsSeedNode":false,"UpgradeDomain":"MYUD2","FaultDomain":"fd:\/RACK1","Id":{"Id":"6e48b9c722325a66f805e2890bb7dd30"}},{"Name":"Node3","IpAddressOrFQDN":"localhost","Type":"NodeType03","CodeVersion":"2.0.310.0","ConfigVersion":"1.0","NodeStatus":1,"NodeUpTimeInSeconds":"1183",NodeDownTimeInSeconds":"0","HealthState":1,"IsSeedNode":true,"UpgradeDomain":"MYUD3","FaultDomain":"fd:\/RACK1","Id":{"Id":"880f1f5072c2c4805e9cb15ec710d083"}}]  
  
```  
  
### Get Applications with Kerberos  
 Request:  
  
```  
GET http://localhost:19007/Applications?api-version=1.0 HTTP/1.1  
Host: localhost:19007  
Connection: keep-alive  
Authorization: Negotiate oXcwdaADC…qEAAAAAA==  
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8  
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.72 Safari/537.36  
Accept-Encoding: gzip,deflate,sdch  
  
```  
  
 Response:  
  
```  
HTTP/1.1 200 OK  
Content-Type: application/json; charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Sun, 12 Jan 2014 02:43:27 GMT  
Content-Length: 165  
  
[{"Id":"sampleApplication","Name":"fabric:\/sampleApplication","TypeName":"PersistentPiEstimatorApp","TypeVersion":"1.0","Status":1,"Parameters":[],"HealthState":1}]  
  
```  
  
### Create Application with Kerberos  
 Request:  
  
```  
POST http://localhost:19007/Applications/$/Create?api-version=1.0 HTTP/1.1  
User-Agent: Fiddler  
Host: localhost:19007  
Content-Length: 114  
Content-Type: application/json; charset=utf-8  
Authorization: Negotiate oXcwdaADCgEBol…tIpqEAAAAAA==  
  
{"Name":"fabric:\/sampleApplication","TypeName":"PersistentPiEstimatorApp","TypeVersion":"1.0","ParameterList":[]}  
  
```  
  
 Response:  
  
```  
HTTP/1.1 201 Created  
Content-Type: application/json; charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Thu, 09 Jan 2014 09:34:22 GMT  
Content-Length: 0  
  
```  
  
### Get Services with Kerberos  
 Request:  
  
```  
GET http://localhost:19007/Applications/sampleApplication/$/GetServices?api-version=1.0 HTTP/1.1  
User-Agent: Fiddler  
Host: localhost:19007  
Content-Length: 0  
Authorization: Negotiate oXcwdaADCgEBolo…qEAAAAAA==  
  
```  
  
 Response  
  
```  
HTTP/1.1 200 OK  
Content-Type: application/json; charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Sun, 12 Jan 2014 02:40:21 GMT  
Content-Length: 207  
  
[{"Id":"sampleApplication\/service1","ServiceKind":2,"Name":"fabric:\/sampleApplication\/service1","TypeName":"PersistentPiEstimatorService","ManifestVersion":"1.0","HasPersistedState":true,"HealthState":1}]  
  
```  
  
### Get Service Description  
 Request:  
  
```  
GET http://localhost:19007/Applications/sampleApplication/$/GetServices/sampleApplication/service1/$/GetDescription?api-version=1.0 HTTP/1.1  
Host: localhost:19007  
Connection: keep-alive  
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8  
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.72 Safari/537.36  
Accept-Encoding: gzip,deflate,sdch  
Accept-Language: en-US,en;q=0.8  
  
```  
  
 Response:  
  
```  
HTTP/1.1 200 OK  
Content-Type: application/json; charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Sun, 12 Jan 2014 02:46:42 GMT  
Content-Length: 463  
  
{"ServiceKind":2,"ApplicationName":"fabric:\/sampleApplication","ServiceName":"fabric:\/sampleApplication\/service1","ServiceTypeName":"PersistentPiEstimatorService","InitializationData":[],"PartitionDescription":{"PartitionScheme":2,"Count":1,"LowKey":"0","HighKey":"9999999"},"TargetReplicaSetSize":3,"MinReplicaSetSize":2,"HasPersistedState":true,"PlacementConstraints":"","CorrelationScheme":[],"ServiceLoadMetrics":[],"ServicePlacementPolicies":[],"Flags":0}  
  
```  
  
### Create Service with Kerberos  
 Request:  
  
```  
POST http://localhost:19007/Applications/sampleApplication/$/GetServices/$/Create?api-version=1.0 HTTP/1.1  
User-Agent: Fiddler  
Host: localhost:19007  
Content-Length: 443  
Authorization: Negotiate oXcwdaA…EAAAAAA==  
  
{"ServiceKind":2,  
"ApplicationName":"fabric:\/sampleApplication",  
"ServiceName":"fabric:\/sampleApplication\/service2",  
"ServiceTypeName":"PersistentPiEstimatorService",  
"InitializationData":[],  
"PartitionDescription":{"PartitionScheme":2,"Count":1,"LowKey":"0","HighKey":"9999999"},  
"TargetReplicaSetSize":3,  
"MinReplicaSetSize":3,  
"HasPersistedState":true,  
"PlacementConstraints":"",  
"CorrelationScheme":[],  
"ServiceLoadMetrics":[]}  
  
```  
  
 Response:  
  
```  
HTTP/1.1 202 Accepted  
Content-Type: application/json; charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Sun, 12 Jan 2014 02:53:28 GMT  
Content-Length: 0  
  
```  
  
### Create Service From Template with Kerberos  
 Request:  
  
```  
POST http://localhost:19007/Applications/sampleApplication/$/GetServices/$/CreateFromTemplate?api-version=1.0 HTTP/1.1  
User-Agent: Fiddler  
Host: localhost:19007  
Content-Length: 174  
Authorization: Negotiate oXcwdaADCg…AAAAA==  
  
{"ApplicationName":"fabric:\/sampleApplication","ServiceName":"fabric:\/sampleApplication\/service1","ServiceTypeName":"PersistentPiEstimatorService","InitializationData":[]}  
  
```  
  
 Response:  
  
```  
HTTP/1.1 202 Accepted  
Content-Type: application/json; charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Sun, 12 Jan 2014 02:39:20 GMT  
Content-Length: 0  
  
```