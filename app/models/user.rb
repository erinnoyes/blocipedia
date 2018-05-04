class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis

  before_save { self.role ||= :standard }

  after_initialize :init

  enum role: [:admin, :standard, :premium]

  def init
    self.role ||= :standard
  end

end
