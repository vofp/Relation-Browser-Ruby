require "relation.rb"
class OneWayRelation < Relation
  def initialize(n1,n2)
    Project.current.relationlist << self
    @node1 = n1
    @node2 = n2
    @node1.relations[self] = @node2
  end
  def to_xml
    relation = Element.new "OneWayRelation"
    data = Element.new "node1"
    data.text = @node1.data["name"]
    relation << data
    data = Element.new "node2"
    data.text = @node2.data["name"]
    relation << data
    relation
  end
end
