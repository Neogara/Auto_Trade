using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Windows;

namespace AutoTrade
{
    static public class WorkerClass
    {
        static public string UserWorker { get; set; }
        static public string NameWorker { get; set; }
        static public string LastNameWorker { get; set; }
        static public int UserType  { get; set; }

        static public string SqlConnect { get; set; } 


       static  public string LoginIn (string login , string password)
        {

            SqlConnect = ConnectionStringBuilder.Build("SAMSUNG\\SQLEXPRESS", "Company", login, password);
            var SqlServer = new SqlConnection(SqlConnect);
            var cmd = new SqlCommand() {Connection = SqlServer };
            var dataSet = new DataSet();
            var adapter = new SqlDataAdapter();
            string request; 

            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "dbo.CallBackDataWorker";

            adapter.SelectCommand = cmd;

            try {
                SqlServer.Open();
                adapter.Fill(dataSet);
                foreach (DataRow Row in dataSet.Tables[0].Rows)
                {
                    NameWorker = Row[0].ToString();
                    LastNameWorker = Row[1].ToString();
                    LastNameWorker = Row[2].ToString();
                    UserType = (int)Row[3];
                    UserWorker = Row[4].ToString();
                }
                 request = "Done";

            }
            catch (SqlException e )
            {
                 request =string.Format( "Произошла ошибка \"{0}\"  \n\n Код ошибки: {1} ",e.Message,e.Number);
            }
            finally
            {
                SqlServer.Close();
            }
            return request;
        }


    }
}
