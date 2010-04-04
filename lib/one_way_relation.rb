require "relation.rb"
class OneWayRelation < Relation
  def initialize(n1,n2)
    Project.current.relationlist << self
    @node1 = n1
    @node2 = n2
    @node1.relations[self] = @node2
  end
end
