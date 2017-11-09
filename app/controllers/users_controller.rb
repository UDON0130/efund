class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:top, :show, :edit, :update]}
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
    
  end
  
  def create
    @user = User.new(name: params[:name], email: params[:email],password: params[:password])
    
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end
  
  # editアクションを作成してください
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  # login_formアクションを追加してください
  def login_form
  end
  
  # loginアクションを追加してください
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
       # 変数sessionに、ログインに成功したユーザーのidを代入してください
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/top")
    else
      # @error_messageを定義してください
      @error_message = "メールアドレスまたはパスワードが間違っています"
      
      # @emailと@passwordを定義してください
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
  
   def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/top")
  end
end