class AttendingEvent < ApplicationRecord
  validates :user_id, :event_id, :status_id, presence: true

  scope :this_event, -> {where(event_id: @event.id)} 
  
  belongs_to :user
  belongs_to :event
  belongs_to :status

  def self.search(search)
    if search
      attendees = AttendingEvent.all
      attendees = attendees.where(event_id: search)
      # attendees = attendees.where(event_id: search[:":event_id"][","])
      return attendees
    else
      AttendingEvent.all
    end
  end
end
