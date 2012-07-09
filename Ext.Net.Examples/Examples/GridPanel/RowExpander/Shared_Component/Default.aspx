<%@ Page Language="C#" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (X.IsAjaxRequest)
        {
            //We do not need to DataBind on an DirectEvent
            return;
        }
        
        this.Store1.DataSource = new object[]
            {
                new object[] { "3m Co", 71.72, 0.02, 0.03, "9/1 12:00am", "Manufacturing"},
                new object[] { "Alcoa Inc", 29.01, 0.42, 1.47, "9/1 12:00am", "Manufacturing"},
                new object[] { "Altria Group Inc", 83.81, 0.28, 0.34, "9/1 12:00am", "Manufacturing"},
                new object[] { "American Express Company", 52.55, 0.01, 0.02, "9/1 12:00am", "Finance"},
                new object[] { "American International Group, Inc.", 64.13, 0.31, 0.49, "9/1 12:00am", "Services"},
                new object[] { "AT&T Inc.", 31.61, -0.48, -1.54, "9/1 12:00am", "Services"},
                new object[] { "Boeing Co.", 75.43, 0.53, 0.71, "9/1 12:00am", "Manufacturing"},
                new object[] { "Caterpillar Inc.", 67.27, 0.92, 1.39, "9/1 12:00am", "Services"},
                new object[] { "Citigroup, Inc.", 49.37, 0.02, 0.04, "9/1 12:00am", "Finance"},
                new object[] { "E.I. du Pont de Nemours and Company", 40.48, 0.51, 1.28, "9/1 12:00am", "Manufacturing"},
                new object[] { "Exxon Mobil Corp", 68.1, -0.43, -0.64, "9/1 12:00am", "Manufacturing"},
                new object[] { "General Electric Company", 34.14, -0.08, -0.23, "9/1 12:00am", "Manufacturing"},
                new object[] { "General Motors Corporation", 30.27, 1.09, 3.74, "9/1 12:00am", "Automotive"},
                new object[] { "Hewlett-Packard Co.", 36.53, -0.03, -0.08, "9/1 12:00am", "Computer"},
                new object[] { "Honeywell Intl Inc", 38.77, 0.05, 0.13, "9/1 12:00am", "Manufacturing"},
                new object[] { "Intel Corporation", 19.88, 0.31, 1.58, "9/1 12:00am", "Computer"},
                new object[] { "International Business Machines", 81.41, 0.44, 0.54, "9/1 12:00am", "Computer"},
                new object[] { "Johnson & Johnson", 64.72, 0.06, 0.09, "9/1 12:00am", "Medical"},
                new object[] { "JP Morgan & Chase & Co", 45.73, 0.07, 0.15, "9/1 12:00am", "Finance"},
                new object[] { "McDonald\"s Corporation", 36.76, 0.86, 2.40, "9/1 12:00am", "Food"},
                new object[] { "Merck & Co., Inc.", 40.96, 0.41, 1.01, "9/1 12:00am", "Medical"},
                new object[] { "Microsoft Corporation", 25.84, 0.14, 0.54, "9/1 12:00am", "Computer"},
                new object[] { "Pfizer Inc", 27.96, 0.4, 1.45, "9/1 12:00am", "Medical"},
                new object[] { "The Coca-Cola Company", 45.07, 0.26, 0.58, "9/1 12:00am", "Food"},
                new object[] { "The Home Depot, Inc.", 34.64, 0.35, 1.02, "9/1 12:00am", "Retail"},
                new object[] { "The Procter & Gamble Company", 61.91, 0.01, 0.02, "9/1 12:00am", "Manufacturing"},
                new object[] { "United Technologies Corporation", 63.26, 0.55, 0.88, "9/1 12:00am", "Computer"},
                new object[] { "Verizon Communications", 35.57, 0.39, 1.11, "9/1 12:00am", "Services"},
                new object[] { "Wal-Mart Stores, Inc.", 45.45, 0.73, 1.63, "9/1 12:00am", "Retail"}
            };

        this.Store1.DataBind();
    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RowExpander with FormPanel Detail - Ext.NET Examples</title>
    <link href="../../../../resources/css/examples.css" rel="stylesheet" type="text/css" />
    
    <ext:ResourcePlaceHolder runat="server" Mode="Script" />

    <style type="text/css">
        .template {
            color: #fff;
            background-color: gray;
        }
        
        .white-footer .x-panel-footer{
          background-color: white !important;
       }
    </style>

    <script type="text/javascript">
        var template = '<span style="color:{0};">{1}</span>';

        var change = function (value) {
            return String.format(template, (value > 0) ? "green" : "red", value);
        };

        var pctChange = function (value) {
            return String.format(template, (value > 0) ? "green" : "red", value + "%");
        };
    </script>

</head>
<body>
    <form runat="server">
        <ext:ResourceManager runat="server" />
        
        <h1>RowExpander Plugin with FormPanel Detail</h1>
        
        <ext:Store ID="Store1" runat="server" IgnoreExtraFields="false">
            <Reader>
                <ext:ArrayReader>
                    <Fields>
                        <ext:RecordField Name="company" />
                        <ext:RecordField Name="price" Type="Float" />
                        <ext:RecordField Name="change" Type="Float" />
                        <ext:RecordField Name="pctChange" Type="Float" />
                        <ext:RecordField Name="lastChange" Type="Date" DateFormat="M/d hh:mmtt" />
                        <ext:RecordField Name="industry" />
                    </Fields>
                </ext:ArrayReader>
            </Reader>
        </ext:Store>
        
        <ext:GridPanel 
            ID="GridPanel1" 
            runat="server" 
            StoreID="Store1" 
            TrackMouseOver="true"
            Title="Expander Rows with control" 
            Collapsible="true"
            AnimCollapse="true" 
            Icon="Table" 
            Width="600" 
            Height="450">
            <ColumnModel runat="server">
                <Columns>
                    <ext:Column Header="Company" Width="40" DataIndex="company" />
                    <ext:Column Header="Price" Width="20" DataIndex="price">
                        <Renderer Format="UsMoney" />
                    </ext:Column>
                    <ext:Column Header="Change" Width="20" DataIndex="change">
                        <Renderer Fn="change" />
                    </ext:Column>
                    <ext:Column Header="Change" Width="20" DataIndex="pctChange">
                        <Renderer Fn="pctChange" />
                    </ext:Column>
                    <ext:DateColumn Header="Last Updated" Width="20" DataIndex="lastChange" />
                </Columns>
            </ColumnModel>
            <View>
                <ext:GridView runat="server" ForceFit="true" />
            </View>
            <SelectionModel>
                <ext:RowSelectionModel runat="server" />
            </SelectionModel>
            <Plugins>
                <ext:RowExpander ID="RowExpander" runat="server">
                    <Component>
                        <ext:FormPanel 
                            ID="RowEditor1" 
                            runat="server" 
                            Padding="6" 
                            Height="180"
                            Border="false"
                            Layout="form" 
                            ForceLayout="true"
                            ButtonAlign="Right"
                            Cls="white-footer">
                            <Items>
                                <ext:TextField 
                                    runat="server" 
                                    DataIndex="company" 
                                    FieldLabel="Company" 
                                    Width="150"
                                    />
                                <ext:NumberField 
                                    runat="server" 
                                    DataIndex="price" 
                                    FieldLabel="Price" 
                                    Width="150"
                                    />
                                <ext:NumberField 
                                    runat="server" 
                                    DataIndex="change" 
                                    FieldLabel="Change" 
                                    Width="150"
                                    />
                                <ext:NumberField 
                                    runat="server" 
                                    DataIndex="pctChange" 
                                    FieldLabel="% Change" 
                                    Width="150"
                                    />
                                <ext:DateField 
                                    runat="server" 
                                    DataIndex="lastChange" 
                                    FieldLabel="Last Updated" 
                                    Width="150"
                                    />
                            </Items>
                            
                            <Buttons>
                                <ext:Button runat="server" Text="Save" Icon="Disk">
                                    <Listeners>
                                        <Click Handler="#{RowEditor1}.getForm().updateRecord(#{RowEditor1}.record);
                                                        #{RowExpander}.collapseRow(#{Store1}.indexOf(#{RowEditor1}.record));" />
                                    </Listeners>
                                </ext:Button>
                                <ext:Button runat="server" Text="Cancel" Icon="Decline">
                                    <Listeners>
                                        <Click Handler="#{RowExpander}.collapseRow(#{Store1}.indexOf(#{RowEditor1}.record));" />
                                    </Listeners>
                                </ext:Button>
                            </Buttons>
                        </ext:FormPanel>
                    </Component>
                    
                    <Listeners>
                        <Expand Handler="#{RowEditor1}.record = record; #{RowEditor1}.getForm().loadRecord(record);" />
                    </Listeners>
                </ext:RowExpander>
            </Plugins>
            <BottomBar>
                <ext:PagingToolbar runat="server" PageSize="10" />
            </BottomBar>
        </ext:GridPanel>
    </form>
</body>
</html>