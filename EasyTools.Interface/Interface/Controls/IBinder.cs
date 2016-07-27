using System.Collections.Generic;
using System.Windows.Forms;
using EasyTools.Data;

namespace EasyTools.Interface.Controls
{
    public interface IBinder
    {
        void BindControls(Panel panel, BaseData data);
        void BindControls(Form form, BaseData data);
        void BindControls<T>(ComboBox cbo, List<T> listData) where T : BaseData, new();
        void BindControls<T>(DataGridView grd, List<T> listData, bool autoGenerateCol = true) where T : BaseData, new();
    }
}