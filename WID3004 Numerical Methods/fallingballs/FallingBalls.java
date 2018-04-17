/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package fallingballs;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.Timer;

/**
 *
 * @author JA
 */
public class FallingBalls{
    
    private JFrame frame;
    private Ball ball;
    private boolean debug = false;
    
    private int repaint_time = 50;
    private float repaint_time_;
    private float gravity = 9.8f;
    private float curr_velocity = 0;
    private int offset_x = 400;
    private int offset_y = 0;
    
    private int pixel_meter_ratio = 10; // 10 pixel : 1 meter
    private int ball_size = 50;
    private int boundary = 25;
    private int boundary_width = 725;
    private int boundary_height = 450;
    
    private float constant;
   
    public static void main(String[] args) {
        FallingBalls b = new FallingBalls();
    }
    
    
    public FallingBalls(){
        repaint_time_ = (float)repaint_time / 1000;
        constant = gravity * repaint_time_;
        
        frame = new JFrame("Balls");
        frame.setSize(800,550);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
        ball = new Ball(0,0);
        frame.add(ball);
        
        ActionListener time = new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                update();
                ball.setOffset(offset_x, offset_y);
                frame.revalidate();
                frame.repaint();
            }
        };
        new Timer(repaint_time, time).start();
    }
    
    public void update(){
        this.curr_velocity += this.constant;
        float distance = this.curr_velocity*repaint_time_;
        this.offset_y += (int) convertToPixel(distance);
        checkHitBound();
        if(debug) System.out.printf("V= %f, S= %d\r\n",this.curr_velocity, this.offset_y);
    }
    
    public float convertToPixel(float meter){
        return meter*pixel_meter_ratio;
    }
    
    public void checkHitBound(){
        int floor = offset_y + 50;
        if(floor>=boundary_height){
            this.curr_velocity *= -0.7;
            if(debug) System.out.println("Hit bounds");
        }
    }
    
    class Ball extends JPanel{
        private int loc_x, loc_y;
        public Ball(int x, int y){
            this.loc_x = boundary + x;
            this.loc_y = boundary + y;
            repaint();
        }
        
        public void setOffset(int x, int y){
            this.loc_x = boundary + x;
            this.loc_y = boundary + y;
            repaint();
        }
        
        @Override
        public void paint(Graphics g) {
            g.drawRect(boundary, boundary, boundary_width, boundary_height);
            g.fillOval(loc_x,loc_y,ball_size,ball_size);
            g.setColor(Color.BLACK);
        }
    }
}
