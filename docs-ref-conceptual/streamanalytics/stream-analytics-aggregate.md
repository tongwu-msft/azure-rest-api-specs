# Aggregate

A (User-Defined) Aggregate provides an extensible way for a Streaming Job to transform aggregation data to output data using a facility that is not described by the Aggregation query.

## Create

Creates a new Stream Analytics user-defined aggregate.

### Request

The **Create Function** request is specified as follows.

For headers and parameters that are used by all requests related to Stream Analytics jobs, see  [Common parameters and headers](http://msdn.microsoft.com/library/azure/8d088ecc-26eb-42e9-8acc-fe929ed33563). Make sure that the request that is made to the management service is secure. For more information, see  [Authenticating Azure Resource Manager requests](http://msdn.microsoft.com/library/azure/dn790557.aspx).

| Method | Request URI |
| --- | --- |
| **PUT** | https://&lt;endpoint&gt;/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.StreamAnalytics/streamingjobs/{jobName}/functions/{aggregateName}?api-version={api-version} |

**Parameters**

Replace {subscription-id} with your subscription ID.

Replace {resource-group-name} with the name of the resource group that this job belongs to. For more information about creating resource groups, see  [Using resource groups to manage your Azure resources](https://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).

Replace {job-name} with the name that you want to assign to the Stream Analytics job that you are creating. The job name is case insensitive and must be unique among all inputs in the job, containing only numbers, letters, and hyphens. It must be 3 to 63 characters long.

Replace {aggregateName} with the name of the user-defined aggregate.

Replace {api-version} with 2015-10-01 in the URI.

**Request Headers**

Common request headers only.

**Request Body**

**JSON**

JSON

{

  &quot;properties&quot;: {

    &quot;type&quot;: &lt;aggregate type&gt;,

    &quot;properties&quot;: {

      .

      . aggregate type-specific properties

      .

    }

  }

}

| Property | Required | Description |
| --- | --- | --- |
| **type** | Yes | The aggregate type value is &quot;Aggregate&quot;. |
| **properties** | Yes | Collection of aggregate type-specific properties. May be empty. |

Properties for Aggregate function type:

| Property | Description |
| --- | --- |
| inputs | An array of inputs, describing the parameters of the UDA accumulate function. |
| Inputs.dataType | Data type of the UDA parameter. List of valid Azure Stream Analytics data types are described at  [Azure Stream Analytics data types](https://msdn.microsoft.com/library/azure/dn835065.aspx). |
| Input.isConfigurationParameter | Optional. True if this parameter is expected to be a constant. Default is false. |
| output | Described output of the UDA computeResult function. |
| Output.dataType | Data type of UDA output. List of valid Azure Stream Analytics data types are described at  [Azure Stream Analytics data types](https://msdn.microsoft.com/library/azure/dn835065.aspx). |
| Binding | Described the physical binding for the UDA. |
| Binding.Type | Type of the binding. |
| Binding.Properties | Properties for the binding. Values are dependent on the type of binding. |

Note

Create Function validates if the binding and input columns specified matches, if it doesn&#39;t it would return an error. This validation is triggered only if either input or output is specified.

### Example payload to create an Azure Stream Analytics JavaScript aggregate.

JSON

{

  &quot;properties&quot;: {

    &quot;type&quot;: &quot;Aggregate&quot;,  //Aggregate type.

    &quot;properties&quot;: {

      &quot;inputs&quot;: [ // accumulate input parameter(s).

        {

          &quot;dataType&quot;: &quot;any&quot;, // Input data type

        }

      ],

      &quot;output&quot;: { // Output

        &quot;dataType&quot;: &quot;any&quot; // Output data type

      },

      &quot;binding&quot;: {

        &quot;type&quot;: &quot;Microsoft.StreamAnalytics/JavascriptUdf&quot;,

        &quot;properties&quot;: { // Aggregate definition

          &quot;script&quot;: &quot;function main() {

                          this.init = function () {

                              this.state = 0;

                          }

                          this.accumulate = function (value, timestamp) {

                              this.state += value;

                          }

                          this.computeResult = function () {

                              return this.state;

                          }

                     }&quot;

        }

      }

    }

  }

}

Binding properties for Microsoft.StreamAnalytics/JavascriptUdf.

| Property | Description |
| --- | --- |
| script | JavaScript code that implements this UDA. |

**Response**

**Status code:**

- 201 (Created) or 200 (OK) if request completed successfully
- 404 (NotFound) if top-level resources are not found (subscription, resource group, or job).
- 409 (Conflict) if job is in a state where updating functions is not allowed
- 412 (Precondition Failed) if failed condition specified by If-Match header.
- 400 (Bad Request) if request body fails validation.

**Response Headers**

Common response headers only

**Response Body**

JSON

{

  &quot;properties&quot;: {

    &quot;type&quot;: {aggregate type},

    &quot;properties&quot;: {

      .

      . aggregate type-specific properties

      .

    }

  }

}

## Delete

Deletes the specified user-defined aggregate.

### Request

The  **Delete Function**  request is specified as follows.

For headers and parameters that are used by all requests related to Stream Analytics jobs, see  [Common parameters and headers](http://msdn.microsoft.com/library/azure/8d088ecc-26eb-42e9-8acc-fe929ed33563). Make sure the request that is made to the management service is secure. For more information, see  [Authenticating Azure Resource Manager requests](http://msdn.microsoft.com/library/azure/dn790557.aspx).

Request

| Method | Request URI |
| --- | --- |
| **DELETE** | https://&lt;endpoint&gt;/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.StreamAnalytics/streamingjobs/{jobName}/function/{aggregateName}?api-version={api-version} |

**Parameters**

Replace {subscription-id} with your subscription ID.

Replace {resource-group-name} with the name of the resource group that this job belongs to. For more information about creating resource groups, see  [Using resource groups to manage your Azure resources](https://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).

Replace {job-name} with the name that you want to assign to the Stream Analytics job that you are creating. The job name is case insensitive and must be unique among all inputs in the job, containing only numbers, letters, and hyphens. It must be 3 to 63 characters long.

Replace {aggregateName} with the name of the user-defined aggregate.

Replace {api-version} with 2015-10-01 in the URI.

**Request Headers**

Common request headers only.

**Request Body**

Empty

**Response**

Status Code as per RPC

**Response Headers**

Common request headers only.

**Response Body**

Empty

## Get

Gets information about a specific user-defined aggregate.

### Request

For headers and parameters that are used by all requests related to Stream Analytics jobs, see  [Common parameters and headers](http://msdn.microsoft.com/library/azure/8d088ecc-26eb-42e9-8acc-fe929ed33563). Make sure that the request that is made to the management service is secure. For more information, see  [Authenticating Azure Resource Manager requests](http://msdn.microsoft.com/library/azure/dn790557.aspx).

| Method | Request URI |
| --- | --- |
| **GET** | https://&lt;endpoint&gt;/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.StreamAnalytics/streamingjobs/{jobName}/functions/{aggregateName}?api-version={api-version} |

Replace {subscription-id} with your subscription ID.

Replace {resource-group-name} with the name of the resource group that this job belongs to. For more information about creating resource groups, see  [Using resource groups to manage your Azure resources](https://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).

Replace {job-name} with the name of the Stream Analytics job that you want information about.

Replace aggregateName with the name of the user-defined aggregate.

Replace {api-version} with 2015-10-01 in the URI.

### Response

Status code: 200

**JSON**

JSON

{

  &quot;id&quot;: &quot;/subscriptions/{id}/resourceGroups/{group}/providers/microsoft.streamAnalytics/streamingjobs/filterSample/functions/{aggregateName}&quot;,

  &quot;name&quot;: {aggregateName},

  &quot;type&quot;: &quot;Microsoft.StreamAnalytics/streamingjobs/functions&quot;,

  &quot;properties&quot;: {

    &quot;type&quot;: {aggregateType},

    &quot;properties&quot;: {

      .

      . aggregate type-specific properties

      .

    }

  }

}

## List

Lists all of the functions that are defined in a Stream Analytics job.

### Request

The  **List Functions**  request is specified as follows.

For headers and parameters that are used by all requests related to Stream Analytics jobs, see  [Common parameters and headers](http://msdn.microsoft.com/library/azure/8d088ecc-26eb-42e9-8acc-fe929ed33563). Make sure that the request that is made to the management service is secure. For more information, see  [Authenticating Azure Resource Manager requests](http://msdn.microsoft.com/library/azure/dn790557.aspx).

| Method | Request URI |
| --- | --- |
| **GET** | [https://managment.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.StreamAnalytics/streamingjobs/{job-name}/functions&amp;api-version={api-version}](https://managment.azure.com/subscriptions/%7bsubscription-id%7d/resourceGroups/%7bresource-group-name%7d/providers/Microsoft.StreamAnalytics/streamingjobs/%7bjob-name%7d/functions&amp;api-version=%7bapi-version%7d) |

Replace {subscription-id} with your subscription ID.

Replace {resource-group-name} with the name of the resource group that this job belongs to. For more information about creating resource groups, see  [Using resource groups to manage your Azure resources](https://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).

Replace {job-name} with the name of the Stream Analytics job.

Replace {api-version} with 2015-10-01-preview in the URI.

### Response

Status code: 200

**JSON**

The following example shows a response from a List Functions request for a Stream Analytics job with one Azure Machine Learning Function.

JSON

{

  &quot;id&quot;: &quot;/subscriptions/{id}/resourceGroups/{group}/providers/microsoft.streamAnalytics/streamingjobs/filterSample/functions/{aggregateName}&quot;,

  &quot;name&quot;: {aggregateName},

  &quot;type&quot;: &quot;Microsoft.StreamAnalytics/streamingjobs/functions&quot;,

  &quot;properties&quot;: {

    &quot;type&quot;: {aggregateType},

    &quot;properties&quot;: {

      .

      . aggregate type-specific properties

      .

    }

  }

}

## Test

Tests whether the specified connection information provided for the binding is valid. If the binding exposes a programmatically queryable interface, test endpoint validates if the UDA definition is compatible with what is returned by the interface.

Testing is asynchronous. When the operation is complete, the entity returned in the Location header of the POST action response includes the full details of the tests run and the results.

### Request

The  **Test Function**  request is specified as follows.

For headers and parameters that are used by all requests related to Stream Analytics jobs, see  [Common parameters and headers](http://msdn.microsoft.com/library/azure/8d088ecc-26eb-42e9-8acc-fe929ed33563). Make sure that the request that is made to the management service is secure. For more information, see  [Authenticating Azure Resource Manager requests](http://msdn.microsoft.com/library/azure/dn790557.aspx).

Request

| Method | Request URI |
| --- | --- |
| **POST** | https://&lt;endpoint&gt;/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.StreamAnalytics/streamingjobs/{jobName}/functions/{aggregateName}/test?api-version={api-version} |

**Parameters**

Replace {subscription-id} with your subscription ID.

Replace {resource-group-name} with the name of the resource group that this job belongs to. For more information about creating resource groups, see  [Using resource groups to manage your Azure resources](https://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).

Replace {job-name} with the name that you want to assign to the Stream Analytics job that you are creating. The job name is case insensitive and must be unique among all inputs in the job, containing only numbers, letters, and hyphens. It must be 3 to 63 characters long.

Replace {aggregateName} with the name of the user-defined aggregate.

Replace {api-version} with 2015-10-01 in the URI.

**Request Headers**

Common request headers only.

**Request Body**

Any one or more of the input type-specific properties used in PUT may be specified in the request body.

**Response**

**Status Code:**

- 202 (Accepted) if the request was accepted to complete asynchronously.
- 404 (NotFound) if top-level resources are not found (subscription, resource group, job).
- 400 (Bad Request) if Test Function is called with an empty request body or a non-existing source.
- 5xx if the service is unable to run the test due to service or communication issues.

**Response Headers**

Common response headers

**Response Body**

None from the POST operation itself. Clients should use the Asynchronous Operations pattern to get the results of the test. Results are returned as Test Operation Results.

## Update

Updates the specified aggregate.

### Request

The  **Update Function**  request is specified as follows.

For headers and parameters that are used by all requests related to Stream Analytics jobs, see  [Common parameters and headers](http://msdn.microsoft.com/library/azure/8d088ecc-26eb-42e9-8acc-fe929ed33563). Make sure that the request that is made to the management service is secure. For more information, see  [Authenticating Azure Resource Manager requests](http://msdn.microsoft.com/library/azure/dn790557.aspx).

**Request**

| Method | Request URI |
| --- | --- |
| **PATCH** | https://&lt;endpoint&gt;/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.StreamAnalytics/streamingjobs/{jobName}/function/{aggregateName}?api-version={api-version} |

**Parameters**

Replace {subscription-id} with your subscription ID.

Replace {resource-group-name} with the name of the resource group that this job belongs to. For more information about creating resource groups, see  [Using resource groups to manage your Azure resources](https://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).

Replace {job-name} with the name that you want to assign to the Stream Analytics job that you are creating. The job name is case insensitive and must be unique among all inputs in the job, containing only numbers, letters, and hyphens. It must be 3 to 63 characters long.

Replace {aggregateName} with the name of the user-defined aggregate.

Replace {api-version} with 2015-10-01 in the URI.

**Request Headers**

Common request headers only.

**Request Body**

One or more properties used in the Create Function may be specified in the request body, setting/replacing any existing value for each property specified.

**JSON**

JSONCopy

{

  &quot;properties&quot;: {

    &quot;type&quot;: {aggregate type},

    &quot;properties&quot;: {

      .

      . aggregate type-specific properties

      .

    }

  }

}

| Property | Required | Description |
| --- | --- | --- |
| **type** | Yes\* | The aggregate type string &quot;Aggregate&quot;. |
| **properties** | Yes | Collection of function type-specific properties to change. May be empty. |

**\** \*Using PATCH to change the function type is not permitted. Since changing the function type likely would specify a whole new set of function type-specific properties. PUT rather than PATCH should be used to replace the complete entity.

Note

Update Function validates if the binding and input columns specified matches, if it doesn&#39;t it would return an error. This validation is triggered only if either input or output is specified.

## Examples

Aggregate type, Binding type, and key properties describing the binding should always be provided.

**Response**

**Status code:**

- 200 (OK) if request completed successfully (or resource does not exist)
- 409 (Conflict) if job is in a state where updating functions is not allowed
- 412 (Precondition Failed) if failed condition specified by If-Match header.
- 400 (Bad Request) if request body fails validation.

**Response Headers**

Common response headers only

**Response Body**

JSON

{

  &quot;properties&quot;: {

    &quot;type&quot;: {aggregate type},

    &quot;properties&quot;: {

      .

      . aggregate type-specific properties

      .

    }

  }

}

Note

The apiKey secret is not returned in the PATCH response.