require 'fileutils'

res = Dir.glob('*.deb')

pkg_info = {}

res.each do |r|
    pkg,ver=r.split('_')
    pkg_info[pkg] ||= {}
    pkg_info[pkg].store(ver , r)
end

selected_dir_name = "selected"
if !Dir.exists?(selected_dir_name)
    Dir.mkdir(selected_dir_name)
end

pkg_info.each do |pkg_name, versions|
    selected_ver, filename = versions.shift # assume that the first one is of highest version
    versions.each do |ver, fname|
        if system("dpkg --compare-versions #{ver} gt #{selected_ver}")
            selected_ver = ver
            filename = fname
        end
    end
    puts "Selected version for #{pkg_name} is #{selected_ver}"
    FileUtils.mv(filename, selected_dir_name)
end
