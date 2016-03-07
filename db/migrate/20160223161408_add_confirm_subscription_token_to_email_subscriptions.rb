class AddConfirmSubscriptionTokenToEmailSubscriptions < ActiveRecord::Migration
  def change
  	add_column :email_subscriptions, :confirm_subscription_token, :string
  end
end
