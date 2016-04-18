class PagesController < ApplicationController

  def home
    @current_nav_identifier = :home
  end

  def add_project
    @current_nav_identifier = :add_new_project
  end

  def zero_failures
    @current_nav_identifier = :home
    @projects = Project.all
  end

  def rre
    @current_nav_identifier = :home
    @projects = Project.all
  end

  def bip
    @current_nav_identifier = :home
    @projects = Project.all
  end

  def show
  end

  def contact
    @current_nav_identifier = :contact
    @sticky_footer=true
  end

  def forgot_password
    @disabled_nav = true
    @sticky_footer=true
  end

  def admin
    @sticky_footer=true
    @current_nav_identifier = :admin
  end

  def registration
  end

  def users
    @disabled_nav = true
    @sticky_footer=true
  end

  def new_password
    @disabled_nav = true
    @sticky_footer=true
  end

  def projects
    @current_nav_identifier = :home
  end
end
