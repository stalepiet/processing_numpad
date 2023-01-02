
 import javax.swing.JFrame;
import javax.swing.JWindow;
import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
/*from w  ww .  j  a  v a2 s  .com*/
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JWindow;
import javax.swing.SwingConstants;
import javax.swing.*;
import java.awt.*;
import javax.swing.border.EmptyBorder;
/* ww  w  .  j a v a  2s.c  om*/
  
class NumPad extends JWindow implements ActionListener{

  private JButton[] button = new JButton[14];// JButton[] buttons = new JButton[10];
  private int fwidth =250;
  private int fheigth=500;
  private int butsize=75;
  public boolean busy;
  public boolean passwordflag;
  public boolean passwordflag2;
  public boolean passwordok;
  public int exit;
  public int value;
  public int presetvalue;
  //private JPanel panel = new JPanel(new GridLayout(4,4,4,4));
  //private JTextField text = new JTextField("hellofhjfhjooe");
  private JTextField text = new JTextField();
  private JTextField textold = new JTextField();
  private Font font1 = new Font("SansSerif", Font.BOLD, 40);
  public  int maxval=1000000;
  private  String txtnbr;
 
  
  public NumPad()
  {
    setSize(fwidth, fheigth);
    setLocationRelativeTo(null);
    setAlwaysOnTop (true);
    setVisible(false);
    
    JPanel p = new JPanel();
    p.setLayout(null);     

    int x=0,y=0,butsize=((fwidth-20)/3);
    int butsizex=butsize;
    for(int i=0;i<14;i++)
    {
      button[i] = new JButton(str(i));
      if(i==13){butsizex=butsize*2;}
      button[i].setBounds((x*(butsize+1))+10 , (y*(butsize+1))+100 , butsizex, butsize);//(x*(butsize+1))+10  ,   (y*(butsize+1))+y100
      button[i].addActionListener(this);
      p.add(button[i]);
      if (x<2){x++;}else {x=0;y++;}
    }
    

     button[0].setText("Esc");
     button[1].setText("Clr");
     button[2].setText("Bck");
     button[12].setText("0");
     button[13].setText("Ok");//But[13].setSize(butsize*2,butsize);
     button[13].addActionListener(this);
    
    x=1;
    for(int i=9;i<=11;i++)
    {
      button[i].setText(str(x));
      x++;
    }
    for(int i=6;i<=8;i++)
    {
      button[i].setText(str(x));
      x++;
    }
    for(int i=3;i<=5;i++)
    {
      button[i].setText(str(x));
      x++;
    }
    
    
    
    text.setBounds(10,10, fwidth-20,50); 
    text.setFont(font1);
    text.setHorizontalAlignment(JTextField.RIGHT);
    text.setText("This is a text");
    p.add(text);
    
    textold.setBounds(10,60, fwidth-20,30);  
    textold.setText("Old value: ");
    p.add(textold);
    add(p);


  }
  
  
  public void actionPerformed (ActionEvent e) 
  {
    //String action = e.getActionCommand();
    if(e.getActionCommand().equals("Ok")){
      value=int(txtnbr);
      setVisible(false);
      exit=1;
    }
  else if(e.getActionCommand().equals("Esc")){
       
       setVisible(false);
       exit=-1;
    }
  else if(e.getActionCommand().equals("Clr")){
      txtnbr = "0";//text.setText(Character.toString((char)(65+32)));
    }
  else if(e.getActionCommand().equals("Bck")){
      
      if(txtnbr.length()>1)
      {
        txtnbr = txtnbr.substring( 0, txtnbr.length()-1 );         
      }
      else
      {
         txtnbr = "0";//ext.setText("0");
      }
      //value=int(txtnbr); 
    } 
    else if (int(txtnbr)<maxval)
    {
      if(txtnbr.equals("0"))
      {
        //text.setText(e.getActionCommand());
        txtnbr = e.getActionCommand();
      }
      else
      {
        //text.setText(text.getText()+e.getActionCommand());
        txtnbr = txtnbr+e.getActionCommand();
      }
    }
    value = int(txtnbr);
    if(passwordflag)
    {
      //setpasswordstr(txtnbr);
      text.setText(setpasswordstr(txtnbr));
    }
    else
    {
      text.setText(txtnbr);
    }/**/
    //text.setText(txtnbr);
    if(passwordflag2 && value==presetvalue)
    {
      passwordok=true;
      setVisible(false);
    }
  } 
  
  
 public void display(int preset)
 {
   txtnbr=str(preset);
   value=preset;
   text.setText(str(value));
   textold.setText("Old value: "+str(preset));
   setVisible(true);
   busy=true;
   passwordflag2=false;
 };

  public void display(int preset, boolean pwf)
 {
   passwordflag=pwf;
   
   value=preset;
   if(passwordflag)
   {
     txtnbr="0";
     text.setText(setpasswordstr(txtnbr));
     textold.setText("Password: "+setpasswordstr(str(preset)));
   }
   else
   {
     txtnbr=str(preset);
     text.setText(str(value));
     textold.setText("Old value: "+str(preset));
   }
   setVisible(true);
   busy=true;
   passwordflag2=false;
 }
 
   public void display(int preset, boolean pwf,boolean pwf2)
   {
     presetvalue=preset;
     display(preset,pwf);
     passwordflag2=pwf2;
   }
 
 public void resetPassword()
 {
   passwordflag2=false;
 }
 private String setpasswordstr(String pw)
 {
   
   String a="";
   if(pw.equals("0")){return a;}
   for (int x=0;x < pw.length();x++)
   {
      a=a+"*"; 
   }
   
   return a;
 }

 public int getValue()
   {
      busy=false;
      exit=0;
      passwordflag= false;
      return value; 
   }
  



  
}
/*


 
    this.setLayout(null);
    //this.setBorder(new EmptyBorder(20, 30, 20, 30));
    //setSize(300, 300);
    //setLocation(100, 100);
    this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    this.setPreferredSize(new Dimension(300, 300));
    this.setResizable(true);   
    this.pack();
    this.setVisible(true);
        //setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    setContentPane(panel);
    
     panel.setLayout(new BorderLayout());
     
     but.setLayout(null);
     but.setBounds(0, 500, 100, 100);
    //but.setPreferredSize(new Dimension(10, 10)); 
    //pnlButton.add(btn,BorderLayout.SOUTH);
    panel.add(but,BorderLayout.SOUTH);
    //panel.add(but1);



public class JWindowNoTitleBar extends JFrame {
  JWindow window = new JWindow(this);

  public JWindowNoTitleBar() {
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    window.getContentPane().add(new JLabel("About"), BorderLayout.NORTH);
    window.getContentPane().add(new JLabel("Label", SwingConstants.CENTER),
        BorderLayout.CENTER);
    JButton b = new JButton("Close");
    window.getContentPane().add(b, BorderLayout.SOUTH);
    b.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        window.setVisible(false);
      }
    });
    window.pack();
    window.setBounds(50, 50, 200, 200);

    b = new JButton("About...");
    b.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        window.setVisible(true);
      }
    });
    getContentPane().add(b);
    pack();
  }

  
}*/
