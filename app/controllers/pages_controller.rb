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

  def introduction
    @current_nav_identifier = :introduction
    @sticky_footer=true
  end


  def projects
  end
end
