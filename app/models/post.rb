class Post < ActiveRecord::Base

  self.per_page = 10

  is_sluggable :title, editable: true

  self.primary_key = :cached_slug

end
