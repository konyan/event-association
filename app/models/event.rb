class Event < ApplicationRecord
    belongs_to :creater, class_name: "User" 
    validates :title,  presence: true
    validates :date,  presence: true
end
