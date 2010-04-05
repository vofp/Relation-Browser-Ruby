# To change this template, choose Tools | Templates
# and open the template in the editor.

class Csv
  def initialize
    
  end
  def self.load(filepath)
    lines = File.readlines(filepath)
    datahash = {}
    relationarray = []
    node = nil
    lines.each { |line|
      line.chomp!
      if(line != "")then
        key,value = line.split(",",2)
        if(key.downcase == "name")then
          if(Project.current.nodelist.has_key?(value))then
            node = Project.current.nodelist[value]
          else
            node = Node::new(value,datahash,relationarray)
          end
        elsif(key.downcase == "related")then
          relationarray << value
        else
          datahash[key] = value
        end
      else
        if(node != nil)then
          node.save(datahash,relationarray)
          datahash = {}
          relationarray = []
          node = nil
        end
      end
    }
    if(node != nil)then
      node.save(datahash,relationarray)
    end
  end
end
