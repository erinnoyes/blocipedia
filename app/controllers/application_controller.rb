class ApplicationController < ActionController::Base

  include Pundit
    protect_from_forgery with: :exception


    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
      flash[:alert] = "You are not authorized to do this."
      redirect_to(request.referrer || root_path)
    end

    def revert_users_wikis_to_public
      current_user.wikis.each do |wiki|
        wiki.update_attribute(:private, false)
      end
    end

end
