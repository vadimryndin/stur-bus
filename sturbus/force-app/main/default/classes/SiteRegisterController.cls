/**
 * An apex class that creates a portal user
 */
public with sharing class SiteRegisterController {
    // PORTAL_ACCOUNT_ID is the account on which the contact will be created on and then enabled as a portal user.
    // you need to add the account owner into the role hierarchy before this will work - please see Customer Portal Setup help for more information.       
    private static Id PORTAL_ACCOUNT_ID = '0012v00002pM8aZAAS';
    
    

    public String username {get; set;}
    public String email {get; set;}
    public String password {get; set {password = value == null ? value : value.trim(); } }
    public String confirmPassword {get; set { confirmPassword = value == null ? value : value.trim(); } }
    public String communityNickname {get; set { communityNickname = value == null ? value : value.trim(); } }
    public String FirstName {get; set { FirstName = value == null ? value : value.trim(); } }
    public String Phone {get; set { Phone = value == null ? value : value.trim(); } }
      
    private boolean isValidPassword() {
        return password == confirmPassword;
    }
    
    public PageReference registerUser() {
        // it's okay if password is null - we'll send the user a random password in that case
        if (!isValidPassword()) {
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, Label.site.passwords_dont_match);
            ApexPages.addMessage(msg);
            return null;
        }    
        User u = new User();
        u.Username = username;
        u.Email = email;
        u.CommunityNickname = communityNickname;
        u.FirstName = FirstName;
        u.Last_Name__c = communityNickname;
               
        String accountId = PORTAL_ACCOUNT_ID;
        
        Passenger__c psg = new Passenger__c();
        psg.First_Name__c = FirstName;
        psg.Name = communityNickname;
        psg.Email__c = email;
        psg.Passanger_phone__c = Phone;
        psg.Account__c = accountId;
        insert psg;

        // lastName is a required field on user, but if it isn't specified, we'll default it to the username
        String userId = Site.createPortalUser(u, accountId, password);
        if (userId != null) { 
            if (password != null && password.length() > 5) {
             //   return Site.login(username, password, null);
                PageReference page = System.Page.loginAfterReg;
                page.setRedirect(true);
                return page;
            }
            else {
                PageReference page = System.Page.SiteRegisterConfirm;
                page.setRedirect(true);
                return page;
            }
        }
        return null;
        
    }

  /*  public SiteRegisterController () {
        Passenger__c psg = new Passenger__c();
        psg.First_Name__c = FirstName;
        psg.Name = communityNickname;
        psg.Email__c = email;
        psg.Id = accountId;
        insert psg;
    }*/

    public void addPsg(){
        Passenger__c psg = new Passenger__c();
        psg.First_Name__c = FirstName;
        psg.Name = communityNickname;
        psg.Email__c = email;
        insert psg;
    }

    public PageReference back() {
        PageReference page = System.Page.login;
        page.setRedirect(true);
        return page;
            }
}
