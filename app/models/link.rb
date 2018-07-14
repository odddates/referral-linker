class Link < ApplicationRecord
  validates :title, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z0-9]+\Z/, message: "can only have alphanumeric characters" }
end