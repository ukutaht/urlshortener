class Url < ActiveRecord::Base
  # TODO validates http://
  validates :long_url, presence: true
  validate :long_url_form

  before_save :generate_short_url

  def generate_short_url
    self.short_url = SecureRandom.hex(5)
  end

  def long_url_form
    errors.add(:long_url, "URL must begin with http://") unless self.long_url =~ /http:.+/
  end
end
