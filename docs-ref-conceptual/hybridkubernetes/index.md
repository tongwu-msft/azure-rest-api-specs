---
title: Hybrid Kubernetes REST API
description: Operation groups for the Hybrid Kubernetes REST API
author: AkashKeshari
ms.author: akkeshar
ms.date: 07/14/2021
ms.topic: reference
ms.service: azure-arc
ms.subservice: azure-arc-kubernetes
ms.devlang: rest-api
---

# Hybrid Kubernetes REST API reference

Hybrid Kubernetes Service allows you to manage your on-premise kubernetes clusters from azure by onboarding them to Azure Arc. The Hybrid Kubernetes API allows you to create, list, update and delete your Arc enabled kubernetes clusters. 

## REST Operation Groups

The Hybrid Kubernetes REST API provides operations for working with the following resources:

| Operation Group | Description |
| --- | --- |
| [ConnectedCluster](/rest/api/hybridkubernetes/connected-cluster) | Operations to manage Azure Arc enabled kubernetes clusters |
| [Operations](/rest/api/hybridkubernetes/operations) | Lists available operations |