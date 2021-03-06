# REVISÃO PROVA 01 - 'Técnicas de Programação' 

**'O difícil é o fácil que não sabemos' - CHEFE AZ**

Este tutorial tem como finalidade auxiliar a fazer o exercício abaixo, explicando alguns pontos específicos para a resolução do exercício abaixo.

## DIVIDIDO EM:
1. [INTERFACE - LOGIN](01%20-%20INTERFACE%20-%20LOGIN.md)
2. **AÇÕES INTERFACE - LOGIN**
3. [INTERFACE - CADASTRO](03%20-%20INTERFACE%20-CADASTRO.md)
4. [AÇÕES INTERFACE - CADASTRO](04%20-%20AÇÕES%20DA%20INTERFACE%20-%20CADASTRO.md)
5. [ATALHOS E DICAS](05%20-%20ATALHOS%20e%20DICAS.md)
---
**CHECK LIST 1 - INTERFACE(O QUE ESTAMOS VENDO) DE LOGIN**
- [ ] APERTANDO O BOTÃO,VERIFICAR SE O INPUT DO LOGIN E DA SENHA FOI INSERIDO 'ADMIN'
- [ ] CASO NÃO, APARECER UMA CAIXA DE DIÁLOGO
- [ ] CASO SIM, ESCONDER A TELA ATUAL
- [ ] AO ESCONDER A TELA ATUAL, MOSTRAR A 'TELA DE CADASTRO' (SERÁ FEITO DEPOIS)
---

#### DANDO AÇÃO A ALGUM ELEMENTO

Toda vez que for necessário inserir uma ação a algum elemento, clique duas vezes no elemento.
Perceba que você será redirecionado a aba 'CÓDIGO' E assim estará na linha do 'evento' conforme clicado, algo assim:


```java
private void btn_EntrarActionPerformed(java.awt.event.ActionEvent evt) {                                           
        // TODO add your handling code here:      
    }  
```

Então nosso código java precisa da seguinte sentença:

   1. Pegue o que está no input Login 
   2. E
   3. Pegue o que está no input Senha
   4. Compare e veja se é igual a 'admin'
   5. Caso sim, esconda a janela
   6. Caso não, mostre uma tela.
   
 As funções a serem utilizadas:
   
   1. getText() - >> pega o input de um JTextField
   2. if &&     - >> verifica se duas sentenças são verdadeiras
   3. equalsIgnoreCase     - >> verifica se duas Strings são iguais (não leva em consideração Case Sensitive
   4. dispose();   ->> fecha a janela atual
   5. JOptionPane.showMessageDialog(null, "Usuário ou senha Inválido!");   ---> chama o objeto JOptionPane, mostrando uma mensagem com o parametro null e a frase desejada.
   
Juntando todas as funções, o código que atribuirá um evento ao botão, ficará assim:
   
   ``` java
       private void btn_EntrarActionPerformed(java.awt.event.ActionEvent evt) {                                           
        // TODO add your handling code here:
        String login = input_Login.getText();
        String senha = input_Senha.getText();
        
        if(login.equalsIgnoreCase("admin") && senha.equalsIgnoreCase("admin")){
            dispose();
        }else{
            JOptionPane.showMessageDialog(null, "Usuário ou senha Inválido!");
                    
        }
        
    } 
    
    ```
Aperte 'SHIFT+F6' para rodar o programa e assim verificamos:

- [x] APERTANDO O BOTÃO,VERIFICAR SE O INPUT DO LOGIN E DA SENHA FOI INSERIDO 'ADMIN'
- [x] CASO NÃO, APARECER UMA CAIXA DE DIÁLOGO
- [x] CASO SIM, ESCONDER A TELA ATUAL
- [x] AO ESCONDER A TELA ATUAL, MOSTRAR A 'TELA DE CADASTRO' (SERÁ FEITO DEPOIS)

