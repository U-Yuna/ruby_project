class Question < ApplicationRecord
  belongs_to :quiz_set
  has_many :choices, dependent: :destroy
  belongs_to :correct_choice, class_name: 'Choice', optional: true
  accepts_nested_attributes_for :choices
  attr_accessor :correct_choice_index

  validates :content, presence: true
  validates :correct_choice_index, presence: true
  validates_associated :choices
end