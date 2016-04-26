class PagesController < ApplicationController

  def zero_failures
    @current_nav_identifier = :home
    @projects = Project.all
    if @projects.joins(:category).where("name LIKE ?", "Zero Failures").count<3
       @sticky_footer = true
    end
    @current_nav_identifier = :home
  end

  def rre
    @current_nav_identifier = :home
    @projects = Project.all
    if @projects.joins(:category).where("name LIKE ?", "Resource,Recovery and Efficiency").count<3
       @sticky_footer = true
    end
    @current_nav_identifier = :home
  end

  def bip
    @current_nav_identifier = :home
    @projects = Project.all
    if @projects.joins(:category).where("name LIKE ?", "Buried Infrastructure Performance").count<3
       @sticky_footer = true
    end
    @current_nav_identifier = :home
  end

  def contact
    @current_nav_identifier = :contact
    @sticky_footer=true
  end

  def introduction
    @current_nav_identifier = :introduction
    @sticky_footer=true
  end

  def aims
    @current_nav_identifier = :aims
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
