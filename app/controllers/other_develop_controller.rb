class OtherDevelopController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    user = User.new(develop_param)
    if user.save
      render json: { result: true, user: user.attributes }
    else
      render json: { result: false }
    end
  end

  private

  def develop_param
    params[:user].permit(:name)
  end
end
