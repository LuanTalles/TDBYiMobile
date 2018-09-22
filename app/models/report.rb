class Report < ApplicationRecord
  belongs_to :comment
  belongs_to :user
end
