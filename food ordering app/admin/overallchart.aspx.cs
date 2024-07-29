using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using VaderSharp2;

namespace food_ordering_app.admin
{
    public partial class overallchart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "Annual Feedback Analysis";
            }
            start();
        }

        private void start()
        {
            var janmessageList = GetData(1);
            var febmessageList = GetData(2);
            var marmessageList = GetData(3);
            var aprmessageList = GetData(4);
            var maymessageList = GetData(5);
            var junmessageList = GetData(6);
            var julmessageList = GetData(7);
            var augmessageList = GetData(8);
            var sepmessageList = GetData(9);
            var octmessageList = GetData(10);
            var novmessageList= GetData(11);
            var decmessageList = GetData(12);
            var janscore = scorecal(janmessageList);
            var febscore = scorecal(febmessageList);
            var marscore = scorecal(marmessageList);
            var aprscore = scorecal(aprmessageList);
            var mayscore = scorecal(maymessageList);
            var junscore = scorecal(junmessageList);
            var julscore = scorecal(julmessageList);
            var augscore = scorecal(augmessageList);
            var sepscore = scorecal(sepmessageList);
            var octscore = scorecal(octmessageList);
            var novscore = scorecal(novmessageList);
            var decscore = scorecal(decmessageList);

            Session["janChart"] = janscore;
            Session["febChart"] = febscore;
            Session["marChart"] = marscore;
            Session["aprChart"] = aprscore;
            Session["mayChart"] = mayscore;
            Session["junChart"] = junscore;
            Session["julChart"] = julscore;
            Session["augChart"] = augscore;
            Session["sepChart"] = sepscore;
            Session["octChart"] = octscore;
            Session["novChart"] = novscore;
            Session["decChart"] = decscore;
        }
        private List<string> GetData(int month)
        {
            List<string> messagesList = new List<string>();
            string CS = "data source=.; database = FoodieDB; integrated security=SSPI";
            SqlConnection con = new SqlConnection(CS);


            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT Message AS Msg,MONTH(CreateDate) AS Month FROM Contact", con);

            using (SqlDataReader reader = cmd.ExecuteReader())
            {

                while (reader.Read())
                {
                    if (Convert.ToInt32(reader["Month"]) == month)
                    {
                        string message = reader["Msg"].ToString();
                        messagesList.Add(message);
                    }
                }
            }

            con.Close();
            return messagesList;
        }
        private double scorecal(List<string> messageList)
        {
            double messageCount = 0;
            double score = 0;
            var analyzer = new SentimentIntensityAnalyzer();
            foreach (var item in messageList)
            {
                var results = analyzer.PolarityScores(item.Trim());
                score += results.Positive;
                messageCount++;
            }

            var positivePercentage = (score / messageCount) * 100;
            return positivePercentage;
        }

    }
}