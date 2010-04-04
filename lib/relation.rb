require "node.rb"
require "project.rb"
class Relation
  attr_accessor :node1, :node2
  def initialize(n1,n2)
    Project.current.relationlist << self
    @node1 = n1
    @node2 = n2
    @node1.relations[self] = @node2
    @node2.relations[self] = @node1
  end

end
