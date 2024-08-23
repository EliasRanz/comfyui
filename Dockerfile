# Base image uses Debian under the hood
FROM python:3

# Install Depdendencies
RUN apt-get update && apt-get install git -y

# Download ComfyUI and Configure
WORKDIR "/opt"
RUN git clone https://github.com/comfyanonymous/ComfyUI.git
WORKDIR "/opt/ComfyUI"
RUN mkdir /opt/ComfyUI/output

RUN pip install -r requirements.txt

EXPOSE 8188

CMD [ "python", "main.py", "--cpu", "--listen", "--output-directory", "/opt/ComfyUI/output" ]
