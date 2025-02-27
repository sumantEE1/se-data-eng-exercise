# gcloud config unset auth/impersonate_service_account
# google cloud project ID
export GOOGLE_CLOUD_REGION=ee-india-se-data

export GOOGLE_CLOUD_PROJECT=ee-india-se-data 
# gcloud auth application-default set-quota-project $GOOGLE_CLOUD_PROJECT
# This command is authenticated as sumant.dey@equalexperts.com which is the active account specified by the [core/account] property.
export GOOGLE_CONFIG_PATH=$(gcloud info --format='value(config.paths.global_config_dir)') #to get the path of google credentials. used below \
export GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_CONFIG_PATH/legacy_credentials/sumant.dey@equalexperts.com/adc.json
# gcloud config set account sumant.dey@equalexperts.com
# gcloud config set project project_id
# To update your Application Default Credentials quota project, use the `gcloud auth application-default set-quota-project` command.
