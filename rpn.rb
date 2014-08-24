class RPNCalculator
	def evaluate(str)
		array = str.split

		while array.size > 1
			i = array.find_index { |n| %w(+ - * /).include?(n) }

			array[i-2..i] = eval("#{array[i-2]} #{array[i]} #{array[i-1]}")
		end
		print "#{array.first}\n" + show_prompt
	end

	def show_prompt
		">\u00a0"
	end
end

calc = RPNCalculator.new

print "\e[H\e[2J" + calc.show_prompt # Clear screen + add prompt

loop do
	input = gets

	break if ["exit\n", "quit\n"].include?(input)
	
	calc.evaluate(input)
end 
