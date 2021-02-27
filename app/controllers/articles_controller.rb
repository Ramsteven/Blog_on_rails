class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index 
    @articles =  Article.paginate(page: params[:page], per_page: 3)
  end

  def new
    @article = Article.new
  end

  def show
  end

  def create
    @article = Article.new(set_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = "Welcome your article was created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(set_params) 
      flash[:notice] =  "Article was updateded successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to @article
  end

  private

  def set_article 
    @article = Article.find(params[:id])
  end

  def set_params
    params
    .require(:article)
    .permit(:title, :content)
  end

  def require_same_user
    if current_user != @article.user
      flash[:alert] = "You can only edit or delete your own articles"
      redirect_to @article
    end
  end

end