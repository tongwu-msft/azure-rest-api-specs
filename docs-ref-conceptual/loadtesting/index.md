---
title: Azure Load Testing REST API
description: 'Azure Load Testing is a fully managed load-testing service for generating high-scale loads by using existing JMeter scripts to optimize app performance.'
author: ninallam
ms.author: ninallam
ms.date: 04/26/2022
ms.topic: reference
ms.service: load-testing
ms.devlang: rest-api
---

# Azure Load Testing REST API

Azure Load Testing Preview is a fully managed load-testing service that enables you to generate high-scale load. The service simulates traffic for your applications, regardless of where they're hosted. Developers, testers, and quality assurance (QA) engineers can use it to optimize application performance, scalability, or capacity. To learn more about Azure Load testing, see the [Azure Load Testing documentation](/azure/load-testing/overview-what-is-azure-load-testing).

## Rest Operation Groups

Azure Load Testing REST APIs provide operations for working with the following:

| Operation group | Description                                                        |
| --------------- | ------------------------------------------------------------------ |
| [Load Test Resource](/rest/api/loadtesting/resourcemanager(2022-04-15-preview)/load-test-resource) | Provides operations for managing Azure Load testing resources. |
| [App Component](/rest/api/loadtesting/dataplane/app-component) | Provides operations for managing app components.|
| [Server Metrics](/rest/api/loadtesting/dataplane/server-metrics) | Provides operations for server metrics. |
| [Test](/rest/api/loadtesting/dataplane/test) | Provides operations for managing tests. |
| [Test Run](/rest/api/loadtesting/dataplane/test-run) | Provides operations for managing test runs. |
