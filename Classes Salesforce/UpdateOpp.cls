public class UpdateOpp {
	
    // Método altera o status das oportunidades inseridas no parâmetro;
    public static void UpdateStatusOpp(List<Opportunity> listOpp, String statusNovo){
        List<Opportunity> listOppUp = new List<Opportunity>();
        for(Opportunity opp:listOpp){
            opp.StageName = statusNovo;
            listOppUp.add(opp);
        }
        Database.SaveResult[] updateStageName = Database.update(listOppUp, false);
        for(Database.SaveResult srOppUp:updateStageName){
            if(srOppUp.isSuccess() == false){
            	for(Database.Error err : srOppUp.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
     			}
    		}
    	}
    }
    
    // Método altera o status para oportunidade perdida e insere o motivo da perda em um campo personalizado de lista de opções;
    public static void UpdateClosedLost(List<Opportunity> listOpp){
        List<String> motivosList = new List<String>{
            'Falta de renda', 'Falta de renda', 'Falta de renda', 'Insatisfeito com o produto', 'Insatisfeito com o atendimento', 'Preferiu a concorrência', 'Outros', 'Preferiu a concorrência', 'Outros'
        };
        List<Opportunity> listOppUp = new List<Opportunity>();
        for(Opportunity opp:listOpp){
            Integer mN = Integer.valueOf(Math.random()*motivosList.size());
            opp.StageName = 'Negócio Perdido'; // Nome da fase de uma oportunidade perdida NESTE CASE
            opp.Motivo_da_perda__c = motivosList[mN];
            listOppUp.add(opp);
        }
        Database.SaveResult[] updateMotivoPerda = Database.update(listOppUp, false);
        for(Database.SaveResult srOppUp:updateMotivoPerda){
            if(srOppUp.isSuccess() == false){
            	for(Database.Error err : srOppUp.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
     			}
    		}
    	}
    }
}