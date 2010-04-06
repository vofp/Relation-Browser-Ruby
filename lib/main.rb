=begin
require "menu.rb"
m = Menu::new


x = Xml.new "../test/test.xml"
=end
require "xml.rb"
require "project.rb"
require "obj.rb"
Project::new()
Project.load("../test/test.obj")
#Project.current.save("../test/test.xml")
Project.current.nodelist[Project.current.nodelist.keys[0]].display