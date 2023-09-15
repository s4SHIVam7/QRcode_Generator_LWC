import { LightningElement } from 'lwc';
import serpApi from '@salesforce/apex/SerpApiCall.sertCall';
export default class Google_img_search_lwc extends LightningElement {}
imageLink;

isVisible = false;


searchQuery;

onChangeHandler(event){
    this.searchQuery = event.target.value.replace(/\s/g, '+');
}


    searchHandler(){

     

        serpApi({
            query: this.searchQuery
        })
            .then((response) => {
                console.log('The data iscoming', response);
                this.imageLink  = response;
            })
            .catch((error) => {
                console.log('The error is coming', error);
            });

         this.isVisible = true;
    }

}