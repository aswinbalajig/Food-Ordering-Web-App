using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VaderSharp2;

namespace food_ordering_app.admin
{
    public partial class chart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                Session["breadCrum"]="FeedBack Analysis";
                if (Session["admin"] == null)
                {
                    Response.Redirect("../user/Login.aspx");
                }
                else 
                {
                    displayanalysis();
                }
            }
            
            
   
        }
        private void displayanalysis()
        {
           
            var DeliverymessageList = GetData("Delivery");
            var QualtitymessageList = GetData("FoodQuality");
            var PaymentmessageList = GetData("Payment");
            var deliveryscore = scorecal(DeliverymessageList);
            var qualityscore = scorecal(QualtitymessageList);
            var paymentscore=scorecal(PaymentmessageList);
            Session["DeliveryScore"] = deliveryscore;
            Session["QualityScore"] = qualityscore;
            Session["PaymentScore"] = paymentscore;
            //code type pananum
        }
        private double scorecal(List<string> messageList)
        {
            double messageCount = 0;
            double score = 0;
            var analyzer = new SentimentIntensityAnalyzer();
            foreach (var item in messageList)
            {
                var results = analyzer.PolarityScores(item.Trim());
                score = score + (1-results.Positive);
                messageCount++;
            }

            //var positivePercentage = 100-((score / messageCount) * 100);
            var positivePercentage= (score / messageCount) * 100;
            return positivePercentage;
        }
        private List<string> GetData( string subject)
        {
            List<string> messagesList = new List<string>();
            string CS = "data source=.; database = FoodieDB; integrated security=SSPI";
            SqlConnection con = new SqlConnection(CS);


            con.Open();
            SqlCommand cmd = new SqlCommand("select Subject,Message from Contact", con);

            using (SqlDataReader reader = cmd.ExecuteReader())
            {

                while (reader.Read())
                {   if (reader.GetString(0) == subject)
                    {
                        string message = reader.GetString(1);
                        messagesList.Add(message);
                    }
                 }
            }

            con.Close();
            return messagesList;
        }

    }
}