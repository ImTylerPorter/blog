class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  has_attached_file :avatar, :styles => { :medium => "200#" }

   validates_attachment :avatar,
   :content_type => { :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] }


  has_many :posts
  has_many :projects

  
  def fullname
    self.first_name << " " << self.last_name
  end
  def fullname=(fname)
    names = fname.split(/(.+) (.+)$/)
    self.fname = names[0]  
    self.lname = names[1] 
  end

  after_create :send_notification

  def send_notification
    AdminMailer.new_user(self).deliver
  end

end
