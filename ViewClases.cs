using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoTrade
{
    class WorkerDeelsClass 
    {

        public string NameWorker { get; set; }
        public string LastNameWOrker { get; set; }
        public string Patronomic { get; set; }

        public DateTime DateDeel { get; set; }

        public string Serial { get; set; }
        public string Company { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public DateTime BuildDate { get; set; }
        public long Price { get; set; }

        public string NameClient { get; set; }
        public string LastNameClient { get; set; }
        public string PasportId { get; set; }
    }

    class AutoClass
    {
        public string AutoId { get; set; }
        public string Serial { get; set; }
        public string Company { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public int Distanse { get; set; }
        public long Prise { get; set; }
        public DateTime BuildDate { get; set; }
    }

    class ClientClass
    {
        public string ClientId { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string Patronymic { get; set; }
        public string Pasport { get; set; }
        public DateTime Birthday { get; set; }
        public string Sex { get; set; }

    }

}
