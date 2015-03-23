class User < ActiveRecord::Base

  has_one :business
  before_create :build_default_associations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

private
  def build_default_associations
    self.build_business
    puts self.business
    self.business.locations.build
  end

 
end
