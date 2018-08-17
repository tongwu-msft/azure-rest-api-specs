---
title: Azure Billing Enterprise APIs - Usage Details| Microsoft Docs
description: Learn about Azure Billing Usage and RateCard APIs, which are used to provide insights into Azure resource consumption and trends.
services: ''
documentationcenter: ''
author: anandedwin
manager: aedwin
editor: ''
tags: billing

ms.assetid: 3e817b43-0696-400c-a02e-47b7817f9b77
ms.service: billing
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: billing
ms.date: 010/02/2017
ms.author: aedwin

---
# Reporting APIs for Enterprise customers - Usage Details

The Usage Detail API offers a daily breakdown of consumed quantities and estimated charges by an Enrollment. The result also includes information on instances, meters, and departments. The API can be queried by Billing period or by a specified start and end date. 

Common header properties that need to be added are specified [here](https://docs.microsoft.com/azure/billing/billing-enterprise-api). Custom time ranges can be specified with the start and end date parameters that are in the format yyyy-MM-dd.  

## CSV Format
The API listed below provides data in csv format.

### Synchronous call (non-polling)
We return data in csv format as a response of the rest API call. The API performance is dependent on the amount of usage data returned by your call. Even though the API supports custom date ranges we recommend that you restrict it based on the volume of usage data you have for that period.  We allow maximum of one month support.

|Method | Download Request URI|
|-|-|
|GET|https://consumption.azure.com/v3/enrollments/{enrollmentNumber}/usagedetails/download?billingPeriod={billingPeriod}
|GET|https://consumption.azure.com/v3/enrollments/{enrollmentNumber}/usagedetails/download?startTime=2017-01-01&endTime=2017-01-10|

### Asynchronous call (polling based)
This is a two-step process that requires you to submit your request first for a specific time range and then poll to get a shared access key based URL for an Azure Blob location which has csv data. The maximum supported time rang here is 36 months. We recommend this API for larger datasets

|Method | Submit Request URI|
|-|-|
|POST|https://consumption.azure.com/v3/enrollments/{enrollmentNumber}/usagedetails/submit?billingPeriod={billingPeriod}
|POST|https://consumption.azure.com/v3/enrollments/{enrollmentNumber}/usagedetails/submit?startTime=2017-04-01&endTime=2017-04-10|

#### Response of Asynchronous (polling) submit call

	{
		"id": "string",
		"enrollmentNumber":"string",
		"requestedOn":"2017-08-29T06:56:29.1290704Z",
		"status":1,
		"blobPath":"",
		"reportUrl":"string",
		"startDate":"2017-06-01T00:00:00",
		"endDate":"2017-06-30T00:00:00"
	}


##### Asynchronous call Response property definitions

|Property Name| Type| Description
|-|-|-|
|id| string| The unique Id for this request. |
|enrollmentNumber| string| The Enrollment number the request was made for.|
|requestedOn| string| The date time that request was made on. |
|status| int| Indicates the status of the request. Queued = 1, InProgress = 2, Completed = 3, Failed = 4, NoDataFound = 5, ReadyToDownload=6, TimedOut = 7. |
|blobPath| string| The shared access key URL to the csv blob. |
|reportUrl| string| The URL that can be used to poll for the status of submit request. |
|startDate| string| Corresponds to the beginning of the time range used while making the submit call. |
|endDate| string| Corresponds to the end of the time range used while making the submit call.|

The reportUrl is the URL that can be used for further polling calls (GET operation). When the status field in the response of polling request comes back as 3, the request is completed. We have the blobPath field in the response populated with a URL pointing to the csv data. The blob is available for 1 hour from the date time in requestedOn field of response. Status 4, 5 and 7 are failure status where the API call has hit an error condition. For all other status, the polling call should be repeated. 

## JSON Format 
The API listed below provide data in JSON format. If a billing period is not specified, then data for the current billing period is returned. The maximum supported time range is 36 months. 

|Method | Request URI|
|-|-|
|GET|https://consumption.azure.com/v3/enrollments/{enrollmentNumber}/usagedetails 
|GET|https://consumption.azure.com/v3/enrollments/{enrollmentNumber}/billingPeriods/{billingPeriod}/usagedetails|
|GET|https://consumption.azure.com/v3/enrollments/{enrollmentNumber}/usagedetailsbycustomdate?startTime=2017-01-01&endTime=2017-01-10|

> [!Note]
> To use the preview version of API, replace v2 with v1 in the above URL.
>

### Response

> Due to the potentially large volume of data the result set is paged. The nextLink property, if present, specifies the link for the next page of data. If the link is empty, it denotes that is the last page. 

	{
		"id": "string",
		"data": [
			{
                "serviceName":"Storage",
                "serviceTier":"Premium Page Blobs",
                "location":"US West",
                "chargesBilledSeparately":false,
                "partNumber":"ABC-12345",
                "resourceGuid":"00000000-0000-0000-0000-000000000000",
                "offerId":"MS-AZR-0003P",
                "cost":1,
                "accountId":123456,
                "productId":1234,
                "resourceLocationId":12,
                "consumedServiceId":1,
                "departmentId":3456,
                "accountOwnerEmail":"account@live.com",
                "accountName":"Account Name",
                "serviceAdministratorId":"123",
                "subscriptionId":0000000,
                "subscriptionGuid":"00000000-0000-0000-0000-000000000000",
                "subscriptionName":"Subscription Name",
                "date":"2018-08-01T00:00:00",
                "product":"Locally Redundant Storage Premium Storage - Page Blob/P10 - US West",
                "meterId":"00000000-0000-0000-0000-000000000000",
                "meterCategory":"Storage",
                "meterSubCategory":"Locally Redundant",
                "meterRegion":"California",
                "meterName":"Premium Storage - Page Blob/P10 (Units)",
                "consumedQuantity"1,
                "resourceRate":1,
                "resourceLocation":"uswest",
                "consumedService":"Microsoft.Compute",
                "instanceId":"Id",
                "serviceInfo1":"string",
                "serviceInfo2":"string",
                "additionalInfo":"string",
                "tags":"string",
                "storeServiceIdentifier":"string",
                "departmentName":"Department Name",
                "costCenter":"1234",
                "unitOfMeasure":"Units",
                "resourceGroup":"ResourceGroup"
			}
		],
		"nextLink": "string"
	}


## Usage details field definitions

|Property Name| Type| Description
|-|-|-|
|id| string| The unique Id for the API call. |
|data| JSON array| The Array of daily usage details for every instance\meter.|
|nextLink| string| When there are more pages of data the nextLink points to the URL to return the next page of data. |
|accountId| int| Obsolete field. Present for backward compatibility. |
|productId| int| Obsolete field. Present for backward compatibility. |
|resourceLocationId| int| Obsolete field. Present for backward compatibility. |
|consumedServiceID| int| Obsolete field. Present for backward compatibility. |
|departmentId| int| Obsolete field. Present for backward compatibility. |
|accountOwnerEmail| string| Email account of the account owner. |
|accountName| string| Customer entered name of the account. |
|serviceAdministratorId| string| Email Address of Service Administrator. |
|subscriptionId| int| Obsolete field. Present for backward compatibility. |
|subscriptionGuid| string| Global Unique Identifier for the subscription. |
|subscriptionName| string| Name of the subscription. |
|date| string| The date on which consumption occurred. |
|product| string| Additional details on the meter.|
|meterId| string| The identifier for the meter which emitted usage. |
|meterCategory| string| The Azure platform service that was used. |
|meterSubCategory| string| Defines the Azure service type that can affect the rate.|
|meterRegion| string| Identifies the location of the datacenter for certain services that are priced based on datacenter location. |
|meterName| string| Name of the meter. |
|consumedQuantity| double| The amount of the meter that has been consumed. |
|resourceRate| double| The rate applicable per billable unit. |
|cost| double| The charge that has been incurred for the meter. |
|resourceLocation| string| Identifies the datacenter where the meter is running. |
|consumedService| string| The Azure platform service that was used. |
|instanceId| string| This identifier is the name of the resource or the fully qualified Resource ID. For more information, see [Azure Resource Manager API](https://docs.microsoft.com/rest/api/resources/resources) |
|serviceInfo1| string| Internal Azure Service Metadata. |
|serviceInfo2| string| For example, an image type for a virtual machine and ISP name for ExpressRoute. |
|additionalInfo| string| Service-specific metadata. For example, an image type for a virtual machine. |
|tags| string| Customer added tags. For more information, see [Organize your Azure resources with tags](https://docs.microsoft.com/azure/azure-resource-manager/resource-group-using-tags). |
|storeServiceIdentifier| string| This column is not used. Present for backward compatibility. |
|departmentName| string| Name of the department. |
|costCenter| string| The cost center that the usage is associated with. |
|unitOfMeasure| string| Identifies the unit that the service is charged in. Example: GB, hours, 10,000 s. |
|resourceGroup| string| The resource group in which the deployed meter is running in. For more information, see [Azure Resource Manager overview](https://docs.microsoft.com/azure/azure-resource-manager/resource-group-overview). |
|chargesBilledSeparately| string| Charges billed outside of Monetary Commitment. |
|location| string| Location where the service was deployed. |
|offerId| string| OfferId against the service. |
|partNumber| string| SKU Number for the service. |
|resourceGuid| string| The identifier for the meter which emitted usage. |
|serviceTier| string| Service Tier. |
|serviceName| string| Service Name. |


## See also

* [Billing Periods API](billing-enterprise-api-billing-periods.md)

* [Balance and Summary API](billing-enterprise-api-balance-summary.md)

* [Marketplace Store Charge API](billing-enterprise-api-marketplace-storecharge.md) 

* [Price Sheet API](billing-enterprise-api-pricesheet.md)