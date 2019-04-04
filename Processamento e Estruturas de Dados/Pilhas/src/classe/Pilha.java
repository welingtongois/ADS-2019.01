package classe;


public class Pilha {
    
    private int MAX;
    private Object memo[];
    private int topo;
    
    public Pilha(){
        MAX = 30;
        memo = new Object[MAX];
        topo = -1;
    }
    
    public boolean isEmpty(){
        return (topo==-1);
    }
    
    public boolean isFull(){
        return(topo==MAX-1);
    }
    
    public void push(Object x){
        if(!isFull()){
            topo++;
            memo[topo] =x;
        } else{
            System.out.println("Pilha Cheia [Stack Overflow]");
        }
    }
    
    public Object top(){
        if(!isEmpty()){
            return memo[topo];
        } else{
            return "Pilha Vazia";
        }
    }
    
    public Object pop(){
        if(!isEmpty()){
            return memo[topo--];
        }else{
            return "Pilha Vazia";
        }
    }
    
    public String print(){
        String resposta;
        
        if(!isEmpty()){
            String resp ="";
            for(int i=0;i<=topo;i++){
                resp+=memo[i]+", ";
            }
            resposta = "P=["+resp+"]";
        }
        else{
            resposta = "Pilha Vazia[Stack Empty]";
        }
        return resposta;
    }
}
