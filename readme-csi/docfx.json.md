# How to configure docfx.json

## Turning off the `Try It` feature

Turn off the `Try It` feature by adding the reference doc to the `enable_rest_try_it` section with the value of **false**.

```json
    "fileMetadata": {
      "enable_rest_try_it": 
      {
        "docs-ref-autogen/iothub/**.yml": false,
        "docs-ref-autogen/cognitiveservices/bingvisualsearch/**.yml":false,
        "docs-ref-autogen/cognitiveservices/computervision/**.yml":false,
        "docs-ref-autogen/cognitiveservices/contentmoderator/**.yml":false,
        "docs-ref-autogen/cognitiveservices/customvisionprediction/**.yml":false,
        "docs-ref-autogen/cognitiveservices/customvisiontraining/**.yml":false,
        "docs-ref-autogen/cognitiveservices/face/**.yml":false,
        "docs-ref-autogen/cognitiveservices/luis-programmatic/**.yml": false,
        "docs-ref-autogen/cognitiveservices/luis-runtime/**.yml": false,
        "docs-ref-autogen/cognitiveservices/qnamaker/**.yml":false,
        "docs-ref-autogen/cognitiveservices/textanalytics/**.yml":false

      },
```