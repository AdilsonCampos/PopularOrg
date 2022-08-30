public class CriaCNPJeCPF {
    
    // Método que retorna uma lista de CNPJs de acordo com a quantidade inserida no parâmetro;
    public static List<String> CriarCNPJ(Integer quantidade){
        
        // A lista abaixo foi preenchida com CNPJs válidos gerados em um site com esse intuito;
        // Verificar a seção de PYTHON;
        List<String> cnpjList = new List<String>{// Insira uma lista com CNPJs válidos
        };
       
        List<String> cnpjs = new List<String>();           
        for(Integer i = 0; i<quantidade; i++){
            cnpjs.add(cnpjList[i]);
        }
       	return cnpjs;
    }
    
    // Método que retorna uma lista de CPFs de acordo com a quantidade inserida no parâmetro;
    public static List<String> CriarCPF(Integer quantidade){
        
        // A lista abaixo foi preenchida com CPFs válidos gerados em um site com esse intuito;
        // Verificar a seção de PYTHON;
        List<String> cpfList = new List<String>{// Insira uma lista com CPFs válidos
        };
            
        List<String> cpfs = new List<String>();           
        for(Integer i = 0; i<quantidade; i++){
            cpfs.add(cpfList[i]);
        }
       	return cpfs;
    }
}