require 'rails_helper'

RSpec.describe "email_subscriptions/index", type: :view do
  before(:each) do
    assign(:email_subscriptions, [
      EmailSubscription.create!(),
      EmailSubscription.create!()
    ])
  end

  it "renders a list of email_subscriptions" do
    render
  end
end
