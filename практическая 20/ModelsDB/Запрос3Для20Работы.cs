using System;
using System.Collections.Generic;

namespace практическая_20.ModelsDB;

public partial class Запрос3Для20Работы
{
    public int КодКлиента { get; set; }

    public string ФамилияКлиента { get; set; } = null!;

    public string? АдресКлиента { get; set; }

    public string? Телефон { get; set; }

    public string? Expr1 { get; set; }
}
