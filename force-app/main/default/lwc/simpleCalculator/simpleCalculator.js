import { LightningElement, track } from 'lwc';

export default class SimpleCalculator extends LightningElement {
    @track currentResult;
    @track previusResult = [];
    @track resultPreviousResult = false;

    firstNumber;
    lastNumber;

    numberChangeHandler(event) {
        const inputNumber = event.target.name;
        if(inputNumber === 'firstNumber') {
            this.firstNumber = event.target.value;
        }else if(inputNumber === 'secondNumber'){
            this.lastNumber = event.target.value;
        }
    }

    addHandler() {
        const firstN = parseInt(this.firstNumber);
        const lastN = parseInt(this.lastNumber);

        this.currentResult = `Result of ${firstN} + ${lastN} is ${firstN + lastN}`;
        this.previusResult.push(this.currentResult);
    }

    substractHandler() {
        const firstN = parseInt(this.firstNumber);
        const lastN = parseInt(this.lastNumber);

        this.currentResult = `Result of ${firstN} - ${lastN} is ${firstN - lastN}`;
        this.previusResult.push(this.currentResult);
    }

    multiplyHandler() {
        const firstN = parseInt(this.firstNumber);
        const lastN = parseInt(this.lastNumber);

        this.currentResult = `Result of ${firstN} x ${lastN} is ${firstN * lastN}`;
        this.previusResult.push(this.currentResult);
    }

    divideHandler() {
        const firstN = parseInt(this.firstNumber);
        const lastN = parseInt(this.lastNumber);

        this.currentResult = `Result of ${firstN} / ${lastN} is ${firstN / lastN}`;
        this.previusResult.push(this.currentResult);
    }

    ShowPreviousResults(event) {
        this.resultPreviousResult = event.target.checked;
    }
}