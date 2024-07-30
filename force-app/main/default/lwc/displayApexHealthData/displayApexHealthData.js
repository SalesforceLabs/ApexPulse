import { LightningElement, wire, track } from 'lwc';
import getApexHealthRecords from '@salesforce/apex/ApexHealthUtility.getApexHealthRecords';
import getSalesforceDomain from '@salesforce/apex/ApexHealthUtility.getSalesforceDomain';

const COLUMNS = [
    { type: 'button', 
        typeAttributes: {
            label:'View', name:'View', title: 'View Details', variant: 'brand-outline'
        },
        cellAttributes: { 
            alignment: 'center' 
        }   
    },
    { label: 'Class Name', fieldName: 'ClassName__c' },
    { label: 'Nb of Methods Unused', fieldName: 'NbOfMethodsUnused__c' },
    { label: 'Nb of Variables Unused', fieldName: 'NbOfVariablesUnused__c' },
    { label: 'Health Percentage', fieldName: 'HealthPercentage__c'}
];

export default class DisplayApexHealthData extends LightningElement {
    @track healthData;
    @track error;
    @track isLoading = true;
    columns = COLUMNS;
    @track selectedRecord;
    @track sfDomain;
    @track score;
    @track counter = 0;

    @track activeMethodSections =['MethodsPresent','MethodsUsed','MethodsUnused'];
    @track activeVariableSections = ['VariablesPresent','VariablesUsed','VariablesUnused'];

    
    @wire(getApexHealthRecords)
    wiredHealthRecords({ error, data }) {
        if (data) {
            this.healthData = data;
            this.error = undefined;
            this.isLoading = false;
        } else if (error) {
            this.error = error;
            this.healthData = undefined;
            this.isLoading = false;
        }
    }

    @wire(getSalesforceDomain)
    wiredSalesforceDomain({ error, data }) {
        if (data) {
            this.sfDomain = data;
            this.error = undefined;
            this.isLoading = false;
        } else if (error) {
            this.error = error;
            this.sfDomain = undefined;
            this.isLoading = false;
        }
    }

    handleRowAction(event) {
        const row = event.detail.row;
        this.selectedRecord = row;
        this.score = this.selectedRecord.HealthPercentage__c;
        this.guageScore = this.score;
        this.counter+=1 ;
        if(this.counter > 1){
            if(this.guageScore  == undefined){
                this.guageScore = 0;
            }
            this.template.querySelector('c-gauge-indicator-component').setGaugeValue(this.guageScore);
        }
    }

    get recordUrl() {
        return this.selectedRecord && this.sfDomain ? `${this.sfDomain}/${this.selectedRecord.EntityId__c}` : '';
    }
}