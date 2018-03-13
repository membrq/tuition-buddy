FactoryBot.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    id 1
    name "Basic User"
    email
    password "basicuser"
    #password_confirmation "basicuser"
    confirmed_at {Time.now}
    is_admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    name "Admin User"
    email
    password "adminuser"
    #password_confirmation "adminuser"
    confirmed_at {Time.now}
    is_admin  true
  end
end
