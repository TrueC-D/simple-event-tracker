class Category < ApplicationRecord
    validates :name, :description, presence: true
    
    has_many  :events
end
