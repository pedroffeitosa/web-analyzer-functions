# Use the official Haskell image from Docker Hub
FROM haskell:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the cabal file and install dependencies
COPY WebAnalyzer.cabal /app/
RUN cabal update && cabal build --only-dependencies

# Copy the rest of the application code
COPY . /app

# Build the application
RUN cabal install

# Define the command to run the application
CMD ["WebAnalyzer", "--url", "https://example.com", "--format", "html"]
