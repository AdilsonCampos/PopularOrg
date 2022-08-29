public class UpdateContas {

// Os dados e campos dessa classe podem já ser inseridos nos Leads e, quando convertidos, já preenchidos automaticamente na conta (mapear os campos do Lead);
	
    //Assim como os Leads, as contas também possuem dois tipos de registros (PF e PJ) e layouts diferentes;
  
    // Método que atualiza informções de todas as contas de Pessoa Física;    
    public static void UpdateInfoContasPF(){
        
        // As listas abaixo são: Forma como o cliente conheceu a empresa e o seu hobby preferido;
        List<String> conhecList = new List<String> {
            'Redes Sociais', 'Redes Sociais', 'Redes Sociais', 'Redes Sociais', 'Anúncio TV', 'Outdoor', 'Anúncio Rádio', 'Amigo/conhecido', 'Outro'
        };
        List<String> hobbyList = new List<String> {
            'Jardinagem', 'Apostas', 'Apostas', 'Leitura', 'Leitura', 'Escrita', 'Música', 'Música', 'Pintura', 'Investimento', 'Redes Sociais', 'Redes Sociais', 'Redes Sociais', 'Redes Sociais', 'Redes Sociais',
                'Viagens', 'Viagens', 'Viagens', 'Atividade Física', 'Atividade Física', 'Atividade Física', 'Outro', 'Outro'
        };
        
        // Lista com as contas em que o campo CPF está preenchido;
        // Este método também pode ser feito com uma lista de contas de seu interesse como parâmetro;
        List<Account> contas = [SELECT id, Conhecimento_da_empresa__c, DataNascimento__c, HobbyCliente__c,
        RENDA_MENSAL__c FROM Account WHERE CPF__c !=null];
        
        List<Account> upContas = new List<Account>();
        
        for(Account conta:contas){
            Integer cN = Integer.valueOf(Math.random()*conhecList.size());
            Integer hN = Integer.valueOf(Math.random()*hobbyList.size());
            
            // Funções para definirem valores aleatórios para data de nsacimento do cliente;
            Integer dia = Integer.valueOf(Math.random()*28)+1; // Devido ao mês de fevereiro ter só "28 dias", o dia do nascimento vai de 1 a 28;
            Integer mes = Integer.valueOf(Math.random()*12)+1;
            Integer ano = Integer.valueOf(Math.random()*82)+1922; // Neste caso, o cliente mais velho terá o ano de nascimento em 1922 e o mais novo, 2003;
            // Lembrando que a função de número aleatório vai de 0 até o número definido menos um;
            // Ex: Integer.valueOf(Math.random()*12) --> vai de 0 a 11. Por isso o "+1" nas funções acima;
                        
			Integer rmN = Integer.valueOf((Math.random()*50)+1)*1000; // Valor aleatório da Renda mensal, com a menor venda no valor de 1000;
            
            // Atualização dos campos da conta;
            conta.Conhecimento_da_empresa__c = conhecList[cN];
            conta.DataNascimento__c = Date.newInstance(ano, mes, dia);
            conta.HobbyCliente__c = hobbyList[hN];
            conta.RENDA_MENSAL__c = rmN;
            
            upContas.add(conta);
        }
        update upContas;
    }
    
    // Ocorre da mesma forma que contas PF, mas com renda anual ao invés de mensal;
    public static void UpdateInfoContasPJ(){
		List<String> conhecList = new List<String> {
            'Redes Sociais', 'Redes Sociais', 'Redes Sociais', 'Redes Sociais', 'Anúncio TV', 'Outdoor', 'Anúncio Rádio', 'Amigo/conhecido', 'Outro'
        };
        
        List<Account> contas = [SELECT id, Conhecimento_da_empresa__c, AnnualRevenue FROM Account WHERE CNPJ__c !=null];
        
        List<Account> upContas = new List<Account>();
        
        for(Account conta:contas){
            Integer cN = Integer.valueOf(Math.random()*conhecList.size());
			Integer rmN = Integer.valueOf((Math.random()*100)+1)*100000;
                  
            conta.Conhecimento_da_empresa__c = conhecList[cN];
            conta.AnnualRevenue = rmN;
            
            upContas.add(conta);
        }
        update upContas;
    }
}