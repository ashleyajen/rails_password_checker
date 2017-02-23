class PasswordController < ApplicationController
  def check
    @username = params[:username] unless params[:username].nil?
    @password = params[:password] unless params[:password].nil?

    special = "?<>',?[]}{=-)(*&^%$#`~{}"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/

    if (@username.nil?) || (@username.length < 6) || (@username =~ regex) || (@username == @password)
      flash.now[:alert] = "Your username credentials are invalid, try again. "
    elsif
     flash.now[:notice] = "Your username credentails are valid. "
   end
    if(@password.nil?) || (@password.length < 6) || !(@password =~ regex) || (@username == @password)
      flash.now[:alert] = flash.now[:alert].to_s + " Your password credentials are invalid, try again."
    elsif
      flash.now[:notice] = flash.now[:notice].to_s + " Your password credentails are valid."
  end
   render('check.html.erb')
  end
end
