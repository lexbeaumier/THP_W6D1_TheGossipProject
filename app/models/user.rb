
#Un User appartient à une ville et peut avoir plusieurs gossips

class User < ApplicationRecord
  belongs_to :city
  has_many :gossips

  validates :first_name, 
    presence: true
  validates :last_name, 
    presence: true
  validates :description, 
    length: { minimum: 5 }, 
    length: { maximum: 50 }
  validates :email, 
    #presence: true
    uniqueness: true
  #validates :age, 
    #numericality : true
end

