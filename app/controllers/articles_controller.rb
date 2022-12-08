class ArticlesController < ApplicationController
    def edit
        @post = Article.find(params[:id])
    end


    def update
        @post = Article.find(params[:id])
        if @post.update article_params
            redirect_to @post
        else
            @error = @post.errors.full_messages
            render action: 'edit'
        end
    end

    def destroy
        @post = Article.find(params[:id]).delete
        redirect_to articles_path
    end




    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all.order(created_at: :desc)
    end

    def new
        
    end

    def create
        @article = Article.new article_params
        if @article.save
            redirect_to @article
        else
            render action = 'new'
        end

    end
    private

    def article_params 
        params.permit(:title, :text)    
    end
end