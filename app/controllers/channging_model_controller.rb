class ChanngingModelController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    name_param = develop_param[:name]

    # 内容によって振り分けるDBを変更する
    user = if name_param == 'develop_db_model'
             User.new(develop_param)
           elsif name_param == 'other_db_model'
             OtherDb::User.new(develop_param)
           end

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
