# 掲示板機能におけるテーブルリレーション
class BulletinBoard < ApplicationRecord
  belongs_to :user
  has_many_attached :files
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true
end
