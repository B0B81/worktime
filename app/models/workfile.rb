class Workfile < ApplicationRecord
  belongs_to :user
  has_many :timestamps
end
