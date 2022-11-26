import { LightningElement, track } from 'lwc';

export default class HelloWorld extends LightningElement {
   @track dynamicHelloWorld = 'World';

   onChangeDinamic(event) {
    this.dynamicHelloWorld = event.target.value
   }
}