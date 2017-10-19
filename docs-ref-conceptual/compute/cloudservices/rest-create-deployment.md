---
title: "Azure Cloud Services REST - Create Deployment | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cloud-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: af9f234d-82a7-46c9-a203-8a34e78ff649
caps.latest.revision: 38
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Create Deployment
The `Create Deployment` asynchronous operation uploads a new service package and creates a new deployment in the staging or production environments.  
  
 Before you can run this operation, you must complete the following tasks:  
  
-   Create a subscription and obtain the subscription identifier.  You can obtain the subscription identifier on the Settings page of the Management Portal.  
  
-   Create and upload a management certificate to authorize the operation.  
  
-   Create a cloud service.  
  
-   Decide whether the application should be deployed in staging or production.  
  
## Request  
 The `Create Deployment` request is specified as follows. Replace `<subscription-id>` with your subscription ID, `<cloudservice-name>` with the name of the cloud service, and `<deployment-slot>` with `staging` or `production`.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deploymentslots/<deployment-slot>`|  
  
### URI Parameters  
 None.  
  
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
<CreateDeployment xmlns="http://schemas.microsoft.com/windowsazure">  
  <Name>deployment-name</Name>  
  <PackageUrl>package-url-in-blob-storage</PackageUrl>  
  <Label>base64-encoded-deployment-label</Label>  
  <Configuration>base64-encoded-configuration-file</Configuration>  
  <StartDeployment>start-deployment</StartDeployment>  
  <TreatWarningsAsError>prioritize-warnings</TreatWarningsAsError>  
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
</CreateDeployment>  
  
```  
  
 The following table describes the elements in the request body.  
  
|Element name|Description|  
|------------------|-----------------|  
|Name|Required. Specifies the name of the deployment.|  
|PackageUrl|Required. Specifies a URL that refers to the location of the service package in the Blob service. The service package can be located either in a storage account beneath the same subscription or a Shared Access Signature (SAS) URI from any storage account.|  
|Configuration|Required. Specifies the base-64 encoded service configuration file for the deployment.|  
|Label|Required. Specifies an identifier for the deployment that is base-64 encoded. The identifier can be up to 100 characters in length. It is recommended that the label be unique within the subscription. The label can be used for your tracking purposes.|  
|StartDeployment|Optional. Indicates whether to start the deployment immediately after it is created. The default value is `false`.<br /><br /> If `false`, the service model is still deployed, but the code is not run immediately. Instead, the service is `Suspended` until you call [Update Deployment Status](rest-update-deployment-status.md) and set the status to `Running`, at which time the service will be started. A deployed service still incurs charges, even if it is suspended.<br /><br /> The `StartDeployment` element is only available using version 2010-04-01 or higher.|  
|TreatWarningsAsError|Optional. Indicates whether to treat package validation warnings as errors. The default value is `false`. If set to `true`, the `Created Deployment` operation fails if there are validation warnings on the service package.<br /><br /> The `TreatWarningsAsError` element is only available using version 2011-04-01 or higher.|  
|Name|Optional. Specifies the name of an extended deployment property. Each extended property must have both a defined name and value. You can have a maximum of 25 extended property name and value pairs.<br /><br /> The maximum length of the Name element is 64 characters, only alphanumeric characters and underscores are valid in the Name, and the name must start with a letter.<br /><br /> The `Name` element is only available using version 2012-03-01 or higher.|  
|Value|Optional. Specifies the value of an extended cloud service property. Each extended property must have both a defined name and value. You can have a maximum of 25 extended property name and value pairs, and each extended property value has a maximum length of 255 characters.<br /><br /> The `Value` element is only available using version 2012-03-01 or higher.|  
|[ExtensionConfiguration](rest-create-deployment.md#bk_extensionconfig)|Optional. Specifies an extension that is added to the cloud service. In Azure, a process can run as an extension of a cloud service. You must add an extension to the cloud service by using [Add Extension](rest-add-extension.md) before it can be added to the deployment.<br /><br /> The `ExtensionConfiguration` element is only available using version 2013-03-01 or higher.|  
  
##  <a name="bk_extensionconfig"></a> ExtensionConfiguration  
 Specifies an extension that is added to the cloud service.  
  
|Element name|Description|  
|------------------|-----------------|  
|AllRoles|Optional. Specifies a list of extensions that are applied to all roles in a deployment.|  
|[Extension](rest-create-deployment.md#bk_extension)|Required. Specifies an extension that is to be deployed to a role in a cloud service.|  
|[NamedRoles](rest-create-deployment.md#bk_namedroles)|Optional. Specifies a list of extensions that are applied to specific roles in a deployment.|  
  
##  <a name="bk_extension"></a> Extension  
 Specifies an extension that is to be deployed to a role in a cloud service.  
  
|Element name|Description|  
|------------------|-----------------|  
|Id|Required. Specifies the identifier of the extension. The identifier is created when the extension is added to the cloud service. You can find the identifier of an extension that was added to a cloud service by using [List Extensions](rest-list-extensions.md).|  
|State|Optional. Specifies the state of the extension. This element only applies to JSON configured extensions.<br /><br /> Possible values are:<br /><br /> -   `Enable`<br />-   `Disable`<br />-   `Uninstall`<br /><br /> The default value is `Enable`.<br /><br /> The `State` element is only available using version 2014-06-01 or higher.|  
  
##  <a name="bk_namedroles"></a> NamedRoles  
 Specifies a list of extensions that are applied to specific roles in a deployment.  
  
|Element name|Description|  
|------------------|-----------------|  
|Role|Required. Specifies a specific role to which the extension is added.|  
|RoleName|Required. Specifies the name of the role.|  
|[Extension](rest-create-deployment.md#bk_extension)|Required. Specifies an extension that is to be deployed to a role in a cloud service.|  
  
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