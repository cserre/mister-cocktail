class Ingredient < ActiveRecord::Base
  has_many :doses
  validates :name, presence: true, uniqueness: true
  before_destroy :check_for_cocktails

  def check_for_cocktails
    if ingredient.doses
      return false
    end
  end
end
