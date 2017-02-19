# SKU Types

These are the valid values for SKU Type, used in version 2016-01-01 and later.

| Name           | Supported Account Kinds | Description                                 |
|----------------|-------------------------|---------------------------------------------|
| Standard_LRS   | Storage, BlobStorage    | Standard Locally Redundant Storage          |
| Standard_GRS   | Storage, BlobStorage    | Standard Geo Replicated Storage             |
| Standard_RAGRS | Storage, BlobStorage    | Standard Read-Access Geo Replicated Storage |
| Standard_ZRS   | Storage                 | Standard Zone Redundant Storage             |
| Premium_LRS    | Storage                 | Provisioned IO Locally Redundant Storage    |



## Notes

-	SKU type names are case-sensitive.

-	Prior to version 2016-01-01, 'SKU' was called 'accountType' and was found under the 'properties' envelope.

