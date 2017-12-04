class UserController < ApplicationController  
  def salt
       @salt = "barbieri"
  end

  def hashed_password= password
      @hashed_password = password
  end

  def verify
     Rails.logger.debug(params[:username])
     @users = User.find_by('usuario' => params[:username])
     Rails.logger.debug(params[:username])
     Rails.logger.debug(self.create(params[:password]))
     unless @users.nil?
          if @users.password == self.create(params[:password])
              session[:user] = @users
              redirect_to url_for(:controller => 'contratos', :action => 'index')
              return     
          end
     end
     redirect_to url_for(:controller => 'plainlogin', :action => 'login')

  end

  def create(submitted_password)
    self.hashed_password = Digest::SHA2.hexdigest(self.salt + submitted_password)
  end

  def new
    @users = User.new
  end

end
