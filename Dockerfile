# Pull base image.
FROM debian:bullseye-slim

# Install necessary packages
RUN apt-get update && apt-get install -y usrmerge apt-utils git curl gnupg wget net-tools

# Repository Kali-Linux
# Add Kali's repository (using HTTPS for security)
RUN echo 'deb https://http.kali.org/kali kali-rolling main non-free contrib' > /etc/apt/sources.list.d/kali.list

# Import Kali's GPG key directly (avoiding apt-key)
RUN wget -q -O - https://archive.kali.org/archive-key.asc | gpg --import
RUN apt-key adv --keyserver hkps://keyserver.ubuntu.com --recv-key 44C6513A8E4FB3D30875F758ED444FF07D8D0BF6

# Update and clean packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get autoremove -y && apt-get clean -y
    
# Set TERM environment variable 
ENV TERM=xterm

# Reconnaissance Tools
RUN apt-get install -y subfinder
RUN apt-get install -y sublist3r 
RUN apt-get install -y recon-ng 
RUN apt-get install -y whatweb 
RUN apt-get install -y theharvester

# Reverse Engineering Tools
RUN apt-get install -y radare2

# Network Scanning Tools
RUN apt-get install -y nmap
RUN apt-get install -y httprobe 
RUN apt-get install -y amass 
RUN apt-get install -y masscan
RUN apt-get install -y sslscan 
RUN apt-get install -y nikto

# Web Application Testing Tools
RUN apt-get install -y wafw00f
RUN apt-get install -y ffuf 
RUN apt-get install -y gobuster

# Wireless Security Tools
RUN apt-get install -y aircrack-ng 

# Database Testing Tools
RUN apt-get install -y sqlmap 

# Password Cracking Tools
RUN apt-get install -y hydra 
RUN apt-get install -y john
RUN apt-get install -y hashcat

# Network Traffic Analysis Tools
RUN apt-get install -y tcpdump

# Exploitation
RUN apt-get install -y metasploit-framework

# Set working directory
WORKDIR /home/

# Define default command.
CMD ["/bin/bash"]



