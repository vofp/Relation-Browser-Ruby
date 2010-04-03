class Relation
  attr_accessor :node1, :node2
  @node1
  @node2
  def initialize(n1,n2)
    Project.current.relationlist << self
    @node1 = n1
    @node2 = n2
  end
end
