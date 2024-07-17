json.extract! parcel_collection, :id, :uid, :sending_parcel_id, :beneficiary_identity_document_type_id, :beneficiary_identity_document_code, :collection, :notes, :status, :account_id, :created_at, :updated_at
json.url parcel_collection_url(parcel_collection, format: :json)
