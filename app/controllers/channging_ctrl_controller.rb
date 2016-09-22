class ChanngingCtrlController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    user = User.new(develop_param)

    # 内容によって振り分けるDBを変更する
    # 一度変更すると、２回めのアクセスでも同じDBを参照してしまうので処理に注意が必要
    # DB接続設定が前回と一緒だったら変更しないようにする
    if user.name == 'develop_db'
      User.establish_connection Rails.env unless env_db?
    elsif user.name == 'other_db'
      User.establish_connection :other_development if env_db?
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

  # 実行環境のDB接続設定と現在のDBコネクションのDB設定が同じかチェック
  def env_db?
    normal_db_name = ActiveRecord::Base.configurations[Rails.env.to_s]['database']
    # mysqlやpostgresの場合
    # normal_db_name == User.connection.current_database

    # sqlite3の場合
    normal_db_name == User.connection.instance_variable_get(:@config)[:database].split('/').last(2).join('/')
  end
end
