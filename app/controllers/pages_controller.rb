class PagesController < ApplicationController

  #ZF filter page
  def zero_failures
    @current_nav_identifier = :home
    @projects = Project.all
    if @projects.joins(:category).where("name LIKE ?", "Zero Failures").count<2
       @sticky_footer = true
    end
    @current_nav_identifier = :home
  end

  #rre filter page
  def rre
    @current_nav_identifier = :home
    @projects = Project.all
    if @projects.joins(:category).where("name LIKE ?", "Resource,Recovery and Efficiency").count<2
       @sticky_footer = true
    end
    @current_nav_identifier = :home
  end

  #BIP filter page
  def bip
    @current_nav_identifier = :home
    @projects = Project.all
    if @projects.joins(:category).where("name LIKE ?", "Buried Infrastructure Performance").count<2
       @sticky_footer = true
    end
    @current_nav_identifier = :home
  end

  #Introduction page
  def introduction
    @current_nav_identifier = :introduction
    @sticky_footer=true
  end


  def projects
  end
end
