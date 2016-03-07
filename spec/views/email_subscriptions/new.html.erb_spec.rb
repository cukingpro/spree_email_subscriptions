require 'rails_helper'

RSpec.describe "email_subscriptions/new", type: :view do
  before(:each) do
    assign(:email_subscription, EmailSubscription.new())
  end

  it "renders new email_subscription form" do
    render

    assert_select "form[action=?][method=?]", email_subscriptions_path, "post" do
    end
  end
end
