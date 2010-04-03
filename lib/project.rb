require "node.rb"
class Project
  @@current = nil
  attr_accessor :nodelist, :relationlist
  def initialize
    @@current = self
    @nodelist = Hash::new
    @relationlist = []
  end
  def self.current
    @@current
  end
  def load (filepath)
    lines = File.readlines(filepath)
    datahash = Hash::new
    relationarray = Array::new
    node = nil
    lines.each { |line|
      line.chomp!
      if(line != "")then
        key,value = line.split(",",2)
        puts key
        puts value
        if(key.downcase == "name")then
          datahash["name"] = value
          if(Project.current.nodelist.has_key?(value))then
            node = Project.current.nodelist[value]
          else
            node = Node::new(datahash,relationarray)
          end
        elsif(key.downcase == "related")then
          relationarray << value
        else
          datahash[key] = value
        end
      else
        if(node != nil)then
          node.save(datahash,relationarray)
          datahash = Hash::new
          relationarray = []
          node = nil
        end
      end
    }
    Node::new(datahash)
  end
end
