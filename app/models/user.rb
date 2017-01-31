class User < ApplicationRecord
  has_many :posts

  has_secure_password

  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :name, :email

  def name_uniformity
    a = self.name.split(" ").map{|n| n.capitalize}
    self.name = a.join(" ")
  end
end
