# Copyright (C) 2007, 2008, 2009, 2010, 2011 The Collaborative Software Foundation
#
# This file is part of TriSano.
#
# TriSano is free software: you can redistribute it and/or modify it under the terms of the
# GNU Affero General Public License as published by the Free Software Foundation, either 
# version 3 of the License, or (at your option) any later version.
#
# TriSano is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
# See the GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License along with TriSano. 
# If not, see http://www.gnu.org/licenses/agpl3.0.txt.

class UserSessionsController < ApplicationController
  reloadable!

  skip_before_filter :load_user, :only => [:new, :create]
  prepend_before_filter :destroy_session, :only => [:new, :create]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save

      # Because authlogic thinks MySQL's choice to ignore case sensistivity in queries,
      # we as Postgres users must search for user names using this little gem.  Please see:
      # http://rdoc.info/github/binarylogic/authlogic/Authlogic/ActsAsAuthentic/Login/Config#find_by_smart_case_login_field-instance_method
      @user = User.find_by_smart_case_login_field(params[:user_session][:user_name])
      
      if @user.password_expired?
        flash[:notice] = "Your password has expired. Please set the new password in order to proceed."
        render :template => "user_sessions/change"
      else
        flash[:notice] = "Successfully logged in."

        if @user.password_expires_soon?
          days_to_expiry = @user.password_last_updated.mjd - config_options[:trisano_auth][:password_expiry_date].days.ago.to_date.mjd
          flash[:notice] += "<br/> Your password will expire in #{days_to_expiry} days. Please, click <a href='#{ change_password_path }'>here</a> to change it."
        end
        redirect_to home_url
      end
    else
      render :action => 'new'
    end
  end

  def change
    @user = User.current_user
    if request.put?
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]
      @user.password_last_updated = Date.today
      @user.current_password = params[:current_password]
      if @user.save
        Rails.logger.info "Successfully reset password for #{@user.inspect}"
        flash[:notice] = "Password successfully updated"
        redirect_to home_url
      end
    end
  end

  def destroy
    User.current_user = nil
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to login_url
  end


  protected

  def destroy_session
    User.current_user = nil
    @user_session.try(:destroy)
  end
end
