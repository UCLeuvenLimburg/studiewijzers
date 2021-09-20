require 'pathname'
require 'fileutils'


def log(message)
  STDERR.puts message
end


def compile_tex(tex_pathname, pdf_pathname)
  log "Preparing to compile #{tex_pathname}"

  log 'Creating dist directory'
  pdf_pathname.dirname.mkpath

  log 'Creating temp directory'
  temp_directory = Pathname.new 'temp'
  temp_directory.mkpath
  temp_pathname = tex_pathname.sub('src', 'temp').sub_ext('.pdf')

  log "Compiling #{tex_pathname}"
  sh "pdflatex -interaction=batchmode -halt-on-error -output-directory #{temp_directory.to_s} #{tex_pathname.to_s}"
  sh "pdflatex -interaction=batchmode -halt-on-error -output-directory #{temp_directory.to_s} #{tex_pathname.to_s}"

  log "Copying pdf to dist"
  unless temp_pathname.file?
    abort "Expected to find #{temp_pathname}"
  end

  FileUtils.cp temp_pathname, pdf_pathname
end


Rake::FileList.new('src/*.tex').then do |tex_files|
  pdf_files = tex_files.pathmap('%{^src/,dist/}X.pdf')

  tex_files.zip(pdf_files).map do |tex_file, pdf_file|
    tex_pathname = Pathname.new tex_file
    pdf_pathname = Pathname.new pdf_file

    course = tex_pathname.basename '.tex'

    file pdf_file => tex_file do
      compile_tex(Pathname.new(tex_file), Pathname.new(pdf_file))
    end

    desc "Generate studiewijzer for #{course}"
    task course => pdf_pathname

    course
  end.then do |courses|
    desc "Generates all studiewijzers"
    task :all => courses
  end
end

task :default => [ :all ]

desc 'Removes dist'
task :clean do
  FileUtils.rm_rf 'dist'
  FileUtils.rm_rf 'temp'
end

desc 'Performs clean build'
task :build => [ :clean, :all ]