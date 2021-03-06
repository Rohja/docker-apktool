FROM java:7

MAINTAINER Paul "Rohja" Lesellier <rohja@rohja.com>

# Install WGET
RUN apt-get update
RUN apt-get install -y wget

# Download APKTool script
RUN wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool

# Install 32b libs
RUN apt-get install -y gcc-multilib

# Download APKTool JAR
RUN wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.0.2.jar
RUN mv apktool_2.0.2.jar apktool.jar

# Move bins to /usr/local/bin
RUN mv apktool.jar apktool /usr/local/bin

# Allow execution
RUN chmod +x /usr/local/bin/apktool.jar /usr/local/bin/apktool

# Create workspace
RUN mkdir /app

VOLUME /app

##

WORKDIR /app
CMD ["-"]
ENTRYPOINT ["apktool"]
