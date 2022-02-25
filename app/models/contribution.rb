class Contribution < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :challenge, optional: true

  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: { message: "- Beschreibung ist ein Pflichtfeld" }, length: { maximum: 140 }
  validates :title, presence: { message: "- Titel ist ein Pflichtfeld" }, length: { maximum: 255 }
  validates :participants, numericality: { greater_than: 0, message: "- Teilnehmeranzahl muss eine ganze Zahl größer 0 sein" }
  validates :amount, numericality: { greater_than: 0, message: "- Beitrag muss eine ganze Zahl größer 0 sein" }

  validates :image, 
      content_type: { in: %w[image/jpeg image/gif image/png], message: "gültiges Bildformat gefordert (JPG, GIF, PNG)" },
      size: { less_than: 5.megabytes, message: "muss kleiner als 5MB sein" }
end
