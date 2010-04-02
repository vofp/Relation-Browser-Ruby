class Node
  @@list = []
  attr_accessor :name, :relations, :data, :circle
  @name = ""
  @relations = []
  @data = []
  @circle
  def initialize
    @@list << self
  end
end
