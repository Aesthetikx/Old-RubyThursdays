class Post < ActiveRecord::Base

  scope :current, -> { where("date <= ?", Time.now) }

  self.per_page = 10

  is_sluggable :title, editable: true

  acts_as_taggable

end
