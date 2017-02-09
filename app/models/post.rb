class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates_presence_of :title, :content, allow_blank: false
  attr_reader :tag_attributes

  def tag_attributes=(tag_attributes)
    tag_attributes.values.reject(&:empty?).each do |tag_attribute|
      tag = Tag.find_or_create_by(name: tag_attribute)
      self.tags << tag unless self.tags.include?(tag)
    end
  end

  def user_created_tags
    user_created = self.tags.select{|t| !Tag.all[0...5].include?(t)}
  end

  def purge_user_tags
    self.tags.each do |t|
      if !Tag.all[0...5].include?(t)
        t.destroy
      end
    end
  end

end
