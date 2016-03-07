require 'rails_helper'

RSpec.describe "email_subscriptions/show", type: :view do
  before(:each) do
    @email_subscription = assign(:email_subscription, EmailSubscription.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
