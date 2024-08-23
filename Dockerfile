# Base image uses Debian under the hood
FROM python:3

# Install Depdendencies
RUN apt-get update && apt-get install git -y

# Download ComfyUI and Configure
WORKDIR "/opt"
RUN git clone https://github.com/comfyanonymous/ComfyUI.git
WORKDIR "/opt/ComfyUI"
RUN pip install -r requirements.txt

# Install Plugins
WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/crystian/ComfyUI-Crystools.git
WORKDIR /opt/ComfyUI/custom_nodes/ComfyUI-Crystools
RUN pip install -r requirements.txt

WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/jags111/efficiency-nodes-comfyui.git
WORKDIR efficiency-nodes-comfyui
RUN pip install -r requirements.txt

WORKDIR /opt/ComfyUI/custom_nodes
RUN git clone https://github.com/rgthree/rgthree-comfy.git
WORKDIR rgthree-comfy
RUN pip install -r requirements.txt

EXPOSE 8188

CMD [ "python", "main.py", "--cpu", "--listen", "--output-directory", "/opt/ComfyUI/output" ]
