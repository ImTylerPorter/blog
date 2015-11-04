class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  
  has_attached_file :avatar, :styles => { :medium => "200#" }

  validates_presence_of :avatar
   validates_attachment :avatar, :presence => true,
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

end
