package start1;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.JFrame;
import javax.swing.JLabel;

import com.sun.jdi.Value;

public class Counter extends JFrame{
	
	

	public Counter() {
		setTitle("카운터");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		Container contentPane = getContentPane();
		contentPane.setBackground(Color.BLACK);
		
		MYLabe1 mb = new MYLabe1(0);
		contentPane.add(mb);
		
		
		setSize(1000,800);
		setVisible(true);
	    mb.setFocusable(true);
        mb.requestFocus();
	}
	class MYLabe1 extends JLabel implements Runnable {

		int value;
		Thread th = null;
		
		public MYLabe1 (int value) {
			this.setText(Integer.toString(value));
			this.value = value;
		
			this.setFont(new Font("TimesRoman",Font.ITALIC,300));
			this.setHorizontalAlignment(JLabel.CENTER);
			
			this.addMouseListener(new MouseAdapter() {
				
				public void mouseClicked(MouseEvent e) {
				 if(th == null) {
					  MYLabe1 m1 = new MYLabe1(0);
					  th = new Thread(m1);
					  th.start();
				 }
				 else if(th.isAlive()) {
					 th.interrupt();
				 }
				 else {
					 th = new Thread(MYLabe1.this);
					 th.start();
				 }
				}
			});
		}
		
		@Override
		public void run() {
			while(true) {
				try {
					Thread.sleep(100);
				} catch (InterruptedException e) {
					return;
				}
			 value ++;
			 setText(Integer.toString(value));			 
			}	
			
		}
	
	}
	public static void main(String[] args) {
		Counter counter = new Counter();
												
	}
}
