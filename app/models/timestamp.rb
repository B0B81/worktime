class Timestamp < ApplicationRecord
  belongs_to :user
  belongs_to :workfile
end
