import { LightningElement, track } from 'lwc';

export default class CondicionalRendering extends LightningElement {
    @track displayDiv = false;

    @track cityList  = ['Gravatai', 'canoas', 'Porto Alegre'];
    
    showDivHandler(event) {
       this.displayDiv = event.target.checked;
    }
}