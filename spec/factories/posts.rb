FactoryGirl.define do
  factory :post do
    title "My first blog"
    contents "Hay look, I am learning factory girl.  You can also start learning if you aren't"
    published_at nil
  end

  trait :published do
    published_at Time.zone.now
  end

end