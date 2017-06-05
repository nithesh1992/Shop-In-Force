public class ProductController {
    public ApexPages.StandardSetController Con {
        get {
            if(Con == null) {
                Con = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Id, Name, UnitPrice FROM PricebookEntry Where IsActive = true]));
                Con.setPageSize(5);
            }
            return Con;
        }
        set;
    }
    
    public List<ProductWrapper> ProductWrapList {get; set;}
    public List<PricebookEntry> prods =  (List<PricebookEntry>) Con.getRecords();
    
    // Initialize setCon and return a list of records
    public List<PricebookEntry> getProducts() {
        return prods;
    }

    public Boolean hasNext {
        get {
            return con.getHasNext();
        }
        set;
    }

    // indicates whether there are more records before the current page set.
    public Boolean hasPrevious {
        get {
            return con.getHasPrevious();
        }
        set;
    }

    // returns the page number of the current page set
    public Integer pageNumber {
        get {
            return con.getPageNumber();
        }
        set;
    }
     

     // returns the previous page of records
     public void previous() {
         con.previous();
     }

     // returns the next page of records
     public void next() {
         con.next();
     }

    @RemoteAction
    public static List<PricebookEntry> refresh(String searchPhrase) {        
        String keyword = '%' + searchPhrase + '%';
        List<PricebookEntry> results = [SELECT Id, Name, UnitPrice FROM PricebookEntry Where IsActive = true AND Name LIKE :keyword];
        return results;
    }
    
        
}