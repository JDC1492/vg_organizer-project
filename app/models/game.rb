class Game < ActiveRecord::Base
    belongs_to :user
    validates :title, :console, :genre, presence: true
    
end