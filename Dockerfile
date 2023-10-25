# Use the official Robot Framework Docker image as the base image
FROM ppodgorsek/robot-framework

# เปิดใช้งานสิทธิ์ root เพื่อติดตั้งแพ็คเกจ
USER root

# Install the RequestsLibrary using pip
RUN pip install -U robotframework-requests==0.9.5