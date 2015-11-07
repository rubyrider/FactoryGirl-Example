class Author < ActiveRecord::Base

  # has authorships
  has_many :authorships

  # has authorship many posts
  has_many :posts, through: :authorships

  # an author must have a name!
  validates :name, :presence => true
end
