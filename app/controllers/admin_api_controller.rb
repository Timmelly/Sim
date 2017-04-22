class AdminApiController < ApplicationController
  before_filter :check_token

  def computer_states
	@computer=Computer.find(params[:computer_id])
	result = {}
	result[:computer_ip] = @computer.ip
	result[:computer_mac] = @computer.mac
	result[:computer_name] = @computer.name
	result[:computer_status] = @computer.computer_status
	render json: [result]
	
  end

  def screenshot
  end

  def reboot
    respond_to do |format|
      format.json do
		@computer=Computer.where(ip: params[:ip]).first
		if @computer.blank? or @computer.computer_status.status!=1
		  render json: [false]
		else 
		  @computer.computer_status.users={users: []}
		  @computer.computer_status.save
		  render json: [true]
		end
	  end
	end
  end

  def user_info
	@user = User.find(params[:user_id])
	result = {}
	result[:user_login] = @user.login
	result[:user_is_blocked] = @user.is_blocked
	result[:user_role] = @user.role
	result[:user_info] = @user.info

	
	render json: [result]
  end

    # Изменение пароля
    def change_password
		@user = User.find(params[:user_id])
		if params[:old_password]==@user.password&&params[:new_password]==params[:new_password_confirmation]
		  @user.password=params[:new_password]
		  @user.save
		  @result = 'Пароль изменён!'
		else @result = 'Неправильный пароль!'

		end
     	render json: [@result]
    end

  def logout
	@computer=Computer.find(params[:computer_id])
	@user = User.find(params[:user_id])
    # raise @computer.computer_status.users.inspect
    if (u = @computer.computer_status.users["users"].find{ |x| x["user_login"] == @user.login })
      @computer.computer_status.users["users"].delete(u)
      @result = 'Пользователь разлогинин!'
    else
      @result = 'Пользователь не был в сети!'
    end

 	render json: [@result]
  end

  def user_block
		@user = User.find(params[:user_id])
		@user.is_blocked=true
		@user.save
		@result = 'Пользователь заблокирован!'
     	render json: [@result]
  end

  def user_proccesses

  end

  def check_token()
    @token = Token.where(api_action: action_name).where("date_end > ?", Date.today()).where(token: params[:token]).all
    raise 'Bad token!' if @token.size == 0
  end
end
