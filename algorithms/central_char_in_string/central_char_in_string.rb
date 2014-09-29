# @param String str
# @param consider_spaces
# return string
def central_char_in_string str, consider_spaces = false
  str.gsub!(' ', '') unless consider_spaces

  return str[str.length / 2]
end

p central_char_in_string "a plus b were sitting on the tube ccqwerttytytytytytyty"