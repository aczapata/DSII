class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_attached_file :avatar, :styles => { :thumb => "32x32" }, :default_url => "/images/default.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :username, presence: true
  validates :username, :uniqueness => true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
