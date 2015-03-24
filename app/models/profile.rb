class Profile < ActiveRecord::Base

  validates_uniqueness_of :inbound_email, on: :update
  validates :inbound_email, length: { minimum: 1 },  format: { with: /\A[a-zA-Z0-9]+\Z/ }, on: :update
  before_create :build_default_route
 
  belongs_to :location
  has_one    :route

  before_save :update_routes, :if => :inbound_email_changed?

  def update_routes 
     if self.route.mandrill_id.nil?
       self.route.add_route(self.inbound_email)
     else
       self.route.remove_route(self.route.mandrill_id)
       self.route.add_route(self.inbound_email) 
     end
  end


  private
    def build_default_route
      self.build_route
    end





end

