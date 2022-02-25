# Install the latest version of pytorch
FROM pytorch/pytorch:1.9.1-cuda11.1-cudnn8-runtime
WORKDIR /root
#
## Installs pandas, and google-cloud-storage.
RUN apt-get update && apt-get install -y curl
RUN pip install --upgrade pip
RUN pip install sklearn
RUN pip install matplotlib
#RUN pip install pandas google-cloud-storage
### RUN pip install fastai==1.0.61
##RUN conda install -c fastai fastai=1.0.61
##RUN pip install thop
## Downloading gcloud package
#RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz
#
## Installing the package
#RUN mkdir -p /usr/local/gcloud \
#  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
#  && /usr/local/gcloud/google-cloud-sdk/install.sh
#
## Adding the package path to local
#ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

# Copies the trainer code to the docker image.
COPY src ./src
#COPY utils.py ./utils.py
#COPY data_preprocess.py ./data_preprocess.py

# copy datasets
COPY data ./data
COPY results ./results
COPY checkpoint ./checkpoint
## COPY data/sop ./data/sop
## COPY data/isc ./data/isc
#COPY entry.sh ./entry.sh

#COPY download_pretrained.py ./download_pretrained.py
RUN #python src/main.py
CMD ["python", "-u", "src/main.py"]
#RUN ["chmod", "+x", "./entry.sh"]
# Set up the entry point to invoke the trainer.
#ENTRYPOINT ["./entry.sh"]