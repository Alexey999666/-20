using System;
using System.Collections.Generic;

namespace практическая_20.ModelsDB;

public partial class СправочникУслуг
{
    public int КодУслуги { get; set; }

    public string Наименование { get; set; } = null!;

    public decimal Цена { get; set; }

    public virtual ICollection<Заказы> Заказыs { get; set; } = new List<Заказы>();
}
