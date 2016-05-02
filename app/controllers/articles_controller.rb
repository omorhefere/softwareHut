class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  authorize_resource
  def index
     @articles = Article.all
     if @articles.count<1
        @sticky_footer = true
     end
  end

  def show
  end



  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text,:avatar)
  end
end
