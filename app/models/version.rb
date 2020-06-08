class Version < ApplicationRecord
  belongs_to :user
  belongs_to :item, polymorphic: true
  has_rich_text :content
end
