---
ms.assetid: 07ca5b1b-2f98-4ca8-bcb0-decaae6cf010
title: Azure Cognitive Services - Bing Search REST API reference
ms.service: cognitive-services
author: steved0x
ms.author: sdanie
ms.data: 05/21/2019
description: Bing Search APIs provide a variety of APIs with trained models for your use.
service_description: Bing Search APIs provide a variety of APIs with trained models for your use.
---


# Azure Cognitive Services - Bing Search REST API reference

>[!WARNING]
> Bing Search APIs are moving from Cognitive Services to
[Bing Search Services](https://aka.ms/cogsvcs/bingmove). Bing Search APIs provisioned using Cognitive Services will be supported
for the next three years or until the end of your Enterprise Agreement,
whichever happens first.
>
> For migration instructions, see [Bing Search Services](https://aka.ms/cogsvcs/bingmigration). 

Bing Search APIs provide a variety of APIs with trained models for your use.

## Bing Search services

| Service|API Version|Description   |
|--|--|--|
|Autosuggest|[V5](bing-autosuggest-api-v5-reference.md), [V7](bing-autosuggest-api-v7-reference.md)|The Autosuggest API lets you send a partial search query term to Bing and get back a list of suggested queries that other users have searched on. In addition to including searches made by others, the list may include suggestions based on user intent.|
|Entity Search|[V7](bing-entities-api-v7-reference.md)|The Entity Search API lets you send a search query to Bing and get back search results that include entities and places. Place results include restaurants, hotel, or other local businesses. For places, the query can specify the name of the local business or it can ask for a list (for example, restaurants near me). Entity results include persons, places, or things. Place in this context is tourist attractions, states, countries, etc.|
|Image Search|[V5](bing-images-api-v5-reference.md), [V7](bing-images-api-v7-reference.md)|The Image Search API lets you send a search query to Bing and get back a list of relevant images. This section provides technical details about the query parameters and headers that you use to request images and the JSON response objects that contain them.|
|News Search|[V5](bing-news-api-v5-reference.md), [V7](bing-news-api-v7-reference.md)|The News Search API lets you send a search query to Bing and get back a list of relevant news articles. This section provides technical details about the query parameters and headers that you use to request news articles and the JSON response objects that contain them. |
|Spell Check|[V5](bing-spell-check-api-v5-reference.md), [V7](bing-spell-check-api-v7-reference.md)|The Spell Check API lets you check a text string for spelling and grammar errors. This section provides technical details about the query parameters and headers that you use to request spell checking, and the JSON response objects that contain the results. |
|Video Search|[V5](bing-video-api-v5-reference.md), [V7](bing-video-api-v7-reference.md)|The Video Search API lets you send a search query to Bing and get back a list of videos that are relevant to the search query. This section provides technical details about the query parameters and headers that you use to request videos and the JSON response objects that contain them. |
|Web Search|[V5](bing-web-api-v5-reference.md), [V7](bing-web-api-v7-reference.md)|The Web Search API lets you send a search query to Bing and get back search results that include links to webpages, images, and more. This section provides technical details about the webpages, related searches, and ranking results in addition to the query parameters that affect the search results. |

This custom APIs allow you to bring your data to the existing algorithm to enhance your results.

| Service |API Version|Description   |
|--|--|--|
|Custom Autosuggest|[V7](bing-custom-autosuggest-api-v7-reference.md)|The Custom Autosuggest API lets you send a partial search query string to Bing and get back a list of suggested queries. Typically, you use this API to support a richer search experience. For example, as the user enters each character of their search term, you'd call this API and populate the search box's drop-down list with the suggested query strings.|
|Custom Image Search|[V7](bing-custom-images-api-v7-reference.md)|The Custom Image Search API lets you send a search query to Bing and get back a list of relevant images from the slice of Web that your Custom Search instance defines.|
|Custom Search|[V7](bing-custom-search-api-v7-reference.md)| The Custom Search API lets you send a search query to Bing and get back web pages from the slice of Web that your Custom Search instance defines.|
|Custom Videos Search|[V7](bing-custom-videos-api-v7-reference.md)|The Custom Videos Search API lets you send a search query to Bing and get back a list of relevant videos from the slice of Web that your Custom Search instance defines. |



## See also

Conceptual documentation for Bing Search 

<h3>Search API</h3>
<p><a href="/azure/cognitive-services/bing-news-search/">Bing News Search</a></p>
<p><a href="/azure/cognitive-services/Bing-Video-Search/">Bing Video Search</a></p>
<p><a href="/azure/cognitive-services/bing-web-search/">Bing Web Search</a></p>
<p><a href="/azure/cognitive-services/Bing-Autosuggest">Bing Autosuggest</a></p>
<p><a href="/azure/cognitive-services/bing-custom-search">Bing Custom Search</a></p>
<p><a href="/azure/cognitive-services/bing-entities-search/">Bing Entity Search</a></p>
<p><a href="/azure/cognitive-services/bing-image-search">Bing Image Search</a></p>
<p><a href="/azure/cognitive-services/bing-visual-search">Bing Visual Search</a></p>
<p><a href="/azure/cognitive-services/bing-spell-check/">Bing Spell Check</a></p>

