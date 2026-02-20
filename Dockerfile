FROM rust:latest

# Install the WASI target required by the plugin
RUN rustup target add wasm32-wasip1

# Set the working directory
WORKDIR /usr/src/app
