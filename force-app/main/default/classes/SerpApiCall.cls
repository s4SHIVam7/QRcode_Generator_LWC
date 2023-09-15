public class SerpApiCall {
    
    
    @AuraEnabled(cacheable=false)
    public static String sertCall(string query){
        
        //We created/instantiated a HTTP Object
        Http http = new Http();
        
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://serpapi.com/search.json?engine=google&tbm=isch&q='+query+'&api_key=5d82d464eea8a7b87a6f17ead6dfd401f74187d11a67765e9e44c5d266e4bddd');
        req.setMethod('GET');
        
        HTTPResponse res = http.send(req);
        system.debug(res);
        
        //Parsing the data from response (JSON to Apex specific format )
        Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        List<Object> m2 = (List<Object>) m.get('images_results');
        Map<String, Object> firstMap = (Map<String, Object>)m2[0];
        String imageUrl = (String)firstMap.get('thumbnail');
        system.debug(imageUrl);
        
        if(imageUrl != null && imageUrl.length() > 0){
            return imageUrl;
        }else{
            return 'NoResponse found';
        }
         
    }
    
}