import { Component, OnInit, OnDestroy } from '@angular/core';
import { egretAnimations } from 'app/shared/animations/egret-animations';
import { LayoutService } from 'app/shared/services/layout.service';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-dashboard-dark',
  templateUrl: './dashboard-dark.component.html',
  styleUrls: ['./dashboard-dark.component.scss'],
  animations: egretAnimations
})
export class DashboardDarkComponent implements OnInit, OnDestroy {
    dailyTrafficChartBar: any;
    monthlyTrafficChartBar: any;
    dailyBandwithUsage: any;
    trafficGrowthChart: any;
    countryTrafficStats = [
      {
        country: "US",
        visitor: 14040,
        pageView: 10000,
        download: 1000,
        bounceRate: 30,
        flag: "flag-icon-us"
      },
      {
          country: "India",
          visitor: 12500,
          pageView: 10000,
          download: 1000,
          bounceRate: 45,
          flag: "flag-icon-in"
      },
      {
          country: "UK",
          visitor: 11000,
          pageView: 10000,
          download: 1000,
          bounceRate: 50,
          flag: "flag-icon-gb"
      },
      {
          country: "Brazil",
          visitor: 4000,
          pageView: 10000,
          download: 1000,
          bounceRate: 30,
          flag: "flag-icon-br"
      },
      {
          country: "Spain",
          visitor: 4000,
          pageView: 10000,
          download: 1000,
          bounceRate: 45,
          flag: "flag-icon-es"
      },
      {
          country: "Mexico",
          visitor: 4000,
          pageView: 10000,
          download: 1000,
          bounceRate: 70,
          flag: "flag-icon-mx"
      },
      {
          country: "Russia",
          visitor: 4000,
          pageView: 10000,
          download: 1000,
          bounceRate: 40,
          flag: "flag-icon-ru"
      }
    ];
    
    constructor(
      private layout: LayoutService,
      private snack: MatSnackBar
    ) {
      
    }
  
    ngOnInit() {
      setTimeout(() => {
        this.layout.publishLayoutChange({sidebarColor: 'dark-blue', topbarColor: 'dark-blue', footerColor: 'dark-blue', matTheme: "egret-dark-purple"});
        this.snack.open('Layout option changed to {sidebarColor: "dark-blue", topbarColor: "dark-blue", matTheme: "egret-dark-purple"};', 'OK', {duration: 6000})
      });

      this.dailyTrafficChartBar = {
        legend: {
          show: false
        },
        grid: {
          left: "8px",
          right: "8px",
          bottom: "0",
          top: "0",
          containLabel: true
        },
        tooltip: {
          show: true,
          backgroundColor: "rgba(0, 0, 0, .8)"
        },
        xAxis: [
          {
            type: "category",
            // data: ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
            data: ["1", "2", "3", "4", "5", "6", "7"],
            axisTick: {
              show: false
            },
            splitLine: {
              show: false
            },
            axisLine: {
              show: false
            },
            axisLabel: {
              color: "#fff"
            }
          }
        ],
        yAxis: [
          {
            type: "value",
            axisLabel: {
              show: false,
              formatter: "${value}"
            },
            min: 0,
            max: 100000,
            interval: 25000,
            axisTick: {
              show: false
            },
            axisLine: {
              show: false
            },
            splitLine: {
              show: false,
              interval: "auto"
            }
          }
        ],
  
        series: [
          {
            name: "Online",
            data: [35000, 69000, 22500, 60000, 50000, 50000, 30000],
            label: { show: false, color: "#0168c1" },
            type: "bar",
            barWidth: "8",
            color: "#f6be1a",
            smooth: true,
            itemStyle: {
              barBorderRadius: 10
            }
          }
        ]
      };
      this.monthlyTrafficChartBar = {
        tooltip: {
          trigger: "axis",
  
          axisPointer: {
            animation: true
          }
        },
        grid: {
          left: "0",
          top: "4%",
          right: "0",
          bottom: "0"
        },
        xAxis: {
          type: "category",
          boundaryGap: false,
          data: [
            "Jan",
            "Feb",
            "Mar",
            "Apr",
            "May",
            "Jun",
            "Jul",
            "Aug",
            "Sept",
            "Oct",
            "Nov",
            "Dec"
          ],
          axisLabel: {
            show: false
          },
          axisLine: {
            lineStyle: {
              show: false
            }
          },
          axisTick: {
            show: false
          },
          splitLine: {
            show: false
          }
        },
        yAxis: {
          type: "value",
          min: 0,
          max: 200,
          interval: 50,
          axisLabel: {
            show: false
          },
          axisLine: {
            show: false
          },
          axisTick: {
            show: false
          },
          splitLine: {
            show: false
          }
        },
        series: [
          {
            name: "Visit",
            type: "line",
            smooth: true,
            data: [
              140,
              135,
              95,
              115,
              95,
              126,
              93,
              145,
              115,
              140,
              135,
              95,
              115,
              95,
              126,
              125,
              145,
              115,
              140,
              135,
              95,
              115,
              95,
              126,
              93,
              145,
              115,
              140,
              135,
              95
            ],
            symbolSize: 8,
            showSymbol: false,
            lineStyle: {
              opacity: 0,
              width: 0
            },
            itemStyle: {
              borderColor: "#f6be1a"
            },
            areaStyle: {
              color: "#f6be1a",
              opacity: 1
            }
          },
          {
            name: "Sales",
            type: "line",
            smooth: true,
            data: [
              50,
              70,
              65,
              84,
              75,
              80,
              70,
              50,
              70,
              65,
              104,
              75,
              80,
              70,
              50,
              70,
              65,
              94,
              75,
              80,
              70,
              50,
              70,
              65,
              86,
              75,
              80,
              70,
              50,
              70
            ],
            symbolSize: 8,
            showSymbol: false,
            lineStyle: {
              opacity: 0,
              width: 0
            },
            itemStyle: {
              borderColor: "#e91f63"
            },
            areaStyle: {
              color: "#e91f63",
              opacity: 1
            }
          }
        ]
      };
  
      this.dailyBandwithUsage = {
        grid: {
          left: "3%",
          right: "4%",
          bottom: "3%",
          containLabel: true
        },
        color: ["#fcc02e", "#e91f63", "#f44336"],
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
            radius: ["50%", "85%"],
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
                  color: "white"
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

      this.trafficGrowthChart = {
        tooltip: {
          trigger: "axis",
  
          axisPointer: {
            animation: true
          }
        },
        grid: {
          left: "0",
          top: "0",
          right: "0",
          bottom: "0"
        },
        xAxis: {
          type: "category",
          boundaryGap: false,
          data: [
            "0",
            "1",
            "2",
            "3",
            "4",
            
          ],
          axisLabel: {
            show: false
          },
          axisLine: {
            lineStyle: {
              show: false
            }
          },
          axisTick: {
            show: false
          },
          splitLine: {
            show: false
          }
        },
        yAxis: {
          type: "value",
          min: 0,
          max: 200,
          interval: 50,
          axisLabel: {
            show: false
          },
          axisLine: {
            show: false
          },
          axisTick: {
            show: false
          },
          splitLine: {
            show: false
          }
        },
        series: [
          {
            name: "Visit",
            type: "line",
            smooth: false,
            data: [0, 40, 140, 90, 160],
            symbolSize: 8,
            showSymbol: false,
            lineStyle: {
              opacity: 0,
              width: 0
            },
            itemStyle: {
              borderColor: "#fcc02e"
            },
            areaStyle: {
              color: '#f44336',
              opacity: 1
            }
          }
        ]
      };
    }
    ngOnDestroy() {
      setTimeout(() => {
        this.layout.publishLayoutChange({sidebarColor: 'slate', topbarColor: 'white', footerColor: 'slate', matTheme: "egret-navy"});
        this.snack.open('Layout option changed {sidebarColor: "black", topbarColor: "white"};', 'OK', {duration: 6000})

      });
    }
}
