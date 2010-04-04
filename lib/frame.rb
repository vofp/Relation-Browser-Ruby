require "java"
import javax.swing.JFrame
import javax.swing.JPanel
import java.awt.Dimension
import java.awt.Color

class Frame < JFrame
  #include ActionListener, Runnable
  def initialize
    super
    @area = DrawArea::new
    add @area

    setPreferredSize(Dimension::new 600,600)
    pack
    setVisible true
    setDefaultCloseOperation DISPOSE_ON_CLOSE
  end
end
class DrawArea < JPanel
  def paintComponent(g)
    #g.setColor Color.new(0,0,0)
    g.fillRect(0, 0, 500, 500);
  end
end
class Circle
  def initialize(node,x,y)
    @radius = 100
    @x = x
    @y = y
  end
  def over(mousex,mousey)
    disx = @x - mousex
    disx = @y - mousey
    (disx**2 + disy**2)**0.5 < @radius ? true : false
  end
end
f = Frame::new