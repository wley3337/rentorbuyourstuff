class Exchange < ApplicationRecord
  belongs_to :renter, class_name: "User"
  belongs_to :listing

  def start_date_format
    self.start_date.strftime("%a, %B %e, %Y")
  end

  def end_date_format
    self.end_date.strftime("%a, %B %e, %Y")
  end

end
