module ApplicationHelper
    
    def markdown(text)
      options = {
      filter_html:     true,
      hard_wrap:       true, 
      no_styles: true,
      space_after_headers: true, 
      prettify:true
    }

      extensions = {
      autolink:           true,
      no_intra_emphasis: true,
      highlight: true,
      gh_blockcode: true,
      quote: true,
      fenced_code_blocks: true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

        renderer = Redcarpet::Render::HTML.new(options)
        markdown = Redcarpet::Markdown.new(renderer, extensions)
        
        markdown.render(text).html_safe
    end
end
