class QuizSet < ApplicationRecord
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions
  validates :title, presence: true
end
