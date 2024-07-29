<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="overallchart.aspx.cs" Inherits="food_ordering_app.admin.overallchart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-sm-12 col-md-12 col-lg-12">
        <h4 class="sub-title text-center">Yearly Feedback Analysis </h4>
    </div>
    <div class="row justify-content-center col-lg-12">
<%--<canvas id="lineChart" style="display: block;box-sizing: border-box;height: 350px;width: 1200px;"></canvas>        --%>
        <canvas id="lineChart" style="display: block;box-sizing: border-box;height: 329px;width: 30cm;" width="1582" height="411"></canvas>
        <%--<canvas id="myChart" width="1582" height="411" style="width: 30cm;display: block;box-sizing: border-box;height: 329px;"></canvas> --%>
        <script>

            var data = {
                labels: ['January', 'February', 'March', 'April', 'May','June','July','August','September','October','November','December'],
                datasets: [{
                    label: 'Month',
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 2,
                    data: [<%=Session["janChart"]%>,<%=Session["febChart"]%>,
                    <%=Session["marChart"]%>,<%=Session["aprChart"]%>,
                    <%=Session["mayChart"]%>,<%=Session["junChart"]%>,
                    <%=Session["julChart"]%>,
                    <%=Session["augChart"]%>,<%=Session["sepChart"]%>,
                    <%=Session["octChart"]%>,<%=Session["novChart"]%>,
                    <%=Session["decChart"]%>    
                    ]

                }]
            };

            // Configuration options for the chart
            var options = {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    x: {
                        type: 'category',
                        title: {
                            display: true,
                            text: 'Month'
                        }
                    },
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Postive Percentage'
                        }
                    }
                }
            };

            var ctx = document.getElementById('lineChart').getContext('2d');

            // Create the line chart
            var myLineChart = new Chart(ctx, {
                type: 'line',
                data: data,
                options: options
            });
        </script>
    </div>
</asp:Content>
