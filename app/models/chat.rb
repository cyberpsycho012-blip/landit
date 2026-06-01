class Chat < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_many :resumes, through: :users
end
