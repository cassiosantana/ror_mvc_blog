class CommentsController < ApplicationController
  before_action :set_article

  def create
    # salva no artigo um comentário. não foi adicionado nenhuma variável pois ela não teria utilidade visto que,
    # precisamdos apenas do ato de salvar o comentário.
    @article.comments.create(comment_params.to_h.merge!({ user_id: current_user.id }))
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end