class Employee < ActiveRecord::Base
# TODO * Validation on model	
  has_secure_password
  attr_accessible :name, :email, :payrate, :password, :rank, :position_ids, :workhours
  belongs_to :business
  has_many :schedules, dependent: :destroy
  has_many :avaliabilities, dependent: :destroy
  has_many :timesheets, dependent: :destroy
  has_many :shifts
  has_and_belongs_to_many :positions
  # allows project page to add items via checkboxes
  accepts_nested_attributes_for :positions
  #  rank validation
  # //
  validates :password, presence: true, length: {minimum:6}
  #
  before_save :create_remember_token
  # before_save { |employee| employee.username = username.downcase }
  # //*
@pos = Position.all 
 private

	    def create_remember_token
	      self.remember_token = SecureRandom.urlsafe_base64
	    end
end
