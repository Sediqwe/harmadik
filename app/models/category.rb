class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: {minimum: 4, maximum: 20 }
    has_many :article_categories
    has_many :article, through: :article_categories
end