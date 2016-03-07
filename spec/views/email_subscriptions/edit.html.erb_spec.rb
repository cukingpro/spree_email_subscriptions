require 'rails_helper'

RSpec.describe "email_subscriptions/edit", type: :view do
  before(:each) do
    @email_subscription = assign(:email_subscription, EmailSubscription.create!())
  end

  it "renders the edit email_subscription form" do
    render

    assert_select "form[action=?][method=?]", email_subscription_path(@email_subscription), "post" do
    end
  end
end
