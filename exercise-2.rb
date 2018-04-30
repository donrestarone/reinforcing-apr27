def check_syntax(str)
  open_html = "<html>"
  close_html = "</html>"

  openables = {
    "(" => ")",
    "[" => "]",
    "{" => "}",
  }
  open = []

  opening_chars = openables.keys
  closing_chars = openables.values
  
#solution for html
    html = []

    if str.include?(open_html) || str.include?(close_html)
        p "html detected"
      if str.include?(open_html)
        html << open_html
      elsif str.include?(close_html)
        html << close_html
        if html.include?(open_html) && html.include?(close_html)
          html.pop

    else 
      p 'error'
        end
      end
      return html
    end 
##############
  str.each_char do |char|

    if opening_chars.include?(char) # opening bracket

      open << char

    elsif closing_chars.include?(char) # closing bracket

      required_char = openables[open.last]

      if char == required_char # it's the right kind of closing bracket

        open.pop

      else 

        if open.any? # it's the wrong kind of closing bracket
          offender = open.last.to_s
          missing = openables[offender]
          puts "* You have a syntax error: there is an unexpected #{char} where there should be a #{missing} "
        else # there's nothing to close
          
          puts "* You have a syntax error: there is an unexpected #{char} where there is nothing to close."
        end

        return false

      end

    end
  end

  if open.any?
    required_char = openables[open.last]
    puts "* You have a syntax error: the string ended without a closing #{required_char}"
  end

  return open.empty? 
end

# puts check_syntax("<html> (this)[] is some text</html>")
# puts check_syntax("<html> (this)] is some text</html>")
# puts check_syntax("<html> [(this] is some text</html>")
# puts check_syntax("<html> [this][ is some text</html")


# puts check_syntax("<html> [this] is some text</html")

puts check_syntax("<html>foo</html")

puts check_syntax("<htmlfoo</html>")
# puts check_syntax("[(this] is some text")



# puts check_syntax("[this][ is some text")


#puts check_syntax("(this)[] is some text")
# puts "*****"
# puts check_syntax("(this)] is some text")
# puts "*****"
# puts check_syntax("[(this] is some text")
# puts "*****"
# puts check_syntax("[this][ is some text")
# puts "*****"
# puts check_syntax("[this] is some text")