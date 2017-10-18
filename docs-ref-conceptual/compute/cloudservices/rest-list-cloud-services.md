---
title: "Azure Cloud Services REST - List Cloud Services | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cloud-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 0bf0061f-c2c7-475c-aaa8-0d95da202d89
caps.latest.revision: 38
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# List Cloud Services
The `List Cloud Services` operation lists the cloud services that are available under the specified subscription.  
  
## Request  
 The `List Cloud Services` request may be specified as follows. Replace `<subscription-id>` with your subscription ID.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.core.windows.net/<subscription-id>/services/hostedservices`|  
  
### URI Parameters  
 None.  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. This header should be set to `2009-10-01` or higher.|  
|`x-ms-continuation-token`|Optional. Specifies a continuation token that enables you to get the remainder of the response when there are more cloud services to list than can be returned in the allotted time. The value of this token is returned in the header of a previous response and will only be returned if additional cloud services need to be listed.|  
  
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
|`x-ms-request-id`|Specifies a value that uniquely identifies a request made against the management service.|  
|`x-ms-continuation-token`|Specifies a continuation token that enables you to get the remainder of the response when there are more cloud services to list than can be returned in the allotted time. If a large number of cloud services exist in the subscription, not all of them can be listed in a single response. You can use the token in this header in subsequent operation requests until all cloud services are returned.|  
  
### Response Body  
 The format of the response body is as follows:  
  
```  
  
<?xml version="1.0" encoding="utf-8"?>  
  <HostedServices xmlns=”http://schemas.microsoft.com/windowsazure”>  
    <HostedService>  
      <Url>address-of-cloud-service</Url>  
      <ServiceName>name-of-cloud-service</ServiceName>  
      <HostedServiceProperties>  
        <Description>description-of-cloud-service</Description>  
        <AffinityGroup>name-of-affinity-group</AffinityGroup>  
        <Location>location-of-cloud-service</Location>  
        <Label>label-of-cloud-service</Label>  
        <Status>status-of-cloud-service</Status>  
        <DateCreated>date-created</DateCreated>  
        <DateLastModified>date-modified</DateLastModified>  
        <ExtendedProperties>  
          <ExtendedProperty>  
            <Name>name-of-property-name</Name>  
            <Value>value-of-property</Value>  
          </ExtendedProperty>  
        </ExtendedProperties>  
        <ReverseDnsFqdn>reverse-dns-fqdn</ReverseDnsFqdn>  
      </HostedServiceProperties>  
      <DefaultWinRMCertificateThumbprint>certificate-thumbprint-for-winrm</DefaultWinRMCertificateThumbprint>  
      <ComputeCapabilities>  
        <VirtualMachineRoleSizes>  
          <RoleSize>role-size-name</RoleSize>  
        </VirtualMachineRoleSizes>  
        <WebWorkerRoleSizes>  
          <RoleSize>role-size-name</RoleSize>  
        </WebWorkerRoleSizes>  
      </ComputeCapabilities>  
    </HostedService>  
  </HostedServices>  
  
```  
  
 The following table describes the elements of the response body.  
  
|Element name|Description|  
|------------------|-----------------|  
|Url|Specifies the request URI that is used to obtain information about the cloud service.|  
|ServiceName|Specifies the name of the cloud service. This name is the DNS prefix name and can be used to access the service.<br /><br /> For example, if the service name is **MyService** you could access the access the service by calling: http://**MyService**.cloudapp.net|  
|Description|Specifies the description of the cloud service.<br /><br /> The `Description` element is only available using version 2012-03-01 or higher.|  
|AffinityGroup|Specifies the affinity group with which this cloud service is associated, if any. If the service is associated with an affinity group, the `Location` element is not returned.<br /><br /> The `AffinityGroup` element is only available using version 2012-03-01 or higher.|  
|Location|Specifies the geo-location of the cloud service in Azure, if the service is not associated with an affinity group. If a location is specified, the `AffinityGroup` element is not returned.<br /><br /> The `Location` element is only available using version 2012-03-01 or higher.|  
|Label|Specifies the base-64 encoded identifier of the cloud service. This identifier can be used for your tracking purposes.<br /><br /> The `Label` element is only available using version 2012-03-01 or higher.|  
|Status|Specifies the status of the cloud service. Possible values are:<br /><br /> -   `Creating`<br />-   `Created`<br />-   `Deleting`<br />-   `Deleted`<br />-   `Changing`<br />-   `ResolvingDns`<br /><br /> The `Status` element is only available using version 2012-03-01 or higher.|  
|DateCreated|Specifies the date that the cloud service was created, in [4DigitYear]-[2DigitMonth]-[2DigitDay]T[2DigitHour]:[2DigitMinute]:[2DigitSecond]Z format. The date 2011-05-11T16:15:26Z is an example that could be returned by the `DateCreated` or `DateLastModified` elements.<br /><br /> The `DateCreated` element is only available using version 2012-03-01 or higher.|  
|DateLastModified|Specifies the date that the cloud service was last updated, in [4DigitYear]-[2DigitMonth]-[2DigitDay]T[2DigitHour]:[2DigitMinute]:[2DigitSecond]Z format. The date 2011-05-11T16:15:26Z is an example that could be returned by the `DateCreated` or `DateLastModified` elements<br /><br /> The `DateLastModified` element is only available using version 2012-03-01 or higher.|  
|Name|Specifies the name of an extended cloud service property. Each extended property must have both a defined name and value. You can define a maximum of 50 extended properties.<br /><br /> The `Name` element is only available using version 2012-03-01 or higher.|  
|Value|Represents the value of an extended cloud service property. The extended property value can be up to 255 characters long.<br /><br /> The `Value` element is only available using version 2012-03-01 or higher.|  
|ReverseDnsFqdn|Optional. Specifies the DNS address to which the IP address of the cloud service resolves when queried using a reverse DNS query.<br /><br /> The `ReverseDnsFqdn` element is only available using version 2014-06-01 or higher.|  
|DefaultWinRMCertificateThumbprint|Specifies the default certificate for a secure connection with WinRM. If a certificate thumbprint is not specified for WinRM when a Virtual Machine is deployed in a cloud service, a certificate is automatically created and the thumbprint is listed as the value of this element. For more information about defining WinRM, see [Create Virtual Machine Deployment](http://msdn.microsoft.com/library/azure/jj157194.aspx) or [Add Role](http://msdn.microsoft.com/library/azure/jj157186.aspx).|  
|[ComputeCapabilities](rest-list-cloud-services.md#bk_computecapabilities)|Specifies the roles sizes that are available for deployments in the cloud service. The available role sizes are defined by the resources that are supported by the cloud service. For example, deployments of web roles and worker roles may have different sizes available than deployments of Virtual Machines.<br /><br /> The `ComputeCapabilities` element is only available using version 2014-05-01 or higher.|  
  
##  <a name="bk_computecapabilities"></a> ComputeCapabilities  
 Specifies the roles sizes that are available for deployments in the cloud service.  
  
|Element name|Description|  
|------------------|-----------------|  
|VirtualMachineRoleSizes|Contains a collection of RoleSize elements.|  
|WebWorkerRoleSizes|Contains a collection of RoleSize elements.|  
|RoleSize|Specifies the role size that is available for the type of deployment.|  
  
## Remarks  
 If the `x-ms-version` is older than 2012-03-01, cloud services that contain virtual machine deployments will not be returned.  
  
 You can see the cloud services that exist in your subscription by looking in the Cloud Services section of the Management Portal. You can also get a list of cloud services by using the [Get-AzureService](/powershell/module/azure/get-azureservice?view=azuresmps-4.0.0) cmdlet.