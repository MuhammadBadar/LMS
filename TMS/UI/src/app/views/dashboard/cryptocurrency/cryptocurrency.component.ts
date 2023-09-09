import { Component, OnInit } from "@angular/core";
import { egretAnimations } from "app/shared/animations/egret-animations";
import { ThemeService } from "app/shared/services/theme.service";
import tinyColor from 'tinycolor2';

@Component({
  selector: "app-cryptocurrency",
  templateUrl: "./cryptocurrency.component.html",
  styleUrls: ["./cryptocurrency.component.scss"],
  animations: egretAnimations
})
export class CryptocurrencyComponent implements OnInit {
  cryptoChart: any;
  cryptoDonutChart: any;
  activeTrades: any[];
  trendingCurrencies: any[];
  
  constructor(    
    private themeService: ThemeService
  ) {}

  ngOnInit() {
    this.themeService.onThemeChange.subscribe(activeTheme => {
      this.initCryptoChart(activeTheme);
    });
    this.initCryptoChart(this.themeService.activatedTheme);

    this.cryptoDonutChart = {
      grid: {
        left: "3%",
        right: "4%",
        bottom: "3%",
        containLabel: true
      },
      color: ["#03A9F4", "#039BE5", "#fcc02e"],
      tooltip: {
        show: false,
        trigger: "item",
        formatter: "{a} <br/>{b}: {c} ({d}%)"
      },
      xAxis: [
        {
          axisLine: {
            show: false
          },
          splitLine: {
            show: false
          }
        }
      ],
      yAxis: [
        {
          axisLine: {
            show: false
          },
          splitLine: {
            show: false
          }
        }
      ],

      series: [
        {
          name: "Sessions",
          type: "pie",
          radius: ["65%", "85%"],
          center: ["50%", "50%"],
          avoidLabelOverlap: false,
          hoverOffset: 5,
          stillShowZeroSum: false,
          label: {
            normal: {
              show: false,
              position: "center",
              textStyle: {
                fontSize: "13",
                fontWeight: "normal"
              },
              formatter: "{a}"
            },
            emphasis: {
              show: true,
              textStyle: {
                fontSize: "15",
                fontWeight: "normal",
                color: "rgba(0, 0, 0, 0.8)"
              },
              formatter: "{b} \n{c} ({d}%)"
            }
          },
          labelLine: {
            normal: {
              show: false
            }
          },
          data: [
            {
              value: 335,
              name: "Direct"
            },
            {
              value: 310,
              name: "Search Eng."
            },
            { value: 148, name: "Social" }
          ],
          itemStyle: {
            emphasis: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: "rgba(0, 0, 0, 0.5)"
            }
          }
        }
      ]
    };
    this.activeTrades = [
      {
        icon: "assets/images/cryptocurrencies/BTC.png",
        currency: "Bitcoin",
        balance: 3000,
        buyingRate: 450,
        currentRate: 450,
        profitLoss: 400,
        lastPrice: 300
      },
      {
        icon: "assets/images/cryptocurrencies/ADA.png",
        currency: "Bitcoin",
        balance: 3000,
        buyingRate: 450,
        currentRate: 450,
        profitLoss: 400,
        lastPrice: 300
      },
      {
        icon: "assets/images/cryptocurrencies/LTC.png",
        currency: "Bitcoin",
        balance: 3000,
        buyingRate: 450,
        currentRate: 450,
        profitLoss: 400,
        lastPrice: 300
      },
      {
        icon: "assets/images/cryptocurrencies/AE.png",
        currency: "Bitcoin",
        balance: 3000,
        buyingRate: 450,
        currentRate: 450,
        profitLoss: 400,
        lastPrice: 300
      }
    ];

    this.trendingCurrencies = [
      {
        currency: "Bitcoin",
        rate: 3800
      },
      {
        currency: "Bitcoin",
        rate: 3800
      },
      {
        currency: "Bitcoin",
        rate: 3800
      },
      {
        currency: "Bitcoin",
        rate: 3800
      }
    ];
  }

  initCryptoChart(theme) {
    this.cryptoChart = {
      tooltip: {
        show: true,
        trigger: "axis",
        backgroundColor: "#fff",
        extraCssText: "box-shadow: 0 0 3px rgba(0, 0, 0, 0.3); color: #444",
        axisPointer: {
          type: "line",
          animation: true
        }
      },
      grid: {
        top: "10%",
        left: "60",
        right: "20",
        bottom: "60"
      },
      xAxis: {
        type: "category",
        data: [
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
          "7",
          "8",
          "9",
          "10",
          "11",
          "12",
          "13",
          "14",
          "15",
          "16",
          "17",
          "18",
          "19",
          "20",
          "21",
          "22",
          "23",
          "24",
          "25",
          "26",
          "27",
          "28",
          "29",
          "30"
        ],
        axisLine: {
          show: false
        },
        axisLabel: {
          show: true,
          margin: 30,
          color: "#888"
        },
        axisTick: {
          show: false
        }
      },
      yAxis: {
        type: "value",
        axisLine: {
          show: false
        },
        axisLabel: {
          show: true,
          margin: 20,
          color: "#888"
        },
        axisTick: {
          show: false
        },
        splitLine: {
          show: true,
          lineStyle: {
            type: "dashed"
          }
        }
      },
      series: [
        {
          data: [
            640,
            1040,
            840,
            1240,
            1040,
            1440,
            1240,
            1640,
            1440,
            1840,
            1640,
            2040,
            1840,
            2240,
            2040,
            2440,
            2240,
            2640,
            2440,
            2840,
            2640,
            3040,
            2840,
            3240,
            3040,
            3440,
            3240,
            3640,
            3440,
            3840
          ],
          type: "line",
          name: "Bitcoin",
          smooth: true,
          color: tinyColor(theme.baseColor).toString(),
          lineStyle: {
            opacity: 1,
            width: 3
          },
          itemStyle: {
            opacity: 0
          },
          emphasis: {
            itemStyle: {
              color: tinyColor(theme.baseColor).toString(),
              borderColor: tinyColor(theme.baseColor).setAlpha(.4).toString(),
              opacity: 1,
              borderWidth: 8
            },
            label: {
              show: false,
              backgroundColor: "#fff"
            }
          }
        },
        {
          data: [
            240,
            640,
            440,
            840,
            640,
            1040,
            840,
            1240,
            1040,
            1440,
            1240,
            1640,
            1440,
            1840,
            1640,
            2040,
            1840,
            2240,
            2040,
            2440,
            2240,
            2640,
            2440,
            2840,
            2640,
            3040,
            2840,
            3240,
            3040,
            3440
          ],
          type: "line",
          name: "Ethereum (ETH)",
          smooth: true,
          color: "rgba(0, 0, 0, .3)",
          lineStyle: {
            opacity: 1,
            width: 3
          },
          itemStyle: {
            opacity: 0
          },
          emphasis: {
            itemStyle: {
              color: "rgba(0, 0, 0, .5)",
              borderColor: "rgba(0, 0, 0, .2)",
              opacity: 1,
              borderWidth: 8
            },
            label: {
              show: false,
              backgroundColor: "#fff"
            }
          }
        }
      ]
    };
  }
}
