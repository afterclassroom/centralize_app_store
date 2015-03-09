Forem::ApplicationHelper.class_eval do
	def forem_pages_widget(collection, options={})
      if collection.num_pages > 1
        if options.empty?
        	content_tag :div, :class => 'pages' do
        		(forem_paginate(collection)).html_safe
        	end
        else
        	content_tag :div, :class => 'pages' do
        		(forem_paginate(collection, options)).html_safe
        	end
        end
      end
    end
end