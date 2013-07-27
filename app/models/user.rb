class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :profile_name, :email, :password, :password_confirmation, :remember_me

  has_many :statuses

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true, 
                           uniqueness: true,
                           format: {
                            with: /\A[a-zA-Z0-9_-]+\z/,
                            message: 'Must be formatted correctly.'
                           }

  def full_name
  	first_name + " " + last_name
  end

  def gravatar_url
    stripped_email = email.strip
    downcase_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcase_email)
    
    "http://gravatar.com/avatar/#{hash}"
  end
end
