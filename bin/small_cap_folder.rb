dirs = Dir.glob('*/')

dirs.each do |dir|
  if File.ftype(dir) == "directory"
    begin
      File.rename dir, dir.downcase unless File.exist?(dir.downcase)
    rescue Exception => e
      puts "Errors occurred while renaming #{dir}: #{e.message}"
    end
  end
end