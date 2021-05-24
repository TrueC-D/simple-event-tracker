class Event < ApplicationRecord
  validates :name, :datetime, :category_id, presence: true
  

  default_scope {order('datetime DESC') }
  scope :future_dates, -> {where("datetime >= DateTime.now")}
  scope :past_dates, -> {where("datetime < DateTime.now")}


  belongs_to :category
  has_many :attending_events
  has_many :users, through: :attending_events

  def future_date?
    if datetime > DateTime.now
      return true
    else
      return false
    end
  end
end
