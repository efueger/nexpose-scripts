#!/usr/bin/env ruby

require 'nexpose'
require 'colorize'
require 'pp'
require 'netaddr'

module Utils

	@mbit_dict = {
		8388608 =>  9,
		8388607 =>  9,
		8388606 =>  9,
		8388604 =>  9,
		1048576 =>  12,
		1048575 =>  12,
		1048574 =>  12,
		1048573 =>  12,
		1048572 =>  12,
		524288  =>  13,
		524284  =>  13,
		262144  =>  14,
		262140  =>  14,
		65536   =>  16,
		65532   =>  16,
		16384   =>  18,
		16380   =>  18,
		8192    =>  19,
		6397    =>  19,
		5118    =>  19,
		4096    =>  20,
		2048    =>  21,
		2046    =>  21,
		2044    =>  21,
		1024    =>  22,
		1022    =>  22,
		1020    =>  22,
		766     =>  22,
		512     =>  23,
		511     =>  23,
		510     =>  23,
		509     =>  23,
		508     =>  23,
		255     =>  24,
		254     =>  24,
		253     =>  24,
		252     =>  24,
		250     =>  24,
		226     =>  24,
		201     =>  24,
		184     =>  24,
		154     =>  24,
		149     =>  24,
		128     =>  25,
		124     =>  25,
		105     =>  25,
		97      =>  25,
		86      =>  25,
		83      =>  25,
		82      =>  25,
		65      =>  25,
		64      =>  25,
		60      =>  26,
		58      =>  26,
		42      =>  26,
		41      =>  26,
		36      =>  26,
		35      =>  26,
		34      =>  26,
		33      =>  26,
		32      =>  27,
		31      =>  27,
		30      =>  27,
		29      =>  27,
		28      =>  27,
		27      =>  27,
		26      =>  27,
		25      =>  27,
		24      =>  27,
		23      =>  27,
		22      =>  27,
		21      =>  27,
		20      =>  27,
		19      =>  27,
		18      =>  27,
		17      =>  27,
		16      =>  28,
		15      =>  28,
		14      =>  28,
		13      =>  28,
		12      =>  28,
		11      =>  28,
		10      =>  28,
		9       =>  29,
		8       =>  29,
		7       =>  29,
		6       =>  29,
		5       =>  29,
		4       =>  30,
		3       =>  30,
		2       =>  31,
		1       =>  32,
		0       =>  32
	}
	
	def Utils.calc_mask(_l,_u)
		if _l.nil? or _u.nil?
			raise "calc_mask() expects a lower and upper ip"
		else
			ipra = NetAddr.range(_l,_u)
			#puts ipra.class.to_s.cyan
			#puts ipra.size.to_s.cyan
		end
		if @mbit_dict.include?(ipra.size)
			return @mbit_dict[ipra.size]
		else
			raise "Bit size not in dictionary: #{ipra.size.to_s}".red
		end
	end
end

