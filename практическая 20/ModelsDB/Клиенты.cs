using System;
using System.Collections.Generic;

namespace практическая_20.ModelsDB;

public partial class Клиенты
{
    public int КодКлиента { get; set; }

    public string ФамилияКлиента { get; set; } = null!;

    public string? АдресКлиента { get; set; }

    public string? Телефон { get; set; }

    public virtual ICollection<РеестрЗаказов> РеестрЗаказовs { get; set; } = new List<РеестрЗаказов>();
}
