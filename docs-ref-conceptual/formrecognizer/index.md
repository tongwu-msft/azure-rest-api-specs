---
title: Form Recognizer REST API reference - Azure Cognitive Services
description: Learn how to get started with making REST calls for Azure Cognitive Services Form Recognizer API
author: nitinme
ms.author: nitinme
ms.manager: nitinme
ms.date: 01/27/2021
ms.topic: reference
ms.service: cognitive-services
ms.subservice: forms-recognizer
ms.devlang: rest-api
---

# Form Recognizer REST API reference - Azure Cognitive Services

This article demonstrates how to call a REST API endpoint for Form Recognizer service. Form Recognizer is a cognitive service that lets you build automated data processing software using machine learning technology. Identify and extract text, key/value pairs, selection marks, tables, and structure from your documents—the service outputs structured data that includes the relationships in the original file, bounding boxes, confidence and more. You quickly get accurate results that are tailored to your specific content without heavy manual intervention or extensive data science expertise. Use Form Recognizer to automate data entry in your applications and enrich your documents search capabilities.

## Call the Form Recognizer endpoint

1. Start by creating an Azure Cognitive Services resource, and within that specifically a Form Recognizer resource. For instructions, see [Create a Cognitive Services resource using the portal](https://docs.microsoft.com/en-us/azure/cognitive-services/cognitive-services-apis-create-account).
1. From the Azure Portal, copy the key and endpoint required to make the call. For instructions, see [Get the keys for your resource](https://docs.microsoft.com/en-us/azure/cognitive-services/cognitive-services-apis-create-account#get-the-keys-for-your-resource).
1. From the left navigation on this article, expand the node for the version of the API you want to work on, and then select the operation that you want to perform (e.g., **Analyze Receipt Async**). On the right pane, select **Try It**.
1. In the **REST API Try It** pane, perform the following steps:

    1. In the **Endpoint** text box, enter the resource endpoint that you copied from the Azure portal.
    1. In the **Ocp-Apim-Subscription-Key** text box, enter the key that you copied from the Azure portal. If the call requires any more headers, add those with the appropriate values as well.
    1. Provide other parameters, headers, and message payload (body) as required for the operation.
    1. Select **Run**.
1. You will see the relevant response with an appropriate response code.

## Samples

Visit the [Cognitive Services REST API Sample Github repo](https://github.com/Azure-Samples/cognitive-services-REST-api-samples) for various samples on working with Cognitive Services using REST.

## See also

- For an overview of the service, see [What is Form Recognizer?](https://docs.microsoft.com/azure/cognitive-services/form-recognizer/overview).
- To create an Azure Cognitive Service resource, see [Get started with Azure Cognitive Service](https://docs.microsoft.com/azure/cognitive-services/cognitive-services-apis-create-account).
- To access REST specifications for previous versions of Form Recognizer API, see this [Github repo](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/cognitiveservices/data-plane/FormRecognizer).