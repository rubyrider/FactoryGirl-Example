class Authorship < ActiveRecord::Base
  belongs_to :author
  belongs_to :post
end
