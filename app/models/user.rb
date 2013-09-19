class User < ActiveRecord::Base
  validates :email, presence: true
  has_secure_password

  def email=(value)
    value = value.strip.downcase
    write_attribute :email, value
  end  
end
