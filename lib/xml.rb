require "rexml/document"
require "project.rb"
include REXML

class Xml
  def initialize(filename)
    project = Element.new "Project"
    Project.current.nodelist.each_value{|node|
      project << node.to_xml
    }
    doc = Document::new
    doc << project
    #doc.write($stdout,2)
    File.open(filename, 'w') {|f| doc.write(f,2)}
  end
end
