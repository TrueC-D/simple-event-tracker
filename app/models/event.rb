class Event < ApplicationRecord
  default_scope {order('datetime DESC') }


  belongs_to :category
  has_many :attending_events
  has_many :users, through: :attending_events
end
