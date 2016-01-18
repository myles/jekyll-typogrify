require "jekyll/typogrify/version"

require 'typogruby'
require 'titlecase'
require 'liquid'

module Jekyll
  module TypogrifyFilter
    # converts a & surrounded by optional whitespace or a non-breaking space
    # to the HTML entity and surrounds it in a span with a styled class.
    #
    # @param [String] text input text
    # @return [String] input text with ampersands wrapped
    def amp(text)
      return Typogruby.amp(text.to_s)
    end
    
    # surrounds two or more consecutive capital letters, perhaps with
    # interspersed digits and periods in a span with a styled class.
    #
    # @param [String] text input text
    # @return [String] input text with caps wrapped
    def caps(text)
      return Typogruby.caps(text.to_s)
    end
    
    # Converts special characters (excluding HTML tags) to HTML entities.
    #
    # @param [String] text input text
    # @return [String] input text with all special characters converted to
    #   HTML entities.
    def entities(text)
      return Typogruby.entities(text.to_s)
    end
    
    # main function to do all the functions from the method.
    #
    # @param [String] text input text
    # @return [String] input text with all filters applied
    def improve(text)
      return Typogruby.improve(text.to_s)
    end
    
    # encloses initial single or double quote, or their entities
    # (optionally preceeded by a block element and perhaps an inline element)
    # with a span that can be styled.
    #
    # @param [String] text input text
    # @return [String] input text with initial quotes wrapped
    
    def initial_quotes(text)
      return Typogruby.initial_quotes(text.to_s)
    end
    
    # Applies smartypants to a given piece of text
    # 
    # @see https://rubygems.org/gems/rubypants
    # @param [String] text input text
    # @return [String] input text with smartypants applied
    def smartypants(text)
      return Typogruby.smartypants(text.to_s)
    end
    
    # replaces space(s) before the last word (or tag before the last word)
    # before an optional closing element (<tt>a</tt>, <tt>em</tt>,
    # <tt>span</tt>, strong) before a closing tag (<tt>p</tt>, <tt>h[1-6]</tt>,
    # <tt>li</tt>, <tt>dt</tt>, <tt>dd</tt>) or the end of the string.
    #
    # @see http://mucur.name/posts/widon-t-and-smartypants-helpers-for-rails
    # @see http://shauninman.com/archive/2006/08/22/widont_wordpress_plugin
    # @param [String] text input text
    # @return [String] input text with non-breaking spaces inserted
    def widont(text)
      return Typogruby.widont(text.to_s)
    end
    
		# convert a given piece of text to titlecase
    def titlecase(text)
      return text.to_s.titlecase
    end
  end
end

Liquid::Template.register_filter(Jekyll::TypogrifyFilter)
