
  /**
 * An apex page controller that exposes the site login functionality
 */
global with sharing class SiteLoginController {
    global String username {get; set;}
    global String password {get; set;}

    global PageReference login() {
      //  String startUrl = System.currentPageReference().getParameters().get('startUrl');
        String startUrl = '/HomePageUser';
        return Site.login(username, password, startUrl);
    }
    global PageReference loginAdmin() {
      //  String startUrl = System.currentPageReference().getParameters().get('startUrl');
        String startUrl = '/HomePageAdmin';
        return Site.login(username, password, startUrl);
    }
    
    global SiteLoginController () {}
}

