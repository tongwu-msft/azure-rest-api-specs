---
title: "Azure Cloud Services REST - Upgrade Deployment | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cloud-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a7b4059f-c6eb-4603-b2ea-8b25444fc092
caps.latest.revision: 38
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Upgrade Deployment
The `Upgrade Deployment` asynchronous operation initiates an update of role instances in a deployment using the package and configuration that you specify.  
  
## Request  
 The `Upgrade Deployment` request may be specified as follows. Replace `<subscription-id>` with the subscription ID, `<cloudservice-name>` with the name of the cloud service, `<deployment-slot>` with `staging` or `production`, or `<deployment-name>` with the name of the deployment.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deploymentslots/<deployment-slot>/`|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deployments/<deployment-name>/`|  
  
### URI Parameters  
  
|URI Parameter|Description|  
|-------------------|-----------------|  
|`comp=upgrade`|Required. Specifies that the deployment must be updated.|  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Content-Type`|Required. Set this header to `application/xml`.|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. This header should be set to `2009-10-01` or higher.|  
  
### Request Body  
 The format of the request body is as follows:  
  
```  
  
<?xml version="1.0" encoding="utf-8"?>  
<UpgradeDeployment xmlns="http://schemas.microsoft.com/windowsazure">  
  <Mode>type-of-upgrade</Mode>  
  <PackageUrl>url-to-package</PackageUrl>  
  <Configuration>base64-encoded-config-file</Configuration>  
  <Label>base-64-encoded-label</Label>  
  <RoleToUpgrade>role-name</RoleToUpgrade>  
  <Force>true|false</Force>  
  <ExtendedProperties>  
    <ExtendedProperty>  
      <Name>property-name</Name>  
      <Value>property-value</Value>  
    </ExtendedProperty>  
  </ExtendedProperties>  
  <ExtensionConfiguration>  
    <AllRoles>  
      <Extension>  
        <Id>identifier-of-extension</Id>  
        <State>state-of-extension</State>  
      </Extension>  
    </AllRoles>  
    <NamedRoles>  
      <Role>  
        <RoleName>role_name1</RoleName>  
        <Extensions>  
          <Extension>  
            <Id>identifier-of-extension</Id>  
            <State>state-of-extension</State>  
          </Extension>  
        </Extensions>  
      </Role>  
    </NamedRoles>  
  </ExtensionConfiguration>  
</UpgradeDeployment>  
  
```  
  
 The following table describes the elements in the request body.  
  
|Element name|Description|  
|------------------|-----------------|  
|Mode|Required. Specifies the type of update to initiate. Role instances are allocated to update domains when the service is deployed. Updates can be initiated manually in each update domain or initiated automatically in all update domains. Possible values are:<br /><br /> -   `Auto`<br />-   `Manual`<br />-   `Simultaneous`<br /><br /> If not specified, the default value is `Auto`.  If set to `Manual`, [WalkUpgradeDomain](rest-walk-upgrade-domain.md) must be called to apply the update. If set to `Auto`, the update is automatically applied to each update domain in sequence.<br /><br /> The `Simultaneous` setting is only available in version 2012-12-01 or higher.|  
|PackageUrl|Required. Specifies a URL that refers to the location of the service package in the Blob service. The service package can be located either in a storage account beneath the same subscription or a Shared Access Signature (SAS) URI from any storage account. For more info about Shared Access Signatures, see [Delegating Access with a Shared Access Signature](../../storageservices/delegating-access-with-a-shared-access-signature.md).|  
|Configuration|Required. Specifies the base-64 encoded service configuration file for the deployment.|  
|Label|Required. Specifies name for the cloud service that is base-64 encoded. The name may be up to 100 characters in length. It is recommended that the label be unique within the subscription. The name can be used identify the cloud service for your tracking purposes.|  
|RoleToUpgrade|Optional. Specifies the name of the specific role instance to update. In single role upgrade, all other roles can still recycle if there is an internal Azure upgrade scheduled. The update domain is guaranteed in this scenario.|  
|Force|Required. Indicates whether the update should proceed even when it will cause local data to be lost from some role instances. `True` if the update should proceed; otherwise `false`.<br /><br /> The `Force` element is only available using version 2011-10-01 or higher.|  
|Name|Optional. Specifies the name of an extended cloud service property. Each extended property must have both a defined name and value. You can have a maximum of 25 extended property name and value pairs.<br /><br /> The maximum length of the `Name` element is 64 characters, only alphanumeric characters and underscores are valid in the name, and the name must start with a letter. Attempting to use other characters, starting with a non-letter character, or entering a name that is identical to that of another extended property owned by the same cloud service, will result in a status code 400 (Bad Request) error.<br /><br /> The `Name` element is only available using version 2012-03-01 or higher.|  
|Value|Optional. Specifies the value of an extended cloud service property. Each extended property must have both a defined name and value. You can have a maximum of 25 extended property name and value pairs, and each extended property value has a maximum length of 255 characters.<br /><br /> You delete an extended property by setting the value to NULL.<br /><br /> The `Value` element is only available using version 2012-03-01 or higher.|  
|[ExtensionConfiguration](rest-upgrade-deployment.md#bk_extensionconfig)|Optional. Specifies an extension that is added to the cloud service. In Azure, a process can run as an extension of a cloud service. You must add an extension to the cloud service by using [Add Extension](rest-add-extension.md) before it can be added to the deployment during an update.<br /><br /> The `ExtensionConfiguration` element is only available using version 2013-03-01 or higher.|  
  
##  <a name="bk_extensionconfig"></a> ExtensionConfiguration  
 Specifies an extension that is added to the cloud service.  
  
|Element name|Description|  
|------------------|-----------------|  
|AllRoles|Optional. Specifies a list of extensions that are applied to all roles in a deployment.|  
|[Extension](rest-upgrade-deployment.md#bk_extension)|Required. Specifies an extension that is to be deployed to a role in a cloud service.|  
|[NamedRoles](rest-upgrade-deployment.md#bk_namedroles)|Optional. Specifies a list of extensions that are applied to specific roles in a deployment.|  
  
##  <a name="bk_extension"></a> Extension  
 Specifies an extension that is to be deployed to a role in a cloud service.  
  
|Element name|Description|  
|------------------|-----------------|  
|Id|Required. Specifies the identifier of the extension. The identifier is created when the extension is added to the cloud service. You can find the Id of an extension that was added to a cloud service by using [List Extensions](rest-list-extensions.md).|  
|State|Optional. Specifies the state of the extension. This element only applies to JSON configured extensions.<br /><br /> Possible values are:<br /><br /> -   `Enable`<br />-   `Disable`<br />-   `Uninstall`<br /><br /> The default value is `Enable`.<br /><br /> The `State` element is only available using version 2014-06-01 or higher.|  
  
##  <a name="bk_namedroles"></a> NamedRoles  
 Specifies a list of extensions that are applied to specific roles in a deployment.  
  
|Element name|Description|  
|------------------|-----------------|  
|Role|Required. Specifies a specific role to which the extension is added.|  
|RoleName|Required. Specifies the name of the role.|  
|[Extension](rest-upgrade-deployment.md#bk_extension)|Required. Specifies an extension that is to be deployed to a role in a cloud service.|  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 200 (OK).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers.  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|A value that uniquely identifies a request made against the management service. For an asynchronous operation, you can call [Get Operation Status](http://msdn.microsoft.com/library/azure/1215ece5-cbef-4a85-a3db-ab6c20c2c6df) with the value of the header to determine whether the operation is complete, has failed, or is still in progress.|  
  
### Response Body  
 None.  
  
## Remarks  
 To perform an automatic update of a deployment, call [Upgrade Deployment](rest-upgrade-deployment.md) or [Change Deployment Configuration](rest-change-deployment-configuration.md) with the `Mode` element set to `automatic`. The update proceeds from that point without a need for further input. You can call [Get Operation Status](http://msdn.microsoft.com/library/azure/1215ece5-cbef-4a85-a3db-ab6c20c2c6df) to determine when the update is complete.  
  
 To perform a manual update, first call [Upgrade Deployment](rest-upgrade-deployment.md) with the `Mode` element set to `manual`. Next, call [WalkUpgradeDomain](rest-walk-upgrade-domain.md) to update each domain within the deployment. You should make sure that the operation is complete by calling Get Operation Status before updating the next domain.  
  
 An update that adds or removes role instances will result in a configuration update to all roles that are deployed in the cloud service. Existing role instances need to be notified of new role instances so that all role instances can communicate together in the cloud service.  
  
 By default, a cloud service is deployed with five update domains, which are updated one at a time during an in-place update.  
  
 To determine the update domain in which a particular instance is running, use the `UpdateDomain` property of the `RoleInstance` class.