global with sharing class SignUpController {
    
     global String username {get; set;}
    global String password {get; set;}

  /*  global PageReference login() {
        String startUrl = System.currentPageReference().getParameters().get('startURL');
        return Site.login(username, password, startUrl);
    }
    
    global PageReference newPassanger() {
 PageReference pr = new PageReference('/apex/SignUp');
  pr.setRedirect(true);
  return pr;
    }
*/

//Add a correct page
global PageReference loginAdmin() {
PageReference pr = new PageReference('/apex/SignUp');
  pr.setRedirect(true);
  return pr;
    }

public SignUpController() {}

}
