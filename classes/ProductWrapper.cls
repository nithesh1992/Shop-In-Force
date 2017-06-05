public class ProductWrapper {
    
    public PricebookEntry prod {get; set;}
    public Integer quantity {get; set;}
    
    public ProductWrapper(PricebookEntry p) {
        prod = p;
        quantity = 0;
    }
}