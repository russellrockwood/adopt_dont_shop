class Applicant < ApplicationRecord
  has_many :pet_applicants
  has_many :pets, through: :pet_applicants

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, numericality: true

  def get_status
    if self.description == nil || self.pets.empty?
      return 'In Progress'
    end
  end

end
