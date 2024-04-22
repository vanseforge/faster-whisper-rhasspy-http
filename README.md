# Faster Whisper Rhasspy HTTP  

This project aims to provide a Faster Whisper integration to Rhasspy.
The project is based on: https://github.com/seifane/whisper-rhasspy-http

## Setup
### Baremetal

```
pip install -r requirements.txt
python main.py
```

### Docker
Start the container

Use the docker-compose.yml

### Rhasspy setup

On Rhasspy change your Speech To Text method to `Remote HTTP` and set the Speech to Text URL to `http://[IP]:[PORT]/api/speech-to-text`. Take care of replacing IP and PORT with actual values.

## Usage
Arguments :

- `--host` : Set the bind address of the HTTP server. Defaults to `0.0.0.0`
- `--port` : Set the bind port of the HTTP server. Defaults to `4444`
- `--filter-chars` : Provide a list of characters to be filtered out of the recognized text. Defaults to None
- `--language` : Provide the spoken language. If not set, language is recognized. Defaults to None
- `--whisper-model` : Define what model should be used for Whisper possible values are `tiny`, `base`, `small`, `medium`, `large`; More info [here](https://github.com/openai/whisper#available-models-and-languages). Defaults to `base`

You can pass arguments to your docker run command in the same as you would usually.

## Recommendations

Some intent recognition services might have troubles recognizing intents because Whisper adds punctuation to the recognized text.
For example `What time is it ?` might not be recognized while `What time is it` will be. The `--filter-chars` argument is meant to be used in this case.
You can specify a list of characters that will automatically get filtered out. A good example would be `--filter-chars ".?'"\!\"":;<>[]{}()"`

## Build Docker Image
Build the docker image
```
docker build . -t whisper-rhasspy-http:latest
```
