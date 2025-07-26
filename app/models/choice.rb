class Choice < ApplicationRecord
  belongs_to :question
  attr_accessor :correct # 一時的に正解を選ぶための仮想属性

  validates :content, presence: true
end