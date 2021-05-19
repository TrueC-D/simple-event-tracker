class Event < ApplicationRecord
  validates :name, :datetime, :category_id, presence: true
  

  default_scope {order('datetime DESC') }


  belongs_to :category
  has_many :attending_events
  has_many :users, through: :attending_events

  def future_date?
    if @event.datetime > DateTime.now
      return true
    else
      return false
    end
  end
end
