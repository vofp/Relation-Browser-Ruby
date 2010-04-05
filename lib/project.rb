require "node.rb"
class Project
  @@current = nil
  attr_accessor :nodelist, :relationlist
  def initialize
    @@current = self
    @nodelist = {}
    @relationlist = []
  end
  def self.current
    @@current
  end

  def load(filepath)
    if(filepath.include?".xml")then
      Xml.load filepath
    elsif(filepath.include?".csv")then
      Csv.load filepath
    end
  end
  def save(filepath)
    if(filepath.include?".xml")then
      Xml.save filepath
    elsif(filepath.include?".csv")then
      puts "Not able to save to csv file yet"
      #Csv.save filepath
    end
  end
end
