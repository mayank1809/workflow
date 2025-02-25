FROM ubuntu:latest

# Install Python and required dependencies
RUN apt-get update && apt-get install -y \
   python3.10 \
   python3-pip \
   python3.10-venv \
   python3-distutils \
   git && \
   apt-get clean && rm -rf /var/lib/apt/lists/*

# Upgrade pip before installing dependencies
RUN pip3 install --upgrade pip

# Install PyYAML
RUN pip3 install --no-cache-dir PyYAML

# Copy scripts
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure entrypoint script is executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
