
def leap_year?(year)
	multiple?(year, 100) ? multiple?(year, 400) : multiple?(year, 4)
end

def multiple?(year, divisor)
	year % divisor == 0
end

SECONDS_IN_A_YEAR = 1.0 * 60 * 60 * 24 * 365 # 31536000.0

def seconds_in_year(seconds)
	format_as_percentage((seconds / SECONDS_IN_A_YEAR) * 100)
end

def format_as_percentage(n)
	'%.1f' % n + '%'
end

def standard_to_military(standard)
	a, b = standard.split(":")
	c, d = b.split(" ")
	e = nil

	if d.downcase != 'am'
		if a.to_i == 12
			add_two(a, c, e)
		else
			e = (a.to_i + 12).to_s + ":" + c
		end
	elsif d.downcase != 'pm'
		if a.to_i == 12
			e = (a.to_i - 12).to_s + ":" + c
		else
			add_two(a, c, e)
		end
	end
	return e
end

def add_two(x, y ,z)
	z = x + ":" + y
end

def am_or_pm(military)
	a, b = military.split(":")
	c = ""

	if a.to_i < 12
		c = add_numbers(a, b) + " am"
	else
		c = add_numbers(a, b) + " pm"
	end

	return c
end

def add_numbers(a, b)
	a + b
end

def in_trouble?(time, parents_home)
	trouble = false
	if (time.split(":")[0].to_i >= 8 && parents_home)
		trouble = false
	elsif (time.split(":")[0].to_i >= 10 && !parents_home) && (time.split(":")[1].split(" ")[1] == 'pm')
		trouble = false
	else
		trouble = true
	end
	return trouble
end

def span(a, b)
	c = 0
	d = 0
	if a < b
		c = b
		d = a
	else
		c = a
		d = b
	end

	return ('%.1f' % (seconds_in_year(c)[0..-2].to_f - seconds_in_year(d)[0..-2].to_f)).to_s + '%'
end
