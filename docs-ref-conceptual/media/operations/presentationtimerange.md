---
title: "PresentationTimeRange"
ms.custom: ""
ms.date: "03/14/2018"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "media-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
ms.assetid: 2af8f8a0-47dc-420f-9590-21c7b13e17f3
caps.latest.revision: 5
author: "Juliako"
ms.author: "juliako"
manager: "erikre"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# PresentationTimeRange
`PresentationTimeRange` is used by manifest filters ([AssetFilter](../operations/assetfilter.md)s and global [Filter](../operations/filter.md)s). The `PresentationTimeRange` rule group is used for filtering manifest start/end points, presentation window length, and the live start position. Media Services uses intersections of multiple ranges to define the final presentation window.  
  
 For a detailed overview and code samples of dynamically generated manifests, see [Dynamic manifests overview](https://azure.microsoft.com/documentation/articles/media-services-dynamic-manifest-overview/).  
  
 Also, see [Filter](../operations/filter.md) and [AssetFilter](../operations/assetfilter.md).  
  
 This topic describes the `PresentationTimeRange` entity.  
  
> [!IMPORTANT]
> When accessing entities in Media Services, you must set specific header fields and values in your HTTP requests. <br/>For more information, see [Setup for Media Services REST API Development](https://docs.microsoft.com/azure/media-services/media-services-rest-how-to-use) and [Connecting to Media Services with the Media Services REST API](https://docs.microsoft.com/azure/media-services/media-services-use-aad-auth-to-access-ams-api).  

## PresentationTimeRange properties  
  
|Property|Type|Description|  
|--------------|----------|-----------------|  
|`StartTimestamp`<br /><br /> Applies to VoD or Live streams.|Edm.Int64|The value represents an absolute start point of the stream. The value gets rounded to the closest next GOP start.<br /><br /> Use StartTimestamp and EndTimestamp to trim the playlist (manifest).  For example, StartTimestamp=40000000 and EndTimestamp = 100000000 will generate a playlist that contains media between StartTimestamp and EndTimestamp. If a fragment straddles the boundary, the entire fragment will be included in the manifest.|  
|`EndTimestamp`<br /><br /> Applies to VoD. For the Live presentation, it is silently ignored and applied when the presentation ends and the stream becomes VoD.|Edm.Int64|The value represents an absolute end point of the stream. It gets rounded to the closest next GOP start.<br /><br /> Use StartTimestamp and EndTimestamp to trim the playlist (manifest).  For example, StartTimestamp=40000000 and EndTimestamp = 100000000 will generate a playlist that contains media between StartTimestamp and EndTimestamp. If a fragment straddles the boundary, the entire fragment will be included in the manifest.|  
|`PresentationWindowDuration`<br /><br /> Applies to Live and VoD. For VoD, it is used to enable smooth transitions when the Live presentation ends.|Edm.Int64|Use PresentationWindowDuration to apply a sliding window to the playlist.  For example, set PresentationWindowDuration=1200000000 to apply a two minute sliding window.  Media within 2 minutes of the live edge will be included in the playlist.  If a fragment straddles the boundary, the entire fragment will be included in the playlist<br /><br /> The minimum presentation window duration is 120 seconds.|  
|`LiveBackoffDuration`<br /><br /> Applies to Live only. For VoD, it is silently ignored to enable smooth transitions when the presentation ends|Edm.Int64|Used to define live playback position. Using this rule, you can delay live playback position and create a server side buffer for players. LiveBackoffDuration is relative to the live position.<br /><br /> The maximum live backoff duration is 300 seconds.|  
|`Timescale`<br /><br /> Applies to VoD or Live streams.|Edm.Int64|The timescale used by the timestamps and durations specified above.  The default timescale is 10000000. An alternative timescale can be used.<br /><br /> Default is 10000000 HNS (hundred nanosecond).|
