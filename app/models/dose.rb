class Dose < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true
  validates :cocktail_id, presence: true, uniqueness: { scope: :ingredient_id,
    message: "Only one dose per ingredient per cocktail" }
  validates :ingredient_id, presence: true
end
