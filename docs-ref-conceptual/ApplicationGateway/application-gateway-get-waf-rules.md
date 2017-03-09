---
title: "Get available rule sets"
ms.custom: ""
ms.date: "2017-03-08"
ms.prod: "azure"
ms.reviewer: ""
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: e519f661-1137-4951-8a41-d3bb03b2bc65
caps.latest.revision: 3
author: "georgewallace"
ms.author: "gwallace"
manager: "timlt"
---
# Get available WAF rule sets

Gets a list of available rule sets for web application firewall

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request
  
|Method|Request URI|
|------------|-----------------|
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGatewayAvailableWafRuleSets?api-version={api-version}`|
  
 Replace {ApplicationGatewayName} with the name of the application gateway to be created.  The application gateway name must be unique within the resource group and be in its own empty virtual network subnet.

## Request Body

None

### Response

```json
{
    "name": "OWASP_3.0",
    "id": "/subscriptions//resourceGroups//providers/Microsoft.Network/applicationGatewayAvailableWafRuleSets/",
    "type": "Microsoft.Network/applicationGatewayAvailableWafRuleSets",
    "properties": {
    "provisioningState": "Succeeded",
    "ruleSetType": "OWASP",
    "ruleSetVersion": "3.0",
    "ruleGroups": [
        {
        "ruleGroupName": "REQUEST-910-IP-REPUTATION",
        "description": "",
        "rules": [
            {
            "ruleId": 910011,
            "description": "Rule 910011"
            },
            {
            "ruleId": 910012,
            "description": "Rule 910012"
            },
            {
            "ruleId": 910000,
            "description": "Request from Known Malicious Client (Based on previous traffic violations)."
            },
            {
            "ruleId": 910100,
            "description": "Client IP is from a HIGH Risk Country Location."
            },
            {
            "ruleId": 910120,
            "description": "Rule 910120"
            },
            {
            "ruleId": 910130,
            "description": "Rule 910130"
            },
            {
            "ruleId": 910150,
            "description": "HTTP Blacklist match for search engine IP"
            },
            {
            "ruleId": 910160,
            "description": "HTTP Blacklist match for spammer IP"
            },
            {
            "ruleId": 910170,
            "description": "HTTP Blacklist match for suspicious IP"
            },
            {
            "ruleId": 910180,
            "description": "HTTP Blacklist match for harvester IP"
            },
            {
            "ruleId": 910013,
            "description": "Rule 910013"
            },
            {
            "ruleId": 910014,
            "description": "Rule 910014"
            },
            {
            "ruleId": 910015,
            "description": "Rule 910015"
            },
            {
            "ruleId": 910016,
            "description": "Rule 910016"
            },
            {
            "ruleId": 910017,
            "description": "Rule 910017"
            },
            {
            "ruleId": 910018,
            "description": "Rule 910018"
            }
        ]
        },
        {
        "ruleGroupName": "REQUEST-911-METHOD-ENFORCEMENT",
        "description": "",
        "rules": [
            {
            "ruleId": 911011,
            "description": "Rule 911011"
            },
            {
            "ruleId": 911012,
            "description": "Rule 911012"
            },
            {
            "ruleId": 911100,
            "description": "Method is not allowed by policy"
            },
            {
            "ruleId": 911013,
            "description": "Rule 911013"
            },
            {
            "ruleId": 911014,
            "description": "Rule 911014"
            },
            {
            "ruleId": 911015,
            "description": "Rule 911015"
            },
            {
            "ruleId": 911016,
            "description": "Rule 911016"
            },
            {
            "ruleId": 911017,
            "description": "Rule 911017"
            },
            {
            "ruleId": 911018,
            "description": "Rule 911018"
            }
        ]
        },
        {
        "ruleGroupName": "REQUEST-912-DOS-PROTECTION",
        "description": "",
        "rules": [
            {
            "ruleId": 912100,
            "description": "Rule 912100"
            },
            {
            "ruleId": 912012,
            "description": "Rule 912012"
            },
            {
            "ruleId": 912120,
            "description": "Denial of Service (DoS) attack identified from %{tx.real_ip} (%{tx.dos_block_counter} hits since last alert)"
            },
            {
            "ruleId": 912130,
            "description": "Rule 912130"
            },
            {
            "ruleId": 912140,
            "description": "Rule 912140"
            },
            {
            "ruleId": 912150,
            "description": "Rule 912150"
            },
            {
            "ruleId": 912160,
            "description": "Rule 912160"
            },
            {
            "ruleId": 912170,
            "description": "Potential Denial of Service (DoS) Attack from %{tx.real_ip} - # of Request Bursts: %{ip.dos_burst_counter}"
            },
            {
            "ruleId": 912013,
            "description": "Rule 912013"
            },
            {
            "ruleId": 912014,
            "description": "Rule 912014"
            },
            {
            "ruleId": 912019,
            "description": "Rule 912019"
            },
            {
            "ruleId": 912171,
            "description": "Potential Denial of Service (DoS) Attack from %{tx.real_ip} - # of Request Bursts: %{ip.dos_burst_counter}"
            },
            {
            "ruleId": 912015,
            "description": "Rule 912015"
            },
            {
            "ruleId": 912016,
            "description": "Rule 912016"
            },
            {
            "ruleId": 912017,
            "description": "Rule 912017"
            },
            {
            "ruleId": 912018,
            "description": "Rule 912018"
            }
        ]
        },
        {
        "ruleGroupName": "REQUEST-913-SCANNER-DETECTION",
        "description": "",
        "rules": [
            {
            "ruleId": 913011,
            "description": "Rule 913011"
            },
            {
            "ruleId": 913012,
            "description": "Rule 913012"
            },
            {
            "ruleId": 913100,
            "description": "Found User-Agent associated with security scanner"
            },
            {
            "ruleId": 913110,
            "description": "Found request header associated with security scanner"
            },
            {
            "ruleId": 913120,
            "description": "Found request filename/argument associated with security scanner"
            },
            {
            "ruleId": 913013,
            "description": "Rule 913013"
            },
            {
            "ruleId": 913014,
            "description": "Rule 913014"
            },
            {
            "ruleId": 913101,
            "description": "Found User-Agent associated with scripting/generic HTTP client"
            },
            {
            "ruleId": 913102,
            "description": "Found User-Agent associated with web crawler/bot"
            },
            {
            "ruleId": 913015,
            "description": "Rule 913015"
            },
            {
            "ruleId": 913016,
            "description": "Rule 913016"
            },
            {
            "ruleId": 913017,
            "description": "Rule 913017"
            },
            {
            "ruleId": 913018,
            "description": "Rule 913018"
            }
        ]
        },
        {
        "ruleGroupName": "REQUEST-920-PROTOCOL-ENFORCEMENT",
        "description": "",
        "rules": [
            {
            "ruleId": 920011,
            "description": "Rule 920011"
            },
            {
            "ruleId": 920012,
            "description": "Rule 920012"
            },
            {
            "ruleId": 920100,
            "description": "Invalid HTTP Request Line"
            },
            {
            "ruleId": 920130,
            "description": "Failed to parse request body."
            },
            {
            "ruleId": 920140,
            "description": "Multipart request body failed strict validation:     PE %{REQBODY_PROCESSOR_ERROR},     BQ %{MULTIPART_BOUNDARY_QUOTED},     BW %{MULTIPART_BOUNDARY_WHITESPACE},     DB %{MULTIPART_DATA_BEFORE},     DA %{MULTIPART_DATA_AFTER},     HF %{MULTIPART_HEADER_FOLDING},     LF %{MULTIPART_LF_LINE},     SM %{MULTIPART_SEMICOLON_MISSING},     IQ %{MULTIPART_INVALID_QUOTING},     IH %{MULTIPART_INVALID_HEADER_FOLDING},     FLE %{MULTIPART_FILE_LIMIT_EXCEEDED}"
            },
            {
            "ruleId": 920160,
            "description": "Content-Length HTTP header is not numeric."
            },
            {
            "ruleId": 920170,
            "description": "GET or HEAD Request with Body Content."
            },
            {
            "ruleId": 920180,
            "description": "POST request missing Content-Length Header."
            },
            {
            "ruleId": 920190,
            "description": "Range: Invalid Last Byte Value."
            },
            {
            "ruleId": 920210,
            "description": "Multiple/Conflicting Connection Header Data Found."
            },
            {
            "ruleId": 920220,
            "description": "URL Encoding Abuse Attack Attempt"
            },
            {
            "ruleId": 920240,
            "description": "URL Encoding Abuse Attack Attempt"
            },
            {
            "ruleId": 920250,
            "description": "UTF8 Encoding Abuse Attack Attempt"
            },
            {
            "ruleId": 920260,
            "description": "Unicode Full/Half Width Abuse Attack Attempt"
            },
            {
            "ruleId": 920270,
            "description": "Invalid character in request (null character)"
            },
            {
            "ruleId": 920280,
            "description": "Request Missing a Host Header"
            },
            {
            "ruleId": 920290,
            "description": "Empty Host Header"
            },
            {
            "ruleId": 920310,
            "description": "Request Has an Empty Accept Header"
            },
            {
            "ruleId": 920311,
            "description": "Request Has an Empty Accept Header"
            },
            {
            "ruleId": 920330,
            "description": "Empty User Agent Header"
            },
            {
            "ruleId": 920340,
            "description": "Request Containing Content, but Missing Content-Type header"
            },
            {
            "ruleId": 920350,
            "description": "Host header is a numeric IP address"
            },
            {
            "ruleId": 920380,
            "description": "Too many arguments in request"
            },
            {
            "ruleId": 920360,
            "description": "Argument name too long"
            },
            {
            "ruleId": 920370,
            "description": "Argument value too long"
            },
            {
            "ruleId": 920390,
            "description": "Total arguments size exceeded"
            },
            {
            "ruleId": 920400,
            "description": "Uploaded file size too large"
            },
            {
            "ruleId": 920410,
            "description": "Total uploaded files size too large"
            },
            {
            "ruleId": 920420,
            "description": "Request content type is not allowed by policy"
            },
            {
            "ruleId": 920430,
            "description": "HTTP protocol version is not allowed by policy"
            },
            {
            "ruleId": 920440,
            "description": "URL file extension is restricted by policy"
            },
            {
            "ruleId": 920450,
            "description": "HTTP header is restricted by policy (%{MATCHED_VAR})"
            },
            {
            "ruleId": 920013,
            "description": "Rule 920013"
            },
            {
            "ruleId": 920014,
            "description": "Rule 920014"
            },
            {
            "ruleId": 920200,
            "description": "Range: Too many fields (6 or more)"
            },
            {
            "ruleId": 920201,
            "description": "Range: Too many fields for pdf request (35 or more)"
            },
            {
            "ruleId": 920230,
            "description": "Multiple URL Encoding Detected"
            },
            {
            "ruleId": 920300,
            "description": "Request Missing an Accept Header"
            },
            {
            "ruleId": 920271,
            "description": "Invalid character in request (non printable characters)"
            },
            {
            "ruleId": 920320,
            "description": "Missing User Agent Header"
            },
            {
            "ruleId": 920015,
            "description": "Rule 920015"
            },
            {
            "ruleId": 920016,
            "description": "Rule 920016"
            },
            {
            "ruleId": 920272,
            "description": "Invalid character in request (outside of printable chars below ascii 127)"
            },
            {
            "ruleId": 920017,
            "description": "Rule 920017"
            },
            {
            "ruleId": 920018,
            "description": "Rule 920018"
            },
            {
            "ruleId": 920202,
            "description": "Range: Too many fields for pdf request (6 or more)"
            },
            {
            "ruleId": 920273,
            "description": "Invalid character in request (outside of very strict set)"
            },
            {
            "ruleId": 920274,
            "description": "Invalid character in request headers (outside of very strict set)"
            },
            {
            "ruleId": 920460,
            "description": "Rule 920460"
            }
        ]
        },
        {
        "ruleGroupName": "REQUEST-921-PROTOCOL-ATTACK",
        "description": "",
        "rules": [
            {
            "ruleId": 921011,
            "description": "Rule 921011"
            },
            {
            "ruleId": 921012,
            "description": "Rule 921012"
            },
            {
            "ruleId": 921100,
            "description": "HTTP Request Smuggling Attack."
            },
            {
            "ruleId": 921110,
            "description": "HTTP Request Smuggling Attack"
            },
            {
            "ruleId": 921120,
            "description": "HTTP Response Splitting Attack"
            },
            {
            "ruleId": 921130,
            "description": "HTTP Response Splitting Attack"
            },
            {
            "ruleId": 921140,
            "description": "HTTP Header Injection Attack via headers"
            },
            {
            "ruleId": 921150,
            "description": "HTTP Header Injection Attack via payload (CR/LF detected)"
            },
            {
            "ruleId": 921160,
            "description": "HTTP Header Injection Attack via payload (CR/LF and header-name detected)"
            },
            {
            "ruleId": 921013,
            "description": "Rule 921013"
            },
            {
            "ruleId": 921014,
            "description": "Rule 921014"
            },
            {
            "ruleId": 921151,
            "description": "HTTP Header Injection Attack via payload (CR/LF detected)"
            },
            {
            "ruleId": 921015,
            "description": "Rule 921015"
            },
            {
            "ruleId": 921016,
            "description": "Rule 921016"
            },
            {
            "ruleId": 921170,
            "description": "Rule 921170"
            },
            {
            "ruleId": 921180,
            "description": "HTTP Parameter Pollution (%{TX.1})"
            },
            {
            "ruleId": 921017,
            "description": "Rule 921017"
            },
            {
            "ruleId": 921018,
            "description": "Rule 921018"
            }
        ]
        },
        {
        "ruleGroupName": "REQUEST-930-APPLICATION-ATTACK-LFI",
        "description": "",
        "rules": [
            {
            "ruleId": 930011,
            "description": "Rule 930011"
            },
            {
            "ruleId": 930012,
            "description": "Rule 930012"
            },
            {
            "ruleId": 930100,
            "description": "Path Traversal Attack (/../)"
            },
            {
            "ruleId": 930110,
            "description": "Path Traversal Attack (/../)"
            },
            {
            "ruleId": 930120,
            "description": "OS File Access Attempt"
            },
            {
            "ruleId": 930130,
            "description": "Restricted File Access Attempt"
            },
            {
            "ruleId": 930013,
            "description": "Rule 930013"
            },
            {
            "ruleId": 930014,
            "description": "Rule 930014"
            },
            {
            "ruleId": 930015,
            "description": "Rule 930015"
            },
            {
            "ruleId": 930016,
            "description": "Rule 930016"
            },
            {
            "ruleId": 930017,
            "description": "Rule 930017"
            },
            {
            "ruleId": 930018,
            "description": "Rule 930018"
            }
        ]
        },
        {
        "ruleGroupName": "REQUEST-931-APPLICATION-ATTACK-RFI",
        "description": "",
        "rules": [
            {
            "ruleId": 931011,
            "description": "Rule 931011"
            },
            {
            "ruleId": 931012,
            "description": "Rule 931012"
            },
            {
            "ruleId": 931100,
            "description": "Possible Remote File Inclusion (RFI) Attack: URL Parameter using IP Address"
            },
            {
            "ruleId": 931110,
            "description": "Possible Remote File Inclusion (RFI) Attack: Common RFI Vulnerable Parameter Name used w/URL Payload"
            },
            {
            "ruleId": 931120,
            "description": "Possible Remote File Inclusion (RFI) Attack: URL Payload Used w/Trailing Question Mark Character (?)"
            },
            {
            "ruleId": 931013,
            "description": "Rule 931013"
            },
            {
            "ruleId": 931014,
            "description": "Rule 931014"
            },
            {
            "ruleId": 931130,
            "description": "Possible Remote File Inclusion (RFI) Attack: Off-Domain Reference/Link"
            },
            {
            "ruleId": 931015,
            "description": "Rule 931015"
            },
            {
            "ruleId": 931016,
            "description": "Rule 931016"
            },
            {
            "ruleId": 931017,
            "description": "Rule 931017"
            },
            {
            "ruleId": 931018,
            "description": "Rule 931018"
            }
        ]
        },
        {
        "ruleGroupName": "REQUEST-932-APPLICATION-ATTACK-RCE",
        "description": "",
        "rules": [
            {
            "ruleId": 932011,
            "description": "Rule 932011"
            },
            {
            "ruleId": 932012,
            "description": "Rule 932012"
            },
            {
            "ruleId": 932120,
            "description": "Remote Command Execution: Windows PowerShell Command Found"
            },
            {
            "ruleId": 932130,
            "description": "Remote Command Execution: Unix Shell Expression Found"
            },
            {
            "ruleId": 932140,
            "description": "Remote Command Execution: Windows FOR/IF Command Found"
            },
            {
            "ruleId": 932160,
            "description": "Remote Command Execution: Unix Shell Code Found"
            },
            {
            "ruleId": 932170,
            "description": "Remote Command Execution: Shellshock (CVE-2014-6271)"
            },
            {
            "ruleId": 932171,
            "description": "Remote Command Execution: Shellshock (CVE-2014-6271)"
            },
            {
            "ruleId": 932013,
            "description": "Rule 932013"
            },
            {
            "ruleId": 932014,
            "description": "Rule 932014"
            },
            {
            "ruleId": 932015,
            "description": "Rule 932015"
            },
            {
            "ruleId": 932016,
            "description": "Rule 932016"
            },
            {
            "ruleId": 932017,
            "description": "Rule 932017"
            },
            {
            "ruleId": 932018,
            "description": "Rule 932018"
            }
        ]
        },
        {
        "ruleGroupName": "REQUEST-933-APPLICATION-ATTACK-PHP",
        "description": "",
        "rules": [
            {
            "ruleId": 933011,
            "description": "Rule 933011"
            },
            {
            "ruleId": 933012,
            "description": "Rule 933012"
            },
            {
            "ruleId": 933100,
            "description": "PHP Injection Attack: Opening/Closing Tag Found"
            },
            {
            "ruleId": 933110,
            "description": "PHP Injection Attack: PHP Script File Upload Found"
            },
            {
            "ruleId": 933120,
            "description": "PHP Injection Attack: Configuration Directive Found"
            },
            {
            "ruleId": 933130,
            "description": "PHP Injection Attack: Variables Found"
            },
            {
            "ruleId": 933150,
            "description": "PHP Injection Attack: High-Risk PHP Function Name Found"
            },
            {
            "ruleId": 933160,
            "description": "PHP Injection Attack: High-Risk PHP Function Call Found"
            },
            {
            "ruleId": 933180,
            "description": "PHP Injection Attack: Variable Function Call Found"
            },
            {
            "ruleId": 933013,
            "description": "Rule 933013"
            },
            {
            "ruleId": 933014,
            "description": "Rule 933014"
            },
            {
            "ruleId": 933151,
            "description": "PHP Injection Attack: Medium-Risk PHP Function Name Found"
            },
            {
            "ruleId": 933015,
            "description": "Rule 933015"
            },
            {
            "ruleId": 933016,
            "description": "Rule 933016"
            },
            {
            "ruleId": 933131,
            "description": "PHP Injection Attack: Variables Found"
            },
            {
            "ruleId": 933161,
            "description": "PHP Injection Attack: Low-Value PHP Function Call Found"
            },
            {
            "ruleId": 933111,
            "description": "PHP Injection Attack: PHP Script File Upload Found"
            },
            {
            "ruleId": 933017,
            "description": "Rule 933017"
            },
            {
            "ruleId": 933018,
            "description": "Rule 933018"
            }
        ]
        },
        {
        "ruleGroupName": "REQUEST-941-APPLICATION-ATTACK-XSS",
        "description": "",
        "rules": [
            {
            "ruleId": 941011,
            "description": "Rule 941011"
            },
            {
            "ruleId": 941012,
            "description": "Rule 941012"
            },
            {
            "ruleId": 941100,
            "description": "XSS Attack Detected via libinjection"
            },
            {
            "ruleId": 941110,
            "description": "XSS Filter - Category 1: Script Tag Vector"
            },
            {
            "ruleId": 941130,
            "description": "XSS Filter - Category 3: Attribute Vector"
            },
            {
            "ruleId": 941140,
            "description": "XSS Filter - Category 4: Javascript URI Vector"
            },
            {
            "ruleId": 941150,
            "description": "XSS Filter - Category 5: Disallowed HTML Attributes"
            },
            {
            "ruleId": 941180,
            "description": "Node-Validator Blacklist Keywords"
            },
            {
            "ruleId": 941190,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 941200,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 941210,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 941220,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 941230,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 941240,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 941260,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 941270,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 941280,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 941290,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 941300,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 941310,
            "description": "US-ASCII Malformed Encoding XSS Filter - Attack Detected."
            },
            {
            "ruleId": 941350,
            "description": "UTF-7 Encoding IE XSS - Attack Detected."
            },
            {
            "ruleId": 941013,
            "description": "Rule 941013"
            },
            {
            "ruleId": 941014,
            "description": "Rule 941014"
            },
            {
            "ruleId": 941320,
            "description": "Possible XSS Attack Detected - HTML Tag Handler"
            },
            {
            "ruleId": 941015,
            "description": "Rule 941015"
            },
            {
            "ruleId": 941016,
            "description": "Rule 941016"
            },
            {
            "ruleId": 941017,
            "description": "Rule 941017"
            },
            {
            "ruleId": 941018,
            "description": "Rule 941018"
            }
        ]
        },
        {
        "ruleGroupName": "REQUEST-942-APPLICATION-ATTACK-SQLI",
        "description": "",
        "rules": [
            {
            "ruleId": 942011,
            "description": "Rule 942011"
            },
            {
            "ruleId": 942012,
            "description": "Rule 942012"
            },
            {
            "ruleId": 942100,
            "description": "SQL Injection Attack Detected via libinjection"
            },
            {
            "ruleId": 942140,
            "description": "SQL Injection Attack: Common DB Names Detected"
            },
            {
            "ruleId": 942160,
            "description": "Detects blind sqli tests using sleep() or benchmark()."
            },
            {
            "ruleId": 942170,
            "description": "Detects SQL benchmark and sleep injection attempts including conditional queries"
            },
            {
            "ruleId": 942230,
            "description": "Detects conditional SQL injection attempts"
            },
            {
            "ruleId": 942270,
            "description": "Looking for basic sql injection. Common attack string for mysql, oracle and others."
            },
            {
            "ruleId": 942290,
            "description": "Finds basic MongoDB SQL injection attempts"
            },
            {
            "ruleId": 942320,
            "description": "Detects MySQL and PostgreSQL stored procedure/function injections"
            },
            {
            "ruleId": 942350,
            "description": "Detects MySQL UDF injection and other data/structure manipulation attempts"
            },
            {
            "ruleId": 942013,
            "description": "Rule 942013"
            },
            {
            "ruleId": 942014,
            "description": "Rule 942014"
            },
            {
            "ruleId": 942150,
            "description": "SQL Injection Attack"
            },
            {
            "ruleId": 942410,
            "description": "SQL Injection Attack"
            },
            {
            "ruleId": 942440,
            "description": "SQL Comment Sequence Detected."
            },
            {
            "ruleId": 942450,
            "description": "SQL Hex Encoding Identified"
            },
            {
            "ruleId": 942015,
            "description": "Rule 942015"
            },
            {
            "ruleId": 942016,
            "description": "Rule 942016"
            },
            {
            "ruleId": 942251,
            "description": "Detects HAVING injections"
            },
            {
            "ruleId": 942460,
            "description": "Meta-Character Anomaly Detection Alert - Repetitive Non-Word Characters"
            },
            {
            "ruleId": 942017,
            "description": "Rule 942017"
            },
            {
            "ruleId": 942018,
            "description": "Rule 942018"
            }
        ]
        },
        {
        "ruleGroupName": "REQUEST-943-APPLICATION-ATTACK-SESSION-FIXATION",
        "description": "",
        "rules": [
            {
            "ruleId": 943011,
            "description": "Rule 943011"
            },
            {
            "ruleId": 943012,
            "description": "Rule 943012"
            },
            {
            "ruleId": 943100,
            "description": "Possible Session Fixation Attack: Setting Cookie Values in HTML"
            },
            {
            "ruleId": 943110,
            "description": "Possible Session Fixation Attack: SessionID Parameter Name with Off-Domain Referer"
            },
            {
            "ruleId": 943120,
            "description": "Possible Session Fixation Attack: SessionID Parameter Name with No Referer"
            },
            {
            "ruleId": 943013,
            "description": "Rule 943013"
            },
            {
            "ruleId": 943014,
            "description": "Rule 943014"
            },
            {
            "ruleId": 943015,
            "description": "Rule 943015"
            },
            {
            "ruleId": 943016,
            "description": "Rule 943016"
            },
            {
            "ruleId": 943017,
            "description": "Rule 943017"
            },
            {
            "ruleId": 943018,
            "description": "Rule 943018"
            }
        ]
        }
    ]
    }
},
{
    "name": "OWASP_2.2.9",
    "id": "/subscriptions//resourceGroups//providers/Microsoft.Network/applicationGatewayAvailableWafRuleSets/",
    "type": "Microsoft.Network/applicationGatewayAvailableWafRuleSets",
    "properties": {
    "provisioningState": "Succeeded",
    "ruleSetType": "OWASP",
    "ruleSetVersion": "2.2.9",
    "ruleGroups": [
        {
        "ruleGroupName": "crs_20_protocol_violations",
        "description": "",
        "rules": [
            {
            "ruleId": 960911,
            "description": "Invalid HTTP Request Line"
            },
            {
            "ruleId": 981227,
            "description": "Apache Error: Invalid URI in Request."
            },
            {
            "ruleId": 960912,
            "description": "Failed to parse request body."
            },
            {
            "ruleId": 960914,
            "description": "Multipart request body failed strict validation:     PE %{REQBODY_PROCESSOR_ERROR},     BQ %{MULTIPART_BOUNDARY_QUOTED},     BW %{MULTIPART_BOUNDARY_WHITESPACE},     DB %{MULTIPART_DATA_BEFORE},     DA %{MULTIPART_DATA_AFTER},     HF %{MULTIPART_HEADER_FOLDING},     LF %{MULTIPART_LF_LINE},     SM %{MULTIPART_SEMICOLON_MISSING},     IQ %{MULTIPART_INVALID_QUOTING},     IH %{MULTIPART_INVALID_HEADER_FOLDING},     FLE %{MULTIPART_FILE_LIMIT_EXCEEDED}"
            },
            {
            "ruleId": 960915,
            "description": "Multipart parser detected a possible unmatched boundary."
            },
            {
            "ruleId": 960016,
            "description": "Content-Length HTTP header is not numeric."
            },
            {
            "ruleId": 960011,
            "description": "GET or HEAD Request with Body Content."
            },
            {
            "ruleId": 960012,
            "description": "POST request missing Content-Length Header."
            },
            {
            "ruleId": 960902,
            "description": "Invalid Use of Identity Encoding."
            },
            {
            "ruleId": 960022,
            "description": "Expect Header Not Allowed for HTTP 1.0."
            },
            {
            "ruleId": 960020,
            "description": "Pragma Header requires Cache-Control Header for HTTP/1.1 requests."
            },
            {
            "ruleId": 958291,
            "description": "Range: field exists and begins with 0."
            },
            {
            "ruleId": 958230,
            "description": "Range: Invalid Last Byte Value."
            },
            {
            "ruleId": 958295,
            "description": "Multiple/Conflicting Connection Header Data Found."
            },
            {
            "ruleId": 950107,
            "description": "URL Encoding Abuse Attack Attempt"
            },
            {
            "ruleId": 950109,
            "description": "Multiple URL Encoding Detected"
            },
            {
            "ruleId": 950108,
            "description": "URL Encoding Abuse Attack Attempt"
            },
            {
            "ruleId": 950801,
            "description": "UTF8 Encoding Abuse Attack Attempt"
            },
            {
            "ruleId": 950116,
            "description": "Unicode Full/Half Width Abuse Attack Attempt"
            },
            {
            "ruleId": 960901,
            "description": "Invalid character in request"
            },
            {
            "ruleId": 960018,
            "description": "Invalid character in request"
            }
        ]
        },
        {
        "ruleGroupName": "crs_21_protocol_anomalies",
        "description": "",
        "rules": [
            {
            "ruleId": 960008,
            "description": "Request Missing a Host Header"
            },
            {
            "ruleId": 960007,
            "description": "Empty Host Header"
            },
            {
            "ruleId": 960015,
            "description": "Request Missing an Accept Header"
            },
            {
            "ruleId": 960021,
            "description": "Request Has an Empty Accept Header"
            },
            {
            "ruleId": 960009,
            "description": "Request Missing a User Agent Header"
            },
            {
            "ruleId": 960006,
            "description": "Empty User Agent Header"
            },
            {
            "ruleId": 960904,
            "description": "Request Containing Content, but Missing Content-Type header"
            },
            {
            "ruleId": 960017,
            "description": "Host header is a numeric IP address"
            }
        ]
        },
        {
        "ruleGroupName": "crs_23_request_limits",
        "description": "",
        "rules": [
            {
            "ruleId": 960209,
            "description": "Argument name too long"
            },
            {
            "ruleId": 960208,
            "description": "Argument value too long"
            },
            {
            "ruleId": 960335,
            "description": "Too many arguments in request"
            },
            {
            "ruleId": 960341,
            "description": "Total arguments size exceeded"
            },
            {
            "ruleId": 960342,
            "description": "Uploaded file size too large"
            },
            {
            "ruleId": 960343,
            "description": "Total uploaded files size too large"
            }
        ]
        },
        {
        "ruleGroupName": "crs_30_http_policy",
        "description": "",
        "rules": [
            {
            "ruleId": 960032,
            "description": "Method is not allowed by policy"
            },
            {
            "ruleId": 960010,
            "description": "Request content type is not allowed by policy"
            },
            {
            "ruleId": 960034,
            "description": "HTTP protocol version is not allowed by policy"
            },
            {
            "ruleId": 960035,
            "description": "URL file extension is restricted by policy"
            },
            {
            "ruleId": 960038,
            "description": "HTTP header is restricted by policy"
            }
        ]
        },
        {
        "ruleGroupName": "crs_35_bad_robots",
        "description": "",
        "rules": [
            {
            "ruleId": 990002,
            "description": "Request Indicates a Security Scanner Scanned the Site"
            },
            {
            "ruleId": 990901,
            "description": "Request Indicates a Security Scanner Scanned the Site"
            },
            {
            "ruleId": 990902,
            "description": "Request Indicates a Security Scanner Scanned the Site"
            },
            {
            "ruleId": 990012,
            "description": "Rogue web site crawler"
            }
        ]
        },
        {
        "ruleGroupName": "crs_40_generic_attacks",
        "description": "",
        "rules": [
            {
            "ruleId": 960024,
            "description": "Meta-Character Anomaly Detection Alert - Repetative Non-Word Characters"
            },
            {
            "ruleId": 950008,
            "description": "Injection of Undocumented ColdFusion Tags"
            },
            {
            "ruleId": 950010,
            "description": "LDAP Injection Attack"
            },
            {
            "ruleId": 950011,
            "description": "SSI injection Attack"
            },
            {
            "ruleId": 950018,
            "description": "Universal PDF XSS URL Detected."
            },
            {
            "ruleId": 950019,
            "description": "Email Injection Attack"
            },
            {
            "ruleId": 950012,
            "description": "HTTP Request Smuggling Attack."
            },
            {
            "ruleId": 950910,
            "description": "HTTP Response Splitting Attack"
            },
            {
            "ruleId": 950911,
            "description": "HTTP Response Splitting Attack"
            },
            {
            "ruleId": 950117,
            "description": "Remote File Inclusion Attack"
            },
            {
            "ruleId": 950118,
            "description": "Remote File Inclusion Attack"
            },
            {
            "ruleId": 950119,
            "description": "Remote File Inclusion Attack"
            },
            {
            "ruleId": 950120,
            "description": "Possible Remote File Inclusion (RFI) Attack: Off-Domain Reference/Link"
            },
            {
            "ruleId": 981133,
            "description": "Rule 981133"
            },
            {
            "ruleId": 981134,
            "description": "Rule 981134"
            },
            {
            "ruleId": 950009,
            "description": "Session Fixation Attack"
            },
            {
            "ruleId": 950003,
            "description": "Session Fixation"
            },
            {
            "ruleId": 950000,
            "description": "Session Fixation"
            },
            {
            "ruleId": 950005,
            "description": "Remote File Access Attempt"
            },
            {
            "ruleId": 950002,
            "description": "System Command Access"
            },
            {
            "ruleId": 950006,
            "description": "System Command Injection"
            },
            {
            "ruleId": 959151,
            "description": "PHP Injection Attack"
            },
            {
            "ruleId": 958976,
            "description": "PHP Injection Attack"
            },
            {
            "ruleId": 958977,
            "description": "PHP Injection Attack"
            }
        ]
        },
        {
        "ruleGroupName": "crs_41_sql_injection_attacks",
        "description": "",
        "rules": [
            {
            "ruleId": 981231,
            "description": "SQL Comment Sequence Detected."
            },
            {
            "ruleId": 981260,
            "description": "SQL Hex Encoding Identified"
            },
            {
            "ruleId": 981320,
            "description": "SQL Injection Attack: Common DB Names Detected"
            },
            {
            "ruleId": 981300,
            "description": "Rule 981300"
            },
            {
            "ruleId": 981301,
            "description": "Rule 981301"
            },
            {
            "ruleId": 981302,
            "description": "Rule 981302"
            },
            {
            "ruleId": 981303,
            "description": "Rule 981303"
            },
            {
            "ruleId": 981304,
            "description": "Rule 981304"
            },
            {
            "ruleId": 981305,
            "description": "Rule 981305"
            },
            {
            "ruleId": 981306,
            "description": "Rule 981306"
            },
            {
            "ruleId": 981307,
            "description": "Rule 981307"
            },
            {
            "ruleId": 981308,
            "description": "Rule 981308"
            },
            {
            "ruleId": 981309,
            "description": "Rule 981309"
            },
            {
            "ruleId": 981310,
            "description": "Rule 981310"
            },
            {
            "ruleId": 981311,
            "description": "Rule 981311"
            },
            {
            "ruleId": 981312,
            "description": "Rule 981312"
            },
            {
            "ruleId": 981313,
            "description": "Rule 981313"
            },
            {
            "ruleId": 981314,
            "description": "Rule 981314"
            },
            {
            "ruleId": 981315,
            "description": "Rule 981315"
            },
            {
            "ruleId": 981316,
            "description": "Rule 981316"
            },
            {
            "ruleId": 981317,
            "description": "SQL SELECT Statement Anomaly Detection Alert"
            },
            {
            "ruleId": 950007,
            "description": "Blind SQL Injection Attack"
            },
            {
            "ruleId": 950001,
            "description": "SQL Injection Attack"
            },
            {
            "ruleId": 950908,
            "description": "SQL Injection Attack."
            },
            {
            "ruleId": 959073,
            "description": "SQL Injection Attack"
            },
            {
            "ruleId": 981272,
            "description": "Detects blind sqli tests using sleep() or benchmark()."
            },
            {
            "ruleId": 981250,
            "description": "Detects SQL benchmark and sleep injection attempts including conditional queries"
            },
            {
            "ruleId": 981241,
            "description": "Detects conditional SQL injection attempts"
            },
            {
            "ruleId": 981276,
            "description": "Looking for basic sql injection. Common attack string for mysql, oracle and others."
            },
            {
            "ruleId": 981270,
            "description": "Finds basic MongoDB SQL injection attempts"
            },
            {
            "ruleId": 981253,
            "description": "Detects MySQL and PostgreSQL stored procedure/function injections"
            },
            {
            "ruleId": 981251,
            "description": "Detects MySQL UDF injection and other data/structure manipulation attempts"
            }
        ]
        },
        {
        "ruleGroupName": "crs_41_xss_attacks",
        "description": "",
        "rules": [
            {
            "ruleId": 973336,
            "description": "XSS Filter - Category 1: Script Tag Vector"
            },
            {
            "ruleId": 973338,
            "description": "XSS Filter - Category 3: Javascript URI Vector"
            },
            {
            "ruleId": 981136,
            "description": "Rule 981136"
            },
            {
            "ruleId": 981018,
            "description": "Rule 981018"
            },
            {
            "ruleId": 958016,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958414,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958032,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958026,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958027,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958054,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958418,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958034,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958019,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958013,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958408,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958012,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958423,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958002,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958017,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958007,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958047,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958410,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958415,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958022,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958405,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958419,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958028,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958057,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958031,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958006,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958033,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958038,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958409,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958001,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958005,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958404,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958023,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958010,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958411,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958422,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958036,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958000,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958018,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958406,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958040,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958052,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958037,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958049,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958030,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958041,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958416,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958024,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958059,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958417,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958020,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958045,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958004,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958421,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958009,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958025,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958413,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958051,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958420,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958407,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958056,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958011,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958412,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958008,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958046,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958039,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 958003,
            "description": "Cross-site Scripting (XSS) Attack"
            },
            {
            "ruleId": 973300,
            "description": "Possible XSS Attack Detected - HTML Tag Handler"
            },
            {
            "ruleId": 973301,
            "description": "XSS Attack Detected"
            },
            {
            "ruleId": 973302,
            "description": "XSS Attack Detected"
            },
            {
            "ruleId": 973303,
            "description": "XSS Attack Detected"
            },
            {
            "ruleId": 973304,
            "description": "XSS Attack Detected"
            },
            {
            "ruleId": 973305,
            "description": "XSS Attack Detected"
            },
            {
            "ruleId": 973306,
            "description": "XSS Attack Detected"
            },
            {
            "ruleId": 973307,
            "description": "XSS Attack Detected"
            },
            {
            "ruleId": 973308,
            "description": "XSS Attack Detected"
            },
            {
            "ruleId": 973309,
            "description": "XSS Attack Detected"
            },
            {
            "ruleId": 973311,
            "description": "XSS Attack Detected"
            },
            {
            "ruleId": 973313,
            "description": "XSS Attack Detected"
            },
            {
            "ruleId": 973314,
            "description": "XSS Attack Detected"
            },
            {
            "ruleId": 973331,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 973315,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 973330,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 973327,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 973326,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 973346,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 973345,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 973324,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 973323,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 973348,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 973321,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 973320,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 973318,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 973317,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 973329,
            "description": "IE XSS Filters - Attack Detected."
            },
            {
            "ruleId": 973328,
            "description": "IE XSS Filters - Attack Detected."
            }
        ]
        },
        {
        "ruleGroupName": "crs_42_tight_security",
        "description": "",
        "rules": [
            {
            "ruleId": 950103,
            "description": "Path Traversal Attack"
            }
        ]
        },
        {
        "ruleGroupName": "crs_45_trojans",
        "description": "",
        "rules": [
            {
            "ruleId": 950110,
            "description": "Backdoor access"
            },
            {
            "ruleId": 950921,
            "description": "Backdoor access"
            },
            {
            "ruleId": 950922,
            "description": "Backdoor access"
            }
        ]
        }
    ]
    }
}
```
**Status code:** If successful, if gateway does not exist return HTTP Status code of 201(Created) otherwise HTTP status code of 200(OK).
