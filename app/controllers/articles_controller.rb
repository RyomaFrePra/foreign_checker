class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_stp)
    redirect_to root_path
  end

  def article_stp
    params.require(:article).permit(:title,:content).merge(user_id: current_user.id)
  end
end
