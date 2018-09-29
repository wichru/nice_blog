module LikesHelper
  def like_destroy_link(article, like)
    link_to article_like_path(article, like), method: :delete, remote: true do
    fa_icon('thumbs-up') + 'Like'
    end
  end

  def like_create_link(article)
    link_to article_likes_path(article), method: :post, remote: true do
    fa_icon('thumbs-up') + 'Like'
    end
  end
end
