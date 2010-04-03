require node.rb
class Project
  @@current
  @nodelist = Hash::new
  @relationlist = Array::new
  def initialize
    @@current = self
  end
  def load (filepath)
    lines = File.readlines(filepath)
    datahash = Hash::new
    relationarray = Array::new
    node = nil
    lines.each { |line|
      if(line != "")then
        key,value = line.split(",",2)
        if(key == "name")then
          node = Node::new
        elsif(key == "relation")then
          relationarray << value
        else
          datahash[key] = value
        end
      else
        if(node != nil)then
          node.save(datahash,relationarray)
          datahash = Hash::new
          node = nil
        end
      end
    }
    Node::new(datahash)
  end
end
