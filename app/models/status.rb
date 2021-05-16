class Status < ApplicationRecord
  validates :name, presence: true
  has_many :attending_events
end
