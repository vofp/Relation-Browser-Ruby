require "rexml/document"
require "project.rb"
include REXML

class Xml
  attr_accessor :filepath
  def initialize(filename)
    @filepath = filename
  end
  def save
    project = Element.new "Project"
    Project.current.nodelist.each_value{|node|
      project << node.to_xml
    }
    Project.current.relationlist.each{|relation|
      project << relation.to_xml
    }
    doc = Document::new
    doc << project
    File.open(@filepath, 'w') {|f| doc.write(f,2,false)}
  end
  def load
    doc = Document::new File::new @filepath
    root = doc.root
    #puts root
    doc.elements.each("Project/Node") {|node|
      datahash = {}
      node.elements.each{|data|
        datahash[data.name] = data.text.strip
      }
      Node::new(nil,datahash)
    }
    doc.elements.each("Project/Relation") {|relation|
      node1 = nil
      node2 = nil
      relation.elements.each("node1"){|node|
        node1 = Project.current.nodelist[node.text.strip]
      }
      relation.elements.each("node2"){|node|
        node2 = Project.current.nodelist[node.text.strip]
      }
      if(node1 != nil and node2 != nil)then
        Relation::new(node1,node2)
      end
    }
  end
end
