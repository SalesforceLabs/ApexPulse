import { LightningElement,api } from 'lwc';
import { loadScript } from 'lightning/platformResourceLoader';
import chartjs from "@salesforce/resourceUrl/chartJS";
import gaugejs from "@salesforce/resourceUrl/tsGauge";

export default class GaugeIndicatorComponent extends LightningElement {

    @api score;
    gaugeConfig = {
        type: "tsgauge",
        data: {
            datasets: [
            {
                backgroundColor: [
                    "#c23934",
                    "#ff9900",
                    "#ffcc00",
                    "#669900",
                    "#027e46"
                ],
                borderWidth: 0,
                gaugeData: {
                    value: this.score,
                    valueColor: "#ff7143"
                },
                label: "My First Dataset",
                gaugeLimits: [0, 20, 40, 60, 80, 100]
            }
            ],
            value: "Score"
        },
        options: {
            events: [],
            showMarkers: true
        }
    };

    async renderedCallback() {
        if (!this.isChartJsInitialized) {
            await loadScript(this, chartjs);
            await loadScript(this, gaugejs);
        } else {
            this.updateGuage(this.score);
        }
        this.isChartJsInitialized = true;
        try {
            this.gaugeConfig.data.datasets[0].gaugeData.value = this.score;
            this.gaugeConfig.data.datasets[0].gaugeData.valueColor =
            this.calculateValueColor();
            const canvas = document.createElement("canvas");
            this.refs.chart.appendChild(canvas);
            const ctx = canvas.getContext("2d");
            this.chart = new window.Chart(ctx, this.gaugeConfig);
        } catch (error) {
            this.error = error;
        }
    }

    calculateValueColor() {
        return this.score < 20
        ? "#c23934"
        : this.score < 40
        ? "#ff9900"
        : this.score < 60
        ? "#ffcc00"
        : this.score < 80
        ? "#669900"
        : "#027e46";
    }
    @api
    setGaugeValue(value) {
        if (this.score !== value) {
            this.score = value;
            this.gaugeConfig.data.datasets[0].gaugeData.value = value;
            this.gaugeConfig.data.datasets[0].gaugeData.valueColor = this.calculateValueColor();
            this.chart.update();
        }
    }
}