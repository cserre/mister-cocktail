class Dose < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true
  validates :ingredient_id, presence: true, uniqueness: { scope: :cocktail_id }
  validates :ingredient_id, presence: true
end
