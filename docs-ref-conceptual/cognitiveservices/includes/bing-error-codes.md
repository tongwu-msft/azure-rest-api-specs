The following are the possible HTTP status codes that a request may return.  
  
|Status Code|Description|  
|-----------------|-----------------|  
|200|The call succeeded.|  
|400|One of the query parameters is missing or not valid.|  
|401|The subscription key is missing or is not valid.|  
|403|The user is authenticated (for example, used a valid subscription key) but they don’t have permission to the requested resource.<br /><br /> If the caller exceeded their queries per month quota, Bing may also return this status.|  
|410|The request used HTTP instead of the HTTPS protocol. HTTPS is the only supported protocol.|  
|429|The caller exceeded their queries per second quota.|  
  
If the request fails, the body of the response will contain an `ErrorResponse` object. The response object will include an error code and description of the error. If the error is related to a parameter, the `parameter` field will identify the parameter that is the issue. And if the error is related to a parameter value, the `value` field will identify the value that is not valid.


```
{
  "_type": "ErrorResponse", 
  "errors": [
    {
      "code": "RequestParameterMissing", 
      "message": "Required parameter is missing.", 
      "parameter": "q" 
    }
  ]
}


{
  "_type": "ErrorResponse", 
  "errors": [
    {
      "code": "AuthorizationMissing", 
      "message": "Authorization is required.", 
    }
  ]
}
```

The following are the possible error codes.

|Error code|Description
|-|-
|RequestParameterMissing|The request is missing a required parameter. The `parameter` field identifies the missing parameter.
|RequestParameterInvalidValue|The parameter value is not valid. The `parameter` field identifies the parameter that contains the invalid value, and the `value` field contains the value that is not valid.
ResourceAccessDenied|The caller does not have permissions to access the resource. This error can occur if the subscription key has been disabled or has expired.
ExceededVolume|The caller exceeded their queries per month (QPM) quota.
ExceededQpsLimit|The caller exceeded their queries per second (QPS).
Disabled|The caller does not have permissions to access the resource.
UnexpectedError|An unexpected error occurred on the server. Try again later.
DataSourceErrors|There was an error access the resource.
AuthorizationMissing|Bing is unable to authenticate the caller. This error may occur if the `Ocp-Apim-Subscription-Key` header is missing.
HttpNotAllowed|The request used the HTTP protocol instead of the HTTPS protocol; Bing supports only HTTPS.
InvalidAuthorization|Bing is unable to authenticate the caller. This may occur if the subscription key is not valid.
InsufficientScope|The caller does not have permissions to access the resource. This error can occur if the subscription key has expired.

