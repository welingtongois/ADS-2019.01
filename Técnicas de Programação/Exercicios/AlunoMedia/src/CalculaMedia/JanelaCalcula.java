/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CalculaMedia;


import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javafx.scene.text.Font;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import java.awt.event.*;
import java.text.DecimalFormat;


/**
 *
 * @author Will
 */
public class JanelaCalcula extends JFrame implements ActionListener{
   
    
    
    private JLabel mensagem,label01,label02,label03,label04,label05,labelNome,resultado,frase;
    private JButton calcule;
    private JTextField nomeAluno, prov1, pj,pr,tr;
    
    
    //construtor - > título e tipo de layout
    
    public JanelaCalcula() {
    super("Calcula a Média do Aluno");
    this.getContentPane().setLayout(null);
    
    
}
    
    //para iniciar, deve-se setar cada item
    public void init(){
    mensagem = new JLabel("Cálculo de Média");
    labelNome= new JLabel("Nome do Aluno:");
    nomeAluno = new JTextField();
    label01= new JLabel("Nota P 1:");
    prov1 = new JTextField();
    label02= new JLabel("Nota de Proj.:");
    pj = new JTextField();
    label03= new JLabel("Nota P Reg.:");
    pr = new JTextField();
    label04= new JLabel("Nota Trab.:");        
    tr = new JTextField();
    calcule = new JButton("Calcule");
    
    frase = new JLabel("");
    resultado = new JLabel("");
    label05= new JLabel("MÉDIA FINAL:");
    //resultado = new JTextField();
    //frase = new JTextField();
    
    
    
    //POSICIONAMENTO(X,Y,largura,espessura)
    mensagem.setBounds(90,10,100,30);
    labelNome.setBounds(45,40,100,30);
    nomeAluno.setBounds(150,40,100,30);
    label01.setBounds(45,70,100,30);
    prov1.setBounds(150,70,50,30);
    label02.setBounds(45,100,100,30);
    pj.setBounds(150,100,50,30);
    label03.setBounds(45,130,100,30);
    pr.setBounds(150,130,50,30);
    label04.setBounds(45,160,100,30);
    tr.setBounds(150,160,50,30);
    calcule.setBounds(45,220,100,100);
    calcule.addActionListener(this);
    label05.setBounds(190,220,150,30);
    label05.setForeground(Color.red);
    resultado.setBounds(190,250,50,30);
    resultado.setForeground(Color.blue);
    frase.setBounds(190,280,260,30);
    frase.setForeground(Color.blue);
    
    //INSERE NO JPANEL
    this.getContentPane().add(mensagem);
    this.getContentPane().add(labelNome);
    this.getContentPane().add(nomeAluno);
    this.getContentPane().add(label01);
    this.getContentPane().add(prov1);
    this.getContentPane().add(label02);
    this.getContentPane().add(pj);
    this.getContentPane().add(label03);
    this.getContentPane().add(pr);
    this.getContentPane().add(label04);
    this.getContentPane().add(tr);
    this.getContentPane().add(calcule);
    this.getContentPane().add(label05);
    this.getContentPane().add(resultado);
    this.getContentPane().add(frase);
    
    //Tamanho x,y
    setSize(500, 400);
    setVisible(true);
    }
    
    private void calcular() {
        float v1 = Float.parseFloat(prov1.getText());
        float v2 = Float.parseFloat(pj.getText());
        float v3 = Float.parseFloat(pr.getText());
        float v4 = Float.parseFloat(tr.getText());
        String nome = (nomeAluno.getText());
        double media;
        String resposta;
        
        DecimalFormat formatter = new DecimalFormat("0.00");
        
        media = Float.parseFloat(formatter.format((0.2*v1 + 0.4*v3 + 0.2*v2 + 0.2*v4)));
        
        if(media>=6){
            resposta = "Parabéns! Você passou!";
        }else if(media>3 && media<6){
            resposta = "Quase heim?! Você está de EXAME!";
        }else{
            resposta = "Prepare o bolso, você está de DP!";
        }
        resultado.setText(String.valueOf(media));
        frase.setText(nome+" "+resposta);
        
        
}
    @Override
    public void actionPerformed(ActionEvent e) {
if (e.getSource()==calcule) {
calcular();
}

 }
}
