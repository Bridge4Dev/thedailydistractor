class Post < ActiveRecord::Base
  belongs_to :admin
  has_many :articles
  has_many :categories, through: :articles

  accepts_nested_attributes_for :articles
  accepts_nested_attributes_for :categories

  validates :post_title, presence: true 
  validates :post_content, presence: true


end
