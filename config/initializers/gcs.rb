
# require 'google/cloud/storage'

# storage = Google::Cloud::Storage.new(
#   credentials: {
#     type: "service_account",
#     project_id: "audeladelles",
#     private_key_id: Rails.application.credentials.gcs_private_key_id, 
#     private_key: Rails.application.credentials.gcs_private_key,
#     client_email: Rails.application.credentials.gcs_client_email,
#     client_id: Rails.application.credentials.gcs_client_id,
#     auth_uri: 'https://accounts.google.com/o/oauth2/auth',
#     token_uri: 'https://oauth2.googleapis.com/token',
#     auth_provider_x509_cert_url: 'https://www.googleapis.com/oauth2/v1/certs',
#     client_x509_cert_url: 'https://www.googleapis.com/robot/v1/metadata/x509/imagesitems%40audeladelles.iam.gserviceaccount.com',
#     universe_domain: 'googleapis.com'
#   }
# )

# Rails.application.config.active_storage.service = :google
# Rails.application.config.active_storage.service_config = {
#   project: "AuDelaDelles",
#   bucket: "imageitems-#{Rails.env}",
#   credentials: storage
# }
