# The Docker needed contents include: Dockerfile, gen_flag
# This is can be used as a common Docker image that runs a python web server and
# complies with the way the backend is passing in dynamic flags.
# Only the CTF specific part of each Dockerfile and the gen_flag script
# need to be customized to suit the CTF.

# Using debian cause some C problems require gcc
FROM debian:latest

RUN apt update && apt install python3 gcc -y

USER root

# CTF specific
COPY generators /root/generators
COPY question /root/question
COPY gen_flag /root/gen_flag
#

RUN chmod +x /root/gen_flag
WORKDIR /root/question
EXPOSE 8080
CMD ["python3", "-m", "http.server", "8080"]
