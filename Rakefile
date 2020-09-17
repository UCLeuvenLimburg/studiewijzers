require 'pathname'


$ids = Dir['*.tex'].map do |tex_file|
    Pathname.new(tex_file).basename('.tex').to_s
end

$ids.each do |id|
    task id do
        puts "Compiling #{id}"
        puts `pdflatex #{id}.tex`
        puts `pdflatex #{id}.tex`
    end
end

task :default => $ids
