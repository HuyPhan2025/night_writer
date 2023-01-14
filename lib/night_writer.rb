class NightWriter
  attr_accessor :read_file,
                :write_file

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
  end
  
  def call
    english_text = File.open(@read_file, "r")
    
    text = english_text.read

    puts "Created #{@write_file} containing #{text.split('').count} characters" 
    File.write(@write_file, text) 
  end  
end
# night_writer = NightWriter.new
# night_writer.call

