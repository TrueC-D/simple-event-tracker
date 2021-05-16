class Event < ApplicationRecord
  validates :name, :datetime, :category_id, presence: true
  

  default_scope {order('datetime DESC') }


  belongs_to :category
  has_many :attending_events
  has_many :users, through: :attending_events
end
