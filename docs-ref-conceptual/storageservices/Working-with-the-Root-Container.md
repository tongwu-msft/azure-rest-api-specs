---
title: Working with the root container (REST API) - Azure Storage
description: A root container serves as a default container for your storage account. A storage account may have one root container. The root container must be explicitly created and must be named `$root`.
author: pemari-msft

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Working with the root container

A root container serves as a default container for your storage account. A storage account may have one root container. The root container must be explicitly created and must be named `$root`.  
  
 A blob stored in the root container may be addressed without referencing the root container name, so that a blob can be addressed at the top level of the storage account hierarchy. For example, you can reference a blob that resides in the root container in the following manner:  
  
```  
https://myaccount.blob.core.windows.net/mywebpage.html  
```  
  
## Managing the Root Container  
 To use the root container with your storage account, create a new container named `$root`. The following sample request shows how to create the root container:  
  
```  
Request Syntax:  
PUT https://myaccount.blob.core.windows.net/$root?restype=container HTTP/1.1  
  
Request Headers:  
x-ms-version: 2011-08-18  
x-ms-date: Sun, 25 Sep 2011 22:50:32 GMT  
x-ms-meta-Name: StorageSample  
x-ms-blob-public-access: container  
Authorization: SharedKey myaccount:Z5043vY9MesKNh0PNtksNc9nbXSSqGHueE00JdjidOQ=  
```  
  
 You can also delete the root container if you no longer have a need for it.  
  
 Like other containers, the root container can be made available for anonymous public access. You can make the container public by setting the `x-ms-blob-public-access` header when the container is created, or by calling [Set Container ACL](Set-Container-ACL.md) after it already exists. See [Restrict Access to Containers and Blobs](/azure/storage/storage-manage-access-to-resources) for more information.  
  
 If the root container is present, it will appear when you perform the [List Containers](List-Containers2.md) operation against the storage account.  
  
 When you perform a [List Blobs](List-Blobs.md) operation against the root container, the root container does not appear in the resource URLs for the blobs returned. The following request syntax shows how to call `List Blobs` against the root container:  
  
```  
GET https://myaccount.blob.core.windows.net/$root?restype=container&comp=list HTTP/1.1  
```  
  
> [!IMPORTANT]
>  A blob in the root container cannot include a forward slash (/) in its name.  
  
## Examples  
 The following examples show how to work with container and blob resources, including the root container:  
  
### GET Operations  
 To list the containers in a storage account:  
  
```  
GET https://myaccount.blob.core.windows.net/?comp=list  
```  
  
 To get a container's properties:  
  
```  
GET/HEAD https://myaccount.blob.core.windows.net/mycontainer?restype=container  
```  
  
 To list the blobs in a container named `mycontainer`:  
  
```  
GET https://myaccount.blob.core.windows.net/mycontainer?restype=container&comp=list  
```  
  
 To list the blobs in the root container:  
  
```  
GET https://myaccount.blob.core.windows.net/$root?restype=container&comp=list  
```  
  
 To read a blob named `myfile` from a container named `mycontainer`:  
  
```  
GET https://myaccount.blob.core.windows.net/mycontainer/myfile  
```  
  
 To read a blob named `myphoto` from the root container:  
  
```  
GET https://myaccount.blob.core.windows.net/myphoto  
```  
  
 You can also explicitly reference the root container:  
  
```  
GET https://myaccount.blob.core.windows.net/$root/myphoto  
```  
  
 To read blob metadata on a blob in the root container:  
  
```  
GET https://myaccount.blob.core.windows.net/myphoto?comp=metadata  
```  
  
 You can also explicitly reference the root container:  
  
```  
GET https://myaccount.blob.core.windows.net/$root/myphoto?comp=metadata  
```  
  
> [!NOTE]
>  Be careful to avoid including a trailing forward slash (/) when referencing a blob under the root container. For example, a URL such as the following now results in status code 400 (Bad Request):  
>   
>  `https://myaccount.blob.core.windows.net/myblob/`  
>   
>  In the above example, the Blob service reads the container name as `myblob` and expects to see a blob name after the trailing slash. The request is malformed due to the missing blob name.  
>   
>  The following URL is valid for an operation on a blob in the root container:  
>   
>  `https://myaccount.blob.core.windows.net/myblob`  
  
### PUT Operations  
 To create a container named `mycontainer`:  
  
```  
  
PUT https://myaccount.blob.core.windows.net/mycontainer?restype=container  
```  
  
 To create a blob named `myblob` in the root container:  
  
```  
  
PUT https://myaccount.blob.core.windows.net/myblob  
```  
  
 You can also explicitly specify the root container:  
  
```  
  
PUT https://myaccount.blob.core.windows.net/$root/myblob  
```  
  
 To create a blob named `myblob` in a container named `mycontainer`:  
  
```  
PUT https://myaccount.blob.core.windows.net/mycontainer/myblob  
```  
  
 To create a blob named `photos/myphoto` in a container named `mycontainer`:  
  
```  
PUT https://myaccount.blob.core.windows.net/mycontainer/photos/myphoto  
```  
  
 To set metadata on a blob named `myblob` in the root container:  
  
```  
  
PUT https://myaccount.blob.core.windows.net/myblob?comp=metadata  
```  
  
### DELETE Operations  
 To delete a container named `mycontainer`:  
  
```  
  
DELETE https://myaccount.blob.core.windows.net/mycontainer?restype=container  
```  
  
 To delete the root container:  
  
```  
  
DELETE https://myaccount.blob.core.windows.net/$root?restype=container  
```  
  
 To delete the blob `myblob` from the root container:  
  
```  
  
DELETE https://myaccount.blob.core.windows.net/myblob  
```  
  
 You can also explicitly specify the root container:  
  
```  
  
DELETE https://myaccount.blob.core.windows.net/$root/myblob  
```  
  
## See Also  
 [HTTP Operations on Blob Service Resources](HTTP-Operations-on-Blob-Service-Resources.md)   
 [Naming and Referencing Containers, Blobs, and Metadata](Naming-and-Referencing-Containers--Blobs--and-Metadata.md)   
 [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md)
