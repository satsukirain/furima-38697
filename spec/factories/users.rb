FactoryBot.define do
    factory :user do
      nickname              {"test"}
      email                 {Faker::Internet.free_email}
      password              {'1a' + Faker::Internet.password(min_length: 6)}
      password_confirmation {password}
      fast_name             {"埼玉"}
      last_name             {"たろう"}
      fast_name_kana        {"サイタマ"}
      last_name_kana        {"タロウ"}
      birthday              {"20021001"}


    end
  end