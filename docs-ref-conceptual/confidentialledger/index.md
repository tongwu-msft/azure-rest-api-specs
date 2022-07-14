---

title: Azure confidential ledger REST API reference
description: Learn how to use Azure confidential ledger to log to an immutable, tamper-proof ledger.
ms.service: confidential-ledger
author: msmbaldwin
ms.author: mbaldwin
ms.date: 07/15/2022
---

# Azure confidential ledger REST API reference

Microsoft Azure confidential ledger (ACL) uses the Azure Confidential Computing platform and the Confidential Consortium Framework to provide a highly secure service for managing sensitive data records. 

## Azure confidential ledger operations

| Operation | Description |
|--|--|
| [Create Or Update User](/rest/api/confidentialledger/create-or-update-user) | Adds a user or updates a user's fields. A JSON merge patch is applied for existing users |
| [Delete User](/rest/api/confidentialledger/delete-user) | Deletes a user from the confidential ledger. |
| [Get Consortium Members](/rest/api/confidentialledger/get-consortium-members) | Gets the consortium members. Consortium members can manage the confidential ledger. |
| [Get Constitution](/rest/api/confidentialledger/get-constitution) | Gets the constitution used for governance. The constitution is a script that assesses and applies proposals from consortium members. |
| [Get Current Ledger Entry](/rest/api/confidentialledger/get-current-ledger-entry) | Gets the current value available in the ledger.  A collection id may optionally be specified. |
| [Get Enclave Quotes](/rest/api/confidentialledger/get-enclave-quotes) | Gets quotes for all nodes of the confidential ledger. A quote is an SGX enclave measurement that can be used to verify the validity of a node and its enclave. |
| [Get Ledger Entry](/rest/api/confidentialledger/get-ledger-entry) | Gets the ledger entry at the specified transaction id. A collection id may optionally be specified to indicate the collection from which to fetch the value.  \nTo return older ledger entries, the relevant sections of the ledger must be read from disk and validated. To prevent blocking within the enclave, the response will indicate whether the entry is ready and part of the response, or if the loading is still ongoing. |
| [Get Receipt](/rest/api/confidentialledger/get-receipt) | Gets a receipt certifying ledger contents at a particular transaction id. |
| [Get Transaction Status](/rest/api/confidentialledger/get-transaction-status) | Gets the status of an entry identified by a transaction id. |
| [Get User](/rest/api/confidentialledger/get-user) | Gets a user. |
| [List Collections](/rest/api/confidentialledger/list-collections) | Retrieves a list of collection ids present in the confidential ledger. Collection ids are user-created collections of ledger entries. |
| [List Ledger Entries](/rest/api/confidentialledger/list-ledger-entries) | Gets ledger entries from a collection corresponding to a range. A collection id may optionally be specified. Only entries in the specified (or default) collection will be returned. |
| [Post Ledger Entry](/rest/api/confidentialledger/post-ledger-entry) | Writes a ledger entry. A collection id may optionally be specified. |

## See also

- For concepts and detailed information about Azure confidential ledger, see [About Azure confidential ledger](/azure/confidential-ledger/overview).
- To get started with ure confidential ledger, see these quickstarts:
- 
  - [Portal](/azure/confidential-ledger/quickstart-portal)
  - [CLI](/azure/confidential-ledger/quickstart-cli)
  - [PowerShell](/azure/confidential-ledger/quickstart-powershell)
  - [Python](/azure/confidential-ledger/quickstart-python)
  - [ARM template](/azure/confidential-ledger/quickstart-template)

- For answers to frequently asked questions about Azure confidential ledger, see the [Azure confidential ledger FAQ](/rest/api/azure/)
- For information on constructing Azure REST API requests, see the [Azure REST API reference](/rest/api/azure/)
