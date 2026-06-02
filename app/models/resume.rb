class Resume < ApplicationRecord
  belongs_to :user, optional: true
end
