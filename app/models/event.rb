class Event < ApplicationRecord
    belongs_to :creater, class_name: "User" 
end
