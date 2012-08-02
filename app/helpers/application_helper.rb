module ApplicationHelper
   def markdown(text)
    renderer = PygmentizeHTML
    extensions = { :fenced_code_blocks => true }
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    redcarpet.render(text).html_safe
  end

  class PygmentizeHTML < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygmentize.process(code, language)
    end
  end
end
