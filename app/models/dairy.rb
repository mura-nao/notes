class Dairy < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length:{ maximum: 50 }
  validates :content, presence: true, length: { maximum: 400 }
end
