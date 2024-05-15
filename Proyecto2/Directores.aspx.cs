using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Directores : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            completarTabla();


        }


    }
    protected void completarTabla()
    {
        try
        {
            DataView dv = (DataView)SelectSql.Select(DataSourceSelectArguments.Empty);


            if (dv != null && dv.Count > 0)
            {
                // Rellenar cabecera
                TableRow headerRow = new TableRow();

                TableCell headerCell1 = new TableCell();
                headerCell1.Text = "id";
                headerRow.Cells.Add(headerCell1);

                TableCell headerCell2 = new TableCell();
                headerCell2.Text = "apellido";
                headerRow.Cells.Add(headerCell2);

                TableCell headerCell3 = new TableCell();
                headerCell3.Text = "nombre";
                headerRow.Cells.Add(headerCell3);

                Table1.Rows.Add(headerRow);

                // Rellenar las filas
                foreach (DataRowView rowView in dv)
                {
                    DataRow row = rowView.Row;
                    TableRow tableRow = new TableRow();

                    TableCell cell1 = new TableCell();
                    cell1.Text = row["id"].ToString();
                    tableRow.Cells.Add(cell1);

                    TableCell cell2 = new TableCell();
                    cell2.Text = row["apellido"].ToString();
                    tableRow.Cells.Add(cell2);

                    TableCell cell3 = new TableCell();
                    cell3.Text = row["nombre"].ToString();
                    tableRow.Cells.Add(cell3);

                    Table1.Rows.Add(tableRow);
                }
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", $"alert('Error');", true);
        }
    }
    protected void CargarDropDownList()
    {
       
        DropDownList1.DataBind();
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string selectedApellido = DropDownList1.SelectedValue;
        int result = EliminarSql.Delete();
        if (result > 0)
        {

            Label2.Text = "Borrado " + result.ToString() + " registro.";
            completarTabla();
            CargarDropDownList();
            TextBox1.Text = string.Empty; TextBox2.Text = string.Empty;
        }
        else
        {
            Label2.Text = "No se borraron registros.";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int result = InsertarSql.Insert();
        if (result > 0)
        {
            Label2.Text = "Agregado " + result.ToString() + " registro.";
            completarTabla();
            CargarDropDownList();
            TextBox1.Text = string.Empty; TextBox2.Text = string.Empty;
        }
        else
        {
            Label2.Text = "No se agregaron registros.";
        }
    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        int result = UpdateSql.Update();
        if (result > 0)
        {
            Label2.Text = "Actualizado " + result.ToString() + " registro.";
            completarTabla();
            CargarDropDownList();
            TextBox1.Text = string.Empty; TextBox2.Text = string.Empty;
        }
        else
        {
            Label2.Text = "No se agregaron registros.";
        }

    }

    protected void SelectedSql_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        DataView dv = (DataView)SelectedSql.Select(DataSourceSelectArguments.Empty);
        if (dv != null && dv.Count > 0)
        {
            DataRowView row = dv[0];
            TextBox1.Text = row["apellido"].ToString();
            DropDownList1.SelectedValue = row["id"].ToString();
            TextBox2.Text = row["nombre"].ToString();
        }
        completarTabla();
    }

    protected void SelectSql_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
}