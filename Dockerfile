FROM python:3-slim-bookworm

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN apt update && \
    apt install -yq curl jq && \
    curl -L -o /usr/local/bin/wokwi-cli $(curl -s https://api.github.com/repos/wokwi/wokwi-cli/releases/latest | jq -r '.assets[] | select(.name == "wokwi-cli-linuxstatic-x64") | .browser_download_url') && \
    chmod +x /usr/local/bin/wokwi-cli

CMD ["python"]
