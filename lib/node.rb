require "rexml/document"
include REXML

require "relation.rb"
require "project.rb"
class Node
  
  attr_accessor :relations, :related, :data
  
  def initialize(name=nil,datahash={},relationar=[])
    if(name == nil)
      name = datahash["name"]
      if(name == nil)
        puts "No name"
        return
      end
    end
    @relations = {}
    @data = {"name"=>name}
    save datahash, relationar
    Project.current.nodelist[@data["name"]] = self
  end
  
  def save(datahash={},relationar=[])
    @data.update(datahash)
    relationar.each{|relation|
      addRelation(relation)
    }
  end
  
  def addRelation(relatingNode)
    node = Project.current.nodelist[relatingNode]
    return if relations.has_value?(node)
    if(node == nil)then
      node = Node::new(relatingNode)
    end
    Relation::new(self,node)
  end
  
  def display
    puts "\n\n"
    puts @data["name"]
    @data.each {|key,value|
      next if(key == "name")
      puts key+":"
      puts value
    }
    i = 0
    @relations.each_value{|value|
      print "#{i})".ljust(4)
      puts value.data["name"].to_s
      i+=1
    }
    input = gets.chomp.to_i
    #Project.current.nodelist[input].display
    i = 0
    displayed = false
    if(input < @relations.size and input >= 0)then
      @relations.each_value{|node|
        if(i==input)then
          node.display
          displayed = true
        end
        i+=1
      }
    end
    if(!displayed)then
      self.display
    end
  end
  def to_xml
    node = Element.new "Node"
    @data.each{|key,value|
      data = Element.new key
      data.text = value
      node << data
    }
    node
  end
end
