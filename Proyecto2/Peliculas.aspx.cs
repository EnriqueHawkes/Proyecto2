using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Peliculas : System.Web.UI.Page
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
            DataView dv = (DataView)SelectTabla.Select(DataSourceSelectArguments.Empty);


            if (dv != null && dv.Count > 0)
            {
                // Rellenar cabecera
                TableRow headerRow = new TableRow();

                TableCell headerCell1 = new TableCell();
                headerCell1.Text = "id";
                headerRow.Cells.Add(headerCell1);

                TableCell headerCell2 = new TableCell();
                headerCell2.Text = "nombre";
                headerRow.Cells.Add(headerCell2);

                TableCell headerCell3 = new TableCell();
                headerCell3.Text = "idDirector";
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
                    cell2.Text = row["nombre"].ToString();
                    tableRow.Cells.Add(cell2);

                    TableCell cell3 = new TableCell();
                    cell3.Text = row["IdDirector"].ToString();
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
        DropDownList2.DataBind();
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
      
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int result = InsertarSql.Insert();
        if (result > 0)
        {
            Label3.Text = "Agregado " + result.ToString() + " registro.";
            completarTabla();
            DropDownList1.DataBind();
            DropDownList2.DataBind();
            TextBox1.Text = string.Empty;
        }
        else
        {
            Label3.Text = "No se agregaron registros.";
        }
    }


    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)  //que dolor de cabeza me dio est parte xD
    {
        // Obtener el idDirector y el nombre de la película seleccionada
        string idPelicula = DropDownList2.SelectedValue;

        // Obtener el idDirector correspondiente a partir del id de la película
        SqlDataSource1.SelectCommand = "SELECT idDirector FROM Peliculas WHERE id = @idPelicula";
        SqlDataSource1.SelectParameters.Clear();
        SqlDataSource1.SelectParameters.Add("idPelicula", idPelicula);
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (dv != null && dv.Count > 0)
        {
            DataRowView row = dv[0];
            string idDirector = row["idDirector"].ToString();

            // Selecciono el director  que tiene que ser  en el DropDownList1
            DropDownList1.SelectedValue = idDirector;
        }

        // para q cosiga  el nombre de la película seleccionada
        string nombrePelicula = DropDownList2.SelectedItem.Text;

        // Mostrar el nombre de la película en el TextBox1
        TextBox1.Text = nombrePelicula;

        completarTabla();
    }



protected void Button3_Click(object sender, EventArgs e)
    {
        string selectedApellido = DropDownList2.SelectedValue;
        int result = EliminarSql.Delete();
        if (result > 0)
        {

            Label3.Text = "Borrado " + result.ToString() + " registro.";
            completarTabla();
            DropDownList1.DataBind();
            DropDownList2.DataBind();
            TextBox1.Text = string.Empty;
        }
        else
        {
            Label3.Text = "No se borraron registros.";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        int result = UpdateSql.Update();
        if (result > 0)
        {
            Label3.Text = "Actualizado " + result.ToString() + " registro.";
            completarTabla();
            CargarDropDownList();
            TextBox1.Text = string.Empty; 
        }
        else
        {
            Label3.Text = "No se agregaron registros.";
        }
    }
}
    
   

    