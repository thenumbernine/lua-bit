-- purely for compatability's sake
local bit
bit = {
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

	-- my attempt at compat with luajit's bit library:
	tobit = function(x)
		x = bit.band(0xffffffff, x)
		if x > 0x7fffffff then return x - 0x100000000 end	-- needed in lua5.4? i should test this...
		return x
	end,
	tohex = function(x, len)
		len = len or 8
		return ('%0'..len..'x'):format(x):sub(-len)
	end,
	bswap = function(x)
		return ((x & 0xff) << 24)
			| ((x & 0xff00) << 8)
			| ((x & 0xff0000) >> 8)
			| ((x & 0xff000000) >> 24)
	end,
}

bit.rol = bit.lrotate
bit.ror = bit.rrotate
return bit
