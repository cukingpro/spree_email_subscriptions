object false
node(:count) { @email_subscriptions.count }
child(@email_subscriptions => :email_subscriptions) do
  extends "spree/api/email_subscriptions/show"
end

