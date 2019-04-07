/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fila;

/**
 *
 * @author Will
 */
public class Fila {
    
    private int total;
    private int comeco;
    private int fim;
    private Object memo[];
    private int MAX;
    private int atual;
    
    public Fila(){
        MAX=100;
        memo = new Object[MAX];
        total =0;
        comeco=0;
        fim=0;
        atual=0;
    }
    
    //verifica se Fila está vazia
    
    public boolean isEmpty(){
        return(total==0);
    }
    
    private boolean isFull(){
        return(total==MAX);
    }
    
    public void enqueue(Object x){
        if(!isFull()){
            memo[fim++] =x;
            fim%=MAX;
            total++;
        }
        else
            System.out.println("Fila Cheia!!");
    }
    
    public Object dequeue() {
        if(!isEmpty()){
            Object resp;
            resp = memo[comeco++];
            comeco %=MAX;
            total--;
            return resp;
        }
        else{
            return null;
        }
    }
    
    public String exibeFila() {
        
        String impressaoFila;
        
        impressaoFila = "Fila: ";
        
        for (int i = comeco;i <= (fim-1);i++) {
            impressaoFila += memo[i] + ", ";
            
        }
        if (isEmpty()) {
            impressaoFila = "Fila Vazia";
        }
        return impressaoFila;
    }

    
}
