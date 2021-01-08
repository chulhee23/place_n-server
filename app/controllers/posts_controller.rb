class PostsController < ApplicationController
  def index
    @posts = Post.all
    json_response(@posts)
  end
end
