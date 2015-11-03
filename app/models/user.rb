class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

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
