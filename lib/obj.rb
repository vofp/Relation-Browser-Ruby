require "project.rb"
class Obj
  def initialize
    
  end
  def self.save(filepath)
    filepath
    o = Marshal.dump(Project.current)
    File.open(filepath, 'w') {|f| f.write(o)}
  end
  def self.load(filepath)
    filepath
    o=nil
    File.open(filepath, 'r') {|f| o=Marshal.load(f.read)}
    Project.current = o
  end
end
