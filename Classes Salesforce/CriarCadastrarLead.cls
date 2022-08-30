public class CriarCadastrarLead {
	
    
    // Este método cria Leads de acordo com a quantidade inserida;
    // OBS: ele cria metade Pessoa Física e metade Pessoa Jurídica, logo a as Listas de CNPJ e CPF devem ser do mesmo tamanho e metade do total de Leads;
    public static void InserirLeads(Integer quantidade){
        
        Integer i = quantidade/2;
        
        // Cria os dados de Lead com os métodos de criar nomes e sobrenomes aleatórios como parâmetros;
        // São criadas duas listas separadas que serão usadas com propósitos diferentes (tipos de registros diferentes);
        List<Lead> listLeadCPF = CriarDadosLead.DadosLead(CriarNomes.CreateFirstName(i), CriarNomes.CreateLastName(i));
        List<Lead> listLeadCNPJ = CriarDadosLead.DadosLead(CriarNomes.CreateFirstName(i), CriarNomes.CreateLastName(i));
        

	// Insere os Leads na ORG;
        CriarLeads.CadastrarLeadsCPF(listLeadCPF, CriaCNPJeCPF.CriarCPF(i));
        CriarLeads.CadastrarLeadsCNPJ(listLeadCNPJ, CriaCNPJeCPF.CriarCNPJ(i));
    }
}