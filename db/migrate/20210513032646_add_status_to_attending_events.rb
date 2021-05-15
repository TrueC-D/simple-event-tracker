class AddStatusToAttendingEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :attending_events, :status, null: false, foreign_key: true
  end
end
