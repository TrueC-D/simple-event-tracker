class User < ApplicationRecord
    has_many :events, through: :attending_events
end
