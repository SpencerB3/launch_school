class TextAnalyzer
  def process
    file = File.open('text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").length} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").length} lines" }
analyzer.process { |text| puts "#{text.split(' ').length} words" }
