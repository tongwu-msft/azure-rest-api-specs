---
title: "JSON payloads for Get Subscription Usage (Azure Storage)"
description: JSON request and response payloads for the Get Subscriptions Usage operation.
---
# JSON payloads for Get Subscription Usage

## Request Body

The Request Body is empty.

## Response Body

Formatted list of the resources along with their current usage and limit. 

```json
{
   "value": [
     {
       "unit": "Count",
       "currentValue": intvalue,
       "limit": intvalue,
       "name": {
         "value": "StorageAccounts",
         "localizedValue": "Storage Accounts"
       }
     }
   ]
}
```