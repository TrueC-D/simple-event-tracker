class AddExpectationsToAttendingEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :attending_events, :expectation, :string
  end
end
