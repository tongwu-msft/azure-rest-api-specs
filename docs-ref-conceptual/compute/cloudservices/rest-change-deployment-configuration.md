---
title: "Azure Cloud Services REST - Change Deployment Configuration | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""

ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 73bb79fb-3593-48d3-8666-f028ac7cc845
caps.latest.revision: 31
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Change Deployment Configuration
The `Change Deployment Configuration` asynchronous operation initiates a change to the deployment configuration.  
  
## Request  
 The `Change Deployment Configuration` request may be specified as follows. Replace `<subscription-id>` with your subscription ID, `<cloudservice-name>` with the name of the cloud service, `<deployment-slot>` with `staging` or `production`, or `<deployment-name>` with the unique name of your deployment.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deploymentslots/<deployment-slot>/`|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deployments/<deployment-name>/`|  
  
### URI Parameters  
  
|URI Parameter|Description|  
|-------------------|-----------------|  
|`comp=config`|Required. Specifies that a change must be made to the configuration of the deployment.|  
  
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
<ChangeConfiguration xmlns="http://schemas.microsoft.com/windowsazure">  
  <Configuration>base-64-encoded-configuration-file</Configuration>  
  <TreatWarningsAsError>warnings-as-errors</TreatWarningsAsError>  
  <Mode>type-of-change</Mode>  
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
</ChangeConfiguration>  
  
```  
  
 The following table describes the elements in the request body.  
  
|Element name|Description|  
|------------------|-----------------|  
|Configuration|Required. Specifies the base-64 encoded service configuration file for the deployment.|  
|TreatWarningsAsError|Optional. Indicates whether warnings should be treated as errors.<br /><br /> Possible values are:<br /><br /> -   `true`<br />-   `false`<br /><br /> If not specified, the default value is `false`.  If set to `true`, the update will be blocked when warnings are encountered.<br /><br /> The `TreatWarningsAsError` element is only available using version 2011-04-01 or higher.|  
|Mode|Optional. Possible values are:<br /><br /> -   `Auto`<br />-   `Manual`<br />-   `Simultaneous`<br /><br /> If not specified the default value is `Auto`.  If set to `Manual`, [WalkUpgradeDomain](rest-walk-upgrade-domain.md) must be called to apply the update.  If set to `Auto`, the update is automatically applied to each update domain for the service.<br /><br /> The `Mode` element is only available using version 2011-08-01 or higher.<br /><br /> The `Simultaneous` setting is only available using version 2013-03-01 or higher.|  
|Name|Optional. Represents the name of an extended cloud service property. Each extended property must have both a defined name and value. You can have a maximum of 25 extended property name and value pairs.<br /><br /> The maximum length of the `Name` element is 64 characters, only alphanumeric characters and underscores are valid in the name, and it must start with a letter. Attempting to use other characters, starting with a non-letter character, or entering a name that is identical to that of another extended property owned by the same cloud service, will result in a status code 400 (Bad Request) error.<br /><br /> The `Name` element is only available using version 2012-03-01 or higher.|  
|Value|Optional. Represents the value of an extended cloud service property. Each extended property must have both a defined name and value. You can have a maximum of 25 extended property name and value pairs, and each extended property value has a maximum length of 255 characters.<br /><br /> You can delete an extended property by setting the value to NULL.<br /><br /> The `Value` element is only available using version 2012-03-01 or higher.|  
|[ExtensionConfiguration](rest-change-deployment-configuration.md#bk_extensionconfig)|Optional. Represents an extension that is added to the cloud service. In Azure, a process can run as an extension of a cloud service. You must add an extension to the cloud service by using [Add Extension](rest-add-extension.md) before it can be added to the deployment during a configuration change.<br /><br /> The `ExtensionConfiguration` element is only available using version 2013-03-01 or higher.|  
  
##  <a name="bk_extensionconfig"></a> ExtensionConfiguration  
 Represents an extension that is added to the cloud service.  
  
|Element name|Description|  
|------------------|-----------------|  
|AllRoles|Optional. Specifies a list of extensions that are applied to all roles in a deployment.|  
|[Extension](rest-change-deployment-configuration.md#bk_extension)|Required. Represents an extension that is to be deployed to a role in a cloud service.|  
|[NamedRoles](rest-change-deployment-configuration.md#bk_namedroles)|Optional. Specifies a list of extensions that are applied to specific roles in a deployment.|  
  
##  <a name="bk_extension"></a> Extension  
 Represents an extension that is to be deployed to a role in a cloud service.  
  
|Element name|Description|  
|------------------|-----------------|  
|Id|Required. The identifier of the extension. The identifier is created when the extension is added to the cloud service. You can find the Id of an extension that was added to a cloud service by using [List Extensions](rest-list-extensions.md).|  
|State|Optional. Specifies the state of the extension. This element only applies to JSON configured extensions.<br /><br /> Possible values are:<br /><br /> -   `Enable`<br />-   `Disable`<br />-   `Uninstall`<br /><br /> The default value is `Enable`.<br /><br /> The `State` element is only available using version 2014-06-01 or higher.|  
  
##  <a name="bk_namedroles"></a> NamedRoles  
 Specifies a list of extensions that are applied to specific roles in a deployment.  
  
|Element name|Description|  
|------------------|-----------------|  
|Role|Required. Represents a specific role to which the extension is added.|  
|RoleName|Required. Specifies the name of the role.|  
|[Extension](rest-change-deployment-configuration.md#bk_extension)|Required. Represents an extension that is to be deployed to a role in a cloud service.|  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
 Because `Change Deployment Configuration` is an asynchronous operation, you must call [Get Operation Status](http://msdn.microsoft.com/library/azure/1215ece5-cbef-4a85-a3db-ab6c20c2c6df) to determine whether the operation is complete, has failed, or is still in progress.  
  
### Status Code  
 A successful operation returns status code 200 (OK).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers.  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|A value that uniquely identifies a request made against the management service. For an asynchronous operation, you can call [Get Operation Status](http://msdn.microsoft.com/library/azure/1215ece5-cbef-4a85-a3db-ab6c20c2c6df) with the value of the header to determine whether the operation is complete, has failed, or is still in progress.|  
  
### Response Body  
 None.