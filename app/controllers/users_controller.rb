#coding=utf-8
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @schedules = Schedule.where(:user_id => @user.id).order('updated_at desc').group(:book_id).includes([:book]).all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user] = @user
      redirect_to request.env["HTTP_REFERER"] || root_url, :notice => '注册成功！'
    else
      render :new
    end
  end
  def destroy
    session[:user] = nil
    redirect_to request.env["HTTP_REFERER"] || root_url, :notice => "已成功退出系统！"
  end
  def login
    @user = User.new(params[:user])
    user = User.where(:email => @user.email, :password => Digest::SHA512.hexdigest(@user.password || '')).first
    if user
      session[:user] = user
      redirect_to params[:return] || root_url, :notice => "登录成功！"
    else
      @user.errors[:account] = '用户名或密码错误！' unless @user.email.nil?
    end
  end
end