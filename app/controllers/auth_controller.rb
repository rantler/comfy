class AuthController < ApplicationController

  layout 'application'

  def login
    render :template => 'auth/login'
  end

  def signup
    render :template => 'auth/signup'
  end

end
