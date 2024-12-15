FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Install system-level build tools required to build llama-cpp-python
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc g++ cmake make \
    && rm -rf /var/lib/apt/lists/*

# Copy and install Python dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy application code
COPY . /app

# Expose the port and run the application
EXPOSE 8000
CMD ["python", "Web-LLM.py"]
