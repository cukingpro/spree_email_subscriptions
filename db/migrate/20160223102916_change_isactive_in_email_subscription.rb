class ChangeIsactiveInEmailSubscription < ActiveRecord::Migration
  def change
	change_column :email_subscriptions, :is_active, :boolean, default: false
  end
end
