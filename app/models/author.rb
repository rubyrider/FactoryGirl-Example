class Author < ActiveRecord::Base
  has_many :authorships
  has_many :posts

  validates :name, :presence => true
end
