---
title: "SKU Types (Azure Storage)"
description: List of valid SKU types and supported account kinds.
---
# SKU Types

These are the valid values for SKU Type, used in version 2016-01-01 and later.

| Name           | Supported Account Kinds | Description                                 |
|----------------|-------------------------|---------------------------------------------|
| Standard_LRS   | Storage, BlobStorage, StorageV2    | Standard Locally Redundant Storage          |
| Standard_GRS   | Storage, BlobStorage, StorageV2    | Standard Geo Replicated Storage             |
| Standard_RAGRS | Storage, BlobStorage, StorageV2    | Standard Read-Access Geo Replicated Storage |
| Standard_ZRS   | Storage, StorageV2                 | Standard Zone Redundant Storage             |
| Premium_LRS    | Storage, StorageV2, FileStorage, BlockBlobStorage| Provisioned IO Locally Redundant Storage    |
| Premium_ZRS    | Storage, StorageV2                 | Provisioned IO Locally Redundant Storage    |
| Standard_GZRS  | Storage,  StorageV2                 | Provisioned IO Locally Redundant Storage    |
| Standard_RAGZRS| Storage,  StorageV2                 | Provisioned IO Locally Redundant Storage    |



## Notes

-	SKU type names are case-sensitive.

-	Prior to version 2016-01-01, 'SKU' was called 'accountType' and was found under the 'properties' envelope.

