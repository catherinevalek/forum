PgSearch.multisearch_options = {
	:kinda_matching,
	:search_any_word,
  using: { 	
  	tsearch: { any_word: true, 
  						 highlight: {
                        StartSel: '<b>',
                        StopSel: '<b>',
                        FragmentDelimiter: '&hellip;'
                        HighlightAll: true
                         } 
                       }
}