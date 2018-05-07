class UsersController < ApplicationController
  def downgrade
    if current_user.standard!
      current_user.wikis.update_all(public: true)
      flash[:notice] = "Your account has been downgraded. You are now a Standard member."
    else
      flash[:notice] = "Something went wrong. Please try again."
    end
    redirect_to users_show_path
  end

  def show
    @wikis = Wiki.where(user_id: current_user.id)
  end
end
