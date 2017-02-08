class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates_presence_of :title, :content


  #GOING TO NEED SOMETHING LIKE THE METHOD BELOW (TAKEN FROM PREVIOUS LAB) FOR THE NESTED TAGS
  def tag_attributes=(tag_attributes)
    tag_attributes.values.each do |tag_attribute|
      tag = Tag.find_or_create_by(tag_attribute)
      self.tags << tag
    end
  end

end
