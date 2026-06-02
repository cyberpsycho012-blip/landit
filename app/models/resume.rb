class Resume < ApplicationRecord
  belongs_to :user
  has_many :chats, through: :user, dependent: :destroy
end
