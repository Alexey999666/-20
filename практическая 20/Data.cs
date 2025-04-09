using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using практическая_20.ModelsDB;

namespace практическая_20
{
    public static class Data
    {
        public static Заказы заказы;
        public static Клиенты клиенты;
    }
    public static class Flags
    {
        public static bool FlagADD { get; set; } = false;
        public static bool FlagEdit { get; set; } = false;
      
    }
}
