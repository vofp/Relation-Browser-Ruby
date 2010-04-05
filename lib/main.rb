=begin
require "menu.rb"
m = Menu::new


x = Xml.new "../test/test.xml"
=end
require "xml.rb"
require "project.rb"
Project::new()
Project.current.load("../test/test.csv")
x = Xml.new "../test/test.xml"
x.load
Project.current.nodelist[Project.current.nodelist.keys[0]].display