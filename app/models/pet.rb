class Pet < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true
  belongs_to :shelter
  has_many :pet_applicants
  has_many :applicants, through: :pet_applicants

  def shelter_name
    shelter.name
  end

  def self.adoptable
    where(adoptable: true)
  end

  def self.by_name(name)
    Pet.where("name ilike ?", "%#{name}%")
  end

end
