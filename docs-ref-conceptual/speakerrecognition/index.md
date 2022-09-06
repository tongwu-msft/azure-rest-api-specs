---
title: Speaker Recognition APIs
description: Introduction for Speaker Recognition APIs
author: kiliu
ms.author: jasonh
ms.date: 05/28/2020
ms.topic: reference
ms.service: cognitive-services
ms.devlang: rest-api
---

# Speaker Recognition

The Azure Cognitive Service Speaker Recognition service provides algorithms that verify and identify speakers by their unique voice characteristics. Speaker Recognition is used to answer the question "who is speaking?". [Learn more](https://azure.microsoft.com/services/cognitive-services/speaker-recognition/).

Voice has unique characteristics that can be associated with an individual. We provide Speaker Verification APIs and Speaker Identification APIs for two major applications of Speaker Recognition technologies.

## Speaker Verification

Speaker verification can be either text-dependent or text-independent. Text-dependent verification means speakers need to choose the same passphrase to use during both enrollment and verification phases. The verification of both speech content and voice signature facilitates a multi-factor verification scenario; Text-independent verification means speakers can speak in everyday language in the enrollment and verification phrases.

### Text Dependent Speaker Verification

In the speaker enrollment phase, the speaker's voice is recorded by saying a passphrase from a set of predefined phrases. Voice features are extracted from the audio recording to form a unique voice signature while the chosen passphrase is recognized. Together, the voice signature and the passphrase would be used to verify the speaker.

In the verification phase, the ID associated with the individual to be verified is sent to the speaker verification API. The speaker verification service extracts voice features and the passphrase from the input speech recording. Then it compares the voice features and the passphrase against the enrollment profile of the corresponding speaker.

The response returns "Accept" or "Reject" with a similarity score ranging from 0 to 1. The "Accept" or "Reject" response is a result combining both the speaker verification result and speech recognition result, while the similarity score only measures the voice similarity. We return "Accept" when the speech recognition result matches the enrollment phrase and the voice similarity score is greater or equal to 0.5. However, the result should be determined based on the scenario and other verification factors that are being used. We recommend you experiment on your own data and determine your threshold to override "Accept" or "Reject" response as appropriate.

In current version of text-dependent speaker verification API, we provide 10 English phrases for the speakers to choose from.

- I am going to make him an offer he cannot refuse.
- Houston we have had a problem.
- My voice is my passport verify me.
- Apple juice tastes funny after toothpaste.
- You can get in without your password.
- You can activate security system now.
- My voice is stronger than passwords.
- My password is not your business.
- My name is unknown to you.
- Be yourself everyone else is already taken"

You can create your own passphrases by sending separate requests to the text-independent speaker verification API and speech-to-text API. Combining the speaker verification result and speech recognition result, you can determine the speaker's identity.

The APIs are not intended to determine whether the audio is from a live person or an imitation or a recording of an enrolled speaker. Generating random phrases for the speaker to read is considered effective to prevent replay attack.

### Text Independent Speaker Verification

Speaker Verification can also be text-independent, which means that there are no restrictions on what the speaker says in the audio.

In the enrollment phase, voice features are extracted from a speaker's audio to form a unique voice signature.

In the verification phase, the audio and the ID associated with the individual to be verified are sent to the speaker verification API. The speaker verification service extracts voice features from the input speech recording. Then it compares the voice features against the voice signature in enrollment profile of the corresponding speaker.

The response returns "Accept" or "Reject" with a similarity score ranging from 0 to 1. The "Accept" response is returned when the similarity score is greater or equal to 0.5. However, the result should be determined based on the scenario and other verification factors that are being used. We recommend you experiment on your own data and determine your threshold to override "Accept" or "Reject" response as appropriate.

The APIs are not intended to determine whether the audio is from a live person or an imitation or a recording of an enrolled speaker.

## Speaker Identification

Speaker identification is the task of determining the identity of an unknown voice among a set of candidate speakers. The Speaker Identification API returns a list of "best matches" based on the similarity scores against a provided list of IDs. The Speaker Identification API is text-independent as it does not compare what was said at the enrollment and recognition.

### Text Independent Speaker Identification

Enrollment for speaker identification is text-independent, which means that there are no restrictions on what the speaker says in the audio. No passphrase is required. In the enrollment phase, the speaker's voice is recorded, and voice features are extracted to form a unique voice signature.

In the identification phase, the speaker identification service extracts voice features from the input speech recording. Then it compares the features against the voice signatures in the enrollment data of a specified list of speakers (up to 50 candidate speakers in each request). The response included one identified ID and five top-ranked IDs with similarity scores ranging from 0 to 1. The identified ID is determined based on the similarity score of the best matched speaker. If none of the candidate speakers returns a similarity score of greater or equal than 0.5, the response returns a string of zero to represent "no match is found". However, the result should be determined based on your scenario and other factors that are being used. We recommend you experiment with your data and determine your threshold to override the default "match or no match" as appropriate.

The APIs are not intended to determine whether the audio is from a live person or an imitation or a recording of an enrolled speaker.

## See Also

- [Tutorial for text-independent speaker verification API](https://azure.microsoft.com/resources/videos/speaker-recognition-text-independent-verification-developer-tutorial/)
