class SearchController < ApplicationController
	def index
		@pg_search_documents = PgSearch.multisearch(params[:query]).with_pg_search_highlight
		# binding.pry
		p @pg_search_documents
	end
end