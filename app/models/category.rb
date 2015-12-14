class Category < ActiveRecord::Base
  has_many :articles
  has_many :posts, through: :articles

  validates_presence_of :post_category

end
