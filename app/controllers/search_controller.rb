class SearchController < ApplicationController
	def index
		@post_search_documents = PgSearch.multisearch(params[:query]).where(:searchable_type => "Post").with_pg_search_highlight
		@comment_search_documents = PgSearch.multisearch(params[:query]).where(:searchable_type => "Comment").with_pg_search_highlight
	  # p "postssssssssss"
	  # p @post_search_documents
	  # p "commentssssssssss"
	  # p @comment_search_documents
	end
end