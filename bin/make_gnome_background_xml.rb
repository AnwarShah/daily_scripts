#!/usr/bin/env ruby

require "optparse"

def write_header(writer)
  writer.puts %s(<?xml version="1.0" encoding="UTF-8"?>)
end

def write_open_tag(writer)
  writer.puts %s(<wallpapers>)
end

def write_end_tag(writer)
  writer.puts %s(</wallpapers>)
end

def titleize(filename)
  filename.gsub(/_|-/,' ').split.map { |word| word[0].upcase + word[1..-1] }.join(' ')
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

def show_skip_message(filename)
  puts "Illegal character in file name: skipped '#{File.basename filename}'"
end

def write_xml_file(xml_writer, file_list)
  write_header(xml_writer)
  write_open_tag(xml_writer)

  file_list.each do |filename|
    if filename.include?("&")
      show_skip_message(filename)
      next
    end
    xml_writer.write xml_block((File.absolute_path filename).strip)
  end

  write_end_tag(xml_writer)
  xml_writer.close
end

def parse_options
  options = {}

  parser = OptionParser.new do |opt|
    opt.on('-d', '--directory DIRECTORY', 'Directory to look for images') { |o| options[:directory] = o }
    opt.on('-e', '--extension EXTENSION', 'file extensions (Default: jpg, png)') { |o| options[:extension] = o }
  end

  parser.parse!

  if options[:directory].nil?
    parser.warn "Bad arguments! Please use correct syntax"
    puts parser.help
    exit(1)
  end

  options
end

if $0 == __FILE__
  options = parse_options

  directory = options[:directory]
  ext = (options[:extension] || "jpg,png").delete(' ')
  output_filename = File.basename(directory) + '.xml' || 'new-backgrounds.xml'

  xml_writer = File.open(output_filename, 'w')
  file_names = Dir.glob(directory + "/*.{#{ext}}")

  write_xml_file(xml_writer, file_names)
end
