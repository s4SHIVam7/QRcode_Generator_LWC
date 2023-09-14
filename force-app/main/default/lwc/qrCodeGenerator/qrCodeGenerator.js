import { LightningElement } from 'lwc';

export default class qrCodeGenerator extends LightningElement {
    inputValue = '';
    value      = false;
    url        = "https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl=";
    img_url    = '';

    inputChange(event) {
        this.inputValue = event.target.value;
        
    }

    letterHandler() {
        
        this.value      = true;
        this.img_url    = this.url + this.inputValue;

    }
}