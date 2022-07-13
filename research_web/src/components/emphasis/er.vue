<template>
    <div>
        <PDFCommon ref="pdfCommon" @changeHeader="handleChecChange"></PDFCommon>
        <el-form style="text-align:left" :inline="true" :model="searchForm" class="demo-form-inline">
            <DataSelect :fatherMethod="initData" :showtable="false"></DataSelect>
        </el-form>

<!--      <el-row v-if="searchForm.table">-->
<!--              <el-table :data="tableData" border stripe style="width: 100%" :row-style="{height: '0'}" @selection-change="handleSelectionChange">-->
<!--                <el-table-column type="selection" width="55"> </el-table-column>-->
<!--                <el-table-column v-for="header in headerData" :prop="header.param" :key="header.label" :label="header.label" :width="header.width" header-align="center" align="center">-->

<!--            </el-table-column>-->
<!--              </el-table>-->
<!--        </el-row>-->

<!--        <el-row v-if="searchForm.database">-->
<!--            <el-col :span="1"><el-checkbox  style="float:left;" true-label="er" false-label="remove_er"  @change="checkboxChange">Select</el-checkbox></el-col>-->
<!--            <el-col :span="23"><div id="er" :style="{width: '100%', height: '500px',display : 'block'}"></div></el-col>-->
<!--        </el-row>-->
<!--        <el-row v-if="searchForm.database">-->
<!--            <el-col :span="1"><el-checkbox  style="float:left;" true-label="erstockstar3" false-label="remove_erstockstar3"  @change="checkboxChange">Select</el-checkbox></el-col>-->
<!--            <el-col :span="23"><div id="erstockstar3" :style="{width: '100%', height: '500px',display : 'block'}"></div></el-col>-->
<!--        </el-row>-->
      <div id="my-diagram-div"></div>
        <div></div>
    </div>
</template>
<script>
import PDFCommon from '../PDFCommon.vue'
import DataSelect from '../DataSelect.vue'
import ehcartsUtils from '../EChartsUtils'
export default {
  name: 'er',
  components:{
    PDFCommon,DataSelect
  },
  data () {
    return {
      title: "er",
      fundOptions: [],
      chartData:[],
      searchForm:{
          database:this.$store.state.database,
          table:this.$store.state.table
      },
      headerData:[],
      tableData:[],
    }
  },
  mounted(){
    if(this.$store.state.database)
        this.er()
  },
  methods: {
      initData(){
          console.log('------subcomponent called---------', this.$store.state.table)
          this.headerData=[],
          this.tableData=[]
          this.er()
      },
      async er(){
            this.searchForm.database=this.$store.state.database,
            this.searchForm.table=this.$store.state.table
            let res_table =await this.$httpf.er(this.searchForm,true)
            var node=[];
            var link = [];
            var colors = {
                'red': '#F75D59',
                'green': '#52ce60',
                'blue': '#6ea5f8',
                'lightred': '#fd8852',
                'lightblue': '#afd4fe',
                'lightgreen': '#b9e986',
                'pink': '#faadc1',
                'purple': '#d689ff',
                'orange': '#fdb400',
                'black': '#000000',
                'white':'#eeeeee',
            }
            if(res_table.code==0){
              node = res_table.data['entity']
              link = res_table.data['link']

              // console.log(this.headerData)
              console.log(node)
              console.log(link)
            }
            var nodeDataArray = []
            for(var i=0;i<node.length;i++){
              var item=[]
              var fig = ''
              var col = ''
              for(var j=0;j<node[i]['item'].length;j++){
                if(node[i]['item'][j][1]){
                  item.push({ name: node[i]['item'][j][0], iskey: true, figure: "Decision", color: colors.red })
                }else{
                  item.push({ name: node[i]['item'][j][0], iskey: false, figure: "Hexagon", color: colors.blue })
                }
              }
              if(node[i]['type'] == 'mtom' || node[i]['type'] == '1to1'){
                fig = 'Diamond'
              }else{
                fig = 'Rectangle'
              }
              if(node[i]['type'] == 'weak'){
                col = colors.black
              }else if(node[i]['type'] == 'subset'){
                col = colors.blue
              }else{
                col = colors.white
              }
              nodeDataArray.push({
                    fig:fig,
                    color:col,
                    key: node[i]['key'],
                    items: item
                })
            }
            // console.log(link)
            var linkDataArray = []
            for(var i=0;i<link.length;i++){
              if(link[i][2] == '1tom'){
                linkDataArray.push({ from: link[i][0], to: link[i][1], text: "", toText: "0:N" })
              }else{
                linkDataArray.push({ from: link[i][0], to: link[i][1], text: "", toText: "1:1" })
              }

            }
            // var linkDataArray = [
            //     { from: "Products", to: "Suppliers", text: "0..N", toText: "1" },
            //     { from: "Products", to: "Categories", text: "0..N", toText: "1" },
            //     { from: "Order Details", to: "Products", text: "0..N", toText: "1" }
            // ];

            let $ = go.GraphObject.make; // for conciseness in defining templates
            let myDiagram = $(
                go.Diagram,
                "my-diagram-div", // id挂载dome节点
                {
                    allowDelete: false,
                    allowCopy: false,
                    layout: $(go.ForceDirectedLayout),
                    "undoManager.isEnabled": true,
                }
            );

            // the template for each attribute in a node's array of item data
            var itemTempl =
                $(go.Panel, "Horizontal",
                    $(go.Shape,
                        { desiredSize: new go.Size(15, 15), strokeJoin: "round", strokeWidth: 3, stroke: null, margin: 2 },
                        new go.Binding("figure", "figure"),
                        new go.Binding("fill", "color"),
                        new go.Binding("stroke", "color")),
                    $(go.TextBlock,
                        {
                            stroke: "#333333",
                            font: "bold 14px sans-serif"
                        },
                        new go.Binding("text", "name"))
                );

            // define the Node template, representing an entity
            myDiagram.nodeTemplate =
                $(go.Node, "Auto",  // the whole node panel
                    {
                        selectionAdorned: true,
                        resizable: true,
                        layoutConditions: go.Part.LayoutStandard & ~go.Part.LayoutNodeSized,
                        fromSpot: go.Spot.AllSides,
                        toSpot: go.Spot.AllSides,
                        isShadowed: true,
                        shadowOffset: new go.Point(3, 3),
                        shadowColor: "#C5C1AA"
                    },
                    new go.Binding("location", "location").makeTwoWay(),
                    // whenever the PanelExpanderButton changes the visible property of the "LIST" panel,
                    // clear out any desiredSize set by the ResizingTool.
                    new go.Binding("desiredSize", "visible", function (v) { return new go.Size(NaN, NaN); }).ofObject("LIST"),
                    // define the node's outer shape, which will surround the Table
                    $(go.Shape,
                        // "Rectangle",
                        new go.Binding("figure","fig"),
                        new go.Binding("stroke","color"),
                        { fill: 'white', strokeWidth: 3 }),
                    $(go.Panel, "Table",
                        { margin: 8, stretch: go.GraphObject.Fill },
                        $(go.RowColumnDefinition, { row: 0, sizing: go.RowColumnDefinition.None }),
                        // the table header
                        $(go.TextBlock,
                            {
                                row: 0, alignment: go.Spot.Center,
                                margin: new go.Margin(0, 24, 0, 2),  // leave room for Button
                                font: "bold 16px sans-serif"
                            },
                            new go.Binding("text", "key")),
                        // the collapse/expand button
                        $("PanelExpanderButton", "LIST",  // the name of the element whose visibility this button toggles
                            { row: 0, alignment: go.Spot.TopRight }),
                        // the list of Panels, each showing an attribute
                        $(go.Panel, "Vertical",
                            {
                                name: "LIST",
                                row: 1,
                                padding: 3,
                                alignment: go.Spot.TopLeft,
                                defaultAlignment: go.Spot.Left,
                                stretch: go.GraphObject.Horizontal,
                                itemTemplate: itemTempl
                            },
                            new go.Binding("itemArray", "items"))
                    )  // end Table Panel
                );  // end Node

            // define the Link template, representing a relationship
            myDiagram.linkTemplate =
                $(go.Link,  // the whole link panel
                    {
                        selectionAdorned: true,
                        layerName: "Foreground",
                        reshapable: true,
                        routing: go.Link.AvoidsNodes,
                        corner: 5,
                        curve: go.Link.JumpOver
                    },
                    $(go.Shape,  // the link shape
                        { stroke: "#303B45", strokeWidth: 2.5 }),
                    $(go.TextBlock,  // the "from" label
                        {
                            textAlign: "center",
                            font: "bold 14px sans-serif",
                            stroke: "#1967B3",
                            segmentIndex: 0,
                            segmentOffset: new go.Point(NaN, NaN),
                            segmentOrientation: go.Link.OrientUpright
                        },
                        new go.Binding("text", "text")),
                    $(go.TextBlock,  // the "to" label
                        {
                            textAlign: "center",
                            font: "bold 14px sans-serif",
                            stroke: "#1967B3",
                            segmentIndex: -1,
                            segmentOffset: new go.Point(NaN, NaN),
                            segmentOrientation: go.Link.OrientUpright
                        },
                        new go.Binding("text", "toText"))
                );

            // create the model for the E-R diagram

            myDiagram.model = $(go.GraphLinksModel,
                {
                    copiesArrays: true,
                    copiesArrayObjects: true,
                    nodeDataArray: nodeDataArray,
                    linkDataArray: linkDataArray
                });

        },
        handleSelectionChange(value){
            this.$refs.pdfCommon.handleSelectionChangeMultiple(value,"er",this.headerData)
        },
        handleChecChange(value){
            this.headerData = value
        },
        removeDuplicationData(value){
            this.chartData.forEach((item, index) =>{
                if(item.id == value.id){
                    this.chartData.splice(index, 1);
                }
            })
            this.chartData.push(value)
        }
  }
}
</script>

<style scoped>
#my-diagram-div {
    width: 1250px;
    height: 800px;
}
</style>