# google cloud project ID
export GOOGLE_CLOUD_PROJECT=ee-india-se-data
export GOOGLE_CONFIG_PATH=$(gcloud info --format='value(config.paths.global_config_dir)')
export GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_CONFIG_PATH/legacy_credentials/sumant.dey@equalexperts.com/adc.json
gcloud config set account sumant.dey@equalexperts.com
