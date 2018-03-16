---
ms.assetid: 56b6be3f-f20f-4024-94c2-92a1e762b409
ms.title: Log Analytics REST API Reference
ms.service: LogAnalytics
author: bwren
ms.author: bwren
ms.manager: carmon
---

# Write data to Log Analytics repository 
The Azure Log Analytics HTTP Data Collector API, allows you to POST JavaScript Object Notation (JSON) data to the Log Analytics repository from any client that can call the REST API. By using this method, you can send data from third-party applications or from scripts, like from a runbook in Azure Automation

## Request URI 
To specify your Log analytics workspace, replace *{CustomerID}* with your Workspace’s ID. 

| Method | Request URI |
|:--|:--|
| Post | https://*{CustomerID}*.ods.opinsights.azure.com/<Resource>?api-version=2016-04-01 |

| Request | URI Parameters |
|:--|:--|
| Parameter | Description |
| CustomerID | Unique identifier for the Log Analytics workspace |
| Resource | API resource name. /api/logs |
| API Version | Version of the API to be used with this request. Currently 2016-04-01 |


## Request headers
The request headers in the following table are required.

| Header | Description |
|:--|:--|
| Authorization | See addational information below on creating a HMAC-SHA256 header |
| Content-Type | Required. Set this to **application/json** |
| Log-Type | Allows you to specify the name of the message that is being submitted. Currently, Log type only supports alpha characters. It does not support numerics or special characters |
| x-ms-date | The date that the request was processed in RFC 1123 format |
| time-generated-field | Allows you to specify the message’s timestamp field to use as the TimeGenerated field. This allows you to configure the TimeGenerated to reflect the actual timestamp from the message data. If this field isn’t specified, the default for TimeGenerated when the message is ingested. The message field specified should follow the ISO 8601 of YYYY-MM-DDThh:mm:ssZ |

## Authorization header
Any request to the Log analytics HTTP Data Collector API must include the Authorization header. To authenticate a request, you must sign the request with either the primary or secondary key for the workspace that is making the request and pass that signature as part of the request. 

The format for the Authorization header is as follows:

	Authorization: SharedKey <WorkspaceID>:<Signature>

*WorkspaceID* is the unique identifer for the Log Analytics workspace, and *Signature* is a Hash-based Message Authentication Code (HMAC) constructed from the request and computed by using the SHA256 algorithm, and then encoded using Base64 encoding.

### Constructing the signature string
To encode the Shared Key signature string, use the following format: 

	StringToSign = VERB + "\n" +
				Content-Length + "\n" +
				Content-Type + "\n" +
				x-ms-date + "\n" +
				"/api/logs";

The following example shows a signature string:
 
	POST\n1024\napplication/json\nx-ms-date:Mon, 04 Apr 2016 08:00:00 GMT\n/api/logs

Next, encode this string by using the HMAC-SHA256 algorithm over the UTF-8-encoded signature string, construct the Authorization header, and add the header to the request.

### Encoding the Signature
To encode the signature, call the HMAC-SHA256 algorithm on the UTF-8-encoded signature string and encode the result as Base64. Use the following format (shown as pseudocode): 

	Signature=Base64(HMAC-SHA256(UTF8(StringToSign)))


## Request body
The body of the message submitted to the endpoint. 
	{
	  "key1": "value1",
	  "key2": "value2"
	  "key3": "value3",
	  "key4": "value4"
	}

You can batch multiple messages of the same type into a single request body. 

	[
	  {
	    "key1": "value1",
	    "key2": "value2"
	    "key3": "value3",
	    "key4": "value4"
	  },
	  {
	    "key1": "value5",
	    "key2": "value6"
	    "key3": "value7",
	    "key4": "value8"
	  }
	]

### Data limits 

There are some constraints around the data posted to the Log Analytics Data collection API.
- Maximum of 30 MB per post to Log Analytics Data Collector API. This is a size limit for a single post. If the data from a single post that exceeds 30 MB, you should split the data up to smaller sized chunks and send them concurrently. 
- Maximum of 32 KB limit for field values. If the field value is greater than 32 KB, the data will be truncated. 
- Recommended maximum number of fields for a given type is 50. This is a practical limit from a usability and search experience perspective.

## See also
- [Log Analytics HTTP Data Collector API](http://azure.microsoft.com/documentation/articles/log-analytics-data-collector-api/)
