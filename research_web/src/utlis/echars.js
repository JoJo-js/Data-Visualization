function create_line(dTitle, dLegend, dXAxis, dSeries){
    option = {
        title: {
            text: dTitle
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: dLegend
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: dXAxis
        },
        yAxis: {
            type: 'value'
        },
        series: getseries(dSeries)
    };
    return option
}

function getseries(s){
    arr = []
    array.forEach(v=>{  
       arr.push({"name":v.name,"type":"line","stack":"总量","data":v.data})
    });
    return arr
}

export {
    create_line
}