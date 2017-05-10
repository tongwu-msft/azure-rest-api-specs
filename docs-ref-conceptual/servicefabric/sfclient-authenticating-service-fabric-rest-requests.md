---
title: "Authenticating Service Fabric REST Requests"
ms.date: "2017-04-23"
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
 This section assumes that you already have a cluster manifest configured to use X.509 certificates. To learn more please read [Secure a Cluster Using X.509 Certificates](/azure/service-fabric/service-fabric-cluster-security).  
  
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
 This section assumes that you already have a cluster manifest configured to use Kerberos for client authentication and X.509 certificates for server authentication and encryption. To learn more please read [Secure a Cluster Using Windows Security](/azure/service-fabric/service-fabric-cluster-security).  
  
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
