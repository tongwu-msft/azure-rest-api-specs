---
title: Create a load test in Azure Load Testing
description: 'This article shows how to create a load test in an Azure Load Testing resource.'
author: ninallam
ms.author: ninallam
ms.date: 05/24/2022
ms.topic: reference
ms.service: load-testing
ms.devlang: rest-api
---

# Create a load test in an Azure Load Testing resource

A test specifies the test script, and configuration settings for running a load test. You can create one or more tests in an Azure Load Testing resource.

The configuration of a load test consists of:

- The test name and description.

- The Apache JMeter test script and related data and configuration files. For example, a CSV data file.

- [Environment variables](/azure/load-testing/how-to-parameterize-load-tests).

- [Secret parameters](/azure/load-testing/how-to-parameterize-load-tests).

- The number of [test engines](/azure/load-testing/concept-load-testing-concepts#test-engine) to run the test script on.

- The [pass/fail criteria](/azure/load-testing/how-to-define-test-criteria) for the test.

- The list of [app components and resource metrics to monitor](/azure/load-testing/how-to-monitor-server-side-metrics) during the test execution.

In Azure Load Testing, the load test creation and the file uploads are decoupled, i.e., they are separate API operations. The section shows the steps involved in creating a load test.

1. Obtain the data plane URI for the Azure Load Testing resource as mentioned [here](data-plane-uri.md).

1. Create a new test

    ```http
    PATCH https://<dataPlaneURL>/loadtests/{testId}?api-version=2022-06-01-preview`
    ```

    For a client making a request with this signature, the [Create or Update Test](/rest/api/loadtesting/dataplane/test/create-or-update-test) operation will be executed.

    A successful response for a request made using this signature will be similar to the following:

    ```json
    { 
      "description": "sample description", 
      "displayName": "Performance_LoadTest", 
      "loadTestConfig": { 
        "engineInstances": 6, 
        "splitAllCSVs": true 
      }, 
      "passFailCriteria": { 
        "passFailMetrics": { 
          "fefd759d-7fe8-4f83-8b6d-aeebe0f491fe": { 
            "clientmetric": "response_time_ms", 
            "aggregate": "percentage", 
            "condition": ">", 
            "value": 20, 
            "action": "continue" 
          } 
        } 
      }, 
      "secrets": { 
        "secret1": { 
          "value": "https://samplevault.vault.azure.net/secrets/samplesecret/f113f91fd4c44a368049849c164db827", 
          "type": "AKV_SECRET_URI" 
        } 
      }, 
      "environmentVariables": { 
        "envvar1": "sampletext" 
      }, 
      "subnetId": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/samplerg/providers/Microsoft.Network/virtualNetworks/samplenetworkresource/subnets/AAAAA0A0A0", 
      "keyvaultReferenceIdentityType": "UserAssigned", 
      "keyvaultReferenceIdentityId": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/samplerg/providers/sampleprovider/sampleresourcetype/sampleresourcename" 
    }
    ```

    This updates the test details like test name, description, secrets, environment variables, number of engines and pass/fail criteria.

1. Upload files to the test created

    ```http
    PUT https://<dataPlaneURL>/loadtests/{testId}/files/{fileId}?api-version=2022-06-01-preview
    ```

    or

    ```http
    PUT https://<dataPlaneURL>/loadtests/{testId}/files/{fileId}?fileType={fileType}&api-version=2022-06-01-preview
    ```

     For a client making a request with this signature, the [Upload test file](/rest/api/loadtesting/dataplane/test/upload-test-file) operation will be executed.

    > [!NOTE]
    > Each PUT call supports only 1 file to be uploaded. If multiple files are uploaded in the same call, all files apart from the first are discarded. Depending upon the requirement, the you might need to make multiple calls, one for each, i.e. JMX script, ZIP file, CSV file, user.properties, etc.

    The uploaded JMX file is validated if it adheres to XML norms and if it is a valid JMeter script. The validationStatus field shows the status of the validation. If JMeter is able to accept the JMX script without any errors, it is considered “VALIDATION_SUCCESS” and the file is successfully associated with the load test. All subsequent test runs will use this file.

    A successful response for a request made using this signature will be similar to the following:

    ```json
    { 
      "url": "https://dummyurl.com/testscriptresource", 
      "fileId": "92345678-1234-1111-1234-123456789012", 
      "filename": "sample.jmx", 
      "fileType": 0, 
      "expireTime": "2021-12-05T16:43:46.072Z", 
      "validationStatus": "VALIDATION_SUCCESS" 
    }
    ```

1. Configure AppComponents for monitoring using the following steps. AppComponents can be configured for either a load test or only a test run.

    ```http
    PATCH https://<dataPlaneURL>/appcomponents/{name}?api-version=2022-06-01-preview
    ```

    For a client making a request with this signature, the [Create Or Update App Components](/rest/api/loadtesting/dataplane/app-component/create-or-update-app-components) operation will be executed. The request body should contain either a testId or a testRunId.

    A successful response for a request made using this signature will be similar to the following:

    ```json
    { 
      "resourceId": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/samplerg/providers/microsoft.loadtestservice/sampleresourcetype/sampleresourcename", 
      "testId": "12345678-1234-1234-1234-123456789012", 
      "testRunId": "12316678-1234-1234-1234-122451189012", 
      "name": "ee843bd9-a6d4-4364-a45c-427a03c39fa7", 
      "value": { 
        "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/samplerg/providers/microsoft.insights/components/appcomponentresource": { 
          "resourceId": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/samplerg/providers/microsoft.insights/components/appcomponentresource", 
          "resourceType": "microsoft.insights/components", 
          "resourceName": "appcomponentresource", 
          "displayName": "Performance_LoadTest_Insights", 
          "resourceGroup": "samplerg", 
          "subscriptionId": "00000000-0000-0000-0000-000000000000", 
          "kind": "web" 
        } 
      } 
    }
    ```
