#!/usr/bin/env ruby

require "optparse"

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

def write_xml_file(xml_writer, file_list)
  write_header(xml_writer)
  write_open_tag(xml_writer)

  file_list.each do |line|
    xml_writer.write xml_block(line.strip)
  end

  write_end_tag(xml_writer)
  xml_writer.close
end

def parse_options
  options = {}

  parser = OptionParser.new do |opt|
    opt.on('-d', '--directory DIRECTORY', 'Directory to look for images') { |o| options[:directory] = o }
    opt.on('-e', '--extension EXTENSION', 'Image extension') { |o| options[:extension] = o }
  end

  parser.parse!

  if options[:directory].nil? || options[:extension].nil?
    parser.warn "Bad arguments! Please use correct syntax"
    puts parser.help
    exit(1)
  end

  options
end

if $0 == __FILE__
  options = parse_options

  directory = options[:directory]
  ext = options[:extension]

  xml_writer = File.open('new-backgrounds.xml', 'w')
  file_names = Dir.glob(directory + '/' + '*.' + ext)

  write_xml_file(xml_writer, file_names)
end
