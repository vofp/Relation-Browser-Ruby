require "project.rb"
puts "Start"
Project::new()
Project.current.load("../test.csv")
puts "done loading"
puts Project.current.nodelist["Ruby"].data["name"]
Project.current.nodelist["Ruby"].display