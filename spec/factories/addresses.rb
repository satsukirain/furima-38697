FactoryBot.define do
  factory :form_address do
    post_code          {"111-1111"}
    region_of_origin_id           {2}
    municipalities     {"あ"}
    address            {"あ"}
    building      {"あ"}
    phone_number       {12345678901}
    token              {"tok_abcdefghijk00000000000000000"}
  end
end