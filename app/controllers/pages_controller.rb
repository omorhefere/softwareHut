class PagesController < ApplicationController

  def home
    @current_nav_identifier = :home
  end

  def add_project
    @current_nav_identifier = :add_new_project
    $user_logged_in = false
  end

  def log_in_out
    @current_nav_identifier = :log_in_out
    @disabled_nav = true
    @sticky_footer=true
    $user_logged_in = true
  end

  def zero_failures
    @current_nav_identifier = :home
    $user_logged_in = false
  end

  def rre
    @current_nav_identifier = :home
    $user_logged_in = false
  end

  def bip
    @current_nav_identifier = :home
    $user_logged_in = false
  end

  def show
    $user_logged_in = false
  end

  def contact
    @current_nav_identifier = :contact
    @sticky_footer=true
    $user_logged_in = false
  end

  def forgot_password
    @disabled_nav = true
    @sticky_footer=true
    $user_logged_in = false
  end

  def registration
    @current_nav_identifier = :registration
    @disabled_nav = true
    @sticky_footer = true
  end

  def admin
    @sticky_footer=true
    @current_nav_identifier = :admin
    $user_logged_in = false
  end

  def new_password
    @disabled_nav = true
    @sticky_footer=true
  end

end
