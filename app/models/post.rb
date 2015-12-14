class Post < ActiveRecord::Base
  belongs_to :admin
  has_many :articles
  has_many :categories, through: :articles

  validates :post_title, presence: true 
  validates :post_content, presence: true


end
