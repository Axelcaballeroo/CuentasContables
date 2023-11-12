using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuentasContables
{
    public partial class RegistroContable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                completarTabla();
            }
        }

        protected void completarTabla()
        {
            try
            {
                DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);

                if (dv != null && dv.Count > 0)
                {
                    TableRow headerRow = new TableRow();

                    TableCell headerCelli = new TableCell();
                    headerCelli.Text = "N° REGISTRO";
                    headerRow.Cells.Add(headerCelli);

                    TableCell headerCell1 = new TableCell();
                    headerCell1.Text = "Descripción";
                    headerRow.Cells.Add(headerCell1);

                    TableCell headerCell2 = new TableCell();
                    headerCell2.Text = "Monto";
                    headerRow.Cells.Add(headerCell2);

                    TableCell headerCell3 = new TableCell();
                    headerCell3.Text = "Facturo?";
                    headerRow.Cells.Add(headerCell3);

                    Table1.Rows.Add(headerRow);

                    foreach (DataRowView rowView in dv)
                    {
                        DataRow row = rowView.Row;
                        TableRow tableRow = new TableRow();

                        TableCell celli = new TableCell();
                        celli.Text = row["idRegistro"].ToString();
                        tableRow.Cells.Add(celli);

                        TableCell cell1 = new TableCell();
                        cell1.Text = row["descripcion"].ToString();
                        tableRow.Cells.Add(cell1);

                        TableCell cell2 = new TableCell();
                        cell2.Text = row["monto"].ToString();
                        tableRow.Cells.Add(cell2);

                        TableCell cell3 = new TableCell();
                        cell3.Text = row["tipo"].ToString();
                        tableRow.Cells.Add(cell3);

                        Table1.Rows.Add(tableRow);
                    }
                }
            }
            catch(Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", $"alert('Error');", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource2.InsertParameters["idCuentas"].DefaultValue = DropDownList1.SelectedValue;
            SqlDataSource2.InsertParameters["monto"].DefaultValue = TextBox2.Text;
            SqlDataSource2.InsertParameters["tipo"].DefaultValue = DropDownList2.SelectedValue;
            int resultado = SqlDataSource2.Insert();
            if (resultado > 0)
            {
                Label2.Text = "Se agrego " + resultado.ToString() + " registro!";
                completarTabla();
                TextBox2.Text = string.Empty;
            } else
            {
                Label2.Text = "No se pudo agregar un registro!";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int resultado = SqlDataSource2.Delete();
            if (resultado > 0)
            {
                Label2.Text = "Se borro " + resultado.ToString() + " registro!";
                completarTabla();
                TextBox2.Text = string.Empty;
            }
            else
            {
                Label2.Text = "No se pudo borrar un registro!";
            }
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
            if (dv != null && dv.Count > 0)
            {
                DataRowView row = dv[0];
                TextBox2.Text = row["monto"].ToString();
                DropDownList1.SelectedValue = row["idCuentas"].ToString();
                DropDownList2.SelectedValue = row["tipo"].ToString();
            }
            completarTabla();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int resultado = SqlDataSource2.Update();
            if (resultado > 0)
            {
                Label2.Text = "Se actualizo " + resultado.ToString() + " registro!";
                completarTabla();
                TextBox2.Text = string.Empty;
            }
            else
            {
                Label2.Text = "No se pudo actualizar un registro!";
            }
        }
    }
}