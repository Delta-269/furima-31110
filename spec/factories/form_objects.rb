FactoryBot.define do
  factory :form_object do
    post { '123-1234' }
    area_id { 2 }
    city { '横浜市' }
    address { '青山1-1-1' }
    phone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
