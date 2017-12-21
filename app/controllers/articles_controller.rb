class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "park", password: "park", except: [:index, :show]

  def index
    @articles = Article.select("id,title,text")
                    .by_title(params[:title])
    # .by_text(params[:text])

    # render json: {
    # articles: articles
    # }
    # render :json => @article
  end

  def list
    # @articles = Article.where('title' => 'oooooo')
    articles = Article
                   .by_title(params[:title])
                   .by_text_not_blank(params[:text])
    article_list = []
    articles.each do |article|
      article_list << {:key => article.id, :value => article.title}
    end
    render json: {article_list: article_list}
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
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
