class Car < ActiveRecord::Base
  validates :company, :name, :model, :year, :color, presence: true
end
