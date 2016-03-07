class AddConfirmUnsubscriptionToken < ActiveRecord::Migration
  def change
  	add_column :email_subscriptions, :confirm_unsubscription_token, :string
  end
end
