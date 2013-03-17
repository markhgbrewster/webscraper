class WebscraperController < ApplicationController
 def new
   
   @input = params[:search]
      a = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
    
    a.get('http://google.com/') do |page|
      search_result = page.form_with(:id => 'gbqf') do |search|
        search.q = @input
      end.submit
      @array = []
      search_result.links_with(:class => 'l').each do |link|
         @array << link.text
        
      end
    end
      
     end
  end
