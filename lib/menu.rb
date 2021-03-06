require "java"
import javax.swing.JFileChooser
import javax.swing.JFrame
import javax.swing.JMenu
import javax.swing.JMenuBar
import javax.swing.JMenuItem
import javax.swing.JOptionPane
import javax.swing.JSeparator
import java.awt.event.ActionListener

require "project.rb"

class Menu < JFrame
  include ActionListener
  def initialize
    super
    @@current = self
    @menubar = JMenuBar::new
    add @menubar

    @file = JMenu::new
    @file.setText "File"
    @menubar.add @file
    
    @new = JMenuItem::new
    @new.setText "New Project"
    @new.add_action_listener self
    @file.add @new
    
    @exit = JMenuItem::new
    @exit.setText("Exit");
    @exit.add_action_listener self
    @file.add @exit
    
    @edit = JMenu::new
    @edit.setText "Edit"
    @menubar.add @edit

    @search = JMenu::new
    @search.setText "Search"
    @menubar.add @search
    
    
    @searchnew = JMenuItem::new;
    @searchnew.setText "New Search"
    @searchnew.add_action_listener self
    @search.add @searchnew

    @search.add JSeparator::new

    pack
    setDefaultCloseOperation EXIT_ON_CLOSE
    setVisible true
  end
  def actionPerformed(event)
    case event.source
    when @new then new_pressed
    when @exit then exit_pressed
    when @searchnew then search_pressed
    end
  end
  def new_pressed
    Project::new()
    Project.current.load("../test.csv")
    Project.current.nodelist["Ruby"].display
  end
  def exit_pressed
    
  end
  def search_pressed

  end
end
