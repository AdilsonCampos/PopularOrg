public class CriarNomes {
    
    //Classe que cria uma lista com nomes (primeiro nome) aleatórios a partir de um lista maior com vários nomes.
    //O parâmetro do método é a quantidade de nomes que você quer gerar.
    public static List<String> CreateFirstName(Integer i){
        
        //Lista com os nomes para serem pegos aleatoriamente.
        List<String> fnames = new List<String>{//Inserir nomes para compor uma lista de primeiros nomes
        };
            
        //Cria a lista que vai retornar os nomes na quantidade inserida no parâmetro.
        List<String> FirstNames = new List<String>();
        for(Integer a=0; a<i; a++){ //Realiza o loop na quantidade de vezes que foi inserida no parâmetro
         	Integer fn = Integer.valueOf(Math.random()*fnames.size());
            
            //Adiciona o nome na lista
            FirstNames.add(fnames[fn]);
        }
        return FirstNames;
    }
    
    //Método igual ao anterior
    public static List<String> CreateLastName(Integer i){
        List<String> lnames = new List<String>{//Inserir nomes para compor uma lista de sobrenomes
       	};
        List<String> LastNames = new List<String>();
        for(Integer a=0; a<i; a++){
         	Integer ln = Integer.valueOf(Math.random()*lnames.size());
            LastNames.add(lnames[ln]);
        }
        return LastNames;
    }
}