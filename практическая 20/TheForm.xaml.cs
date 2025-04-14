using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using практическая_20.ModelsDB;
using Microsoft.EntityFrameworkCore;

namespace практическая_20
{
    /// <summary>
    /// Логика взаимодействия для TheForm.xaml
    /// </summary>
    public partial class TheForm : Window
    {
        public TheForm()
        {
            InitializeComponent();
        }

        ServicesAndOrdersContext _db = new ServicesAndOrdersContext();
        Заказы _заказы;

        private void btnFormAdd_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            //if (!int.TryParse(tbNumber.Text, out int N) || N <= 0)
            //    errors.AppendLine("Ошибка в номере");
            if (dpDate.SelectedDate == null || dpDate.SelectedDate.Value == default(DateTime))
                errors.AppendLine("Заполните корректную дату");
            else if (dpDate.SelectedDate.Value > DateTime.Now)
                errors.AppendLine("Дата не может быть в будущем");
            if (string.IsNullOrWhiteSpace(cbNumber.Text))
                errors.AppendLine("Заполните заказ");
            if (string.IsNullOrWhiteSpace(cbKod.Text))
                errors.AppendLine("Заполните услугу");
            tbCoust.Text = tbCoust.Text.Replace(".", ",");
            if (!double.TryParse(tbCoust.Text, out double D) || D <= 0)
                errors.AppendLine("Ошибка в цене");
            if (string.IsNullOrWhiteSpace(cbFormBuy.Text))
                errors.AppendLine("Заполните форму оплаты");
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString()); return;
            }
            try
            {
                if(Data.заказы == null)
                {
                    _db.Заказыs.Add(_заказы);
                    _db.SaveChanges();
                }
                else
                {
                    _db.Entry(_заказы).State = EntityState.Modified;
                    _db.SaveChanges();
                }
                MessageBox.Show("Информация сохранена");
                this.Close();
            }
            catch (Exception ex)
            {
                _db.Заказыs.Remove(_заказы) ;
                MessageBox.Show(ex.Message.ToString());
            }

        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            cbNumber.ItemsSource = _db.РеестрЗаказовs.ToList();
            cbNumber.DisplayMemberPath = "НомерЗаказа";
            cbKod.ItemsSource = _db.СправочникУслугs.ToList();
            cbKod.DisplayMemberPath = "Наименование";


            if (Flags.FlagADD == true )
            {
                TheFormBlank.Title = "Добавить запись";
                btnFormAdd.Content = "Добавить";
                _заказы = new Заказы();
                _заказы.ДатаЗаказа = DateTime.Now;
                Flags.FlagADD = false;
            }
            else
            {
                TheFormBlank.Title = "Изменить запись";
                btnFormAdd.Content = "Изменить";
                _заказы = _db.Заказыs.Find(Data.заказы.Код);
            }
            TheFormBlank.DataContext = _заказы;
        }
    }
}
