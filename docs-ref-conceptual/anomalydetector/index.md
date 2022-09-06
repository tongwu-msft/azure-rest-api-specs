---
title: Anomaly Detector REST API reference - Azure Cognitive Services
description: Learn how to get started with making REST calls for Azure Cognitive Services Anomaly Detector API
author: nitinme
ms.author: nitinme
ms.manager: nitinme
ms.date: 04/13/2021
ms.topic: reference
ms.service: cognitive-services
ms.subservice: anomaly-detector
ms.devlang: rest-api
---

# Anomaly Detector REST API reference - Azure Cognitive Services

This article demonstrates how to call a REST API endpoint for Anomaly Detector service. The Anomaly Detector API enables you to monitor and detect abnormalities in your time series data without having to know machine learning. The Anomaly Detector API's algorithms adapt by automatically identifying and applying the best-fitting models to your data, regardless of industry, scenario, or data volume. Using your time series data, the API determines boundaries for anomaly detection, expected values, and which data points are anomalies.

## Call the Anomaly Detector endpoint

1. Start by creating an Azure Cognitive Services resource, and within that specifically an Anomaly Detector resource. For instructions, see [Create a Cognitive Services resource using the portal](/azure/cognitive-services/cognitive-services-apis-create-account).
1. From the Azure Portal, copy the key and endpoint required to make the call. For instructions, see [Get the keys for your resource](/azure/cognitive-services/cognitive-services-apis-create-account#get-the-keys-for-your-resource).
1. From the left navigation on this article, select the operation that you want to perform (e.g., **Detect Change Point**). On the right pane, select **Try It**.
1. In the **REST API Try It** pane, perform the following steps:

    1. In the **Endpoint** text box, enter the resource endpoint that you copied from the Azure portal.
    1. In the **Ocp-Apim-Subscription-Key** text box, enter the key that you copied from the Azure portal. If the call requires any more headers, add those with the appropriate values as well.
    1. Provide other parameters, headers, and message payload (body) as required for the operation.
    1. Select **Run**.
1. You will see the relevant response with an appropriate response code.

## Samples

Visit the [Cognitive Services REST API Sample Github repo](https://github.com/Azure-Samples/cognitive-services-REST-api-samples) for various samples on working with Cognitive Services using REST.

## See also

- For more information, see [Anomaly Detector Documentation](/azure/cognitive-services/anomaly-detector/).
- To create an Azure Cognitive Service resource, see [Get started with Azure Cognitive Service](/azure/cognitive-services/cognitive-services-apis-create-account).
- To access REST specifications for previous versions of Anomaly Detector API, see this [Github repo](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/cognitiveservices/data-plane/AnomalyDetector).