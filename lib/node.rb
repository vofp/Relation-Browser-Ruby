require "relation.rb"
require "project.rb"
class Node
  
  attr_accessor :relations, :related, :data, :circle
  
  def initialize(name=nil,datahash={},relationar=[])
    if(name == nil)
      puts "No name"
      return
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
    puts "Saved"
  end
  
  def addRelation(relatingNode)
    node = Project.current.nodelist[relatingNode]
    return if relations.has_value?(node)
    if(node == nil)then
      node = Node::new({"name" => relatingNode})
    end
    Relation::new(self,node)
  end
  
  def display
    puts "\n\n"
    puts @data["name"]
    puts
    @data.each {|key,value|
      next if(key == "name")
      puts key+":"
      puts value
    }
    puts
    i = 0
    @relations.each_value{|value|
      puts "#{i})\t#{value.data["name"]}"
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
end
