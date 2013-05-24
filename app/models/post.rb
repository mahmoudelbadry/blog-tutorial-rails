class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :tags_attribute
  validates :name, :presence => true
  validates :title, :presence => true,
                    :length => {:minimum => 5}
  has_many :comments, :dependent => :destroy
  has_many :tags
  accepts_nested_attributes_for :tags, :destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k,v| v.blank? } }
end
