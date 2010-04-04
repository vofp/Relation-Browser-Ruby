require "node.rb"
require "one_way_relation.rb"
require "project.rb"
class SearchNode < Node
  def initialize(name=nil,datahash={},relationar=[])
    super
    Project.current.nodelist.each_value{ |node|
      search(node)
    }
  end
  def searchNode(node)
    node.data.each_value{ |value|
      if(value.include?(data["name"]))
        OneWayRelation::new(self, node)
      end
    }
  end
end
