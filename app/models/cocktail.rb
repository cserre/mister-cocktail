class Cocktail < ActiveRecord::Base
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_attached_file :picture, styles: { medium: "300x300>" }

  validates_attachment :picture, presence: true
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  validates :name, presence: true, uniqueness: true
end
