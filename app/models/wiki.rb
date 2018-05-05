class Wiki < ApplicationRecord
  belongs_to :user

  def public?
    !private
  end

end
