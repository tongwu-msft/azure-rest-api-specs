---
ms.assetid: e70aa09a-0893-4d6b-842b-ecedb7891f93
ms.title: Azure Monitor REST API Filter Syntax
ms.service: monitoring-and-diagnostics
author: erickson-doug
ms.author: douge
ms.manager: douge
---

# Azure Monitor REST API Filter Syntax

Many Azure Monitor APIs take a parameter, `{filter-expression}`, that you can use to filter or constrain the set of data that is collected.  

Here are the possible expression strings you can pass as `{filter-expression}`.  No other syntax is allowed.


* List events for a resource group
    ```
    $filter=eventTimestamp ge '<Start Time>' and eventTimestamp le '<End Time>' and eventChannels eq 'Admin, Operation' and resourceGroupName eq '<ResourceGroupName>'
    ```
    **Example**: 
    > $filter=eventTimestamp ge '2014-12-29T22:00:37Z' and eventTimestamp le '2014-12-29T23:36:37Z' and eventChannels eq 'Admin, Operation' and resourceGroupName eq 'CloudLab'

* List events for a resource
    ```
    $filter=eventTimestamp ge '<Start Time>' and eventTimestamp le '<End Time>' and eventChannels eq 'Admin, Operation' and resourceUri eq '<ResourceURI>'
    ```
    **Example**:
    > $filter=eventTimestamp ge '2014-12-29T22:00:37Z' and eventTimestamp le '2014-12-29T23:36:37Z' and eventChannels eq 'Admin, Operation' and resourceUri eq '/subscriptions/089bd33f-d4ec-47fe-8ba5-0753aa5c5b33/resourcegroups/CloudLab/providers/Microsoft.Web/sites/mytestweb004'

* List events for an Azure subscription
    ```  
    $filter=eventTimestamp ge '<Start Time>' and eventTimestamp le '<End Time>' and eventChannels eq 'Admin, Operation'
    ```
    **Example**:
    > $filter=eventTimestamp ge '2014-12-29T22:00:37Z' and eventTimestamp le '2014-12-29T23:36:37Z' and eventChannels eq 'Admin, Operation'

* List events for an Azure resource provider
    ```
    $filter=eventTimestamp ge '<Start Time>' and eventTimestamp le '<End Time>' and eventChannels eq 'Admin, Operation' and resourceProvider eq '<ResourceProviderName>'
    ```
    **Example**:
    > $filter=eventTimestamp ge '2014-12-29T22:00:37Z' and eventTimestamp le '2014-12-29T23:36:37Z' and eventChannels eq 'Admin, Operation' and resourceProvider eq 'Microsoft.Web'

* List events for a correlation ID
    ```
    api-version=2014-04-01&$filter=eventTimestamp ge '2014-07-16T04:36:37.6407898Z' and eventTimestamp le '2014-07-20T04:36:37.6407898Z' and eventChannels eq 'Admin, Operation' and correlationId eq '<CorrelationID>'
    ```
    > Example:
api-version=2014-04-01&$filter=eventTimestamp ge '2014-12-29T22:00:37Z' and eventTimestamp le '2014-12-29T23:36:37Z' and eventChannels eq 'Admin, Operation'  and correlationId eq  '07c85493-5e87-4efd-9200-0c64d904d878' 
