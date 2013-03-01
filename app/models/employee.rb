class Employee < ActiveRecord::Base
# TODO * Validation on model	
  attr_accessible :position_id, :name, :email, :mail, :payrate, :rank
  belongs_to :business
  has_many :schedules, dependent: :destroy
  has_many :avaliabilities, dependent: :destroy
  belongs_to :position
  #  rank validation
  # //
  #
  # //*
@pos = Position.all 

end
