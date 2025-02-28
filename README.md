# se-data-eng-exercise
* threw error
 project: required field is not set
* https://discuss.hashicorp.com/t/error-project-required-field-is-not-set/22128 said to run
```terraform state pull > state.json```

gc-profile 
* GOOGLE_APPLICATION_CREDENTIALS 
    is set in environment to path of credentials of gcp user (like ee user credentials) which will be used by terraform other than the default credentials (different credential is used other than the client credentials)


Gcloud cli commands used
* gcloud storage ls --project=<project> - List the bucketsn in project in gcli url format
* gcloud storage ls gs://<Bucket-name> // uri from the above command - list the contents of bucket

Gcloud function
* Created a new google_storage_bucket with variable function-bucket (I don't know what it is called yet) - refer cloud_function.tf
* Created a google_storage_bucket_object with variable archive - pushed the zipped python file to above bucket
    *  When you zip make sure the file type should be just zip, not py.zip
* The terraform gives variable support which is used in current commit
    * Created cloudfunction with following config
        * source_archive_bucket is `"${google_storage_bucket.function-bucket.name}"`
        * source_archive_object is  `"${google_storage_bucket_object.archive.name}"`
* Create python virtual environment
    * python3 -m venv <name of enviroment> * keep the name small *
* Terraform supports archive of folder
    * add the env folder to excludes <name of enviroment> (took time to find adding)
* Activate the environment `source <name of enviroment>/bin/activate>`
* Install python library `pip install -r requirements.txt` # read about option for pip install
* Not mandatory Freeze pip dependency
    * `pip freeze > requirements.txt`
    * `pip freeze >> requirements.txt`


created key `354393945b0647c6b1fb656d5f249d35aba81413` in App Engine default service account with email ee-india-se-data@appspot.gserviceaccount.com 

Follow steps to generate the key of service account
*Generate a Key for the Service Account:*
   - In the *Service Accounts* list, click on the service account you just created.
   - Go to the *Keys* tab.
   - Click *Add Key > Create New Key*.
   - Choose *JSON* as the key type and click *Create*.
   - This will download a JSON file containing the credentials. Keep this file secure.

placement of secret in github - Follow the following steps
*Store the Credentials in GitHub Secrets:*
   - Go to your GitHub repository.
   - Navigate to *Settings > Secrets and variables > Actions*.
   - Click *New Repository Secret*.
   - Name the secret (e.g., GCP_CREDENTIALS).
   - Paste the contents of the JSON file you downloaded earlier into the secret value.
   - Click *Add Secret*.

Used github google action
    google-github-actions/auth@v1
    The name of env variable for google credential is `GOOGLE_CREDENTIALS`