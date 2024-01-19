# Pull base image.
FROM debian:bullseye-slim

# Install.
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/*

# Reconnaissance Tools
RUN apt-get Install -y subfinder
RUN apt-get Install -y sublist3r 
RUN apt-get Install -y recon-ng 
RUN apt-get Install -y whatweb 
RUN apt-get Install -y theharvester

# Reverse Engineering Tools
RUN apt-get Install -y radare2

# Network Scanning Tools
RUN apt-get Install -y nmap
RUN apt-get Install -y httprobe 
RUN apt-get Install -y amass 
RUN apt-get Install -y masscan
RUN apt-get Install -y sslscan 
RUN apt-get Install -y nikto

# Web Application Testing Tools
RUN apt-get Install -y wafw00f
RUN apt-get Install -y ffuf 
RUN apt-get Install -y gobuster

# Wireless Security Tools
RUN apt-get Install -y aircrack-ng 

# Database Testing Tools
RUN apt-get Install -y sqlmap 

# Password Cracking Tools
RUN apt-get Install -y hydra 
RUN apt-get install -y john
RUN apt-get install -y hashcat

# Network Traffic Analysis Tools
RUN apt-get install -y tcpdump
RUN apt-get install -y wireshark

# Exploitation
RUN apt-get install -y metasploit-framework

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /home/

# Define default command.
CMD ["/bin/bash"]



