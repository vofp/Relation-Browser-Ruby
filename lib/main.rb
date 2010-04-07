=begin
require "menu.rb"
m = Menu::new


x = Xml.new "../test/test.xml"
=end
require "project.rb"
Project::new()
Project.load("../test/test.obj")
Project.current.nodelist[Project.current.nodelist.keys[0]].display