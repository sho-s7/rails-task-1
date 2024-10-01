class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :end_at_check
  validates :memo, presence: true, length: { maximum: 500}

  def end_at_check
    if end_at.present? && start_at.present? && end_at < start_at
      errors.add(:end_at, "終了日は開始日以降に設定してください")
    end
  end
end
