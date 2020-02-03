global with sharing class LoginPage {
    
    public String password { get; set; }
    public String username { get; set; }

    public LoginPage() { }

       /* public PageReference registerUser() {
        PageReference newPage = new PageReference('/apex/newPage');
        newPage.setRedirect(true);
        return newPage;
    }*/
    global PageReference login() {
        PageReference newPage = new PageReference('/apex/newPage');
        newPage.setRedirect(true);
        return newPage;
    }
    public PageReference loginAdmin() {
        PageReference newPage = new PageReference('/apex/newPage');
        newPage.setRedirect(true);
        return newPage;
    }
    public PageReference forgotPassword() {
        PageReference newPage = new PageReference('/apex/newPage');
        newPage.setRedirect(true);
        return newPage;
    }
    public PageReference newPassanger() {
        PageReference newPage = new PageReference('/apex/newPage');
        newPage.setRedirect(true);
        return newPage;
    }
}

