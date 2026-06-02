class Resume < ApplicationRecord
  has_many :chats, through: :user, dependent: :destroy
  belongs_to :user, optional: true
end
