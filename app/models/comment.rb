class Comment < ApplicationRecord
  validates :text, presence: true

  belongs_to :user
  belongs_to :event
  has_many :reports
end
