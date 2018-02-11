class House < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :address 
end
