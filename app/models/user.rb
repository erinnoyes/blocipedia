class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis
  has_many :collaborators
  has_many :collab_wikis, source: :wiki, through: :collaborators

  after_initialize :init

  enum role: [:admin, :standard, :premium]

  def init
    self.role ||= :standard
  end

end
