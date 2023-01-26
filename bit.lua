-- purely for compatability's sake

return {
	arshift = function(a,b) return a >> b end,
	band = function(c, ...)
		for i=1,select('#', ...) do
			c = c & select(i, ...)
		end
		return c
	end,
	bnot = function(a) return ~a end,
	bor = function(c, ...)
		for i=1,select('#', ...) do
			c = c | select(i, ...)
		end
		return c
	end,
	btest = function(c, ...)
		for i=1,select('#', ...) do
			c = c & select(i, ...)
		end
		return c ~= 0
	end,
	bxor = function(c, ...)
		for i=1,select('#', ...) do
			c = c ~ select(i, ...)
		end
		return c
	end,
	extract = function(n, field, width)
		width = width or 1
		return (n >> field) & ((1 << width) - 1)
	end,
	replace = function(n, v, field, width)
		width = width or 1
		local mask = (1 << width) - 1
		n = n & ~(mask << field) | ((v & mask) << field)
		return n
	end,
	-- from https://stackoverflow.com/questions/10134805/bitwise-rotate-left-function
	lrotate = function(a,b)
		return (a << b) | (a >> (64 - b))
	end,
	lshift = function(a,b)
		return a << b
	end,
	-- from https://stackoverflow.com/questions/10134805/bitwise-rotate-left-function
	rrotate = function(a,b)
		return (a >> b) | (a << (64 - b))
	end,
	rshift = function(a,b)
		return a >> b
	end,
}
