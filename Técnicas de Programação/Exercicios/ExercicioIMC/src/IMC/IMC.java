/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IMC;

/**
 *
 * @author Will
 */
public class IMC {
    private double peso;
    private double altura;
    private String classificacao;
    private double pesoIdeal;

   
    
    public double calcula(double peso,double altura){
        double imc;
        altura = altura/100;
        imc = peso/(altura*altura);
        
        return imc;
    } 
    
    public double calculaPesoIdealM(double altura){
        
        pesoIdeal = (altura-100)-((altura-150)/2);
        
        return pesoIdeal;
    }
    public double calculaPesoIdealH(double altura){
        
        pesoIdeal = (altura-100)-((altura-150)/4);
        
        return pesoIdeal;
    }
    public String classifica(double imc){
        
        if (imc<18.5){
            classificacao = "Abaixo do peso";
        }
        if (imc>=18.5 && imc<24.9){
            classificacao = "Peso Normal";
        }
        if (imc>25 && imc<29.9){
            classificacao = "Sobrepeso";
        }
        if (imc>30){
            classificacao = "Obesidade";
        }
 
        
        return classificacao;
    }

 
    
    
    
}
