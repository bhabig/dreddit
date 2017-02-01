class User < ApplicationRecord
  has_many :posts

  has_secure_password
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  def name_uniformity
    a = self.name.split(" ").map{|n| n.capitalize}
    self.name = a.join(" ")
  end

  def password_control(user_params)
    if !user_params[:name].empty? && !user_params[:email].empty?
      if user_params[:password].empty? && user_params[:password_confirmation].empty?
        self.update(user_params)
      elsif user_params[:password] == user_params[:password_confirmation]
        self.update(user_params)
      else
        return false
      end
    else
      return false
    end
  end
end
