require 'fileutils'

excluded = ['.', '..', '.git', '.gitignore']

home = File.expand_path('~')
Dir.glob(".*").reject { |f| excluded.include?(f) }.each do |file|
  homefile = File.join(home, file)

  if File.exists?(homefile)
    FileUtils.mv(homefile, homefile + '.old')
  end

  if File.symlink?(homefile)
    FileUtils.rm(homefile)
  end

  FileUtils.ln_s(File.expand_path("./#{file}"), homefile)
end

