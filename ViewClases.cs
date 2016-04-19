using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoTrade
{
    class AutoClass
    {
        public string AutoId { get; set; }
        public string Serial { get; set; }
        public string Company { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public long Distanse { get; set; }
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
