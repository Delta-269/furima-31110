FactoryBot.define do
  factory :user do
    nick_name { 'sample' }
    email                 { 'test@gmail.com' }
    password              { 's00000' }
    password_confirmation { password }
    name_zen_family       { '山田' }
    name_zen_first        { '太郎' }
    name_han_family       { 'ヤマダ' }
    name_han_first        { 'タロウ' }
    birthday              { '2000-01-01' }
  end
end
