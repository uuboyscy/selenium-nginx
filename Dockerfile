FROM selenium/standalone-chrome:latest

USER root

WORKDIR /root
COPY . ./

# RUN apt-get install apt-transport-https ca-certificates gnupg
# RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | \
#     tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
#     curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
#     apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && \
#     apt-get update -y && apt-get install google-cloud-cli -y

# RUN gcloud auth activate-service-account --key-file /root/cloud-run-secret.json
# RUN gcloud config set project data-warehouse-369301
# RUN export GOOGLE_APPLICATION_CREDENTIALS=/root/cloud-run-secret.json

# RUN apt-get update -y && apt-get install -y \
#     tini \
#     lsb-release; \
#     gcsFuseRepo=gcsfuse-`lsb_release -c -s`; \
#     echo "deb http://packages.cloud.google.com/apt $gcsFuseRepo main" | \
#     tee /etc/apt/sources.list.d/gcsfuse.list; \
#     curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
#     apt-key add -; \
#     apt-get update; \
#     apt-get install -y gcsfuse \
#     && apt-get clean

RUN apt-get update -y && apt-get install -y nginx

RUN chmod +x /root/run.sh

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["/root/run.sh"]
