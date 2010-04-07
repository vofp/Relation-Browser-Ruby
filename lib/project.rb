require "node.rb"
class Project
  @@current = nil
  attr_accessor :nodelist, :relationlist, :filepath
  def initialize
    @@current = self
    @nodelist = {}
    @relationlist = []
  end
  def self.current
    @@current
  end
  def self.current=(project)
    @@current = project
  end
  def self.load(filename=@filepath)
    @filepath = filename
    if(@filepath.include?".xml")then
      require "xml.rb"
      Xml.load @filepath
    elsif(@filepath.include?".csv")then
      require "csv.rb"
      Csv.load @filepath
    elsif(@filepath.include?".obj")then
      require "obj.rb"
      Obj.load @filepath
    end
  end
  def self.save(filename=@filepath)
    @filepath = filename
    if(@filepath.include?".xml")then
      require "xml.rb"
      Xml.save @filepath
    elsif(@filepath.include?".obj")then
      require "obj.rb"
      Obj.save @filepath
    elsif(@filepath.include?".csv")then
      require "csv.rb"
      puts "Not able to save to csv file yet"
      #Csv.save filepath
    end
  end
end
