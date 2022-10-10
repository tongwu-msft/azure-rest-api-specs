# Repeatability of Requests

Applies to: ACS Email (Email Send API)

POST APIs are not idempotent by definition. In order to make them behave in an idempotent manner, we support repeatable requests according to the [OASIS Repeatable Requests Version 1.0](https://docs.oasis-open.org/odata/repeatable-requests/v1.0/repeatable-requests-v1.0.html) specification. To support this, customers need to specify two mandatory headers in their POST request:

1. Repeatability-Request-Id
1. Repeatability-First-Sent

## Repeatability-Request-Id header

The value of this header identifies the request uniquely with a GUID.

## Repeatability-First-Sent header

The value of this header represents the time stamp when the original request was first sent. The value should be specified in UTC in [IMF-fixdate format](https://www.rfc-editor.org/rfc/rfc7231.html). We only track requests for a specified duration (for Email Send, the tracked duration is 5 minutes). Any requests with a first-sent value prior to that are considered potentially unsafe to re-execute and will return a 412 (Pre-condition failed) error.

## Repeatability in ACS SDKs
Repeatability headers are automatically generated, added and sent to the API when using any of our ACS SDK libraries.

## Repeatable request error codes
Detailed information about various status codes for repeatable requests are included in the table below.

| Repeatability-Request-ID | Repeatability-First-Sent | Repeatability Result | Response Statuscode |
|--------------------------|--------------------------|--------------------------|--------------------------|
| Valid GUID | Invalid format | Rejected | 400 |
| Invalid format | [Valid Date](https://www.rfc-editor.org/rfc/rfc7231.html) | Rejected | 400 |
| Invalid format | Invalid format | Rejected | 400 |
| Valid | Outside TrackedTimeWindow | Rejected | 412 (Precondition failed) |
| Valid new/unrepeated request | Within TrackedTimeWindow | Accepted | Status code from normal execution |
| Valid repeated request | Within TrackedTimeWindow, but doesn't match previous request | Rejected | 400 |
| Valid repeated request | Within TrackedTimeWindow, matches previous request | Accepted | These are specific to Email Send API: <ul><li>If original request is still in progress: 409</li> <li>If original request's status code was 2xx or 4xx, return that status code.</li> <li>If original request's status code was 5xx, return status code from re-execution of the request.</li></ul> |

## Troubleshooting

1. If you have sent a request with a first sent timestamp that is within the last 5 minutes, but still receive a 412 (Precondition failed) error with message "Repeatability first sent header was not in 5 minutes window.", then make sure to check that your client computer's clock is synced to the time server.
