class Link < ApplicationRecord

  # validations for url
  validates :url, presence: true
  validates :url, format: URI::regexp(%w[http https])
  validates :url, length: { maximum: 255, too_long: "255 characters is the maximum allowed"}

  # validations for code
  validates :code, uniqueness: true
  validates :code, length: { maximum: 255, too_long: "%{count} characters is the maximum allowed" }
end
