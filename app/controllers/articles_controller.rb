class ArticlesController < ApplicationController
  # A frequent practice is to place the standard CRUD actions
  # in each controller in the following order: index, show, new, edit, create, update and destroy.
  def index
    @articles = Article.all
  end

  # @article is an instance variable to hold a reference to the article object.
  # Rails pass all instance variables to the view. In this case, to the view show.html.erb
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  # The render method here is taking a very simple hash with a key of plain and value of params[:article].inspect.
  #  The params method is the object which represents the parameters (or fields) coming in from the form.

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render "new"
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end



  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
