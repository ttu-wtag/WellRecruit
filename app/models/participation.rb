class Participation < ApplicationRecord
  belongs_to :application
  belongs_to :assessment
end
