=begin
require "menu.rb"
m = Menu::new
=end
require "project.rb"
require "xml.rb"
Project::new()
Project.current.load("../test/test.csv")
x = Xml.new "../test/test.xml"