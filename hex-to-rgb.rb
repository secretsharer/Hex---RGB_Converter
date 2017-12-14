
class ColorConverter

  attr_accessor = :hex_code, :hex_input

  def initialize(hex_code)
    @hex_input = gets.strip
    @hex_code = hex_code
  end

  def self.get_input(string)
    @hex_input = gets.strip
    @hex_code = @hex_input
  end

  #parses the string to make sure it's a valid length coming in, if so removes hash symbol, if not, throws error.
  def self.parse_hex_code(hex_code)
    if hex_code.length == 7 || hex_code.length == 4 && hex_code[0] == "#"
      else
        raise Exception.new("Not a valid hexadecimal code.")
      end
    hex_code.slice!(0)
  end


  #builds the string if needed to a uniform length, accounting for repeat chars
  #breaks the hex into sections
  #grabs hex binary value and shifts bits as needed, returns corresponding rgb values
  #prints those values
  def self.convert_hex_to_rgb(hex_code)
    if hex_code.length == 3
       hex_code = "#{hex_code[0]}""#{hex_code[0]}""#{hex_code[1]}""#{hex_code[1]}""#{hex_code[2]}""#{hex_code[2]}"
    end
      hex_1 = hex_code.slice(0..1)
      r = hex_1.to_i(16)

      hex_2 = hex_code.slice(2..3)
      g = hex_2.to_i(16)

      hex_3 = hex_code.slice(4..5)
      b = hex_3.to_i(16)

      print r, g, b

  end
end


#passes with the following input

#happy_path
hex_code = ColorConverter.get_input("#800080")
ColorConverter.parse_hex_code(hex_code)
ColorConverter.convert_hex_to_rgb(hex_code)

hex_code = ColorConverter.get_input("#ffa500")
ColorConverter.parse_hex_code(hex_code)
ColorConverter.convert_hex_to_rgb(hex_code)

hex_code = ColorConverter.get_input("#F00")
ColorConverter.parse_hex_code(hex_code)
ColorConverter.convert_hex_to_rgb(hex_code)

hex_code = ColorConverter.get_input("#AD2441")
ColorConverter.parse_hex_code(hex_code)
ColorConverter.convert_hex_to_rgb(hex_code)

hex_code = ColorConverter.get_input("#333")
ColorConverter.parse_hex_code(hex_code)
ColorConverter.convert_hex_to_rgb(hex_code)

hex_code = ColorConverter.get_input("#AfD")
ColorConverter.parse_hex_code(hex_code)
ColorConverter.convert_hex_to_rgb(hex_code)

#successfully_produced_error
hex_code = ColorConverter.get_input("oops")
ColorConverter.parse_hex_code(hex_code)
ColorConverter.convert_hex_to_rgb(hex_code)

hex_code = ColorConverter.get_input("#6")
ColorConverter.parse_hex_code(hex_code)
ColorConverter.convert_hex_to_rgb(hex_code)

hex_code = ColorConverter.get_input("15")
ColorConverter.parse_hex_code(hex_code)
ColorConverter.convert_hex_to_rgb(hex_code)

hex_code = ColorConverter.get_input(" ")
ColorConverter.parse_hex_code(hex_code)
ColorConverter.convert_hex_to_rgb(hex_code)

#not currently passing anything that requires a regex to remove mid-index white spaces or erroneous characters
hex_code = ColorConverter.get_input("# 57")
ColorConverter.parse_hex_code(hex_code)
ColorConverter.convert_hex_to_rgb(hex_code)

hex_code = ColorConverter.get_input("4 $ ")
ColorConverter.parse_hex_code(hex_code)
ColorConverter.convert_hex_to_rgb(hex_code)

hex_code = ColorConverter.get_input("A /8")
ColorConverter.parse_hex_code(hex_code)
ColorConverter.convert_hex_to_rgb(hex_code)



#An Alternate approach that seemed more verbose but was essentially doing the same thing:

# converting hex <-> binary
# then binary <-> rgb
# first map hex string to binary representation or as string-int
# for example...
# hex_code.hex.to_s(2).rjust(num.size*4, '0') or hex_code..to_i(16).to_s(2)
# then use bitwise operator to shift bit accounting for leading characters, for example...
# r = hex_1 >> 16
# g = hex_2 >> 8 & 0xFF;
# b = hex_3 & 0xFF;
