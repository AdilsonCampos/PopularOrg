public class CriarDadosLead {
    
    // Este método cria dados para cadastro do Lead de acordo com sua necessidade;
    // Os seus parâmetros são listas de nomes e sobrenomes, podendo ser os métodos da classe CriarNomes;
    // As listas de nomes e sobrenomes devem ser do MESMO TAMANHO
    public static List<Lead> DadosLead(List<String> fnames, List<String> lnames){
        
        // Neste CASE, a empresa só atendia clientes das regiões Sudeste e Sul, não havendo necessidade de cadastro de estados que não fosse dessas regiões;
        
        // Como as regiões são escolhidas de forma aleatória da lista abaixo, algumas regiões estão repetidas pelo simples fato de aumentar a probabilidade de serem escolhidas e se aproximarem mais da realidade;       
        List<String> regioes = new List<String>{
            'Norte', 'Nordeste', 'Nordeste', 'Nordeste', 'Centro-Oeste', 'Sudeste', 'Sul', 'Sudeste', 'Sul', 'Sudeste', 'Sul', 'Sudeste', 'Sul', 'Sudeste', 'Sul', 'Sudeste', 'Sul', 'Sudeste', 'Sudeste', 'Sudeste', 'Sudeste', 'Sudeste'
        };
        
        // As capitais de cada estado estão repetidas pelo mesmo motivo da haverem regiões repetidas na lista acima;
        List<String> citySP = new List<String>{
        	'São Paulo', 'São Paulo', 'São Paulo', 'Santos', 'Ubatuba', 'Taubaté', 'Piracicaba', 'Riberão Preto'
        };
        List<String> cityRJ = new List<String>{
        	'Rio de Janeiro', 'Rio de Janeiro', 'Rio de Janeiro', 'Macaé', 'Paraty', 'Duque de Caxias', 'Belford Roxo', 'Nova Iguaçu'
        };
        List<String> cityMG = new List<String>{
        	'Belo Horizonte', 'Belo Horizonte', 'Belo Horizonte', 'Uberlândia', 'Uberaba', 'Alfenas', 'Viçosa', 'Juiz de Fora'
        };
        List<String> cityES = new List<String>{
        	'Vitória', 'Vitória', 'Vitória', 'Vila Velha', 'Guarapari', 'Serra', 'Cariacica', 'Linhares'
        };
        List<String> cityPR = new List<String>{
        	'Curitiba', 'Curitiba', 'Curitiba', 'Maringa', 'Londrina', 'Foz do Iguaçu', 'Cascavel', 'Ponta Grossa'
        };
        List<String> citySC = new List<String>{
        	'Florianópolis', 'Florianópolis', 'Florianópolis', 'Joinville', 'Blumenau', 'Brusque', 'Chapecó', 'Lages'
        };
        List<String> cityRS = new List<String>{
        	'Porto Alegre', 'Porto Alegre', 'Porto Alegre', 'Rio Grande', 'Pelotas', 'Gramado', 'Canela', 'Bento Gonçalves'
        };
            
        // Lista para selecionarem a origem do Lead de acordo com as opções no campos personalizado criado;
        // A repetição de dados na lista abaixo é pelo mesmo motivo da anteriores;
        List<String> origemLead = new List<String> {'Redes Sociais','Redes Sociais','Redes Sociais', 'Site', 'Site', 'Site', 'Site', 'Site', 'Site', 'Site', 'Indicação', 'Lista adquirida', 'Lista adquirida', 'Outros', 'Outros'};
        
        // Lista que irá conter os Leads criados
        List<Lead> leads = new List<Lead>();
        
        // Criado para percorrer a lista de sobrenomes no "for" abaixo;
        Integer i = 0;
        
        for(String fn:fnames){// Percorre a lista de nomes inserida como parâmetro;
            
            // Funções que geram um número aleatório de acordo com o tamanho da lista informada para serem usados como índices para pegarem um dados aleatório da lista.
            Integer oLN = Integer.valueOf(Math.random()*origemLead.size()); 
            Integer rN = Integer.valueOf(Math.random()*regioes.size());
            
            Integer telefone = Integer.valueOf((Math.random()*99999999)+900000000); //Função que gera um número de telefone aleatório começando com o número 9;
            String cidade;
            
            // Pega os valores de estados e cidades, caso a região definida aleatoriamente seja Sul ou Sudeste;
            if(regioes[rN] == 'Sul' || regioes[rN] == 'Sudeste'){
                String estado;
                
                // Caso for da região Sul, irá escolher um estado aleatoriamente da mesma forma que os dados anteriores;
                if(regioes[rN] == 'Sul'){
                    
                    // Lista de estados do Sul
                    List<String> estados = new List<String>{
        			'Rio Grande do Sul', 'Paraná', 'Santa Catarina'
        			};
                    Integer num = Integer.valueOf(Math.random()*estados.size()); //Índice aleatório para definir o estado;
                    Integer num1 = Integer.valueOf(Math.random()*8); //Índice aleatório para definir a cidade (Lista com 8 cidades);
                    estado = estados[num]; // Armazena o valor aleatório do estado;
                    
                    // Definem as cidades de acordo com cada estado de forma aleatória;
                    if(estado == 'Rio Grande do Sul') cidade = cityRS[num1];
                    if(estado == 'Paraná') cidade = cityPR[num1];
                    if (estado == 'Santa Catarina') cidade = citySC[num1];
                }
                
                // Realiza as mesmas operações, mas com estados da região Sudeste;
                else{
                    List<String> estados = new List<String>{
        			'São Paulo', 'Rio de Janeiro', 'Minas Gerais', 'São Paulo', 'Rio de Janeiro', 'Minas Gerais',
                        'São Paulo', 'Rio de Janeiro', 'Minas Gerais', 'São Paulo', 'Espírito Santo'
        			};
                    Integer num = Integer.valueOf(Math.random()*estados.size());
                    Integer num1 = Integer.valueOf(Math.random()*8);
                    estado = estados[num];
                    if(estado == 'São Paulo') cidade = citySP[num1];
                    else if(estado == 'Rio de Janeiro') cidade = cityRJ[num1];
                    else if(estado == 'Minas Gerais') cidade = cityMG[num1];
                    else if(estado == 'Espírito Santo') cidade = cityES[num1];
                } 
                
                	// Cria os dados de um lead de acordo com os dados obtidos até agora;
                    Lead ld = new Lead(
                        FirstName = fn,
                        LastName = lnames[i],
                        Email = lnames[i].toLowerCase()+'@email.com', // Email aleatório NÃO VÁLIDO!!
                        Regiao__c = regioes[rN],
                        State = estado,
                        City = cidade,
                        MobilePhone = String.valueOf(telefone),
                        LeadSource = origemLead[oLN]
            		);
                    leads.add(ld);    // Adiciona o Lead à lista criada anteriormente                           
            }
            
            // Caso a região do Lead não seja Sul ou Sudeste;
            else{
                Lead ld = new Lead(
            		FirstName = fn,
               		LastName = lnames[i],
                    Email = lnames[i].toLowerCase()+'@email.com',
                	Regiao__c = regioes[rN],
                    MobilePhone = String.valueOf(telefone),
                    LeadSource = origemLead[oLN]
            	);
                
                leads.add(ld);
            }
             i++; // Contador para percorrer a lista de sobrenomes;  
            }
        return leads; // Retorna a lista de leads para serem usados em operações em sequência;           
    }
}