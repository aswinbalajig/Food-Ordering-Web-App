using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VaderSharp2;

namespace food_ordering_app.user
{
    public partial class dummychart : System.Web.UI.Page
    {
        string mode = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                //    Session["breadCrum"] = "FeedBack Analysis";
                //    if (Session["admin"] == null)
                //    {
                //        Response.Redirect("../user/Login.aspx");
                //    }
                //    else
                //    {
                btnPosOrNeg.Text = "Negativity Score";
                btnPosOrNeg.CommandArgument = "pos";
                    displayanalysis(btnPosOrNeg.CommandArgument.ToString());
                
                }
            //}


        }
        protected void btnPosOrNeg_Click(object sender, EventArgs e)
        {
            //if (mode == "pos")
            //{
            //    mode = "neg";
            //    displayanalysis("neg");
            //    btnPosOrNeg.Text = "Negativity score";

            //}
            //else if (mode == "neg")
            //{
            //    mode = "pos";
            //    displayanalysis("pos");
            //    btnPosOrNeg.Text = "Positivity score";
            //    ;
            //}
            if (btnPosOrNeg.CommandArgument.ToString() == "pos")
            {
                displayanalysis("neg");
                btnPosOrNeg.Text = "Negativity score";
                btnPosOrNeg.CommandArgument = "neg";
            }
            else if (btnPosOrNeg.CommandArgument.ToString() == "neg")
            {
                displayanalysis("pos");
                btnPosOrNeg.Text = "Positivity Score";
                btnPosOrNeg.CommandArgument = "pos";
            }
        }
        private void displayanalysis(string mode)
        {

            var DeliverymessageList = GetData("Delivery");
            var QualtitymessageList = GetData("FoodQuality");
            var PaymentmessageList = GetData("Payment");
            var deliveryscore = scorecal(DeliverymessageList,mode);
            var qualityscore = scorecal(QualtitymessageList,mode);
            var paymentscore = scorecal(PaymentmessageList, mode);
            Session["DeliveryScore"] = deliveryscore;
            Session["QualityScore"] = qualityscore;
            Session["PaymentScore"] = paymentscore;
            //code type pananum
        }
        private double scorecal(List<string> messageList, string mode)
        {
            double messageCount = 0;
            double score = 0;
            var analyzer = new SentimentIntensityAnalyzer();
            if (mode == "pos")
            {

                foreach (var item in messageList)
                {
                    var results = analyzer.PolarityScores(item.Trim());
                    score += results.Positive;
                    messageCount++;
                }

               
            }
            else if (mode == "neg")
            {
                foreach (var item in messageList)
                {
                    var results = analyzer.PolarityScores(item.Trim());
                    score += results.Negative;
                    messageCount++;
                }
            }
            var Percentage = 100-((score / messageCount) * 100);
            return Percentage;
        }
        private List<string> GetData(string subject)
        {
            List<string> messagesList = new List<string>();
            string CS = "data source=.; database = FoodieDB; integrated security=SSPI";
            SqlConnection con = new SqlConnection(CS);


            con.Open();
            SqlCommand cmd = new SqlCommand("select Subject,Message from Contact", con);

            using (SqlDataReader reader = cmd.ExecuteReader())
            {

                while (reader.Read())
                {
                    if (reader.GetString(0) == subject)
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