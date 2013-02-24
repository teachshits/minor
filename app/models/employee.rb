class Employee < ActiveRecord::Base
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
