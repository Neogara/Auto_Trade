using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoTrade
{
    static public class WorkerClass
    {
        static public int IdWorker { get; set; }
        static public string NameWorker { get; set; }
        static public string LastNameWorker { get; set; }
        static public int UserType  { get; set; }

        static public string SqlConnect { get; set; } 


       static  public void LoginIn (string login , string password)
        {
            //IdWorker = id;
            //NameWorker = name; 

            //LastNameWorker = lastName;

            SqlConnect = ConnectionStringBuilder.Build("SAMSUNG\\SQLEXPRESS", "Company", login, password);



        }

        
    }
}
