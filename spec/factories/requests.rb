FactoryBot.define do
  factory :request do
    id 1
    #user_id 2
    amount_requested 5000
    amount_paid 5000
    date_processed Date.today
    documents_submitted true
    processing_status "WIP"
    request_approved true
  end
end
