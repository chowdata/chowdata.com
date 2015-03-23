class User < ActiveRecord::Base

  before_create :build_default_business
  has_one :business

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

private
  def build_default_business
    self.build_business
    self.save!
  end

 
end
