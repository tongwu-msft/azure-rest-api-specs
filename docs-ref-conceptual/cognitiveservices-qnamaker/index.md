---
title: QnA Maker REST API reference - Azure Cognitive Services
description: Learn how to get started with making REST calls for Azure Cognitive Services QnA Maker
author: nitinme
ms.author: nitinme
ms.manager: nitinme
ms.date: 02/17/2021
ms.topic: reference
ms.service: cognitive-services
ms.subservice: qna-maker
ms.devlang: rest-api
---

# QnA Maker REST API reference - Azure Cognitive Services

This article demonstrates how to call a REST API endpoint for QnA Maker, a service in Azure Cognitive Services suite. QnA Maker is a cloud-based Natural Language Processing (NLP) service that allows you to create a natural conversational layer over your data. It is used to find the most appropriate answer for any input from your custom knowledge base (KB) of information. QnA Maker is commonly used to build conversational client applications, which include social media applications, chat bots, and speech-enabled desktop applications.

## Call the QnA Maker endpoint

1. Start by creating an Azure Cognitive Services resource, and within that specifically a QnA Maker resource. For instructions, see [Create a Cognitive Services resource using the portal](/azure/cognitive-services/cognitive-services-apis-create-account).
1. From the Azure Portal, copy the key and endpoint required to make the call. For instructions, see [Get the keys for your resource](/azure/cognitive-services/cognitive-services-apis-create-account#get-the-keys-for-your-resource).
1. From the left navigation on this article, expand the node for the version of the API you want to work on, and then select the operation that you want to perform (e.g., **Get alterations**). On the right pane, select **Try It**.
1. In the **REST API Try It** pane, perform the following steps:

    1. In the **Endpoint** text box, enter the resource endpoint that you copied from the Azure portal.
    1. In the **Ocp-Apim-Subscription-Key** text box, enter the key that you copied from the Azure portal. If the call requires any more headers, add those with the appropriate values as well.
    1. Provide other parameters, headers, and message payload (body) as required for the operation.
    1. Select **Run**.
1. You will see the relevant response with an appropriate response code.

## Samples
Visit the [Cognitive Services REST API Sample Github repo](https://github.com/Azure-Samples/cognitive-services-REST-api-samples) for various samples on working with Cognitive Services using REST.


## See also

- For an overview of the service, see [What is QnA Maker?](/azure/cognitive-services/qnamaker/overview/overview)
- To create an Azure Cognitive Service resource, see [Get started with Azure Cognitive Service](/azure/cognitive-services/cognitive-services-apis-create-account).
- To access REST specifications for previous versions of QnA Maker API, see this [Github repo](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/cognitiveservices/data-plane/QnAMaker).