class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to '/console',
          notice: "Your information was successfully updated."
        }
      else
        format.html { redirect_to '/console/profile',
          notice: "There was an error, please try again."
        }
      end
    end
  end

  private
  def user_params
    if params[:user]
      params.require(:user).permit(
        :username, :first_name, :last_name, :email, :pivotal_api_key)

    e = Client::Encrypt_Decrypt.new
    encrypt_tracker_key = e.encrypt(params[:user][:pivotal_api_key])
      {
        pivotal_api_key: encrypt_tracker_key
      }
    end
  end
end
