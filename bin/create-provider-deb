#!/usr/bin/env ruby

SUFFIX = 'provider'

def control_string_for(package_name, version)
  control_string = <<END
Package: #{package_name}-#{SUFFIX}
Version: 1.0
Provides: #{package_name} (= #{version})
Conflicts: #{package_name}
Description: A fake package to satisfy apt's need of #{package_name}
 A fake package to satisfy apt's need of #{package_name}
 .
END
  control_string
end

def create_control_file(package_name, version)
  File.open("#{package_name}-#{SUFFIX}", 'w') do |file|
    file.write(control_string_for(package_name, version))
  end
end

if ARGV.length != 2
  raise ArgumentError.new('You need to pass both package name and version')
else
  package_name, version = ARGV[0], ARGV[1]
  create_control_file(package_name, version)
  system("equivs-build #{package_name}-#{SUFFIX}")
  system("rm -v #{package_name}-#{SUFFIX}")
end
