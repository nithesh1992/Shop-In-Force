public class ProductController {
    public ApexPages.StandardSetController Con {
        get {
            if(Con == null) {
                Con = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Id, Name, UnitPrice FROM PricebookEntry Where IsActive = true AND Pricebook2.Name = 'nShop']));
                Con.setPageSize(5);
            }
            return Con;
        }
        set;
    }
    
    public List<ProductWrapper> ProductWrapList {get; set;}
    public List<PricebookEntry> prods =  (List<PricebookEntry>) Con.getRecords();
    public Boolean empty = false;
    
    // Initialize setCon and return a list of records
    public List<PricebookEntry> getProducts() {
        return prods;
    }

    public Boolean hasNext {
        get {
            return Con.getHasNext();
        }
        set;
    }

    // indicates whether there are more records before the current page set.
    public Boolean hasPrevious {
        get {
            return Con.getHasPrevious();
        }
        set;
    }

    // returns the page number of the current page set
    public Integer pageNumber {
        get {
            return Con.getPageNumber();
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

     public Boolean getisEmpty(){
        empty = prods.isEmpty();
        return empty;
     }

    
    public PageReference runSearch() {   
        String searchPhrase = '%' + String.escapeSingleQuotes(Apexpages.currentPage().getParameters().get('searchbar')) + '%' ;    
       // String query = 'SELECT Id, Name, UnitPrice FROM PricebookEntry Where IsActive = true AND Name LIKE \'%' 
       //                 + String.escapeSingleQuotes(searchPhrase) 
       //                 +'%\'';

        Con = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Id, Name, UnitPrice FROM PricebookEntry Where IsActive = true AND Pricebook2.Name = 'nShop' AND Name LIKE  :searchPhrase ]));
                Con.setPageSize(5);
        prods = (List<PricebookEntry>) Con.getRecords();
        return null;
    }

    
        
}