class BlogsController < ApplicationController
	def new
        @blog = Blog.new
	end

	def create
      @blog = Blog.new(permit_params)
      if @blogs.save
        redirect_to root_path
      end
  end

  def index
    @current_blog = Blog.find_by(current_version: true)
    @blogs =  Blog.where.not(current_version: true)
  end
  def edit
   @blog = Blog.find(params[:id])
  end

  def update
   @blog = Blog.find(params[:id])
    @blog.update!(title: params["blog"]["title"], content: params["blog"]["content"]) 
   
    # blog.update_version(blog)
    redirect_to root_path
   
  end

  def content

    current_blog = Blog.find_by(id: params[:content])
    second_blog = Blog.find_by(id: params[:format])
    @difference = current_blog.compare_blog(second_blog)
    
  end

  private
    
    def permit_params
     params.require(:blog).permit(:title, :content)

    end

end
