class Category < ApplicationRecord
    before_create :set_slug
    has_many :movies
    def to_param
        slug
    end
    private
    def set_slug
        slug = self.title.parameterize
        count = Category.where("slug LIKE '#{slug}'").count
        self.slug = count.positive? ? "#{slug}-#{count + 1}" : slug
    end
end
