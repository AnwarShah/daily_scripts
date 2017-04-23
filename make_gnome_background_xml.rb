#!/usr/bin/env ruby

new_xml = File.open('new-backgrounds.xml', 'w')

def write_header(writer)
  writer.write "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
end

def write_open_tag(writer)
  writer.write "<wallpapers>\n"
end

def write_end_tag(writer)
  writer.write "</wallpapers>\n"
end

def titleize(shitty_string)
  shitty_string.gsub(/_|-/,' ').split.map { |word| word[0].upcase + word[1..-1] }.join(' ')
end

def xml_block(image_with_path)
  image_name = File.basename image_with_path, ".jpg"
<<-EOS
    <wallpaper deleted="false">
          <name>#{titleize(image_name)}</name>
          <filename>#{image_with_path}</filename>
          <options>zoom</options>
          <pcolor>#000000</pcolor>
          <scolor>#000000</scolor>
          <shade_type>solid</shade_type>
    </wallpaper>
EOS
end

write_header(new_xml)
write_open_tag(new_xml)

File.open('backgrounds.txt', "r") do |f|
  f.each_line do |line|
    new_xml.write xml_block(line.strip)
  end
end

write_end_tag(new_xml)

new_xml.close