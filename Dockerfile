# Use an official NVIDIA CUDA base image
FROM --platform=amd64 nvcr.io/nvidia/cuda:12.1.0-devel-ubuntu22.04 as base

# Set an environment variable
ENV HF_TOKEN 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

# Install Python and other dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

# Copy your Python application into the container
COPY . /vllm

# Set the working directory
WORKDIR /vllm

# Install Python dependencies (if you have a requirements.txt)
RUN pip3 install -r requirements.txt
RUN pip3 install vllm
# Expose port 8000
EXPOSE 8000

#Entrypoint Script
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

