export default {
    createLineECharts:function(obj, id, _title, _legend, _xAxis, _yAxis, _series){
        console.log('EChartsUtils', obj, id, _title, _legend, _xAxis, _yAxis, _series)
        let draw = obj.$echarts.init(document.getElementById(id))
        draw.clear();
        draw.setOption({
            // title: { text: _title, left: 'center', align: 'right', top: 35 },
            title: _title,
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#6a7985'
                    }
                }
            },
            legend:_legend,
            grid: { top : '20%', left: '3%', right: '4%', containLabel: true },
            xAxis: [{type: 'category', boundaryGap: false, data: _xAxis}],
            yAxis: _yAxis,
            series: _series
        })
    },
    defaultEcharts:function(obj, id, _title, _legend, _xAxis, _yAxis, _series, _grid){
        let draw = obj.$echarts.init(document.getElementById(id))
        draw.setOption({
            title: _title,
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#6a7985'
                    }
                }
            },
            legend: _legend,
            grid: _grid,
            xAxis: _xAxis,
            yAxis: _yAxis,
            series: _series
        })
    },
    createLineEchartsLegendLeft:function(obj, id, _title, _legend, _xAxis, _yAxis, _series){
        var p_grid = { top : '20%', left: '3%', right: '4%', containLabel: true }
        var p_legend = { data: _legend, left: 10}
        var p_xAxis = [{type: 'category', boundaryGap: false, data: _xAxis}]
        this.defaultEcharts(obj, id, _title, p_legend, p_xAxis, _yAxis, _series, p_grid)
    },
    createLineEchartsCommon: function(obj, id, _title, _legend, _xAxis, _yAxis, _series){
        let draw = obj.$echarts.init(document.getElementById(id))
        draw.setOption({
            title: _title,
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#6a7985'
                    }
                }
            },
            legend: _legend,
            xAxis: _xAxis,
            yAxis: _yAxis,
            series: _series
        })
    },
    // 雷达
    createradarEcharts:function(obj, id, _title, _legend, _radar, _series){
        let draw = obj.$echarts.init(document.getElementById(id))
        draw.clear();
        draw.setOption({
            title: _title,
            tooltip: {},
            legend: _legend,
            radar: _radar,
            series: _series
        })
    },
    // 柱状图
    createBarEcharts:function(obj, id, _title, _legend,  _xAxis, _yAxis, _series){
        console.log(id, _title, _legend,  _xAxis, _yAxis, _series)
        let draw = obj.$echarts.init(document.getElementById(id))
        draw.clear();
        draw.setOption({
            title: _title,
            tooltip: {},
            xAxis: _xAxis,
            yAxis: _yAxis,
            legend: _legend,
            series: _series
        })
    }
}