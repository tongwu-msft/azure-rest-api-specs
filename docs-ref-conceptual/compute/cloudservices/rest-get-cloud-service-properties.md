---
title: "Azure Cloud Services REST - Get Cloud Service Properties | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""

ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 48802f55-cf32-4a81-8d90-0c59c23db4e9
caps.latest.revision: 48
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Get Cloud Service Properties
The `Get Cloud Service Properties` operation retrieves properties for the specified cloud service. These properties include the following values:  
  
-   The name and the description of the cloud service.  
  
-   The name of the affinity group to which the cloud service belongs, or its location if it is not part of an affinity group.  
  
-   The label that can be used to track the cloud service.  
  
-   The date and time that the cloud service was created or modified.  
  
-   If details are requested, information about deployments in the cloud service is returned.  
  
## Request  
 The `Get Cloud Service Properties` request may be specified as follows. Replace `<subscription-id>` with your subscription ID, and `<cloudservice-name>` with the name of the cloud service.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>`|  
  
### URI Parameters  
  
|URI Parameter|Description|  
|-------------------|-----------------|  
|`embed-detail=true`|Optional. Specifies that properties should be returned for all deployments in the cloud service. The default value is `false`.|  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. This header must be set to `2009-10-01` or higher.|  
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code, a set of response headers, and a response body.  
  
### Status Code  
 A successful operation returns status code 200 (OK).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers.  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|A value that uniquely identifies a request made against the management service.|  
  
### Response Body  
 The basic format for the response body when the request does not include `embed-detail` is shown below:  
  
```  
  
<?xml version="1.0" encoding="utf-8"?>  
<HostedService xmlns="http://schemas.microsoft.com/windowsazure">  
  <Url>hosted-service-url</Url>  
  <ServiceName>hosted-service-name</ServiceName>  
  <HostedServiceProperties>  
    <Description>description</Description>  
    <AffinityGroup>name-of-affinity-group</AffinityGroup>   
    <Location>location-of-service</Location >  
    <Label>base-64-encoded-name-of-service</Label>  
    <Status>current-status-of-service</Status>  
    <DateCreated>creation-date-of-service</DateCreated>  
    <DateLastModified>last-modification-date-of-service</DateLastModified>  
    <ExtendedProperties>  
      <ExtendedProperty>  
        <Name>name-of-property</Name>  
        <Value>value-of-property</Value>  
      </ExtendedProperty>  
    </ExtendedProperties>  
    <ReverseDnsFqdn>reverse-dns-fqdn</ReverseDnsFqdn>  
  </HostedServiceProperties>  
  <DefaultWinRmCertificateThumbprint>thumbprint-of-winrm-certificate</DefaultWinRmCertificateThumbprint>  
</HostedService>  
  
```  
  
 The following elements are returned when `embed-detail` is set to `true`:  
  
```  
<?xml version="1.0" encoding="utf-8"?>  
<HostedService xmlns="http://schemas.microsoft.com/windowsazure">  
  <Url>hosted-service-url</Url>  
  <ServiceName>hosted-service-name</ServiceName>  
  <HostedServiceProperties>  
    <Description>description-of-service</Description>  
    <AffinityGroup>name-of-affinity-group</AffinityGroup>  
    <Location>location-of-service</Location>  
    <Label>base-64-encoded-name-of-service</Label>  
    <Status>current-status-of-service</Status>  
    <DateCreated>creation-date-of-service</DateCreated>  
    <DateLastModified>last-modification-date-of-service</DateLastModified>  
    <ExtendedProperties>  
      <ExtendedProperty>  
        <Name>name-of-property</Name>  
        <Value>value-of-property</Value>  
      </ExtendedProperty>  
    </ExtendedProperties>  
    <ReverseDnsFqdn>reverse-dns-fqdn</ReverseDnsFqdn>  
  </HostedServiceProperties>  
  <Deployments>  
    <Deployment xmlns=”http://schemas.microsoft.com/windowsazure”>  
      <Name>name-of-deployment</Name>  
      <DeploymentSlot>current-deployment-environment</DeploymentSlot>  
      <PrivateID>deployment-id</PrivateID>  
      <Status>status-of-deployment</Status>  
      <Label>base64-encoded-name-of-deployment</Label>  
      <Url>deployment-url</Url>  
      <Configuration>base-64-encoded-configuration-file</Configuration>  
      <RoleInstanceList>  
        <RoleInstance>  
          <RoleName>name-of-role</RoleName>  
          <InstanceName>name-of-role-instance</InstanceName>  
          <InstanceStatus>status-of-role-instance</InstanceStatus>  
          <InstanceUpgradeDomain>update-domain-of-role-instance</InstanceUpgradeDomain>  
          <InstanceFaultDomain>fault-domain-of-role-instance</InstanceFaultDomain>  
          <InstanceSize>size-of-role-instance</InstanceSize>  
          <InstanceStateDetails>state-of-role-instance</InstanceStateDetails>  
          <InstanceErrorCode>error-code-returned-for-role-instance</InstanceErrorCode>  
          <IpAddress>ip-address-of-role-instance</IpAddress>  
          <InstanceEndpoints>  
            <InstanceEndpoint>  
              <Name>name-of-endpoint</Name>  
              <Vip>virtual-ip-address-of-instance-endpoint</Vip>  
              <PublicPort>public-facing-port-of-instance-endpoint</PublicPort>  
              <LocalPort>internal-facing-port-of-instance-endpoint</LocalPort>  
              <Protocol>protocol-of-instance-endpoint</Protocol>  
            </InstanceEndpoint>  
          </InstanceEndpoints>  
          <PowerState>state-of-role-instance</PowerState>  
          <HostName>dns-name-of-service</HostName>  
          <RemoteAccessCertificateThumbprint>cert-thumbprint-for-remote-access</RemoteAccessCertificateThumbprint>  
        </RoleInstance>  
      </RoleInstanceList>  
      <UpgradeStatus>  
        <UpgradeType>type-of-upgrade</UpgradeType>  
        <CurrentUpgradeDomainState>status-of-current-upgrade</CurrentUpgradeDomainState>  
        <CurrentUpgradeDomain>n</CurrentUpgradeDomain>  
      </UpgradeStatus>  
      <UpgradeDomainCount>number-of-upgrade-domains-in-deployment</UpgradeDomainCount>  
      <RoleList>  
        <Role>  
          <RoleName>name-of-role</RoleName>  
          <OSVersion>operating-system-version</OSVersion>  
          <ConfigurationSets>  
            <ConfigurationSet>  
              <ConfigurationSetType>NetworkConfiguration</ConfigurationSetType>  
              <InputEndpoints>  
                <InputEndpoint>  
                  <Port>port-number-of-input-endpoint-in-network</Port>  
                  <Protocol>protocol-of-input-endpoint-in-network</Protocol>  
                  <Vip>virtual-ip-address-of-input-endpoint-in-network</Vip>  
                </InputEndpoint>  
              </InputEndpoints>  
            </ConfigurationSet>  
          </ConfigurationSets>  
        </Role>  
        <Role>  
          <RoleName>name-of-role</RoleName>  
          <OSVersion>operating-system-version</OSVersion>  
          <RoleType>PersistentVMRole</RoleType>  
          <ConfigurationSets>  
            <ConfigurationSet>  
              <ConfigurationSetType>NetworkConfiguration</ConfigurationSetType>  
              <InputEndpoints>  
                <InputEndpoint>  
                  <LoadBalancedEndpointSetName>name-of-load-balanced-endpoint-set</LoadBalancedEndpointSetName>  
                  <LocalPort>internal-facing-port-of-input-endpoint</LocalPort>  
                  <Name>name-of-input-endpoint</Name>  
                  <Port>external-facing-port-of-input-endpoint</Port>  
                  <LoadBalancerProbe>  
                    <Path>path-of-probe</Path>  
                    <Port>port-assigned-to-probe</Port>  
                    <Protocol>protocol-of-probe-port</Protocol>  
                  </LoadBalancerProbe>  
                  <Protocol>protocol-of-input-endpoint</Protocol>  
                  <Vip>virtual-ip-address-of-input-endpoint</Vip>  
                </InputEndpoint>  
              </InputEndpoints>  
              <SubnetNames>  
                <SubnetName>name-of-subnet</SubnetName>  
              </SubnetNames>  
            </ConfigurationSet>  
          </ConfigurationSets>  
          <AvailabilitySetName>name-of-availability-set</AvailabilitySetName>  
          <DataVirtualHardDisks>  
            <DataVirtualHardDisk>  
              <HostCaching>host-caching-mode-of-data-disk</HostCaching>  
              <DiskName>name-of-data-disk</DiskName>  
              <Lun>logical-unit-number-of-data-disk</Lun>  
              <LogicalDiskSizeInGB>size-of-data-disk</LogicalDiskSizeInGB>  
              <MediaLink>path-to-vhd</MediaLink>  
            </DataVirtualHardDisk>  
          </DataVirtualHardDisks>  
          <OSVirtualHardDisk>  
            <HostCaching>host-caching-mode-of-os-disk</HostCaching>  
            <DiskName>name-of-os-disk</DiskName>  
            <MediaLink>path-to-vhd</MediaLink>  
            <SourceImageName>image-used-to-create-os-disk</SourceImageName>  
            <OS>operating-system-on-os-disk</OS>  
          </OSVirtualHardDisk>  
          <RoleSize>size-of-role-instance</RoleSize>  
        </Role>  
      </RoleList>  
      <SdkVersion>sdk-version-used-to-create-package</SdkVersion>  
      <Locked>status-of-deployment-write-allowed</Locked>  
      <RollbackAllowed>rollback-operation-allowed</RollbackAllowed>  
      <CreatedTime>time-of-deployment-creation</CreatedTime>  
      <LastModifiedTime>time-of-last-deployment-modification</LastModifiedTime>  
      <VirtualNetworkName>name-of-virtual-network</VirtualNetworkName>  
      <Dns>  
        <DnsServers>  
          <DnsServer>  
            <Name>name-of-dns-server</Name>  
            <Address>address-of-dns-server</Address>  
          </DnsServer>  
        </DnsServers>  
      </Dns>  
      <ExtendedProperties>  
        <ExtendedProperty>  
          <Name>name-of-property</Name>  
          <Value>value-of-property</Value>  
        </ExtendedProperty>  
      </ExtendedProperties>  
      <PersistentVMDowntime>  
        <StartTime>start-of-downtime</StartTime>  
        <EndTime>end-of-downtime</EndTime>  
        <Status>status-of-downtime</Status>  
      </PersistentVMDowntime>  
      <VirtualIPs>  
        <VirtualIP>  
          <Address>virtual-ip-address-of-deployment</Address>  
        </VirtualIP>  
      </VirtualIPs>  
    </Deployment>  
  </Deployments>  
  <DefaultWinRmCertificateThumbprint>thumbprint-of-winrm-certificate</DefaultWinRmCertificateThumbprint>  
</HostedService>  
  
```  
  
 The following table describes the elements in the response body.  
  
|Element name|Description|  
|------------------|-----------------|  
|Url|Specifies the URL that is assigned to the cloud service.|  
|ServiceName|Specifies the name of the cloud service. This name is the DNS prefix name and can be used to access the cloud service.<br /><br /> For example, if the cloud service name is **MyService** you could access the access the cloud service by calling: http://**MyService**.cloudapp.net|  
|[HostedServiceProperties](rest-get-cloud-service-properties.md#bk_hostedserviceproperties)|Specifies the properties that are assigned to the cloud service.|  
|DefaultWinRmCertificateThumbprint|Specifies the SSL certificate thumbprint that was generated when WinRM was defined with an HTTPS listener and a certificate was not included in the definition. The value of this property is read only and does not change if a running role instance is updated to use a new SSL certificate.|  
|[Deployments](rest-get-cloud-service-properties.md#bk_deployments)|Specifies the deployments in the cloud service.|  
  
###  <a name="bk_hostedserviceproperties"></a> HostedServiceProperties  
 Specifies the properties that are assigned to the cloud service.  
  
|Element name|Description|  
|------------------|-----------------|  
|Description|Specifies the description of the cloud service.|  
|AffinityGroup|Specifies the name of the affinity group with which the cloud service is associated. If the cloud service is associated with an affinity group, the `Location` element is not returned.|  
|Location|Specifies the geo-location of the cloud service in Azure, if the cloud service is not associated with an affinity group. If a location has been specified, the `AffinityGroup` element is not returned.|  
|Label|Specifies the base-64-encoded identifier of the cloud service. The label can be used to identify the cloud service for your tracking purposes.|  
|Status|Specifies the status of the cloud service.<br /><br /> Possible values are:<br /><br /> -                          `Creating`<br /><br /> -                          `Created`<br /><br /> -                          `Deleting`<br /><br /> -                          `Deleted`<br /><br /> -                          `Changing`<br /><br /> -                          `ResolvingDns`<br /><br /> The `Status` element is only available using version 2012-03-01 or higher.|  
|DateCreated|Specifies the date that the cloud service was created, in [4DigitYear]-[2DigitMonth]-[2DigitDay]T[2DigitHour]:[2DigitMinute]:[2DigitSecond]Z format. The date 2011-05-11T16:15:26Z is an example that could be returned by the `DateCreated` or `DateLastModified` elements.<br /><br /> The `DateCreated` element is only available using version 2012-03-01 or higher.|  
|DateLastModified|Specifies the date that the cloud service was last updated, in [4DigitYear]-[2DigitMonth]-[2DigitDay]T[2DigitHour]:[2DigitMinute]:[2DigitSecond]Z format. The date 2011-05-11T16:15:26Z is an example that could be returned by the `DateCreated` or `DateLastModified` elements<br /><br /> The `DateLastModified` element is only available using version 2012-03-01 or higher.|  
|Name|Specifies the name of an extended cloud service property.<br /><br /> The `Name` element is only available using version 2012-03-01 or higher.|  
|Value|Specifies the value of an extended cloud service property.<br /><br /> The `Value` element is only available using version 2012-03-01 or higher.|  
|ReverseDnsFqdn|Optional. Specifies the DNS address to which the IP address of the cloud service resolves when queried using a reverse DNS query.<br /><br /> The `ReverseDnsFqdn` element is only available using version 2014-06-01 or higher.|  
  
###  <a name="bk_deployments"></a> Deployments  
 Specifies the deployments in the cloud service.  
  
|Element name|Description|  
|------------------|-----------------|  
|Name|Specifies the name of the deployment.|  
|DeploymentSlot|Specifies the environment in which this deployment is running, either `staging` or `production`.|  
|PrivateID|Specifies the unique identifier for the deployment.|  
|Status|Specifies the status of the deployment.<br /><br /> Possible values are:<br /><br /> -                          `Running`<br /><br /> - `Suspended`<br /><br /> -                          `RunningTransitioning`<br /><br /> -                          `SuspendedTransitioning`<br /><br /> - `Starting`<br /><br /> -                          `Suspending`<br /><br /> - `Deploying`<br /><br /> - `Deleting`|  
|Label|Specifies the base-64-encoded identifier of the deployment. The label can be used for your tracking purposes.|  
|Url|Specifies the URL that can be used to access the cloud service.<br /><br /> For example, if the service name is **MyService** you could access the access the service by calling: http://**MyService**.cloudapp.net|  
|Configuration|Specifies the base-64-encoded configuration file of the deployment.|  
|[RoleInstanceList](rest-get-cloud-service-properties.md#bk_roleinstancelist)|Contains the list of role instances in the deployment.|  
|[UpgradeStatus](rest-get-cloud-service-properties.md#bk_upgradestatus)|Specifies information about an upgrade occurring on the deployment.|  
|UpgradeDomainCount|Specifies the number of upgrade domains available to the cloud service.<br /><br /> The `UpgradeDomainCount` element is only available using version 2011-06-01 or higher.|  
|[RoleList](rest-get-cloud-service-properties.md#bk_rolelist)|Contains the list of roles in the deployment.|  
|SdkVersion|Specifies the version of the SDK that was used to generate the package for the deployment.<br /><br /> The first two numerical components of the returned version represent the version of the SDK that was used to create the package.<br /><br /> The `SdkVersion` element is only available using version 2011-06-01 or higher.|  
|Locked|Indicates whether the deployment is locked for new write operations. `True` if the deployment is locked because an existing operation is updating the deployment; otherwise `false`.<br /><br /> The `Locked` element is only available using version 2011-06-01 or higher.|  
|RollbackAllowed|Indicates whether the [Rollback Update Or Upgrade](rest-rollback-update-or-upgrade.md) operation is allowed at this time. `True` if the operation is allowed; otherwise `false`.<br /><br /> The `RollbackAllowed` element is only available using version 2011-06-01 or higher.|  
|CreatedTime|Specifies the time that the deployment was created.|  
|LastModifiedTime|Specifies the last time that the deployment was modified.|  
|VirtualNetworkName|Specifies the name of the Virtual Network that the virtual machine connects to.<br /><br /> The `VirtualNetworkName` element is only available using version 2012-03-01 or higher.|  
|[Dns](rest-get-cloud-service-properties.md#bk_dns)|Specifies the custom DNS settings that are specified for deployment.<br /><br /> The `Dns` element is only available using version 2012-03-01 or higher.|  
|[ExtendedProperties](rest-get-cloud-service-properties.md#bk_extendedproperties)|Specifies the properties that are used to provide more information about a deployment.|  
|[PersistentVMDowntime](rest-get-cloud-service-properties.md#bk_persistentvmdowntime)|Specifies information about when the Virtual Machine has been started and stopped.<br /><br /> The `PersistentVMDowntime` element is only available using version 2012-03-01 or higher.|  
|[VirtualIPs](rest-get-cloud-service-properties.md#bk_virtualips)|Contains the virtual IP addresses that are specified for the deployment.<br /><br /> The `VirtualIPs` element is only available using version 2012-03-01 or higher.|  
  
###  <a name="bk_roleinstancelist"></a> RoleInstanceList  
 Contains the list of role instances in the deployment.  
  
|Element name|Description|  
|------------------|-----------------|  
|RoleName|Specifies the name of the role.|  
|InstanceName|Specifies the name of a specific role instance, if an instance of the role is running.|  
|InstanceStatus|Specifies the current status of a role instance.<br /><br /> `RoleStateUnknown` :<br /><br /> - Indicates that the role state is currently unknown.<br /><br /> `CreatingVM` :<br /><br /> - Indicates that resources are being created for a Virtual Machine.<br /><br /> `StartingVM` :<br /><br /> - Indicates that a Virtual Machine is starting.<br /><br /> `CreatingRole` :<br /><br /> - Indicates that resources are being created for a role instance.<br /><br /> `StartingRole` :<br /><br /> - Indicates that a role instance is starting.<br /><br /> `ReadyRole` :<br /><br /> - Indicates that a role instance has started and is ready to be used.<br /><br /> `BusyRole` :<br /><br /> - Indicates that a role instance is unavailable for requests. This state is usually generated while the role is being created or stopped.<br /><br /> `StoppingRole` :<br /><br /> - Indicates that a role instance is stopping.<br /><br /> `StoppingVM` :<br /><br /> - Indicates that a Virtual Machine is stopping.<br /><br /> `DeletingVM` :<br /><br /> - Indicates that a Virtual Machine is being deleted.<br /><br /> `StoppedVM` :<br /><br /> - Indicates that a Virtual Machine is not running. This is the final state of the shutdown process, and no other status messages should be received after `StoppedVM`.<br /><br /> `RestartingRole` :<br /><br /> - Indicates that a role instance has unexpectedly stopped or has failed to start. This status indicates that there is a problem with the role instance that is causing it to crash or preventing it from starting, and must be corrected before the role instance can be started. The `InstanceStateDetails` and `InstanceErrorCode` fields can hold information about the error that caused this state.<br /><br /> `CyclingRole` :<br /><br /> - Indicates that the role instance is not starting correctly. This status indicates that there is a problem with the role instance that prevents it from starting, and may be generated after the `StartingRole` status or `ReadyRole` status is received. The problem in the role instance must be found and corrected before the role can be started. The `InstanceStateDetails` and `InstanceErrorCode` fields can hold information about the role error that caused this state.<br /><br /> `FailedStartingRole` :<br /><br /> - Indicates that a role instance has failed to start. This status indicates that there is a problem with the role instance that prevents it from starting, and may be generated after the process returns `StartingRole`. The problem in the role must be found and corrected before the role can be started. The `InstanceStateDetails` and `InstanceErrorCode` fields can hold information about the role error that caused this state, which may be useful for identifying and debugging the problem.<br /><br /> `FailedStartingVM` :<br /><br /> - Indicates that a Virtual Machine has continually failed to start. This status is generated by Azure, and does not indicate an error with the role instance. It may be generated after the `StartingRole` state.<br /><br /> `UnresponsiveRole` :<br /><br /> - Indicates that a role instance has timed out before receiving a status message and is not responding to requests.<br /><br /> `StoppedDeallocated` :<br /><br /> - Indicates that a role instance has been stopped and all allocated resources have been released. This stops billing for the role instance. Role instances that have a status of `StoppedDeallocated` are only returned in the role instance list if the version is 2013-06-01 or higher. If all role instances in the deployment have a status of `StoppedDeallocated`, the deployment is not returned.|  
|InstanceUpgradeDomain|Specifies the update domain that the role instance belongs to. During an upgrade deployment, all role instances in the same update domain are updated at the same time.<br /><br /> The `InstanceUpgradeDomain` element is only available using version 2011-06-01 or higher.|  
|InstanceFaultDomain|Specifies the fault domain that the role instance belongs to. Role instances that are part of the same fault domain may all be vulnerable to the failure of the same piece of shared hardware.<br /><br /> The `InstanceFaultDomain` element is only available using version 2011-06-01 or higher.|  
|InstanceSize|Specifies the size of the role instance.<br /><br /> The `InstanceSize` element is only available using version 2011-06-01 or higher.|  
|InstanceStateDetails|Provides a snapshot of the state of the role instance at the time that the operation was called.<br /><br /> The `InstanceStateDetails` element is only available using version 2011-06-01 or higher.|  
|InstanceErrorCode|For Virtual Machines the error codes are:<br /><br /> - WaitTimeout - The role instance did not communicate within 25 minutes. Typically this indicates that it did not start or that the guest agent is not installed.<br /><br /> - VhdTooLarge - The VHD image selected was too large for the role instance.<br /><br /> - AzureInternalError – An internal error has occurred that has caused to role instance to fail to start. Contact support for additional assistance.<br /><br /> For web and worker roles this field returns an error code that can be provided to Azure support to assist in resolution of errors. Typically this field will be empty.<br /><br /> The `InstanceErrorCode` element is only available using version 2011-10-01 or higher.|  
|IpAddress|Specifies the IP address of the role instance (DIP).<br /><br /> The `IpAddress` element is only available using version 2012-03-01 or higher.|  
|[InstanceEndpoints](rest-get-cloud-service-properties.md#bk_instanceendpoints)|Contains the list of instance endpoints for the role.|  
|PowerState|Indicates the running state of the role instance.<br /><br /> The following are possible values:<br /><br /> - `Starting`<br /><br /> - `Started`<br /><br /> - `Stopping`<br /><br /> - `Stopped`<br /><br /> - `Unknown`|  
|HostName|Specifies the DNS host name of the cloud service in which the role instance is running. This element is only listed for Virtual Machine deployments.|  
|RemoteAccessCertificateThumbprint|Specifies the thumbprint of the RDP server certificate (in Windows) or SSH server certificate (in Linux).  The thumbprint is only used for Virtual Machines that have been created from an image.<br /><br /> The `RemoteAccessCertificateThumbprint` element is only available using version 2012-08-01 or higher.|  
  
###  <a name="bk_instanceendpoints"></a> InstanceEndpoints  
 Contains the list of instance endpoints for the role.  
  
|Element name|Description|  
|------------------|-----------------|  
|Name|Specifies the name of the endpoint.|  
|Vip|Specifies the virtual IP address of the endpoint.<br /><br /> The `Vip` element is only available using version 2011-06-01 or higher.|  
|PublicPort|Specifies the external port that is used by the endpoint.|  
|LocalPort|Specifies the internal port that is used by the endpoint.|  
|Protocol|Specifies the protocol of traffic on the endpoint.|  
  
###  <a name="bk_upgradestatus"></a> UpgradeStatus  
 Specifies information about an upgrade occurring on the deployment.  
  
|Element name|Description|  
|------------------|-----------------|  
|UpgradeType|Specifies the type of the upgrade.<br /><br /> Possible values are:<br /><br /> -                          `Auto`<br /><br /> -                          `Manual`<br /><br /> -                          `Simultaneous`|  
|CurrentUpgradeDomainState|Specifies the current state of the upgrade. Possible values are `Before` and `During`|  
|CurrentUpgradeDomain|Contains an integer value that identifies the current upgrade domain. Upgrade domains are identified with a zero-based index: the first upgrade domain has an ID of 0, the second has an ID of 1, and so on.|  
  
###  <a name="bk_rolelist"></a> RoleList  
 Contains the list of roles in the deployment.  
  
|Element name|Description|  
|------------------|-----------------|  
|RoleName|Specifies the name of the role.|  
|OSVersion|Specifies the version of the operating system on which the role instances are running.|  
|RoleType|Specifies the type of the role. This element is only listed for Virtual Machine deployments and by default is `PersistentVMRole`.|  
|[ConfigurationSets](rest-get-cloud-service-properties.md#bk_configurationsets)|Contains a collection of values that represents system or application configuration settings.|  
|AvailabilitySetName|Specifies the name of a collection of virtual machines.|  
|[DataVirtualHardDisks](rest-get-cloud-service-properties.md#bk_datavirtualharddisks)|Contains the parameters that are used to add a data disk to a Virtual Machine.|  
|[OSVirtualHardDisk](rest-get-cloud-service-properties.md#bk_osvirtualharddisk)|Contains the parameters that are used to create the operating system disk for a Virtual Machine.|  
|RoleSize|Specifies the size of the role instance.|  
  
###  <a name="bk_configurationsets"></a> ConfigurationSets  
 Contains a collection of values that represents system or application configuration settings.  
  
|Element name|Description|  
|------------------|-----------------|  
|ConfigurationSetType|Specifies the configuration type for the configuration set. This is currently always set to NetworkConfiguration.|  
|[InputEndpoints](rest-get-cloud-service-properties.md#bk_inputendpoints)|Contains a collection of external endpoints for a Virtual Machine.|  
|SubnetNames|Contains a list of Virtual Network subnet names to which the deployment belongs.|  
  
###  <a name="bk_inputendpoints"></a> InputEndpoints  
 Contains a collection of external endpoints for a Virtual Machine.  
  
|Element name|Description|  
|------------------|-----------------|  
|LoadBalancedEndpointSetName|Specifies a name of a set of load-balanced endpoints. This element is only listed for Virtual Machine deployments.|  
|LocalPort|Specifies the internal port on which the Virtual Machine is listening to serve the endpoint. This element is only listed for Virtual Machine deployments.|  
|Name|Specifies the name for the external endpoint. This element is only listed for Virtual Machine deployments.|  
|Port|Specifies the external port to use for the endpoint.|  
|[LoadBalancerProbe](rest-get-cloud-service-properties.md#bk_loadbalancerprobe)|Contains the endpoint settings which the Azure load balancer uses to monitor the availability of a Virtual Machine before forwarding traffic to the endpoint.|  
|Protocol|Specifies the transport protocol for the endpoint.<br /><br /> Possible Values are:<br /><br /> -                          `TCP`<br /><br /> - `UDP`|  
|Vip|Specifies the virtual IP address for the endpoint.|  
  
###  <a name="bk_loadbalancerprobe"></a> LoadBalancerProbe  
 Contains the endpoint settings which the Azure load balancer uses to monitor the availability of a Virtual Machine before forwarding traffic to the endpoint.  
  
|Element name|Description|  
|------------------|-----------------|  
|Path|Specifies the relative path name to inspect to determine the availability status. If Protocol is set to TCP, this value must be NULL.<br /><br /> Example:<br /><br /> path<br /><br /> The probe will use https://example.com/path to perform the probe.|  
|Port|Specifies the port to use to inspect the availability status.|  
|Protocol|Specifies the protocol to use to inspect the availability status.<br /><br /> Possible values are:<br /><br /> - `HTTP`<br /><br /> - `TCP`|  
  
###  <a name="bk_dns"></a> Dns  
 Specifies the custom DNS settings that are specified for deployment.  
  
|Element name|Description|  
|------------------|-----------------|  
|Name|Specifies the name of the DNS server.|  
|Address|Specifies the IP address of the DNS server.|  
  
###  <a name="bk_extendedproperties"></a> ExtendedProperties  
 Specifies the properties that are used to provide more information about a deployment.  
  
|Element name|Description|  
|------------------|-----------------|  
|Name|Specifies the name of a property that is associated with the deployment.|  
|Value|Specifies the value of a property that is associated with the deployment.|  
  
###  <a name="bk_persistentvmdowntime"></a> PersistentVMDowntime  
 Specifies information about when the Virtual Machine has been started and stopped.  
  
|Element name|Description|  
|------------------|-----------------|  
|StartTime|Specifies the time that the Virtual Machine was started.|  
|EndTime|Specifies the time that the Virtual Machine was stopped.|  
|Status|Specifies the status of the Virtual Machine.|  
  
###  <a name="bk_virtualips"></a> VirtualIPs  
 Contains the virtual IP addresses that are specified for the deployment.  
  
|Element name|Description|  
|------------------|-----------------|  
|Address|Specifies the virtual IP address of the deployment.|  
  
###  <a name="bk_datavirtualharddisks"></a> DataVirtualHardDisks  
 Contains the parameters that are used to add a data disk to a Virtual Machine.  
  
|Element name|Description|  
|------------------|-----------------|  
|HostCaching|Specifies the platform caching behavior of the data disk blob for read/write efficiency.<br /><br /> Possible values are:<br /><br /> - `None`<br /><br /> -                          `ReadOnly`<br /><br /> - `ReadWrite`<br /><br /> The default vault is `ReadOnly`.|  
|DiskName|Specifies the name of the VHD to use to create the data disk for the Virtual Machine.|  
|Lun|Specifies the Logical Unit Number (LUN) for the data disk. The LUN specifies the slot in which the data drive appears when mounted for usage by the Virtual Machine. This element is only listed when more than one data disk is attached to a Virtual Machine.|  
|LogicalDiskSizeInGB|Specifies the size, in GB, of the disk to be attached to the Virtual Machine.|  
|MediaLink|Specifies the location in Azure storage of the VHD that is associated with the disk.<br /><br /> Example:<br /><br /> http://example.blob.core.windows.net/disks/mydatadisk.vhd|  
  
###  <a name="bk_osvirtualharddisk"></a> OSVirtualHardDisk  
 Contains the parameters that are used to create the operating system disk for a Virtual Machine.  
  
|Element name|Description|  
|------------------|-----------------|  
|HostCaching|Specifies the platform caching behavior of the operating system disk blob for read/write efficiency.<br /><br /> Possible values are:<br /><br /> - `ReadOnly`<br /><br /> -                          `ReadWrite`|  
|DiskName|Specifies the name an operating system image in the image repository.|  
|MediaLink|Specifies the location in Azure storage of the VHD that is associated with the operating system disk.|  
|SourceImageName|Specifies the name of the source image that was used to create the operating system disk.|  
|OS|Specifies the operating system that is running on the Virtual Machine.|  
  
## Remarks  
 To obtain the names of cloud services in your subscription, you can use [List Cloud Services](rest-list-cloud-services.md).