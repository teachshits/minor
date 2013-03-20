class Employee < ActiveRecord::Base
# TODO * Validation on model	
  has_secure_password
  attr_accessible :name, :email, :payrate, :password, :rank, :seats_attributes, :position_ids, :workhours, :punch_in, :punch_out, :change_log
  belongs_to :business
  has_many :schedules, dependent: :destroy
  has_many :avaliabilities, dependent: :destroy
  has_many :timesheets, dependent: :destroy
  has_many :shifts

  has_many :seats
  has_many :positions, through: :seats, dependent: :destroy
  # allows project page to add items via checkboxes
  accepts_nested_attributes_for :positions
  accepts_nested_attributes_for :seats
  #  rank validation
  # //
  #validates :password, presence: true, length: {minimum:6}
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
