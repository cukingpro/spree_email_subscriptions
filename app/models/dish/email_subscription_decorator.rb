Dish::EmailSubscription.class_eval do
	before_create :confirmation_token

	def self.daily_email
		Dish::EmailSubscription.find_each do |email_subscription|
			if email_subscription.is_active
				EmailSubscriptionMailer.daily_email(email_subscription).deliver
			end
		end
	end

	def confirmation_token
    if self.confirm_subscription_token.blank?
      self.confirm_subscription_token = SecureRandom.urlsafe_base64.to_s
    end
  end

  def email_activate
    self.is_active = true
    self.confirm_subscription_token = nil
    self.confirm_unsubscription_token = SecureRandom.urlsafe_base64.to_s
    save!(:validate => false)
  end

  def email_deactivate
  	self.is_active = false
    self.confirm_unsubscription_token = nil
    self.confirm_subscription_token = SecureRandom.urlsafe_base64.to_s
  	save!(:validate => false)
  end

end