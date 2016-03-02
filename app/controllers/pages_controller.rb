class PagesController < ApplicationController

  def home
    @current_nav_identifier = :home
  end

  def add_project
    @current_nav_identifier = :add_new_project
  end

  def log_in_out
    @current_nav_identifier = :log_out
  end

  def show
  end
end
