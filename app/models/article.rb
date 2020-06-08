class Article < ApplicationRecord
  has_rich_text :content
  has_many :versions, as: :item, dependent: :destroy
end
