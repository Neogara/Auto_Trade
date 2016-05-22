namespace AutoTrade
{
    public static class ConnectionStringBuilder
    {
       // 'Persist Security Info=False;User ID = *****; Password=*****;Initial Catalog = AdventureWorks; Server=MySqlServer'
        private const string Template = "Server={0};Database={1};User Id={2};Password={3};";

        public static string Build(string server, string database, string user, string password)
        {
            return string.Format(Template, server, database, user, password);
        }
    }
}
