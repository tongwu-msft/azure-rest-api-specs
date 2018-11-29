---
title: Azure Time Series Insights Update data access landing  | Microsoft Docs
description: This topic describes the Azure Time Series Insights update data access
keywords:
services: time-series-insights
documentationcenter:
author: dpalled
manager: cshankar
editor: 

ms.assetid:
ms.service: time-series-insights
ms.devlang: na
ms.topic: data-acesss-api
ms.tgt_pltfrm: na
ms.workload: big-data
ms.date: 11/13/2017
ms.author: 
---
Azure Time Series Insights Update that is in Public Preview, enables following data access operations in Time Series Insights Update environment:
* View and query events data for an environment. For more information, see [Time Series Query](time-series-insights-reference-update-tsq.md) section.
* Model and query metadata associated with the events in an environment. For more information, see [Time Series Model](time-series-insights-reference-update-tsm.md) section.

Below is the terminology definition that will be helpful, as time series model and time series query introduce many new concepts.

### **Data Model and Terminology**

**Event** is the single timestamp + properties + values on the wire as persisted in TSI.

**Time Series** is an array of rows, where each row has a timestamp and multiple values.

**Time Series Instance** is a group of events that has the same **Time Series ID**. Time Series ID is unique key within event stream and within the model.

**Time Series Instance** has a required **Time Series Type** that is persisted in **Time Series Model (TSM)**.

**Time Series Type** defines variables. Variables are named calculations over values from the events.
Calculations can be aggregations, interpolations and scalar calculations.

In addition to persisting calculations of variables in TSM, **TSQ can be used ad-hoc to perform calculations** and return values without
persisting calculations in the TSM.

**Time Series Expressions (TSX)** is a string based expression language with strong typing. Type specification is required, e.g. `$event.p1.Double`. In JSON, TSX is a string value of `tsx` property.

**Time Series Variable** is a name associated with a value of one of the types. Variable definitions also contain formulas and computation rules.
Variable definitions can be stored in types in TSM, as well as provided ad-hoc (inline variables) on TSQ APIs.

Most APIs operate on and return **Time Series Value (TSV)** data structure:
Time Series Value - rectangular data structure.
Timestamps may not be unique.

```
{
  "timestamps": ["2018-01-01T00:02:03Z", "2018-01-01T00:02:03Z", ..],
  "properties": [
  {
    "name": "Temperature",
    "type": "Double",
    "values": [1.0, 2.0 ...]
  },
  ..
  ]
}

```
