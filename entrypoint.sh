#!/bin/bash
python3 -m vllm.entrypoints.openai.api_server --host 0.0.0.0 --port 8080  --model $MODEL
