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


# labs.each do |lab|

# end

# task :exercises => %i[
#     clean
#     animal-crossing
#     arithmetic
#     arrays
#     arrays-2d
#     booleans
#     car
#     conditionals
#     exam-cities
#     exam-crosswords
#     exam-infection
#     exam-multiple-choice
#     exam-picross
#     exam-solitaire
#     imaging
#     lambdas
#     loops
#     objects
#     parsing
#     patterns
#     recursion
#     sorting
#     strings
#     sudoku
#     tetris
#     yahtzee
# ]