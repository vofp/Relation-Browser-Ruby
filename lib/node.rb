class Node
  attr_accessor :relations, :data, :circle
  @data = []
  @circle
  def initialize(datahash=nil,relationar=nil)
    save datahash, relationar
  end
  def self.save(datahash=nil,relationar=nil)
    if(datahash == nil)
      puts "No data"
    elsif(datahash["name"] == nil)
      puts "No name"
    else
      @data.update(datahash)
      relationar.each{|relation|
        addRelation(relation)
      }
      Project.current.nodelist[@data["name"]] = self
      puts "Saved"
    end
  end
  def self.addRelation(relatingNode)
    node = Project.current.nodelist[relatingNode]
    if(node == nil)then
      node = Node::new({"name" => relatingNode})
    end
    Relation::new(self,node)
  end
end
