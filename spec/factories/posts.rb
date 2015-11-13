FactoryGirl.define do
  factory :post do
    title "My first blog"
    contents "Hay look, I am learning factory girl.  You can also start learning if you aren't"
  end

  trait :published do
    published_at Time.zone.now
  end

  trait :lazy_published_at do
    published_at { Time.zone.now }
  end

end