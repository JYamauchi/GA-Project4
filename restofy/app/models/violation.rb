class Violation < ActiveRecord::Base
  has_and_belongs_to_many :inspections
  has_and_belongs_to_many :violation_keys
end