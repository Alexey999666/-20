using Microsoft.EntityFrameworkCore;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using практическая_20.ModelsDB;

namespace практическая_20
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnInfo_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Задание 1.Создать таблицы: \r\nТаблица 1. Справочник услуг.\r\nСтруктура таблицы: Код услуги, Наименование, Цена \r\nТаблица 2. Заказы.\r\nСтруктура таблицы: Номер заказа, Дата заказа, Код услуги, Стоимость услуги, Форма \r\nоплаты. Форма оплаты может быть наличными или по безналичному расчету. \r\nТаблица 3. Клиенты.\r\nСтруктура таблицы: Код клиента, Фамилия клиента, Адрес клиента, Телефон (Номер \r\nтелефона должен содержать код города) \r\nТаблица 4. Реестр заказов.\r\nСтруктура таблицы: Номер заказа, Код клиента, Стоимость заказа.\r\nЗадание 2. С помощью SQL-запроса подсчитать стоимость заказов по каждому клиенту. \r\nЗапрос должен содержать поля: Фамилия клиента, Стоимость заказа. \r\nЗадание 3. Составить SQL-запрос, позволяющий просмотреть данные обо всех клиентах, \r\nтелефон которых содержит код города Рязань.", "Задание", MessageBoxButton.OK, MessageBoxImage.Question);
        }

        private void btnDeveloper_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Андрианов Алексей Вариант 14", "Разработчик", MessageBoxButton.OK, MessageBoxImage.Question);
        }
        private void btnRequestInfo_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Запрос 1 Находит студентов по полу 'Мужской' или 'Женский'\r\nЗапрос 2 Находит имена по первой букве\r\nЗапрос 3 Находит людей у которых по всем предметам одинаковые оценки\r\nЗапрос 4 Находит людей без отчества\r\nЗапрос 5 Определяет есть ли у выбраного по id студента искомая оценка, если нет то таблица будет пустой\r\nЗапрос 6 Обновление фамилии выбраного по id студента на ту которую указывает пользователь\r\nЗапрос 7 Обновление оценки выбраного по id студента по информатике на веденную пользователемм\r\nЗапрос 8 Удаление студента по id", "Запросы", MessageBoxButton.OK, MessageBoxImage.Question);
        }
        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
           
           
            tbPoisk.Clear();
           
           
            
            
            
        }

        private void Windows_Loaded(object sender, RoutedEventArgs e)
        {
            LoudDataBaseDG();
        }
        void LoudDataBaseDG()
        {
            using (ServicesAndOrdersContext _db = new ServicesAndOrdersContext())
            {
                int selectIndex = DGDataBase.SelectedIndex;
                int selectIndexCl = DGclient.SelectedIndex;
                _db.Заказыs.Load();
                _db.Клиентыs.Load();
                _db.РеестрЗаказовs.Load();
                _db.СправочникУслугs.Load();

                DGDataBase.ItemsSource = _db.Заказыs.ToList();
                DGclient.ItemsSource = _db.Клиентыs.ToList();
                if (selectIndex != -1)
                {
                    if (selectIndex >= DGDataBase.Items.Count) selectIndex = DGDataBase.Items.Count - 1;
                    DGDataBase.SelectedIndex = selectIndex;
                    DGDataBase.ScrollIntoView(DGDataBase.SelectedItem);
                }
                if (selectIndexCl != -1)
                {
                    if (selectIndexCl >= DGclient.Items.Count) selectIndexCl = DGclient.Items.Count - 1;
                    DGclient.SelectedIndex = selectIndexCl;
                    DGclient.ScrollIntoView(DGclient.SelectedItem);
                }
                DGDataBase.Focus();
            }
        }

        private void btnAddEntry(object sender, RoutedEventArgs e)
        {
            Flags.FlagADD = true;
            Data.заказы = null;
            TheForm f = new TheForm();
            f.Owner = this;
            f.ShowDialog();
            LoudDataBaseDG();
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            if (DGDataBase.SelectedItem != null)
            {
                Flags.FlagEdit = true;
                Data.заказы = (Заказы)DGDataBase.SelectedItem;
                TheForm f = new TheForm();
                f.Owner = this;
                f.ShowDialog();
                LoudDataBaseDG();
            }
        }
        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show("Удалить запись?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (result == MessageBoxResult.Yes)
            {
                try
                {
                    Заказы row = (Заказы)DGDataBase.SelectedItem;

                    if (row != null)
                    {
                        using (ServicesAndOrdersContext _db = new ServicesAndOrdersContext())
                        {
                            _db.Заказыs.Remove(row);
                            _db.SaveChanges();
                        }
                        LoudDataBaseDG();
                    }
                }
                catch
                {
                    MessageBox.Show("Ошибка заполнения");
                }

            }
            else DGDataBase.Focus();
        }

       

        

       

        private void btnFind_Click(object sender, RoutedEventArgs e)
        {
            
            List<Заказы> listItem = (List<Заказы>)DGDataBase.ItemsSource;
            var find = listItem.Where(p => p.КодУслугиNavigation.КодУслуги.ToString().Contains(tbPoisk.Text) || (p.КодУслугиNavigation != null &&
     p.КодУслугиNavigation.Наименование.Contains(tbPoisk.Text)));
            if (find.Any())
            {
                var item = find.First();
                DGDataBase.SelectedItem = item;
                DGDataBase.ScrollIntoView(item);
                DGDataBase.Focus();
            }
            else
            {
                MessageBox.Show("Совпадений не найдено");
            }
        }

       

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            LoudDataBaseDG();
        }

        private void btnClientCost_Click(object sender, RoutedEventArgs e)
        {
            using(ServicesAndOrdersContext _db = new ServicesAndOrdersContext())
            {
                var CostSum = _db.Клиентыs.FromSql($"Запрос2Для20Работы");
                DGclient.ItemsSource = CostSum.ToList();
            }
           
        }

        private void btnPhoneRyzan_Click(object sender, RoutedEventArgs e)
        {

        }
    }

}