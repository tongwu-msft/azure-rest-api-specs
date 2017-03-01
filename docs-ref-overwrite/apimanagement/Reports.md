---
uid: management.azure.com/ApiManagementClient/2016-07-07/Reports_ListByService
description: *content
---
Lists report records for the service instance. 

You can filter the results by specifying a value for the `$filter` parameter using OData filter expression [syntax](http://docs.oasis-open.org/odata/odata/v4.0/os/part2-url-conventions/odata-v4.0-os-part2-url-conventions.html#_Toc372793792).

Reports are available in the following aggregations. Each report aggregation has different filter parameters available for filtering the returned report records.


-   [byTime - Get metrics over a period of time](#ReportByTime)  
-   [byGeo - Get metrics aggregated by geographical region](#ReportByGeo)  
-   [byUser - Get metrics aggregated by user](#ReportByUser)  
-   [byProduct - Get metrics aggregated by product](#ReportByProduct)  
-   [byApi - Get metrics aggregated by API](#ReportByAPI)  
-   [byOperation - Get metrics aggregated by operation](#ReportByOperation)  
-   [bySubscription - Get metrics aggregated by subscription](#ReportBySubscription)  
-   [byRequest - Get request log entries](#ReportByRequest)  


##  <a name="ReportByTime"></a> Get metrics over a period of time  
The `byTime` aggregation returns metrics covering the specified time period.  
   
The following fields and operators are supported for the `$filter` parameter. This parameter is required and must include a `timestamp` for the call to be successful.

| Field          | Supported operators | Description                                                                                                                                                                                                                                                                                               |
|----------------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| timestamp      | ge,le                | The start and end of the reporting period, for example `$filter=timestamp ge datetime'2014-10-07T00:00:00' and timestamp le datetime'2014-10-14T00:00:00'`. If `le` is omitted the current date and time is used for the end of the reporting period. You must specify a starting date and time for `ge`. |
| apiRegion      | eq                   | Azure region where the gateway that processed this request is located.                                                                                                                                                                                                                                    |
| userId         | eq                   | User identifier                                                                                                                                                                                                                                                                                           |
| productId      | eq                   | Product identifier.                                                                                                                                                                                                                                                                                       |
| apiId          | eq                   | API identifier.                                                                                                                                                                                                                                                                                           |
| operationId    | eq                   | Operation identifier.                                                                                                                                                                                                                                                                                     |
| subscriptionId | eq                   | Subscription identifier.                                                                                                                                                                                                                                                                                  |

This report requires the `interval` parameter, which specifies the period of time over which the data presented in this entity was aggregated, in ISO 8601 format: `P500DT3H10M15.304S`. The minimum `interval` is fifteen minutes, and `interval` must be in even fifteen minute increments; otherwise a `400 Bad Request` error is returned.<br /><br /> This parameter is required.

 
 This report supports the following `$filter` parameter expression operand combinations.  
  
-   API  
-   API and operation  
-   Product  
-   Subscription  
-   User  
-   User and API  
-   User and API and operation  
-   User and product  
  

For this report, the following fields are returned.  
 
-   timestamp  
-   interval  
-   callCountSuccess  
-   callCountBlocked  
-   callCountFailed  
-   callCountOther  
-   bandwidth  
-   cacheHitsCount  
-   cacheMissCount  
-   apiTimeAvg  
-   apiTimeMin  
-   apiTimeMax  
-   serviceTimeAvg  
-   serviceTimeMin  
-   serviceTimeMax  
  
All other fields in the response contain default values.  
  

  
##  <a name="ReportByGeo"></a> Get metrics aggregated by geographical region  
The `byGeo` aggregation returns metrics aggregated by geographical region.  
  
The following fields and operators are supported. The `$filter` parameter is required and must include a `timestamp` for the call to be successful.

| Field          | Supported operations | Description                                                                                                                                                                                                                                                                                               |
|----------------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| timestamp      | ge,le                | The start and end of the reporting period, for example `$filter=timestamp ge datetime'2014-10-07T00:00:00' and timestamp le datetime'2014-10-14T00:00:00'`. If `le` is omitted the current date and time is used for the end of the reporting period. You must specify a starting date and time for `ge`. |
| apiRegion      | eq                   | Azure region where the gateway that processed this request is located.                                                                                                                                                                                                                                    |
| userId         | eq                   | User identifier.                                                                                                                                                                                                                                                                                          |
| productId      | eq                   | Product identifier.                                                                                                                                                                                                                                                                                       |
| apiId          | eq                   | API identifier.                                                                                                                                                                                                                                                                                           |
| operationId    | eq                   | Operation identifier.                                                                                                                                                                                                                                                                                     |
| subscriptionId | eq                   | Subscription identifier.                                                                                                                                                                                                                                                                                  |

This report supports the following `$filter` parameter expression operand combinations.  

-   API  
-   API and operation  
-   Product  
-   Subscription  
-   User  
-   User and API  
-   User and API and operation  
-   User and product  
 
For this report, the following fields are returned.  
   
-   country  
-   region  
-   zip  
-   callCountSuccess  
-   callCountBlocked  
-   callCountFailed  
-   callCountOther  
-   bandwidth  
-   cacheHitsCount  
-   cacheMissCount  
-   apiTimeAvg  
-   apiTimeMin  
-   apiTimeMax  
-   serviceTimeAvg  
-   serviceTimeMin  
-   serviceTimeMax  
   
All other fields in the response contain default values.  
  
##  <a name="ReportByUser"></a> Get metrics aggregated by user  
The `byUser` aggregation returns metrics aggregated by user.  
  
The following fields and operators are supported. The `$filter` parameter is required and must include a `timestamp` for the call to be successful.

| Field          | Supported operations | Description                                                                                                                                                                                                                                                                                               |
|----------------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| timestamp      | ge,le                | The start and end of the reporting period, for example `$filter=timestamp ge datetime'2014-10-07T00:00:00' and timestamp le datetime'2014-10-14T00:00:00'`. If `le` is omitted the current date and time is used for the end of the reporting period. You must specify a starting date and time for `ge`. |
| userId         | eq                   | User identifier.                                                                                                                                                                                                                                                                                          |
| apiRegion      | eq                   | Azure region where the gateway that processed this request is located.                                                                                                                                                                                                                                    |
| productId      | eq                   | Product identifier.                                                                                                                                                                                                                                                                                       |
| apiId          | eq                   | API identifier.                                                                                                                                                                                                                                                                                           |
| operationId    | eq                   | Operation identifier.                                                                                                                                                                                                                                                                                     |
| subscriptionId | eq                   | Subscription identifier.                                                                                                                                                                                                                                                                                  |

This operation has an `$orderby` parameter that provides an OData [order by query](http://docs.oasis-open.org/odata/odata/v4.0/os/part2-url-conventions/odata-v4.0-os-part2-url-conventions.html#_Toc372793862) option. The following fields are supported.

-   name
-   callCountSuccess
-   callCountBlocked
-   callCountFailed
-   callCountOther
-   bandwidth
-   apiTimeAvg
  
This report supports the following `$filter` parameter expression operand combinations.  
  
-   API  
-   API and operation  
-   Product  
-   Subscription - can be combined with any other filter  
-   User - can be combined with any other filter  
  
For this report, the following fields are returned.  
   
-   name  
-   userId  
-   callCountSuccess  
-   callCountBlocked  
-   callCountFailed  
-   callCountOther  
-   bandwidth  
-   cacheHitsCount  
-   cacheMissCount  
-   apiTimeAvg  
-   apiTimeMin  
-   apiTimeMax  
-   serviceTimeAvg  
-   serviceTimeMin  
-   serviceTimeMax  
   
All other fields in the response contain default values.  
  
##  <a name="ReportByProduct"></a> Get metrics aggregated by product  
The `byProduct` aggregation returns metrics aggregated by product.  
  
The following fields and operators are supported. The `$filter` parameter is required and must include a `timestamp` for the call to be successful.

| Field          | Supported operations | Description                                                                                                                                                                                                                                                                                               |
|----------------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| timestamp      | ge,le                | The start and end of the reporting period, for example `$filter=timestamp ge datetime'2014-10-07T00:00:00' and timestamp le datetime'2014-10-14T00:00:00'`. If `le` is omitted the current date and time is used for the end of the reporting period. You must specify a starting date and time for `ge`. |
| apiRegion      | eq                   | Azure region where the gateway that processed this request is located.                                                                                                                                                                                                                                    |
| userId         | eq                   | User identifier                                                                                                                                                                                                                                                                                           |
| productId      | eq                   | Product identifier.                                                                                                                                                                                                                                                                                       |
| subscriptionId | eq                   | Subscription identifier.                                                                                                                                                                                                                                                                                  |

This operation has an `$orderby` parameter that provides an OData [order by query](http://docs.oasis-open.org/odata/odata/v4.0/os/part2-url-conventions/odata-v4.0-os-part2-url-conventions.html#_Toc372793862) option. The following fields are supported.

-   name
-   callCountSuccess
-   callCountBlocked
-   callCountFailed
-   callCountOther
-   bandwidth
-   apiTimeAvg
  
 This report supports the following `$filter` parameter expression operand combinations.  
  
-   User
-   Subscription - can be combined with any other filter
-   Product - can be combined with any other filter
  
For this report, the following fields are returned.  
   
-   name  
-   productId  
-   callCountSuccess  
-   callCountBlocked  
-   callCountFailed  
-   callCountOther  
-   bandwidth  
-   cacheHitsCount  
-   cacheMissCount  
-   apiTimeAvg  
-   apiTimeMin  
-   apiTimeMax  
-   serviceTimeAvg  
-   serviceTimeMin  
-   serviceTimeMax  
   
All other fields in the response contain default values.  
  
##  <a name="ReportByAPI"></a> Get metrics aggregated by API  
The `byApi` aggregation returns metrics aggregated by API.  
  
The following fields and operators are supported. The `$filter` parameter is required and must include a `timestamp` for the call to be successful.

| Field          | Supported operations | Description                                                                                                                                                                                                                                                                                               |
|----------------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| timestamp      | ge,le                | The start and end of the reporting period, for example `$filter=timestamp ge datetime'2014-10-07T00:00:00' and timestamp le datetime'2014-10-14T00:00:00'`. If `le` is omitted the current date and time is used for the end of the reporting period. You must specify a starting date and time for `ge`. |
| apiRegion      | eq                   | Azure region where the gateway that processed this request is located.                                                                                                                                                                                                                                    |
| userId         | eq                   | User identifier.                                                                                                                                                                                                                                                                                          |
| productId      | eq                   | Product identifier.                                                                                                                                                                                                                                                                                       |
| subscriptionId | eq                   | Subscription identifier.                                                                                                                                                                                                                                                                                  |
| apiId          | eq                   | API identifier.                                                                                                                                                                                                                                                                                           |

This operation has an `$orderby` parameter that provides an OData [order by query](http://docs.oasis-open.org/odata/odata/v4.0/os/part2-url-conventions/odata-v4.0-os-part2-url-conventions.html#_Toc372793862) option. The following fields are supported.

- name
- callCountSuccess
- callCountBlocked
- callCountFailed
- callCountOther
- bandwidth
- apiTimeAvg
  
 This report supports the following `$filter` parameter expression operand combinations.  
  
-   Product  
-   User  
-   User and product  
-   API - can be combined with any other filter  
-   Subscription - can be combined with any other filter  
  
For this report, the following fields are returned.  
   
-   name  
-   apiId  
-   callCountSuccess  
-   callCountBlocked  
-   callCountFailed  
-   callCountOther  
-   bandwidth  
-   cacheHitsCount  
-   cacheMissCount  
-   apiTimeAvg  
-   apiTimeMin  
-   apiTimeMax  
-   serviceTimeAvg  
-   serviceTimeMin  
-   serviceTimeMax  
   
All other fields in the response contain default values.  
  
##  <a name="ReportByOperation"></a> Get metrics aggregated by operation  
The `byOperation` aggregation returns metrics aggregated by operation.  
  
The following fields and operators are supported. The `$filter` parameter is required and must include a `timestamp` for the call to be successful.

| Field          | Supported operations | Description                                                                                                                                                                                                                                                                                               |
|----------------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| timestamp      | ge,le                | The start and end of the reporting period, for example `$filter=timestamp ge datetime'2014-10-07T00:00:00' and timestamp le datetime'2014-10-14T00:00:00'`. If `le` is omitted the current date and time is used for the end of the reporting period. You must specify a starting date and time for `ge`. |
| apiRegion      | eq                   | Azure region where the gateway that processed this request is located.                                                                                                                                                                                                                                    |
| userId         | eq                   | User identifier.                                                                                                                                                                                                                                                                                          |
| productId      | eq                   | Product identifier.                                                                                                                                                                                                                                                                                       |
| apiId          | eq                   | API identifier.                                                                                                                                                                                                                                                                                           |
| subscriptionId | eq                   | Subscription identifier.                                                                                                                                                                                                                                                                                  |
| operationId    | eq                   | Operation identifier.                                                                                                                                                                                                                                                                                     |

This operation has an `$orderby` parameter that provides an OData [order by query](http://docs.oasis-open.org/odata/odata/v4.0/os/part2-url-conventions/odata-v4.0-os-part2-url-conventions.html#_Toc372793862) option. The following fields are supported.

- name
- callCountSuccess
- callCountBlocked
- callCountFailed
- callCountOther
- bandwidth
- apiTimeAvg
  
 This report supports the following `$filter` parameter expression operand combinations.  
  
-   API
-   Product
-   User
-   User and API  
-   User and product  
-   Subscription - can be combined with any other filter  
-   Subscription - can be combined with API and/or operation  
-   Operation - may not be used alone, must be combined with API  
  

For this report, the following fields are returned.  
   
-   name  
-   operationId  
-   callCountSuccess  
-   callCountBlocked  
-   callCountFailed  
-   callCountOther  
-   bandwidth  
-   cacheHitsCount  
-   cacheMissCount  
-   apiTimeAvg  
-   apiTimeMin  
-   apiTimeMax  
-   serviceTimeAvg  
-   serviceTimeMin  
-   serviceTimeMax  
   
All other fields in the response contain default values.  
  
##  <a name="ReportBySubscription"></a> Get metrics aggregated by subscription  
The `bySubscription` aggregation returns metrics aggregated by subscription.  
  
The following fields and operators are supported. The `$filter` parameter is required and must include a `timestamp` for the call to be successful.

| Field          | Supported operations | Description                                                                                                                                                                                                                                                                                               |
|----------------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| timestamp      | ge,le                | The start and end of the reporting period, for example `$filter=timestamp ge datetime'2014-10-07T00:00:00' and timestamp le datetime'2014-10-14T00:00:00'`. If `le` is omitted the current date and time is used for the end of the reporting period. You must specify a starting date and time for `ge`. |
| apiRegion      | eq                   | Azure region where the gateway that processed this request is located.                                                                                                                                                                                                                                    |
| userId         | eq                   | User identifier.                                                                                                                                                                                                                                                                                          |
| productId      | eq                   | Product identifier.                                                                                                                                                                                                                                                                                       |
| subscriptionId | eq                   | Subscription identifier.                                                                                                                                                                                                                                                                                  |

This operation has an `$orderby` parameter that provides an OData [order by query](http://docs.oasis-open.org/odata/odata/v4.0/os/part2-url-conventions/odata-v4.0-os-part2-url-conventions.html#_Toc372793862) option. The following fields are supported.

- name
- callCountSuccess
- callCountBlocked
- callCountFailed
- callCountOther
- callCountTotal
- bandwidth
- apiTimeAvg
  
 This report supports the following `$filter` parameter expression operand combinations.  
  
-   API
-   API and operation
-   User - can be combined with any other filter
-   Product - can be combined with any other filter
-   Subscription - can be combined with any other filter
  
For this report, the following fields are returned.  
   
-   name  
-   userId  
-   productId  
-   subscriptionId  
-   callCountSuccess  
-   callCountBlocked  
-   callCountFailed  
-   callCountOther  
-   callCountTotal  
-   bandwidth  
-   cacheHitsCount  
-   cacheMissCount  
-   apiTimeAvg  
-   apiTimeMin  
-   apiTimeMax  
-   serviceTimeAvg  
-   serviceTimeMin  
-   serviceTimeMax  
   
All other fields in the response contain default values.  
  
##  <a name="ReportByRequest"></a> Get request log entries  
The `byRequest` aggregation returns request log entries.  
  
The following fields and operators are supported. The `$filter` parameter is required and must include a `timestamp` for the call to be successful.

| Field     | Supported operations | Description                                                                                                                                                                                                                                                                                               |
|-----------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| timestamp | ge,le                | The start and end of the reporting period, for example `$filter=timestamp ge datetime'2014-10-07T00:00:00' and timestamp le datetime'2014-10-14T00:00:00'`. If `le` is omitted the current date and time is used for the end of the reporting period. You must specify a starting date and time for `ge`. |
  
### Sample response body  
  
```json  
  
{  
"value":   
  [  
        {  
            "apiId": "/apis/1",  
            "operationId": "/apis/1/operations/15",  
            "productId": "/products/1",  
            "userId": "/users/1",  
            "method": "GET",  
            "url": "https://contoso.azure-api.net/weather/exampleApi?parameter=12345",  
            "ipAddress": "52.19.150.51",  
            "backendResponseCode": 200,  
            "responseCode": 200,  
            "responseSize": 6207,  
            "timestamp": "2016-08-26T21:48:10.6363746",  
            "cache": "none",  
            "apiTime": 480.2314,  
            "serviceTime": 459.9143,  
            "apiRegion": "West Europe",  
            "subscriptionId": "/subscriptions/33",  
            "requestSize": 0  
        },  
            "apiId": "/apis/2",  
            "operationId": "/apis/2/operations/10",  
            "productId": "/products/2",  
            "userId": "/users/2",  
            "method": "GET",  
            "url": "https://contoso.azure-api.net/weather/anotherExampleApi?parameter=6789",  
            "ipAddress": "100.15.65.51",  
            "backendResponseCode": 200,  
            "responseCode": 200,  
            "responseSize": 7405,  
            "timestamp": "2016-08-26T21:53:15.6378946",  
            "cache": "none",  
            "apiTime": 315.5657,  
            "serviceTime": 212.8273,  
            "apiRegion": "West US",  
            "subscriptionId": "/subscriptions/55",  
            "requestSize": 0  
        }                        
    ],  
  "count": 2  
}  
  
```  
