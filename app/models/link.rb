class Link < ApplicationRecord
  # validations for url
  validates :url, presence: true
  validates :url, url: true
  validates :url, length: { minimum: 11, message: "%{count} characters is the minimum allowed" }

  # validations for code
  validates :code, presence: true
  validates :code, uniqueness: true

  # short url
  def short_url
    "http://localhost:3000/#{code}"
  end
end
