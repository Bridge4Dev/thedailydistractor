class Post < ActiveRecord::Base
  belongs_to :admin

  validates :post_title, presence: true 
  validates :post_content, presence: true


end
