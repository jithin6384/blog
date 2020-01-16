
class Blog < ApplicationRecord
	# def update_version(blog)
	# 	Blog.where.not(id: id).update_all(current_version: false)
 #    end

    def compare_blog(blog)
      @aa=[]
        doc1 = Nokogiri::HTML(content)
      doc2 = Nokogiri::HTML(blog.content)
      doc2.diff(doc1) do |change,node|
	       
        a="#{change} #{node.to_html}".ljust(30) + node.parent.path
       @aa << a
       
       	
       end
      return @aa
    end
end
