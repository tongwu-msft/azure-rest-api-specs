---
title: Face REST API reference - Azure Cognitive Services
description: Learn how to get started with making REST calls for Azure Cognitive Services Face API
author: nitinme
ms.author: nitinme
ms.manager: nitinme
ms.date: 01/27/2021
ms.topic: reference
ms.service: cognitive-services
ms.subservice: face-api
ms.devlang: rest-api
---

# Face REST API reference - Azure Cognitive Services

This article demonstrates how to call a REST API endpoint for Face, a service in Azure Cognitive Services suite. The Face service provides AI algorithms that detect, recognize, and analyze human faces in images. Facial recognition software is important in many different scenarios, such as security, natural user interface, image content analysis and management, mobile apps, and robotics.

## Call the Face endpoint

1. Start by creating an Azure Cognitive Services resource, and within that specifically a Face resource. For instructions, see [Create a Cognitive Services resource using the portal](/azure/cognitive-services/cognitive-services-apis-create-account).
1. From the Azure Portal, copy the key and endpoint required to make the call. For instructions, see [Get the keys for your resource](/azure/cognitive-services/cognitive-services-apis-create-account#get-the-keys-for-your-resource).
1. From the left navigation on this article, expand the node for the version of the API you want to work on, and then select the operation that you want to perform (e.g., **Find Similar**). On the right pane, select **Try It**.
1. In the **REST API Try It** pane, perform the following steps:

    1. In the **Endpoint** text box, enter the resource endpoint that you copied from the Azure portal.
    1. In the **Ocp-Apim-Subscription-Key** text box, enter the key that you copied from the Azure portal. If the call requires any more headers, add those with the appropriate values as well.
    1. Provide other parameters, headers, and message payload (body) as required for the operation.
    1. Select **Run**.
1. You will see the relevant response with an appropriate response code.

## Samples
Visit the [Cognitive Services REST API Sample Github repo](https://github.com/Azure-Samples/cognitive-services-REST-api-samples) for various samples on working with Cognitive Services using REST.

## See also

- For an overview of the service, see [What is Face service?](/azure/cognitive-services/face/overview)
- To create an Azure Cognitive Service resource, see [Get started with Azure Cognitive Service](/azure/cognitive-services/cognitive-services-apis-create-account).
- To access REST specifications for previous versions of Face API, see this [Github repo](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/cognitiveservices/data-plane/Face).