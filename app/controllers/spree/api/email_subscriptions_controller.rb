module Spree
  module Api

    class EmailSubscriptionsController < Spree::Api::BaseController
      before_action :authenticate_user, :except => [:index, :show, :update, :create, :confirm_subscription, :unsubscribe]

      # GET /email_subscriptions
      def index
        @email_subscriptions = Dish::EmailSubscription.all
        render "spree/api/email_subscriptions/index"
      end

      # GET /email_subscriptions/1
      def show
        @email_subscriptions = Dish::EmailSubscription.find(params[:id])
        render "spree/api/email_subscriptions/show"
      end

      # POST /email_subscriptions
      def create
        if Dish::EmailSubscription.exists?(email: params[:email], is_active: true)
          @status = [ { "messages" => "Email subscription was already subscribed"}]
        else
          if @email_subscription = Dish::EmailSubscription.find_or_create_by(email: params[:email])
            EmailSubscriptionMailer.confirm_subscription_email(@email_subscription).deliver
            @status = [ { "messages" => "Email subscription was successfully created"}]
          else
            @status = [ { "messages" => "Email subscription was not successfully created"}]
          end
        end
        render "spree/api/logger/log", status: 201
      end

      def confirm_subscription
        @email_subscription = Dish::EmailSubscription.find_by!(email_confirm_subscription_params)

        if @email_subscription.email_activate
          EmailSubscriptionMailer.thankyou_email(@email_subscription).deliver
          @status = [ { "messages" => "Email subscription was successfully confirmed"}]
        else
          @status = [ { "messages" => "Email subscription was not successfully confirmed"}]
        end
        render "spree/api/logger/log", status: 200
      end

      def unsubscribe
        @email_subscription = Dish::EmailSubscription.find_by!(email_confirm_unsubscription_params)

        if @email_subscription.email_deactivate
          EmailSubscriptionMailer.unsubscribe_email(@email_subscription).deliver
          @status = [ { "messages" => "Email subscription was successfully destroyed"}]
        else
          @status = [ { "messages" => "Email subscription was not successfully destroyed"}]
        end
        render "spree/api/logger/log", status: 200
      end

      # Only allow a trusted parameter "white list" through.
      # def email_subscription_params
      #   params.require(:email_subscription).permit(:email, :is_active)
      # end

      private

      def email_confirm_unsubscription_params
        params.require(:email_confirm_unsubscription).permit(:id, :confirm_unsubscription_token)
      end

      def email_confirm_subscription_params
        params.require(:email_confirm_subscription).permit(:id, :confirm_subscription_token)
      end


    end
  end
end
