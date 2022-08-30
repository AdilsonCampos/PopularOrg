public class CriarLeads {
	
    // Recebe duas listas como parâmetros: uma com os dados do Lead já preechidos e uma com os CPFs para preencher;
    // As listas devem ser do mesmo tamanho;
    // Acrescenta CPF, Nome da "Empresa" e o Tipo de Registro;
    public static void CadastrarLeadsCPF(List<Lead> listLead, List<String> cpfs){
        List<Lead> leads = new List<Lead>();
        
        // Contador que irá percorrer a lista de CPFs
        Integer i = 0;
        
        for(Lead ld:listLead){
            ld.Company = ld.FirstName; // Por ser campo obrigatório e ser pessoa física, o nome da "Empresa" é o nome cadastrado;
            ld.CPF__c = cpfs[i];
			ld.RecordTypeId = '0128V000001EPkPQAW'; // ID do registro de Pessoa Física. DICA: buscar essa ID através do SOQL;
            leads.add(ld);
			
			i++;            
        }
        
        // Insere os Leads e imprime os erros, caso tenha
        Database.SaveResult[] insertCPFList = Database.insert(leads, false);
        for(Database.SaveResult srCPF:insertCPFList){
            if(srCPF.isSuccess() == false){
            	for(Database.Error err : srCPF.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }  
            }
        }
    }
    
    
    // Funciona da mesma forma que o método anterior, mas com uma lista com nome de empresas
    public static void CadastrarLeadsCNPJ(List<Lead> listLead, List<String> cnpjs){
    	List<String> empresas = new List<String>{// Inserir uma lista com nomes de empresas
        };
        
        List<Lead> leads = new List<Lead>();
        Integer i = 0;
        for(Lead ld:listLead){
            Integer empN = Integer.valueOf(Math.random()*empresas.size()); // Número aleatório que irá servir como índice para buscar um nome de empresa aleatório;
            ld.Company = empresas[empN];
            ld.CNPJ__c = cnpjs[i];
			ld.RecordTypeId = '0128V000001EQ36QAG'; // ID do registro de Pessoa Jurídica;
            leads.add(ld);
            
            i++;  
        }
        Database.SaveResult[] insertCNPJList = Database.insert(leads, false);
        for(Database.SaveResult srCNPJ:insertCNPJList){
            if(srCNPJ.isSuccess() == false){
            	for(Database.Error err : srCNPJ.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }  
            }
        }
       
    }
}