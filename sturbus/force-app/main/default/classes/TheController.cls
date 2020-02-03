public class TheController{
    private ApexPages.StandardController sctrl;
    public TheController(ApexPages.StandardController stdController)
    {
        this.sctrl = stdController;
    }
  
    public PageReference returnPage(){
   // PageReference pr = new PageReference(ApexPages.currentPage().getParameters().get('retURL'));  
   PageReference pr = new PageReference('/HomePageUser');
    pr.setRedirect(true);
    return pr;
    }
/*
   public PageReference returnPage(){
    PageReference pr = Page.HomePageUser;
    pr.setRedirect(true);
    return pr;
    }
*/    
}
