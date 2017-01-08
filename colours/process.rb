#!ruby

require 'optparse'
require 'pry'

require 'color'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: process.rb [options]"

  opts.on("-i", "--input INPUT", "Input file") do |f|
    options[:input] = f
  end

  opts.on("-o", "--output OUTPUT", "Output file") do |f|
    options[:output] = f
  end

  opts.on("-d", "--dark COLOUR", "Dark colour") do |f|
    options[:dark] = f
  end

  opts.on("-l", "--light COLOUR", "Light colour") do |f|
    options[:light] = f
  end

  opts.on("-b", "--brighten AMOUNT", "Brighten") do |f|
    options[:brighten] = f.to_i
  end

  opts.on("-h", "--hue HUE", "Hue") do |f|
    options[:hue] = f.to_f
  end

  opts.on("-c", "--contrast AMOUNT", "Amount") do |f|
    options[:contrast] = f.to_i
  end

  opts.on("-a", "--amount AMOUNT", "Amount") do |f|
    options[:amount] = f.to_f
  end
end.parse!

darkColour  = Color::RGB.by_hex(options[:dark])
lightColour = Color::RGB.by_hex(options[:light])

contents = File.readlines(options[:input])

hexChars = '0-9abcdefABCDEF'

def increaseContrast(value, amount)
  (Math.atan((value - 0.5) * 2.0 * amount) / Math.atan(1.0 * amount)) / 2.0 + 0.5
end

def clamp(value, low, high)
  [high, [value, low].max].min
end

def clamp01(value)
  clamp(value, 0.0, 1.0)
end

newFile = contents.map { |l|
  if /^\s*hi\s+\w+\s+/.match l
    l.gsub(/#[#{hexChars}]{6}/) do |code|
      hexCode    = code.match(/[#{hexChars}]{6}/)[0]
      colour     = Color::RGB.by_hex(hexCode)
      #(Math.atan((brightened.brightness - 0.5) * 4.0) / Math.atan(1.0 * 4.0)) / 2.0 + 0.5
      colourHSL  = colour.to_hsl
      contrast   = increaseContrast(colourHSL.l * (1+options[:brighten]/100.0), options[:contrast])
      colourHSL.l = contrast
      colourHSL.h = (colourHSL.h + options[:hue]) % 1.0
      colourHSL.s = clamp01(3.0*colourHSL.s)
      mixColour  = lightColour.mix_with(darkColour, contrast * 100.0)
      newColour  = mixColour.mix_with(colourHSL.to_rgb, options[:amount])
      "##{newColour.hex}"
    end
  else
    l
  end
}

File.open(options[:output], "w+") do |f|
  f.puts(newFile)
end
