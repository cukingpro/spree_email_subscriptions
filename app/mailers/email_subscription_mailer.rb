class EmailSubscriptionMailer < ApplicationMailer

  def thankyou_email(email_subscription)
    @email_subscription = email_subscription
    set_unsubscribe_url(email_subscription)

    mail to: email_subscription.email, subject: "Thank you for subscribing"
  end

  def daily_email(email_subscription)

    @email_subscription = email_subscription
    @products = Spree::Product.products_on_date(Date.today)
    set_unsubscribe_url(email_subscription)

    mail to: email_subscription.email, subject: "Daily dishes"
  end

  def confirm_subscription_email(email_subscription)
    @email_subscription = email_subscription
    set_subscribe_url(email_subscription)

    mail to:email_subscription.email, subject: "Confirm subscription"
  end

  def unsubscribe_email(email_subscription)
    @email_subscription = email_subscription
    set_subscribe_url(email_subscription)

    mail to:email_subscription.email, subject: "Unsubscription"
  end

  

  def set_unsubscribe_url(email_subscription)
    @unsubscribe_url = DOMAIN+"/confirm_unsubscrition?id=#{email_subscription.id}&token=#{email_subscription.confirm_unsubscription_token}"
  end

  def set_subscribe_url(email_subscription)
    @subscribe_url = DOMAIN+"/confirm_subscrition?id=#{email_subscription.id}&token=#{email_subscription.confirm_subscription_token}"
  end


end
