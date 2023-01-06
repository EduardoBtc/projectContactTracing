import { LightningElement, track, wire, api } from 'lwc';
import getProducts from "@salesforce/apex/PricebookEntrySelector.getAllProdutsVarejoteste";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const columns = [
    { label: 'Nome', fieldName: 'Name' },
    { label: 'Quantidade', fieldName: 'Quantity', type: 'number' , editable: true}
];


export default class AdicionarProdutosMobile extends LightningElement {

    columns = columns;

    ProductName = 'Hop';
    ProductValue = 'RS: 4,00';
    ProductFamily = 'Cerveja';

    _title;
    message;
    variant;

    @api SearchKey = '';

    connectedCallback(){
        console.log('callback:');
        getProducts({nameProduct : this.nameProduct})
        .then(result => {
            console.log('callback:');
            this.data = result;
            console.log('callback:');
        })
        .catch(error => {
            console.log('Error:' + error);
        })
    }

    handleChanged(event) {
        this.SearchKey = event.target.value;
        console.log('SearchKey:' + this.SearchKey);

        getProducts({nameProduct : this.SearchKey})
        .then(result => {
            this.data = result;
            console.log('result:' + result);
        })
        .catch(error => {
            console.log('Error:' + error);
        })
    }

    showNotification() {
        console.log('showNotification');
        const evt = new ShowToastEvent({
            title: 'Sucesso',
            message: 'Produto adicionado com sucesso!',
            variant: 'success',
        });
        this.dispatchEvent(evt);
    }
    
}