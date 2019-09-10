class Customer < ApplicationRecord
  scope :blacklisted, -> { where(blacklisted: true) }
  scope :not_blacklisted, -> { where(blacklisted: false) }

  validates :name, presence: true
  validates :phone_number, presence: true, uniqueness: true

  def blacklist
    update!(blacklisted: true)
  end

  def unblacklist
    update!(blacklisted: false)
  end
end
