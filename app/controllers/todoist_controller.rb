class TodoistController < ApplicationController
  def oauth_request
    redirect_to "https://todoist.com/oauth/authorize?client_id=05785ef32b24472e82f89e25bc018f32&state=0daef4fc6f3b47289a4b4efe4a945781&scope=data:read_write"
  end

  def oauth_response
    if params[:error].present?
      redirect_to root_path, error: params[:error]
    else
      session[:code] = params[:code]
      redirect_to root_path(state: params[:state])
    end
  end
end
