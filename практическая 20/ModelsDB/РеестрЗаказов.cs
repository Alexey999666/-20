using System;
using System.Collections.Generic;

namespace практическая_20.ModelsDB;

public partial class РеестрЗаказов
{
    public int НомерЗаказа { get; set; }

    public int КодКлиента { get; set; }

    public decimal СтоимостьЗаказа { get; set; }

    public virtual ICollection<Заказы> Заказыs { get; set; } = new List<Заказы>();

    public virtual Клиенты КодКлиентаNavigation { get; set; } = null!;
}
