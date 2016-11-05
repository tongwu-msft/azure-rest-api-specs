---
title: "Get a list of native image store content"
ms.custom: ""
ms.date: "2016-03-30"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-fabric"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows 10"
  - "Windows 8"
  - "Windows 8.1"
  - "Windows Server 2012 R2"
dev_langs: 
  - "CSharp"
ms.assetid: 340d3dbd-7866-4a94-9806-fd3f175ed779
caps.latest.revision: 4
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
---
# Get a list of native image store content
Gets the image store content from the given relative path.  
  
## Request  
 See [Application](../ServiceFabricREST/application2.md) for headers and parameters that are used by all requests related the image store.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|The following URI can be used to get the files and folders below the image store root:<br /><br /> `<URI>/NativeImageStore?api-version={api-version}`|  
|GET|The following URI can be used to get the files and folders below the given image store relative path:<br /><br /> `<URI>/NativeImageStore/{remote-location}?api-version={api-version}`|  
  
## URI Parameters  
  
|URI Parameter|Required|Description|  
|-------------------|--------------|-----------------|  
|api-version|Yes|The API Version, which is "1.0”.|  
|remote-location|Yes|Relative path in the native image store.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](../ServiceFabricREST/status-and-error-codes1.md).  
  
```  
{  
    “StoreFiles”: [],  
    "StoreFolders": []  
}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|StoreFiles|An array of objects representing files below the given remote path.|  
|StoreFolders|An array of objects representing folders below the given remote path.|  
  
```  
{“StoreFiles”: [  
   {  
	“FileSize:897,  
	“FileVersion”:  
	{  
	    “EpochDataLossNumber”: 131032507974234364  
	    “VersionNumber”: 255  
}  
“ModifiedDate”: 131032509095517808  
“StoreRelativePath: Store\CalcServiceApp\ApplicationManifest.1.0.xml  
   }  
]}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|FileSize|The size of file in bytes.|  
|FileVersion|The version of file, which is the specific information for native image store.|  
|ModifiedDate|The date and time when the file was modified.|  
|StoreRelativePath|The relative path from native image store root of the file.|  
|EpochDataLossNumber|The epoch data loss number of the file.|  
|VersionNumber|The native image store version number of the file|  
  
```  
{“StoreFiles”: [  
   {  
	“FileCount” : 31  
	“StoreRelativePath”: Store\CalcServiceApp\CalcService.Code.2.0  
   }  
]}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|FileCount|The number of files in the folder.|  
|StoreRelativePath|The relative path from native image store root of the folder.|  
  
## Examples  
 The following example displays the specified service.  
  
```  
/// <summary>  
/// Get a list of image content.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>The image store relative path.</returns>  
public static bool GetImageStoreContent(Uri clusterUri, string remoteLocation = "")          
{  
   string responseString = string.Empty;  
  
   //Create the request and add URL parameters  
   Uri requestUri;  
  
   //if remote location is empty, list content from the root path.  
   if (string.IsNullOrEmpty(remoteLocation))  
   {  
       requestUri = new Uri(clusterUri, string.Format("/NativeImageStore?api-version={0}", "1.0"));  
   }  
   else  
   {  
      requestUri = new Uri(clusterUri, string.Format("/NativeImageStore/{0}?api-version={1}", remoteLocation, "1.0"));  
   }  
  
   HttpWebRequest request = (HttpWebRequest)WebRequest.Create(requestUri);  
   request.Method = "GET";  
  
   //Execute the request and obtain the response  
   try  
   {  
       using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())  
       {  
           if (response.StatusCode == HttpStatusCode.NoContent)  
           {  
               Console.WriteLine("No content found");  
               return true;  
           }  
  
          using (StreamReader streamReader = new StreamReader(response.GetResponseStream(), true))  
         {   
              responseString = streamReader.ReadToEnd();  
         }  
       }  
   }  
   catch (WebException e)  
   {  
       Console.WriteLine("Error getting the image store content:");  
       Console.WriteLine(e.Message);  
       if (e.InnerException != null)  
       {  
          Console.WriteLine(e.InnerException.Message);  
       }  
  
       return false;  
   }  
   catch (Exception e)  
   {  
       throw (e);  
   }  
  
   JavaScriptSerializer jss = new JavaScriptSerializer();  
   ImageStoreContent content = jss.Deserialize<ImageStoreContent>(responseString);  
  
   if(content.StoreFiles != null && content.StoreFiles.Any())  
   {  
      Console.WriteLine("StoreFiles:");  
      foreach (ImageStoreFileInfo fileInfo in content.StoreFiles)  
      {  
          Console.WriteLine(" File:");  
          Console.WriteLine("   StoreRelativePath: " + fileInfo.StoreRelativePath);  
          Console.WriteLine("   FileVersion:");  
          Console.WriteLine("      EpochDataLossNumber: " + fileInfo.FileVersion.EpochDataLossNumber);  
          Console.WriteLine("      VersionNumber: " + fileInfo.FileVersion.VersionNumber);  
          Console.WriteLine("   ModifiedDate: " + fileInfo.ModifiedDate);  
          Console.WriteLine("   FileSize: " + fileInfo.FileSize);  
        }  
      }  
  
      if (content.StoreFolders != null && content.StoreFolders.Any())  
      {  
          Console.WriteLine("StoreFolders:");  
          foreach (ImageStoreFolderInfo folderInfo in content.StoreFolders)  
          {  
             Console.WriteLine(" Folder:");  
             Console.WriteLine("    StoreRelativePath: " + folderInfo.StoreRelativePath);  
             Console.WriteLine("    FileCount: " + folderInfo.FileCount);   
          }  
       }  
  
       return true;  
    }  
  
    public static bool GetImageStoreContent(string remoteLocation)  
    {  
       return true;  
    }  
 }  
  
  public class ImageStoreFileVersion  
  {  
     public Int64 EpochDataLossNumber;  
     public Int64 VersionNumber;  
  }  
  
  public class ImageStoreFileInfo  
  {  
     public string StoreRelativePath;  
     public ImageStoreFileVersion FileVersion;  
     public string ModifiedDate;  
     public Int64 FileSize;  
  }  
  
  public class ImageStoreFolderInfo  
  {  
     public string StoreRelativePath;  
     public int FileCount;  
  }  
  
  public class ImageStoreContent  
  {  
     public List<ImageStoreFileInfo> StoreFiles;  
     public List<ImageStoreFolderInfo> StoreFolders;  
  }  
  
/* This code produces output similar to the following:  
StoreFiles:  
 File:  
   StoreRelativePath: CalcAppV3\_.dir  
   FileVersion:  
      EpochDataLossNumber: 131074858555075897  
      VersionNumber: 320  
   ModifiedDate: 131074873142835793  
   FileSize: 0  
 File:  
   StoreRelativePath: CalcAppV3\ApplicationManifest.xml  
   FileVersion:  
      EpochDataLossNumber: 131074858555075897  
      VersionNumber: 176  
   ModifiedDate: 131074872567278953  
   FileSize: 1136  
StoreFolders:  
 Folder:  
    StoreRelativePath: CalcAppV3\CalcService  
    FileCount: 143  
*/  
  
```