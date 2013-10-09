class Url < ActiveRecord::Base
  
  before_save :generate_short_url

  def generate_short_url
    self.short_url = SecureRandom.hex(5)
  end
end
