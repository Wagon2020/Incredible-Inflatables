class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :inflatable
  enum status: { rejected: 2, accepted: 1, default: 0 }
end
