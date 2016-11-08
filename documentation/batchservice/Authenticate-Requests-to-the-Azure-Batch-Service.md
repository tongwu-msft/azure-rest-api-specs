# Authenticate requests to the Batch service

Every request made against the Batch service must be authenticated.  The Batch service supports the Shared Key authentication scheme to make REST requests.

An authenticated request requires two headers: the *Date* or *ocp-date* header and the *Authorization* header. The following sections describe how to construct these headers.

### Specify the date header
All authenticated requests must include the Coordinated Universal Time (UTC) timestamp for the request. You can specify the timestamp either in the *ocp-date* header, or in the standard HTTP/HTTPS *Date* header. If both headers are specified for the request, the value of *ocp-date* is used as the creation time of the request.

The Batch service must receive a request within 15 minutes of when it is created. By doing this, the service is guarded against security attacks, such as replay attacks. The *ocp-date* header is provided because some HTTP client libraries and proxies automatically set the *Date* header, and do not give you an opportunity to read its value in order to include it in the authenticated request. If you set *ocp-date*, construct the signature with an empty value for the *Date* header.

### Specify the authorization header
An authenticated request must include the *Authorization* header. To authenticate a request, you must sign the request with the key for the account that is making the request and pass that signature as part of the request.

The format for the *Authorization* header is as follows:

```
Authorization="SharedKey <AccountName>:<Signature>"
```

`SharedKey` is the name of the authorization scheme, `AccountName` is the name of the account requesting the resource, and `Signature` is a Hash-based Message Authentication Code (HMAC) constructed from the request, computed by using the SHA256 algorithm, and then encoded by using Base64 encoding.

The following sections describe how to construct the *Authorization* header.

#### Construct the signature string
When you construct the signature string, keep in mind the following:

-   The VERB portion of the string is the HTTP verb, such as GET or POST, and must be uppercase.

-   Each header included in the signature string may appear only once.

-   The values of all standard HTTP headers must be included in the string in the order shown in the signature format, without the header names. These headers may be empty if they are not being specified as part of the request; in that case, only the new line character is required.

-   When the verb is POST, the Content-Type and Content-Length values are required as request headers and as values in the signature string. Content-Type must be set to **application/json;odata\=minimalmetadata**.

-   If the *ocp-date* header is specified, the *Date* header is not required, simply specify an empty line for the *Date* portion of the signature string. In this case, follow the instructions in the [Construct the canonicalized headers string](../Topic/Authenticate%20Requests%20to%20the%20Azure%20Batch%20Service.md#bk_canonicalizedhead) section for adding the *ocp-date* header.

-   All new line characters (\\n) shown are required within the signature string.

-   For detailed information about how to construct the `CanonicalizedHeaders` and `CanonicalizedResource` strings that make up part of the signature string, see the appropriate sections later in this topic.

To encode the signature string for a request against the Batch service, use the following format:

```
StringToSign = VERB + "\n" +
  Content-Encoding + "\n"
  Content-Language + "\n"
  Content-Length + "\n"
  Content-MD5 + "\n"
  Content-Type + "\n" +
  Date + "\n" +
  If-Modified-Since + "\n"
  If-Match + "\n"
  If-None-Match + "\n"
  If-Unmodified-Since + "\n"
  Range + "\n"
  CanonicalizedHeaders +
  CanonicalizedResource;
```

 The following example shows a signature string for a request to [List the jobs in an account](../Topic/List%20the%20jobs%20in%20an%20account.md) with a timeout of 20 seconds. When a header value does not exist, only the new line character is specified.

```
GET\n\n\n\n\n\n\n\n\n\n\n\nocp-date:Tue, 29 Jul 2014 21:49:13 GMT\n /myaccount/jobs\napi-version:2014-01-01.1.0\ntimeout:20
```

 Breaking this down line-by-line shows each portion of the same string:

```
GET\n /*HTTP Verb*/
\n    /*Content-Encoding*/
\n    /*Content-Language*/
\n    /*Content-Length*/
\n    /*Content-MD5*/
\n    /*Content-Type*/
\n    /*Date*/
\n    /*If-Modified-Since */
\n    /*If-Match */
\n    /*If-None-Match */
\n    /*If-Unmodified-Since*/
\n    /* Range */
ocp-date:Tue, 29 Jul 2014 21:49:13 GMT\n    /*CanonicalizedHeaders*/
/myaccount/jobs\napi-version:2014-04-01.1.0\ntimeout:20    /*CanonicalizedResource*/
```

Next, encode this string by using the HMAC-SHA256 algorithm over the UTF-8-encoded signature string, construct the *Authorization* header, and add the header to the request. The following example shows the *Authorization* header for the same operation:

```
Authorization: SharedKey myaccount:ctzMq410TV3wS7upTBcunJTDLEJwMAZuFPfr0mrrA08=
```

####  <a name="bk_canonicalizedhead"></a> Construct the canonicalized headers string
To construct the `CanonicalizedHeaders` portion of the signature string, follow these steps:

1.  Retrieve all headers for the resource that begin with *ocp-*, including the *ocp-date* header.

2.  Convert each HTTP header name to lowercase.

3.  Sort the headers lexicographically by header name, in ascending order. Each header may appear only once in the string.

4.  Replace any breaking white space with a single space.

5.  Trim any white space around the colon in the header.

6.  Append a new line character to each canonicalized header in the resulting list. Construct the `CanonicalizedHeaders` string by concatenating all headers in this list into a single string.

#### Construct the canonicalized resource string
The `CanonicalizedResource` part of the signature string represents the resource of the Batch service that is targeted by the request. Any portion of the `CanonicalizedResource` string that is derived from the URI of the resource should be encoded exactly as it is in the URI.

Keep in mind the following rules for constructing the canonicalized resource string:

-   Avoid using the new line character (\\n) in values for query parameters. If it must be used, ensure that it does not affect the format of the canonicalized resource string.

-   Avoid using commas in query parameter values.

 You can construct the `CanonicalizedResource` string as follows:

1.  Beginning with a slash ("/"), followed by the name of the account that owns the resource being accessed.

2.  Append the resource's encoded URI path, without any query parameters.

3.  Retrieve all query parameters on the resource URI, including the *api-version* parameter.

4.  Convert all parameter names to lowercase.

5.  Sort the query parameters lexicographically by parameter name, in ascending order.

6.  URL-decode each query parameter name and value.

7.  Append each query parameter name and value to the string in the following format, making sure to include the colon (:) between the name and the value:

    ```
    parameter-name:parameter-value
    ```

8.  If a query parameter has more than one value, sort all values lexicographically, then include them in a comma-separated list:

    ```
    parameter-name:parameter-value-1,parameter-value-2,parameter-value-n
    ```

9. Append a new line character (\\n) after each name-value pair.

#### Encode the Signature
To encode the signature, call the HMAC-SHA256 algorithm on the UTF-8-encoded signature string and encode the result as Base64. Use the following format (shown as pseudocode):

```
Signature=Base64(HMAC-SHA256(UTF8(StringToSign)))
```

## See Also
[Azure Batch REST API Reference](../Topic/Azure%20Batch%20REST%20API%20Reference.md)

