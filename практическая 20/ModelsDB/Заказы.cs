using System;
using System.Collections.Generic;

namespace практическая_20.ModelsDB;

public partial class Заказы
{
    public int Код { get; set; }

    public int НомерЗаказа { get; set; }

    public DateTime ДатаЗаказа { get; set; }

    public int КодУслуги { get; set; }

    public decimal СтоимостьУслуги { get; set; }

    public string? ФормаОплаты { get; set; }

    public virtual СправочникУслуг КодУслугиNavigation { get; set; } = null!;

    public virtual РеестрЗаказов НомерЗаказаNavigation { get; set; } = null!;
}
