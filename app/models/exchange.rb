class Exchange < ApplicationRecord
  belongs_to :renter, class_name: "User"
  belongs_to :listing
end
