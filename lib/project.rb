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
      Xml.load @filepath
    elsif(@filepath.include?".csv")then
      Csv.load @filepath
    elsif(@filepath.include?".obj")then
      Obj.load @filepath
    end
  end
  def self.save(filename=@filepath)
    @filepath = filename
    if(@filepath.include?".xml")then
      Xml.save @filepath
    elsif(@filepath.include?".obj")then
      Obj.save @filepath
    elsif(@filepath.include?".csv")then
      puts "Not able to save to csv file yet"
      #Csv.save filepath
    end
  end
end
