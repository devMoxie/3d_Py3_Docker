# Start with the official Python base image
FROM python:3.11.3-slim

# Install necessary system level dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libgl1-mesa-dev \
    libxt-dev \
    wget \
    unzip

# Set the working directory in the Docker image
WORKDIR /3d_Py3_Docker

# Download VTK source
RUN wget https://www.vtk.org/files/release/9.2/VTK-9.2.6.tar.gz && \
    tar -xzf VTK-9.2.6.tar.gz && \
    rm VTK-9.2.6.tar.gz

# Build VTK
WORKDIR /3d_Py3_Docker/VTK-9.2.6/build
RUN cmake .. \
    -DVTK_PYTHON_VERSION=3 \
    -DVTK_WRAP_PYTHON=ON && \
    make -j$(nproc) && \
    make install

# Verify Python bindings
WORKDIR /3d_Py3_Docker
RUN python -c "import vtk; print(vtk.VTK_VERSION)"

# Copy requirements file into the image
COPY requirements.txt .

# Install Python dependencies
RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# The command that will run when the container starts
CMD [ "python", "./test_docker_build.py" ]