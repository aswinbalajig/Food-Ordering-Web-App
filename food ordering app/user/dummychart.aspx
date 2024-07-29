<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="dummychart.aspx.cs" Inherits="food_ordering_app.user.dummychart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!--<div class="pcoded-inner-content pt-0">
    <div class="main-body">
        <div class="page-wrapper">

            <div class="page-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-header">
                            </div>
                        <div class="card-block">
                            
			                </div>
            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    
    </div>-->
    <div class="col-sm-12 col-md-12 col-lg-12">
    <h4 class="sub-title text-center">FeedBack Analysis </h4>
    </div>
<!--changes-->
		 <!--<div class="col-sm-12 col-md-12 col-lg-12">-->
             <div class="row justify-content-center">
    <!--<canvas id="myChart" width="100%" height="25%" style="width:700px;"></canvas>-->
<canvas id="myChart" width="1582" height="411" style="width: 30cm;display: block;box-sizing: border-box;height: 329px;"></canvas>             </div>
             <!--changes-->
             <script>
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Payment', 'Delivery', 'Food Quality'],
            datasets: [{
                label: 'Sentiment Score(%)',
                data: [<%= Session["PaymentScore"] %>, <%= Session["DeliveryScore"] %>, <%= Session["QualityScore"] %>],
                backgroundColor: ['rgba(75, 192, 192, 0.2)', 'rgba(255, 99, 132, 0.2)', 'rgba(255, 206, 86, 0.2)'],
                borderColor: ['rgba(75, 192, 192, 0.2)', 'rgba(255, 99, 132, 1)', 'rgba(255, 206, 86, 1)'],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    title: {
                        display: true,
                        text: 'Sentiment Percentage'
                    },
                    beginAtZero: true,
                    max: 100
                }
            }
            
        }
    });
             </script>
    <div class="col text-center">
    Click here to view <asp:Button ID="btnPosOrNeg" runat="server"  CssClass="btn btn-primary" OnClick="btnPosOrNeg_Click"  />
    </div>
</asp:Content>
