import functions_framework
from google.cloud import logging


# Instantiates a client
logging_client = logging.Client()


# Register a CloudEvent function with the Functions Framework
@functions_framework.cloud_event
def newFileInBucket(cloud_event):
  # Your code here
  # Access the CloudEvent data payload via cloud_event.data
  logging.info("Sumant-cloudfunction: Came here")
  data = cloud_event.data
  logging.info("Sumant-cloudfunction: new file %s", data)
  return data