using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuentasContables
{
    public partial class Cuentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                actualizarDatos();
            }
            
        }

        protected void actualizarDatos()
        {
            Label2.Text = "";
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            foreach(DataRowView dr in dv )
            {
                DataRow row = dr.Row;
                Label2.Text += row["descripcion"].ToString() + " - ";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {         
            int resultado = SqlDataSource1.Insert();
            if(resultado != 0)
            {
                Label1.Text = "Se agrego "+resultado.ToString() +" registro correctamente";
                actualizarDatos();
                TextBox1.Text = "";
            } else
            {
                Label1.Text = "No se pudo agregar un registro!";
            }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource2.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader reader = (SqlDataReader)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            if(reader.Read()) {
                TextBox2.Text = reader["descripcion"].ToString();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int resultado = SqlDataSource1.Delete();
            if (resultado != 0)
            {
                Label1.Text = "Se elimino " + resultado.ToString() + " registro correctamente";
                actualizarDatos();
                TextBox2.Text = "";
            }
            else
            {
                Label1.Text = "No se pudo eliminar un registro!";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlDataSource1.UpdateParameters["idCuentas"].DefaultValue = ListBox1.SelectedValue.ToString();
            SqlDataSource1.UpdateParameters["descripcion"].DefaultValue = TextBox2.Text;

            int resultado = SqlDataSource1.Update();
            if (resultado != 0)
            {
                Label1.Text = "Se modifico " + resultado.ToString() + " registro correctamente";
                actualizarDatos();
                TextBox2.Text = "";
            }
            else
            {
                Label1.Text = "No se pudo modificar el registro!";
            }
        }
    }
}