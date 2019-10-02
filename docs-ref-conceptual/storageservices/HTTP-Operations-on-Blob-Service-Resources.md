---
title: HTTP Operations on Blob service resources (REST API) - Azure Storage
description: The Blob service exposes the storage account, container, and blob resources via the REST API.
author: pemari-msft

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# HTTP Operations on Blob service resources

The Blob service exposes the following resource types via the REST API:  
  
- **Account.** A storage account is a globally uniquely identified entity within the storage system. The account is the parent namespace for the Blob service. All containers are associated with an account.  
  
- **Containers.** A container is a user-defined set of blobs within an account. A container resource has no associated content, only properties and metadata.  
  
- **Blobs.** A blob is an entity representing a set of content. A blob resource includes content, properties, and metadata.  
  
 You can address each resource using its resource URI. For information about URI addresses, see [Referring to Containers and Blobs](naming-and-referencing-containers--blobs--and-metadata.md).  
  
 Each resource supports operations based on the HTTP verbs GET, PUT, HEAD, and DELETE. The verb, syntax, and supported HTTP version(s) for each operation appears on the reference page for each operation. For a complete list of operation reference pages, see [Blob Service REST API](Blob-Service-REST-API.md).  
  
## See Also  
 [Naming and Referencing Containers, Blobs, and Metadata](Naming-and-Referencing-Containers--Blobs--and-Metadata.md)   
 [Working with the Root Container](Working-with-the-Root-Container.md)   
 [Operations on Containers](Operations-on-Containers.md)   
 [Operations on Blobs](Operations-on-Blobs.md)   
 [Blob Service Concepts](Blob-Service-Concepts.md)   
 [Blob Service REST API](Blob-Service-REST-API.md)
