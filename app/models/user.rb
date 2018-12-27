class User < ApplicationRecord


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
    	:recoverable, :rememberable, :validatable,:omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  has_many :reviews, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :requests, dependent: :destroy
  validates :user_agreement, acceptance: { accept: 'yes' }
  #def self.from_omniauth(access_token)
    #data = access_token.info
    #user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data['name'],
    #        email: data['email'],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    #user
#end

#def self.from_omniauth(auth)
  #where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #user.email = auth.info.email
    #user.provider = auth.provider
   #user.uid = auth.uid
    #user.password = Devise.friendly_token[0,20]
  #end
#end

def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

 #def self.from_omniauth(auth)
    #where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      #user.email = auth.info.email
      #user.password = Devise.friendly_token[0,20]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    #end
  #end

  def self.from_omniauth(auth)
  if self.where(email: auth.info.email).exists?
    return_user = self.where(email: auth.info.email).first
    return_user.provider = auth.provider
    return_user.uid = auth.uid
  else
    return_user = self.create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.provider = auth.provider
      user.uid = auth.uid
    end
  end

  return_user
end

   def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end


  
end
