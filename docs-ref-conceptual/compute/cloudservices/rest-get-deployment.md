---
title: "Azure Cloud Services REST - Get Deployment | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "02/01/2016"
ms.prod: "azure"
ms.reviewer: ""

ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 21449db8-7f94-4726-95a7-a4e3b0039ac3
caps.latest.revision: 67
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Get Deployment
The `Get Deployment` operation returns configuration information, status, and system properties for a deployment.  
  
## Request  
 The `Get Deployment` request can be used to retrieve deployment events for a single deployment slot (staging or production) or for a specific deployment name. If you want to retrieve information by deployment name, you must first get the unique name for the deployment. This unique name is part of the response when you make a request to get the deployment in a deployment slot.  
  
 For example, if you have a cloud service deployed to the production environment, you can get the unique name by making a request to `…/deploymentslots/production`. The response includes a `Name` element for the cloud service. That `Name` element value can be used to make a request to `…/deployments/<Name>` if you want to retrieve information about that specific deployment.  
  
 To generate the request URI, replace `<subscription-id>` with your subscription ID, `<cloudservice-name>` with the name of the cloud service, `<deployment-slot>` with `staging` or `production`, or `<deployment-name>` with the name of the deployment.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deploymentslots/<deployment-slot>`|  
|GET|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deployments/<deployment-name>`|  
  
### URI Parameters  
 None.  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. This header should be set to `2009-10-01` or higher.|  
  
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
 The following example shows the format of the response body:  
  
```  
<?xml version="1.0" encoding="utf-8"?>  
<Deployment xmlns="http://schemas.microsoft.com/windowsazure">  
  <Name>name-of-deployment</Name>  
  <DeploymentSlot>current-deployment-environment</DeploymentSlot>  
  <PrivateID>identifier-of-deployment</PrivateID>  
  <Status>status-of-deployment</Status>  
  <Label>base64-encoded-name-of-deployment</Label>  
  <Url>url-of-deployment</Url>  
  <Configuration>base-64-encoded-configuration-file</Configuration>  
  <RoleInstanceList>  
    <RoleInstance>  
      <RoleName>name-of-role</RoleName>  
      <InstanceName>name-of-role-instance</InstanceName>  
      <InstanceStatus>status-of-role-instance</InstanceStatus>  
      <ExtendedInstanceStatus>additional-status-details</ExtendedInstanceStatus>  
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
      <GuestAgentStatus>  
        <ProtocolVersion>version-of-protocol</ProtocolVersion>  
        <Timestamp>status-report-time</Timestamp>  
        <GuestAgentVersion>version-of-agent</GuestAgentVersion>  
        <Status>status-of-agent</Status>  
        <FormattedMessage>  
          <Language>language-of-message</Language>  
          <Message>agent-message</Message>  
        </FormattedMessage>  
      </GuestAgentStatus>  
      <ResourceExtensionStatusList>  
        <ResourceExtensionStatus>  
          <HandlerName>name-of-extension</HandlerName>  
          <Version>version-of-extension</Version>  
          <Status>status-of-extension</Status>  
          <Code>status-code-of-extension</Code>  
          <FormattedMessage>  
            <Language>language-of-message</Language>  
            <Message>extension-message</Message>  
          </FormattedMessage>  
          <ExtensionSettingStatus>  
            <Timestamp>status-report-time</Timestamp>  
            <Name>name-of-setting</Name>  
            <Operation>operation-performed</Operation>  
            <Status>status-of-setting</Status>  
            <Code>status-code</Code>  
            <FormattedMessage>  
              <Language>language-of-status-message</Language>  
              <Message>status-message</Message>  
            </FormattedMessage>  
            <SubStatusList>  
              <SubStatus>  
                <Name>name-of-substatus-object</Name>  
                <Status>status-of-object</Status>  
                <FormattedMessage>  
                  <Language>language-of-message</Language>  
                  <Message>status-message</Message>  
                </FormattedMessage>  
              </SubStatus>                     
            </SubStatusList>  
          </ExtensionSettingStatus>  
        </ResourceExtensionStatus>  
      </ResourceExtensionStatusList>  
      <PublicIPs>  
        <PublicIP>  
          <Name>name-of-public-ip</Name>  
          <Address>ip-address</Address>  
          <IdleTimeoutInMinutes>timeout-for-tcp-idle-connection</IdleTimeoutInMinutes>  
          <DomainNameLabel>domain-label</DomainNameLabel>  
          <Fqdns>  
            <Fqdn>fqdn</Fqdn>  
          </Fqdns>  
        <PublicIP>  
      <PublicIPs>  
      <NetworkInterfaces>  
        <NetworkInterface>  
          <Name>interface-name</Name>  
          <MacAddress>mac-address</MacAddress>  
          <IPConfigurations>  
            <IPConfiguration>  
              <SubnetName>subnet-name</SubnetName>  
              <Address>ip-address</Address>  
            </IPConfiguration>  
          <IPConfigurations>  
        </NetworkInterface>  
      </NetworkInterfaces>  
    </RoleInstance>  
  </RoleInstanceList>  
  <UpgradeStatus>  
    <UpgradeType>type-of-upgrade</UpgradeType>  
    <CurrentUpgradeDomainState>current-status-of-upgrade</CurrentUpgradeDomainState>  
    <CurrentUpgradeDomain>n</CurrentUpgradeDomain>  
  </UpgradeStatus>  
  <UpgradeDomainCount>number-of-upgrade-domains-in-deployment</UpgradeDomainCount>  
  <RoleList>  
    <Role>  
      <RoleName>name-of-role</RoleName>  
      <OsVersion>operating-system-version</OsVersion>  
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
          <PublicIPs>  
            <PublicIP>  
              <Name>PublicIPName</Name>  
              <StaticVirtualNetworkIPAddress></StaticVirtualNetworkIPAddress>  
              <IdleTimeoutInMinutes></IdleTimeoutInMinutes>  
              <DomainNameLabel>domain-name</DomainNameLabel>  
            </PublicIP>  
          </PublicIPs>  
          <NetworkInterfaces>  
            <NetworkInterface>  
              <Name>interface-name</Name>  
              <IPConfigurations>  
                <IPConfiguration>  
                  <SubnetName>subnet-name</SubnetName>  
                  <StaticVirtualNetworkIPAddress>ip-address</StaticVirtualNetworkIPAddress>  
                </IPConfiguration>  
              </IPConfigurations>  
            </NetworkInterface>  
          <NetworkInterfaces>  
        </ConfigurationSet>  
      </ConfigurationSets>  
    </Role>  
    <Role>  
      <RoleName>name-of-role</RoleName>  
      <OsVersion>operating-system-version</OsVersion>  
      <RoleType>PersistentVMRole</RoleType>  
      <LicenseType>type-of-license</LicenseType>  
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
              <LoadBalancerName>name-of-internal-loadbalancer</LoadBalancerName>  
              <IdleTimeoutInMinutes>timeout-for-tcp-idle-connection</IdleTimeoutInMinutes>  
              <Protocol>protocol-of-input-endpoint</Protocol>  
              <Vip>virtual-ip-address-of-input-endpoint</Vip>  
            </InputEndpoint>  
          <InputEndpoints>  
          <SubnetNames>  
            <SubnetName>name-of-subnet</SubnetName>  
          </SubnetNames>  
          <StaticVirtualNetworkIPAddress>ip-address</StaticVirtualNetworkIPAddress>  
        </ConfigurationSet>  
      </ConfigurationSets>  
      <ResourceExtensionReferences>  
        <ResourceExtensionReference>  
          <ReferenceName>name-of-reference</ReferenceName>  
          <Publisher>name-of-publisher</Publisher>  
          <Name>name-of-extension</Name>  
          <Version>version-of-extension</Version>  
          <ResourceExtensionParameterValues>  
            <ResourceExtensionParameterValue>  
              <Key>name-of-parameter-key</Key>  
              <Value>parameter-value</Value>  
              <Type>type-of-parameter</Type>  
            </ResourceExtensionParameterValue>  
          </ResourceExtensionParameterValues>  
          <State>state-of-resource</State>  
        </ResourceExtensionReference>  
      </ResourceExtensionReferences>  
      <AvailabilitySetName>name-of-availability-set</AvailabilitySetName>  
      <DataVirtualHardDisks>  
        <DataVirtualHardDisk>  
          <HostCaching>host-caching-mode-of-data-disk</HostCaching>  
          <DiskName>name-of-data-disk</DiskName>  
          <Lun>logical-unit-number-of-data-disk</Lun>  
          <LogicalDiskSizeInGB>size-of-data-disk</LogicalDiskSizeInGB>  
          <MediaLink>path-to-vhd</MediaLink>  
          <IOType>IO-Type<IOType>  
        </DataVirtualHardDisk>  
      </DataVirtualHardDisks>  
      <OSVirtualHardDisk>  
        <HostCaching>host-caching-mode-of-os-disk</HostCaching>  
        <DiskName>name-of-os-disk</DiskName>  
        <MediaLink>path-to-vhd</MediaLink>  
        <SourceImageName>image-used-to-create-os-disk</SourceImageName>  
        <OS>operating-system-on-os-disk</OS>  
        <RemoteSourceImageLink>path-to-source-image</RemoteSourceImageLink>  
         <IOType>IO-Type<IOType>  
      </OSVirtualHardDisk>  
      <RoleSize>size-of-instance</RoleSize>  
      <ProvisionGuestAgent>install-an-agent</ProvisionGuestAgent>  
    </Role>  
  </RoleList>  
  <SdkVersion>sdk-version-used-to-create-package</SdkVersion>  
  <Locked>status-of-deployment-write-allowed</Locked>  
  <RollbackAllowed>rollback-operation-allowed</RollbackAllowed>  
  <VirtualNetworkName>name-of-virtual-network</VirtualNetworkName>  
  <Dns>  
    <DnsServers>  
      <DnsServer>  
        <Name>name-of-dns-server</Name>  
        <Address>address-of-dns-server</Address>  
      </DnsServer>  
    </DnsServers>  
  </Dns>  
  <LoadBalancers>  
    <LoadBalancer>  
      <Name>name-of-internal-load-balancer</Name>  
      <FrontendIpConfiguration>  
        <Type>type-of-ip-address</Type>  
        <SubnetName>name-of-subnet</SubnetName>  
        <StaticVirtualNetworkIPAddress>static-ip-address</StaticVirtualNetworkIPAddress>  
      </FrontendIpConfiguration>  
    </LoadBalancer>  
  </LoadBalancers>  
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
      <IsReserved>indicator-of-ip-reservation</IsReserved>  
      <ReservedIPName>name-of-reserved-ip</ReservedIpName>  
      <Type>type-of-ip</Type>  
    </VirtualIP>  
  </VirtualIPs>  
  <ExtensionConfiguration>  
    <AllRoles>  
      <Extension>  
        <Id>identifier-of-extension</Id>  
        <SequenceNumber>configuration-sequence</SequenceNumber>  
        <State>state-of-extension</State>  
      </Extension>  
    </AllRoles>  
    <NamedRoles>  
      <Role>  
        <RoleName>role_name1</RoleName>  
        <Extensions>  
          <Extension>  
            <Id>identifier-of-extension</Id>  
            <SequenceNumber>configuration-sequence</SequenceNumber>  
            <State>state-of-extension</State>  
          </Extension>  
        </Extensions>  
      </Role>  
    </NamedRoles>  
  </ExtensionConfiguration>  
  <ReservedIPName>name-of-reserved-ip</ReservedIpName>  
  <InternalDnsSuffix>dns-suffix</InternalDnsSuffix>  
</Deployment>  
```  
  
 The following table describes the elements in the response body.  
  
|Element name|Description|  
|------------------|-----------------|  
|Name|Specifies the name of the deployment.|  
|DeploymentSlot|Specifies the environment to which the cloud service is deployed, either `staging` or `production`.|  
|PrivateID|Specifies a unique identifier generated internally for  this deployment.|  
|Status|Specifies the status of the deployment.<br /><br /> Possible values are:<br /><br /> -                          `Running`<br /><br /> - `Suspended`<br /><br /> - `RunningTransitioning`<br /><br /> - `SuspendedTransitioning`<br /><br /> -                          `Starting`<br /><br /> - `Suspending`<br /><br /> -                          `Deploying`<br /><br /> - `Deleting`|  
|Label|Specifies a base-64-encoded identifier of the deployment. This identifier can be used for your tracking purposes.|  
|Url|Specifies the URL that is used to access the cloud service.<br /><br /> For example, if the service name is **MyService** you could access the access the service by calling: http:// **MyService**.cloudapp.net|  
|Configuration|Specifies the base-64-encoded configuration file of the deployment.|  
|[RoleInstanceList](rest-get-deployment.md#RoleInstanceList)|Contains the list of role instances in the deployment.|  
|[UpgradeStatus](rest-get-deployment.md#UpgradeStatus)|Contains settings for how the deployment is upgraded.|  
|UpgradeDomainCount|Contains an integer that represents the total number of upgrade domains for the deployment.<br /><br /> The `UpgradeDomainCount` element is only available using version 2011-06-01 or higher.|  
|[RoleList](rest-get-deployment.md#RoleList2)|Contains the list of roles in the deployment.|  
|SdkVersion|Specifies the version of the SDK that was used to generate the package for the deployment.<br /><br /> The `SdkVersion` element is only available using version 2011-06-01 or higher.|  
|Locked|`True` to prevent a new write operation on the deployment while it is being updated; otherwise `false`.<br /><br /> The `Locked` element is only available using version 2011-06-01 or higher.|  
|RollbackAllowed|`True` if the `RollbackDeploymentUpdateOrUpgrade` operation is allowed on the deployment; otherwise `false`.<br /><br /> The `RollbackAllowed` element is only available using version 2011-06-01 or higher.|  
|CreatedTime|Specifies the time that the deployment was created.|  
|LastModifiedTime|Specifies the last time that the deployment was modified.|  
|VirtualNetworkName|Specifies the name of the Virtual Network that the Virtual Machine connects to.<br /><br /> The `VirtualNetworkName` element is only available using version 2012-03-01 or higher.|  
|[Dns](rest-get-deployment.md#Dns)|Contains the DNS settings that are specified for deployment.<br /><br /> The `Dns` element is only available using version 2012-03-01 or higher.|  
|[LoadBalancers](rest-get-deployment.md#bk_loadbalancers)|Contains a list of internal load balancers that can be assigned to input endpoints.<br /><br /> The `LoadBalancers` element is only available using version 2014-05-01 or higher.|  
|[ExtendedProperties](rest-get-deployment.md#ExtendedProperties)|Specifies the properties that are used to provide more information about a deployment.|  
|[PersistentVMDowntime](rest-get-deployment.md#PersistentVMDownTimeInfo)|Specifies information about when the virtual machine has been started and stopped.<br /><br /> The `PersistentVMDowntime` element is only available using version 2012-03-01 or higher.|  
|[VirtualIPs](rest-get-deployment.md#VirtualIPs)|Specifies the virtual IP addresses for the deployment.<br /><br /> The `VirtualIPs` element is only available using version 2012-03-01 or higher.|  
|[ExtensionConfiguration](rest-get-deployment.md#bk_extensionconfig)|Specifies an extension that is added to the cloud service. In Azure, a process can run as an extension of a cloud service. You can add an extension to a cloud service by using [Add Extension](rest-add-extension.md) and you can add the extension to the deployment by using [Upgrade Deployment](rest-upgrade-deployment.md) or [Change Deployment Configuration](rest-change-deployment-configuration.md).<br /><br /> The `ExtensionConfiguration` element is only available using version 2013-03-01 or higher.|  
|ReservedIPName|Specifies the name of a reserved IP address that is to be assigned to the deployment.<br /><br /> The `ReservedIPName` element is only available using version 2014-05-01 or higher.|  
|InternalDnsSuffix|Specifies the domain name suffix for internal name resolution that is automatically assigned by Azure. All instances of Virtual Machines in a deployment are automatically assigned the domain name suffix. All instances of web roles or worker roles in a deployment are automatically assigned the domain name suffix when at least one role is assigned a computer name by using the `vmName` attribute. A deployment that is in a VNET with a DNS server configured is not assigned an internal domain name suffix.<br /><br /> The `InternalDnsSuffix` element is only available using version 2013-11-01 or higher.|  
  
###  <a name="RoleInstanceList"></a> RoleInstanceList  
 Contains the list of role instances in the deployment.  
  
|Element name|Description|  
|------------------|-----------------|  
|RoleName|Specifies the name of the role.|  
|InstanceName|Specifies the name of a specific role instance, if an instance of the role is running.|  
|InstanceStatus|Specifies the current status of a role instance.<br /><br /> `Unknown` :<br /><br /> - Indicates that the role state is currently unknown.<br /><br /> `CreatingVM` :<br /><br /> - Indicates that resources are being created for a Virtual Machine.<br /><br /> `StartingVM` :<br /><br /> - Indicates that a Virtual Machine is starting.<br /><br /> `CreatingRole` :<br /><br /> - Indicates that resources are being created for a role instance.<br /><br /> `StartingRole` :<br /><br /> - Indicates that a role instance is starting.<br /><br /> `ReadyRole` :<br /><br /> - Indicates that a role instance has started and is ready to be used.<br /><br /> `BusyRole` :<br /><br /> - Indicates that a role instance is unavailable for requests. This state is usually generated while the role instance is being created or stopped.<br /><br /> `StoppingRole` :<br /><br /> - Indicates that a role instance is stopping.<br /><br /> `StoppingVM` :<br /><br /> - Indicates that a Virtual Machine is stopping.<br /><br /> `DeletingVM` :<br /><br /> - Indicates that a Virtual Machine is being deleted.<br /><br /> `StoppedVM` :<br /><br /> - Indicates that a Virtual Machine is not running. This is the final state of the shutdown process, and no other status messages should be received after `StoppedVM`.<br /><br /> `RestartingRole` :<br /><br /> - Indicates that a role instance has unexpectedly stopped or has failed to start. This status indicates that there is a problem with the role instance that is causing it to crash or preventing it from starting, and must be corrected before the role instance can be started. The `InstanceStateDetails` and `InstanceErrorCode` fields can hold information about the role error that caused this state.<br /><br /> `CyclingRole` :<br /><br /> - Indicates that a role has continually crashed after being started by Azure. This status indicates that there is a problem with the role that prevents it from starting, and may be generated after the `StartingRole` even `ReadyRole` statuses are received. The problem in the role must be found and corrected before the role can be started. The `InstanceStateDetails` and `InstanceErrorCode` fields can hold information about the role error that caused this state, which may be useful for identifying and debugging the problem. The `CyclingRole` element is only returned if the version is 2014-02-01 or lower.<br /><br /> `FailedStartingRole` :<br /><br /> - The role has continually failed to start. This status indicates that there is a problem with the role instance that prevents it from starting, and may be generated after the process returns `StartingRole`. The problem in the role must be found and corrected before the role can be started. The `InstanceStateDetails` and `InstanceErrorCode` fields can hold information about the role error that caused this state, which may be useful for identifying and debugging the problem.<br /><br /> `FailedStartingVM` :<br /><br /> - Indicates that a Virtual Machine has continually failed to start. This status is generated by Azure, and does not indicate an error with the role. It may be generated after the `StartingRole` state.<br /><br /> `UnresponsiveRole` :<br /><br /> - Indicates that a role instance has timed out before receiving a status message and is not responding to requests.<br /><br /> `StoppedDeallocated` :<br /><br /> - Indicates that a role instance has been stopped and all allocated resources have been released. This stops billing for the role instance. Role instances that have a status of `StoppedDeallocated` are only returned in the role instance list if the version is 2013-06-01 or higher. If all role instances in the deployment have a status of `StoppedDeallocated`, the deployment is not returned if the version is lower than 2013-06-01.<br /><br /> `Preparing` :<br /><br /> - Indicates that the blob is being copied from the remote source location. This status is only returned f the version is 2014-05-01 or higher.|  
|ExtendedInstanceStatus|Specifies additional status details if available for the deployment. If a blob is being copied from a remote source location to a storage account, the value of this element contains the percentage of the blob that has been copied.<br /><br /> The `ExtendedInstanceStatus` element is only available using version 2015-05-01 or higher.|  
|InstanceUpgradeDomain|Specifies the upgrade domain that the role instance belongs to.  During an upgrade deployment, all roles in the same upgrade domain are upgraded at the same time.<br /><br /> The `InstanceUpgradeDomain` element is only available using version 2011-06-01 or higher.|  
|InstanceFaultDomain|Specifies the fault domain that the role instance belongs to.  Role instances in the same fault domain may be vulnerable to the failure of a single piece of hardware.<br /><br /> The `InstanceFaultDomain` element is only available using version 2011-06-01 or higher.|  
|InstanceSize|Specifies the size of the role instance.<br /><br /> The `InstanceSize` element is only available using version 2011-06-01 or higher.|  
|InstanceStateDetails|Provides a snapshot of the state of the role instance at the time that the operation was called.<br /><br /> The `InstanceStateDetails` element is only available using version 2011-10-01 or higher.|  
|InstanceErrorCode|The error code of the latest role start.<br /><br /> For Virtual Machines the error codes are:<br /><br /> - WaitTimeout - The role instance did not communicate within 25 minutes. Typically this indicates that it did not start or that the guest agent is not installed.<br /><br /> - VhdTooLarge - The VHD image selected was too large for the role instance.<br /><br /> - AzureInternalError – An internal error has occurred that has caused to role instance to fail to start. Contact support for additional assistance.<br /><br /> For web and worker roles this field returns an error code that can be provided to Azure support to assist in resolution of errors. Typically this field will be empty.<br /><br /> The `InstanceErrorCode` element is only available using version 2011-10-01 or higher.|  
|IpAddress|Specifies the IP address of the role instance (DIP).<br /><br /> The `IpAddress` element is only available using version 2012-03-01 or higher.|  
|[InstanceEndpoints](rest-get-deployment.md#InstanceEndpoints)|Contains the list of instance endpoints for the role.|  
|PowerState|The running state of the virtual machine.<br /><br /> The following are possible values:<br /><br /> -                          `Starting`<br /><br /> - `Started`<br /><br /> -                          `Stopping`<br /><br /> - `Stopped`<br /><br /> - `Unknown`|  
|HostName|Specifies the DNS host name of the cloud service in which the role instance is running. This element is only listed for Virtual Machine deployments.|  
|RemoteAccessCertificateThumbprint|Specifies the thumbprint of the RDP server certificate (in Windows) or SSH server certificate (in Linux).  The thumbprint is only used for Virtual Machines that have been created from an image.<br /><br /> The `RemoteAccessCertificateThumbprint` element is only available using version 2012-08-01 or higher.|  
|[GuestAgentStatus](rest-get-deployment.md#bk_guestagent)|Specifies information about the agent that is installed on an instance.<br /><br /> The `GuestAgentStatus` element is only available using version 2014-04-01 or higher.|  
|[ResourceExtensionStatusList](rest-get-deployment.md#bk_extensionlist)|Specifies information about the extensions that are installed on an instance.<br /><br /> The `ResourceExtensionStatusList` element is only available using version 2014-04-01 or higher.|  
|[PublicIPs](rest-get-deployment.md#bk_publicips)|Optional. Contains a public IP address that can be used in addition to default virtual IP address for the Virtual Machine.<br /><br /> The `PublicIPs` element is only available using version 2014-05-01 or higher.|  
|[NetworkInterfaces](rest-get-deployment.md#NetworkInterfaces)|Optional, A set of secondary network interfaces. The number of secondary network interfaces allowed depends on the size of the virtual machine.<br /><br /> The NetworkInterfaces element is only available using version 2014-08-01 or higher.|  
  
###  <a name="InstanceEndpoints"></a> InstanceEndpoints  
 Contains the list of instance endpoints for the role.  
  
|Element name|Description|  
|------------------|-----------------|  
|Name|Specifies the name of the endpoint.|  
|Vip|Specifies the virtual IP address of the endpoint.<br /><br /> The `Vip` element is only available using version 2011-06-01 or higher.|  
|PublicPort|Specifies the external port that is used by the endpoint.|  
|LocalPort|Specifies the internal port that is used by the endpoint.|  
|Protocol|Specifies the protocol of traffic on the endpoint.|  
  
###  <a name="UpgradeStatus"></a> UpgradeStatus  
 Specifies information about an upgrade occurring on the deployment.  
  
|Element name|Description|  
|------------------|-----------------|  
|UpgradeType|Specifies the type of the upgrade.<br /><br /> Possible values are:<br /><br /> -                          `Auto`<br /><br /> - `Manual`<br /><br /> -                          `Simultaneous`|  
|CurrentUpgradeDomainState|Specifies the current state of the upgrade. Possible values are `Before` and `During`.|  
|CurrentUpgradeDomain|Contains an integer value that identifies the current upgrade domain. Upgrade domains are identified with a zero-based index: the first upgrade domain has an ID of 0, the second has an ID of 1, and so on.|  
  
##  <a name="RoleList2"></a> RoleList  
 Contains the list of roles in the deployment.  
  
|Element name|Description|  
|------------------|-----------------|  
|RoleName|Specifies the name of the role.|  
|OsVersion|Specifies the version of the operating system on which the role instances are running.|  
|RoleType|Specifies the type of the role. This element is only listed for Virtual Machine deployments and by default is `PersistentVMRole`.|  
|LicenseType|Specifies that the image or disk that is being used was licensed on-premises. This element is only used for images that contain the Windows Server operating system.<br /><br /> Possible values are:<br /><br /> - Windows_Client<br /><br /> - Windows_Server|  
|[ConfigurationSets](rest-get-deployment.md#ConfigurationSets)|Contains a collection of values that represents system or application configuration settings.|  
|AvailabilitySetName|Specifies the name of a collection of virtual machines.|  
|[DataVirtualHardDisks](rest-get-deployment.md#DataVirtualHardDisks)|Contains the parameters that are used to add a data disk to a Virtual Machine.|  
|[OSVirtualHardDisk](rest-get-deployment.md#OSVirtualHardDisk)|Contains the parameters that are used to create the operating system disk for a Virtual Machine.|  
|RoleSize|Specifies the size of the role instance.|  
|ProvisionGuestAgent|Optional. Indicates whether the VM Agent is installed on the Virtual Machine. To run a resource extension in a Virtual Machine, this service must be installed.<br /><br /> Possible values are:<br /><br /> -                      `true`<br /><br /> - `false`|  
|[ResourceExtensionReferences](rest-get-deployment.md#bk_resourceextensionreferences)|Optional. Contains a collection of resource extensions that are to be installed on the Virtual Machine. This element is used if ProvisionGuestAgent is set to `true`.|  
  
##  <a name="ConfigurationSets"></a> ConfigurationSets  
 Contains a collection of objects that provide system or application data.  
  
|Element name|Description|  
|------------------|-----------------|  
|ConfigurationSetType|Specifies the configuration type for the configuration set. This is currently always set to NetworkConfiguration.|  
|[InputEndpoints](rest-get-deployment.md#InputEndpoints)|Contains a collection of external endpoints for a Virtual Machine.|  
|[SubnetNames](rest-get-deployment.md#bk_subnetnames)|Contains a list of Virtual Network subnet names to which the deployment belongs.|  
|[PublicIPs](rest-get-deployment.md#bk_publicips)|Optional. Contains a public IP address that can be used in addition to default virtual IP address for the Virtual Machine.<br /><br /> The `PublicIPs` element is only available using version 2014-05-01 or higher.|  
|[NetworkInterfaces](rest-get-deployment.md#NetworkInterfaces)|Optional, A set of secondary network interfaces. The number of secondary network interfaces allowed depends on the size of the virtual machine.<br /><br /> The NetworkInterfaces element is only available using version 2014-08-01 or higher.|  
|StaticVirtualNetworkIPAddress|Specifies the internal IP address for the Virtual Machine in a Virtual Network. If this element is specified, the [SubnetNames](rest-get-deployment.md#bk_subnetnames) element will contain only one subnet. The IP address specified in this element belongs to the subnet that is defined in [SubnetNames](rest-get-deployment.md#bk_subnetnames).<br /><br /> The `StaticVirtualNetworkIPAddress` element is only available using version 2013-11-01 or higher.|  
  
##  <a name="InputEndpoints"></a> InputEndpoints  
 Contains a collection of external endpoints for a Virtual Machine.  
  
|Element name|Description|  
|------------------|-----------------|  
|LoadBalancedEndpointSetName|Specifies a name of a set of load-balanced endpoints. This element is only listed for Virtual Machine deployments.|  
|LocalPort|Specifies the internal port on which the Virtual Machine is listening to serve the endpoint. This element is only listed for Virtual Machine deployments.|  
|Name|Specifies the name for the external endpoint. This element is only listed for Virtual Machine deployments.|  
|Port|Specifies the external port to use for the endpoint.|  
|[LoadBalancerProbe](rest-get-deployment.md#LoadBalancerProbe)|Contains the endpoint settings which the Azure load balancer uses to monitor the availability of a Virtual Machine before forwarding traffic to the endpoint.|  
|LoadBalancerName|Optional. Specifies the name of the internal load balancer that is associated with this endpoint. The internal load balancer name is specified in [LoadBalancers](rest-get-deployment.md#bk_loadbalancers).<br /><br /> The `LoadBalancerName` element is only available using version 2014-05-01 or higher.|  
|IdleTimeoutInMinutes|Optional. Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes. The default value is 4 minutes. This element is only used when the protocol is set to TCP.<br /><br /> The `IdleTimeoutInMinutes` element is only available using version 2014-06-01 or higher.|  
|Protocol|Specifies the transport protocol for the endpoint.<br /><br /> Possible Values are:<br /><br /> -                      `TCP`<br /><br /> - `UDP`|  
|Vip|Specifies the virtual IP address for the endpoint.|  
  
##  <a name="LoadBalancerProbe"></a> LoadBalancerProbe  
 Contains the endpoint settings which the Azure load balancer uses to monitor the availability of a Virtual Machine before forwarding traffic to the endpoint.  
  
|Element name|Description|  
|------------------|-----------------|  
|Path|Specifies the relative path name to inspect to determine the availability status. If Protocol is set to TCP, this value must be NULL.<br /><br /> Example:<br /><br /> path<br /><br /> The probe will use https://example.com/path to perform the probe.|  
|Port|Specifies the port to use to inspect the availability status.|  
|Protocol|Specifies the protocol to use to inspect the availability status.<br /><br /> Possible values are:<br /><br /> - `HTTP`<br /><br /> -                      `TCP`|  
  
##  <a name="Dns"></a> Dns  
 Specifies the custom DNS settings that are specified for deployment.  
  
|Element name|Description|  
|------------------|-----------------|  
|Name|Specifies the name of the DNS server.|  
|Address|Specifies the IP address of the DNS server.|  
  
##  <a name="ExtendedProperties"></a> ExtendedProperties  
 Specifies the properties that are used to provide more information about a deployment.  
  
|Element name|Description|  
|------------------|-----------------|  
|Name|Specifies the name of a property that is associated with the deployment.|  
|Value|Specifies the value of a property that is associated with the deployment.|  
  
##  <a name="PersistentVMDownTimeInfo"></a> PersistentVMDowntime  
 Specifies information about when the Virtual Machine has been started and stopped.  
  
|Element name|Description|  
|------------------|-----------------|  
|StartTime|Specifies the time that the Virtual Machine was started.|  
|EndTime|Specifies the time that the Virtual Machine was stopped.|  
|Status|Specifies the status of the Virtual Machine.|  
  
##  <a name="VirtualIPs"></a> VirtualIPs  
 Contains the virtual IP addresses that are specified for the deployment.  
  
|Element name|Description|  
|------------------|-----------------|  
|Address|Specifies the virtual IP address of the deployment.|  
|IsReserved|Indicates whether the virtual IP address is reserved.<br /><br /> Possible values are:<br /><br /> -                      `true`<br /><br /> -                      `false`|  
|ReservedIPName|Specifies the name of a reserved IP address that was assigned to the deployment.|  
|Type|Specifies a value of `Private` if the virtual IP address is associated with an internal load balancer.|  
  
##  <a name="bk_subnetnames"></a> SubnetNames  
 Contains a list of subnets to which the Virtual Machine will belong.  
  
|Element name|Description|  
|------------------|-----------------|  
|SubnetName|Required. Specifies the name of a subnet to which the Virtual Machine belongs.|  
  
##  <a name="DataVirtualHardDisks"></a> DataVirtualHardDisks  
 Contains the parameters that are used to add a data disk to a Virtual Machine.  
  
|Element name|Description|  
|------------------|-----------------|  
|HostCaching|Specifies the platform caching behavior of the data disk blob for read/write efficiency.<br /><br /> Possible values are:<br /><br /> -                      `None`<br /><br /> -                      `ReadOnly`<br /><br /> -                      `ReadWrite`<br /><br /> The default vault is `ReadOnly`.|  
|DiskName|Specifies the name of the VHD to use to create the data disk for the Virtual Machine.|  
|Lun|Specifies the Logical Unit Number (LUN) for the data disk. The LUN specifies the slot in which the data drive appears when mounted for usage by the Virtual Machine. This element is only listed when more than one data disk is attached to a Virtual Machine.<br /><br /> Valid values are 0 – 31.|  
|LogicalDiskSizeInGB|Specifies the size, in GB, of the disk to be attached to the Virtual Machine.|  
|MediaLink|Specifies the location in Azure storage of the VHD that is associated with the disk.<br /><br /> Example:<br /><br /> http://example.blob.core.windows.net/disks/mydatadisk.vhd|  
|IOType|This property identifies the type of the storage account for the backing VHD.<br /><br /> If the backing VHD is in an Provisioned Storage account, “Provisioned” is returned otherwise “Standard” is returned.Note: This value is populated by Azure platform when the disk is created, not by the user.<br /><br /> This property is only returned with a version header of 2014-10-01 or newer.|  
  
##  <a name="OSVirtualHardDisk"></a> OSVirtualHardDisk  
 Contains the parameters that are used to create the operating system disk for a Virtual Machine.  
  
|Element name|Description|  
|------------------|-----------------|  
|HostCaching|Specifies the platform caching behavior of the operating system disk blob for read/write efficiency.<br /><br /> Possible values are:<br /><br /> -                      `ReadOnly`<br /><br /> - `ReadWrite`|  
|DiskName|Specifies the name an operating system image in the image repository.|  
|MediaLink|Specifies the location in Azure storage of the VHD that is associated with the operating system disk.|  
|SourceImageName|Specifies the name of the source image that was used to create the operating system disk.|  
|OS|Specifies the operating system that is running on the Virtual Machine.<br /><br /> Possible values are:<br /><br /> - `Windows`<br /><br /> - `Linux`|  
|RemoteSourceImageLink|Specifies a URI to the location where an OS image is stored that was used to create the Virtual Machine. This location can be a different location than the user or platform repositories in Azure. An image is always associated with a VHD, which is a .vhd file stored as a page blob in a storage account. If you specify the path to an image with this element, an associated VHD is created and you must use the MediaLink element to specify the location in storage where the VHD will be located. If this element is used, SourceImageName is not used.<br /><br /> The `RemoteSourceImageLink` element is only available using version 2014-05-01 or higher.|  
|IOType|This property identifies the type of the storage account for the backing VHD.<br /><br /> If the backing VHD is in an Provisioned Storage account, “Provisioned” is returned otherwise “Standard” is returned.<br /><br /> Note: This value is populated by Azure platform when the disk is created, not by the user.<br /><br /> This property is only returned with a version header of 2014-10-01 or newer|  
  
##  <a name="bk_resourceextensionreferences"></a> ResourceExtensionReferences  
 Contains a collection of resource extensions that are to be installed on the Virtual Machine. A resource extension is a software component that is installed on the Virtual Machine. The VM Agent must be installed on the Virtual Machine to install resource extensions.  
  
|Element name|Description|  
|------------------|-----------------|  
|ResourceExtensionReference|Required. Specifies the properties of a resource extension that should be installed on the Virtual Machine.|  
|ReferenceName|Required. Specifies the reference name of the resource extension.|  
|Publisher|Required. Specifies the name of the publisher who created the resource extension. You can use [List Resource Extensions](http://msdn.microsoft.com/library/azure/b4d5b03b-9fff-4ddd-a144-3fae2d53f91c) to find the publisher name of a resource extension.|  
|Name|Required. Specifies the name of the resource extension. You can use [List Resource Extensions](http://msdn.microsoft.com/library/b4d5b03b-9fff-4ddd-a144-3fae2d53f91c) to find the names of available resource extensions.|  
|Version|Required. Specifies the version of the resource extension. You can use [List Resource Extension Versions](http://msdn.microsoft.com/library/azure/4f1e9218-b44e-407e-802d-a1549ac16e1c) to find the version of the resource extension.|  
|[ResourceExtensionParameterValues](rest-get-deployment.md#bk_parametervalues)|Optional. Contains a collection of parameters that are passed to the resource extension when it is installed.|  
|State|Optional. Specifies the state of the resource extension.<br /><br /> Possible values are:<br /><br /> -                      `Enable`<br /><br /> -                      `Disable`<br /><br /> The default value is `Enable`.|  
  
##  <a name="bk_parametervalues"></a> ResourceExtensionParameterValues  
 Contains a collection of parameters that are passed to the resource extension when it is installed.  
  
|Element name|Description|  
|------------------|-----------------|  
|ResourceExtensionParameterValue|Required. Specifies the key, value, and type of the parameter.|  
|Key|Required. Specifies the key of the parameter.|  
|Value|Required. Specifies the base-64 encoded value of the parameter.|  
|Type|Required. Specifies the type for the resource extension.<br /><br /> Possible values are:<br /><br /> - `Public`<br /><br /> -                      `Private`<br /><br /> If this value is set to `Private`, the parameter will not be returned by [Get Deployment](rest-get-deployment.md). You can only specify one public parameter and one private parameter for a maximum of two parameters.|  
  
##  <a name="bk_extensionconfig"></a> ExtensionConfiguration  
 Contains extensions that are added to the cloud service.  
  
|Element name|Description|  
|------------------|-----------------|  
|AllRoles|Specifies a list of extensions that are applied to all roles in a deployment.|  
|[Extension](rest-get-deployment.md#bk_extension)|Specifies an extension that is to be deployed to a role in a cloud service.|  
|[NamedRoles](rest-get-deployment.md#bk_namedroles)|Specifies a list of extensions that are applied to specific roles in a deployment.|  
  
##  <a name="bk_extension"></a> Extension  
 Specifies an extension that is to be deployed to a role in a cloud service.  
  
|Element name|Description|  
|------------------|-----------------|  
|Id|Specifies the identifier of the extension. The identifier is created when the extension is added to the cloud service. You can find the Id of an extension that was added to a cloud service by using [List Extensions](rest-list-extensions.md).|  
|SequenceNumber|Specifies the number of the last applied configuration for the extension. This number is assigned by Azure and is incremented with every configuration change.<br /><br /> The `SequenceNumber` element is only available using version 2014-06-01 or higher.|  
|State|Optional. Specifies the state of the extension. This element only applies to JSON configured extensions.<br /><br /> Possible values are:<br /><br /> -                      `Enable`<br /><br /> -                      `Disable`<br /><br /> -                      `Uninstall`<br /><br /> The default value is `Enable`.<br /><br /> The `State` element is only available using version 2014-06-01 or higher.|  
  
##  <a name="bk_namedroles"></a> NamedRoles  
 Specifies a list of extensions that are applied to specific roles in a deployment.  
  
|Element name|Description|  
|------------------|-----------------|  
|Role|Specifies a specific role to which the extension is added.|  
|RoleName|Specifies the name of the role.|  
|[Extension](rest-get-deployment.md#bk_extension)|Specifies an extension that is to be deployed to a role in a cloud service.|  
  
##  <a name="bk_guestagent"></a> GuestAgentStatus  
 Specifies information about the agent that is installed on an instance.  
  
|Element name|Description|  
|------------------|-----------------|  
|ProtocolVersion|Specifies the version of the protocol that is used by the agent for status reporting.|  
|Timestamp|Specifies the UTC time when the status was reported.|  
|GuestAgentVersion|Specifies the version of the agent that is installed on the instance.|  
|Status|Specifies the status of the agent.<br /><br /> Possible values are:<br /><br /> - `Ready`<br /><br /> -                      `NotReady`|  
|[FormattedMessage](rest-get-deployment.md#bk_message)|Specifies a localized status message.|  
  
##  <a name="bk_message"></a> FormattedMessage  
 Specifies a localized status message.  
  
|Element name|Description|  
|------------------|-----------------|  
|Language|Specifies the language of the message.|  
|Message|Specifies the message.|  
  
##  <a name="bk_extensionlist"></a> ResourceExtensionStatusList  
 Specifies information about the extensions that are installed on an instance.  
  
|Element name|Description|  
|------------------|-----------------|  
|[ResourceExtensionStatus](rest-get-deployment.md#bk_extensionstatus)|Specifies information about a specific extension.|  
  
##  <a name="bk_extensionstatus"></a> ResourceExtensionStatus  
 Specifies information about a specific extension.  
  
|Element name|Description|  
|------------------|-----------------|  
|HandlerName|Specifies the name of the extension.|  
|Version|Specifies the version of the extension.|  
|Status|Specifies the status of the extension.<br /><br /> Possible values are:<br /><br /> -                      `Installing`<br /><br /> -                      `Ready`<br /><br /> -                      `NotReady`<br /><br /> -                      `Unresponsive`|  
|Code|Specifies the status code that is returned by the extension.|  
|[FormattedMessage](rest-get-deployment.md#bk_message)|Specifies a localized status message.|  
|[ExtensionSettingStatus](rest-get-deployment.md#bk_extstatus)|Specifies status information about the settings that were passes to the extension.|  
  
##  <a name="bk_publicips"></a> PublicIPs  
 Contains a public IP address that can be used in addition to default virtual IP address for the Virtual Machine.  
  
|Element name|Description|  
|------------------|-----------------|  
|PublicIP|Required. Specifies an additional IP public address that can be used to communicate with the Virtual Machine.|  
|Name|Required. Specifies the name of the public IP address.|  
|Address|Required. Specifies the IP address for the public IP.|  
|IdleTimeoutInMinutes|Optional. Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes. The default value is 4 minutes. This element is only used when the protocol is set to TCP.<br /><br /> The `IdleTimeoutInMinutes` element is only available using version 2014-06-01 or higher.|  
|DomainNameLabel|Optional. Specifies the domain name label for the public IP.<br /><br /> The `DomainNameLabel` element is only available using version 2015-03-01 or higher.|  
|Fqdn|Optional. Specifies a FQDN registered for this public IP.|  
  
##  <a name="NetworkInterfaces"></a> NetworkInterfaces  
 Contains a set of secondary network interfaces.  
  
|Element name|Description|  
|------------------|-----------------|  
|NetworkInterface|Required. Specifies a secondary network interface.|  
|Name|Required, Specifies the name of the secondary network interface.|  
|[IPConfigurations](rest-get-deployment.md#IPConfigurations)|Required. Specifies a set of IP address configurations for a secondary network interface.|  
  
##  <a name="IPConfigurations"></a> IPConfigurations  
 Specifies a set of IP address configurations for a secondary network interface.  
  
|Element name|Description|  
|------------------|-----------------|  
|IPConfiguration|Required. Specifies an IP address configuration for a secondary network interface.<br /><br /> Currently only one IP address configuration is supported for a secondary network interface.|  
|SubnetName|Required. Specifies the name of the virtual network subnet that this IP address configuration belongs.|  
|Address|Required, Specifies the internal IP address configured for a secondary network interface.|  
  
##  <a name="bk_loadbalancers"></a> LoadBalancers  
 Contains a list of internal load balancers that can be assigned to input endpoints.  
  
|Element name|Description|  
|------------------|-----------------|  
|LoadBalancer|Required. Specifies the attributes of an internal load balancer.|  
|Name|Required. Specifies the name of the internal load balancer.|  
|FrontendIpConfiguration|Required. Specifies the configuration for the virtual IP address that is provided by the load balancer.|  
|Type|Required. Specifies the type of virtual IP address that is provided by the load balancer. The only allowable value is `Private`.|  
|SubnetName|Required if the deployment exists in a virtual network and a StaticVirtualNetworkIPAddress is assigned. Specifies the subnet of the virtual network that the load balancer uses. The virtual IP address that is managed by the load balancer is contained in this subnet.|  
|StaticVirtualNetworkIPAddress|Optional. Specifies a specific virtual IP address that the load balancer uses from the subnet in the virtual network.|  
  
##  <a name="bk_extstatus"></a> ExtensionSettingStatus  
 Specifies status information about the settings that were passes to the extension.  
  
|Element name|Description|  
|------------------|-----------------|  
|Timestamp|Specifies the UTC time when the status was reported.|  
|Name|Specifies the name of the setting that was passed to the extension.|  
|Operation|Specifies the operation that was performed by the extension using the setting.|  
|Status|Specifies the status of the operation.<br /><br /> Possible values are:<br /><br /> -                      `transitioning`<br /><br /> -                      `error`<br /><br /> -                      `success`<br /><br /> -                      `warning`|  
|Code|Specifies the status code for the operation.|  
|[FormattedMessage](rest-get-deployment.md#bk_message)|Specifies a localized status message.|  
|[SubStatusList](rest-get-deployment.md#bk_substat)|Contains a list of additional status information if it exists.|  
  
##  <a name="bk_substat"></a> SubStatusList  
 Contains a list of additional status information if it exists.  
  
|Element name|Description|  
|------------------|-----------------|  
|SubStatus|Contains information about additional status messages returned by the extension.|  
|Name|Specifies the status identifier.|  
|Status|Specifies the status of the operation.<br /><br /> Possible values are:<br /><br /> - `transitioning`<br /><br /> - `error`<br /><br /> -                      `success`<br /><br /> - `warning`|  
|[FormattedMessage](rest-get-deployment.md#bk_message)|Specifies a localized status message.|  
  
## Remarks  
 To obtain the names of cloud services in your subscription, you can use [List Cloud Services](rest-list-cloud-services.md).