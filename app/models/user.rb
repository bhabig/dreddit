class User < ApplicationRecord
  has_many :posts

  has_secure_password

  validates :name, presence: true, uniqueness: {case_sensitive: false}, allow_blank: false
  validates :email, presence: true, uniqueness: {case_sensitive: false}, allow_blank: false

  def admin?
    !!self.admin == true
  end

  def name_uniformity
    a = self.name.split(" ").map{|n| n.capitalize}
    self.name = a.join(" ")
  end

  def update_control(user_params)
    if !user_params[:name].empty? && !user_params[:email].empty?
      password_control(user_params)
    else
      return false
    end
  end

  def password_control(user_params)
    if user_params[:password].empty? && user_params[:password_confirmation].empty?
      self.update(user_params)
    elsif user_params[:password] == user_params[:password_confirmation]
      self.update(user_params)
    else
      return false
    end
  end

  def purge_posts
    self.posts.each do |p|
      p.purge_user_tags
      p.destroy
    end
  end

end
