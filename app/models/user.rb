class User < ApplicationRecord
    validates :name, :username, presence: true
    validates :username, uniqueness: true
    
    has_secure_password

    has_many :attending_events
    has_many :events, through: :attending_events

end
