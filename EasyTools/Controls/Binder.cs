using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using EasyTools.Data;
using EasyTools.Interface.Controls;

namespace EasyTools.Controls
{
    public class Binder : IBinder
    {

        public void BindControls<T>(ComboBox cbo, List<T> listData)  where T : BaseData, new()
        {
            cbo.DataSource = null;
            cbo.DataSource = listData;
            cbo.ValueMember = "id";
            cbo.DisplayMember = "name";
            cbo.Refresh();
        }

        public void BindControls<T>(DataGridView grd, List<T> listData, bool autoGenerateCol = true) where T : BaseData, new()
        {
            grd.DataSource = null;
            grd.DataSource = listData;
            grd.Refresh();
            grd.AutoGenerateColumns = autoGenerateCol;
        }

        public void BindControls(Panel panel, BaseData data)
        {
            foreach (var control in panel.Controls)
            {

  
                if (control.GetType() == typeof (ComboBox))
                {
                    var cbo = (ComboBox) control;
                    if(cbo.Tag == null || ReferenceEquals(cbo.Tag, ""))
                        continue;
                    cbo.DataBindings.Clear();
                    cbo.DataBindings.Add("Text", data, (string) cbo.Tag, false, DataSourceUpdateMode.OnPropertyChanged);
                }

                if (control.GetType() == typeof(TextBox))
                {
                    var textBox = (TextBox)control;
                    if (textBox.Tag == null || ReferenceEquals(textBox.Tag, ""))
                        continue;
                    textBox.DataBindings.Clear();
                    textBox.DataBindings.Add("Text", data, (string)textBox.Tag, false, DataSourceUpdateMode.OnPropertyChanged);
                }

            }
         
         
        }

        public void BindControls(Form form, BaseData data)
        {
            foreach (var control in form.Controls)
            {
                if (control.GetType() == typeof(ComboBox))
                {
                    var cbo = (ComboBox)control;
                    if (cbo.Tag == null || ReferenceEquals(cbo.Tag, ""))
                        continue;
                    cbo.DataBindings.Clear();
                    cbo.DataBindings.Add("Text", data, (string)cbo.Tag, false, DataSourceUpdateMode.OnPropertyChanged);
                }

                if (control.GetType() == typeof(TextBox))
                {
                    var textBox = (TextBox)control;
                    if (textBox.Tag == null || ReferenceEquals(textBox.Tag, ""))
                        continue;
                    textBox.DataBindings.Clear();
                    textBox.DataBindings.Add("Text", data, (string)textBox.Tag, false, DataSourceUpdateMode.OnPropertyChanged);
                }

            }


        }
    }
}
