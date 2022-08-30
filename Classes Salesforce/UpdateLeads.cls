public class UpdateLeads {
 	
    // Método para alterar o status do Lead de acordo com sua preferência;
    // Os parâmetros são: lista de leads que você quer alterar e o status (String) que você quer atualizar;
    public static void AlterarStatus(List<Lead> listLeads, String statusNovo){
        
        List<Lead> uppLeads = new List<Lead>();
        
        for(Lead ld:listLeads){
            ld.Status = statusNovo;            
            uppLeads.add(ld);
        }
        Database.SaveResult[] srStatusUp = Database.update(uppLeads, false);
        for(Database.SaveResult srStatus:srStatusUp){
            if(srStatus.isSuccess() == false){
            	for(Database.Error err : srStatus.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
     			}
    		}
    	}
    }
    
    
    // Este método converte os leads de sua preferência;
    public static void ConverterLeads(List<Lead> listLeads){

        LeadStatus CLeadStatus= [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true Limit 1];
        List<Database.LeadConvert> MassLeadconvert = new List<Database.LeadConvert>();
        for(Lead currentlead: listLeads){
            Database.LeadConvert Leadconvert = new Database.LeadConvert();
            Leadconvert.setLeadId(currentlead.id);
            Leadconvert.setConvertedStatus(CLeadStatus.MasterLabel);
            MassLeadconvert.add(Leadconvert);
        }
        
        if (!MassLeadconvert.isEmpty()) {
            List<Database.LeadConvertResult> lcr = Database.convertLead(MassLeadconvert, false);
        }
    }

}