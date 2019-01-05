class Contact < MailForm::Base
	attribute  :first_name, 	 :validate => true
	attribute  :last_name, 		 :validate => true
	attribute  :email,	 :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :message, :validate => true
  
	def headers 
		{
			:subject => "Contact Form",
			:to => "support@relyapply.com",
			:from => %("#{first_name} #{last_name}" <#{email}>)
		}
	end	
end