class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Article crée avec succes !"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Article mis a jour !"
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "Article supprimé!"
  end

  private

  def set_article
    @article = Article.find_by(id: params[:id])
    redirect_to articles_path, alert: "Article introuvable" if @article.nil?
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
