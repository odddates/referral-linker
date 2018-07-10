class Link < ApplicationRecord
  validates :id, uniqueness: true, presence: true
end