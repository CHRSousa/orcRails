class SessionsController < ApplicationController
   def create  
   	  @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
         sign_in
         redirect_to @user
      else
         render action: :new
      end
   end

   def destroy
     sign_out
  	  redirect_to root_url
   end
end
