<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Peliculas.aspx.cs" Inherits="Peliculas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title> Peliculas</title>
</head>
<body style="height: 104px; background-color: #000; color: #fff">

    <form id="form1" runat="server">
         <div class="container mt-4">
            <div class="row">
                <div class="col-12">
                    <h2 class="text-center mb-4">Agregar & Modificar Películas</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <label for="TextBox1">Nombre de la Película:</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control mb-3" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <label for="DropDownList2">Películas:</label>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control mb-3" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SelectTabla" DataTextField="nombre" DataValueField="id" ToolTip="Para modificar selecciona la película y completa el campo vacío"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <label for="DropDownList1">Directores:</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control mb-3" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="Select" DataTextField="apellido" DataValueField="id"></asp:DropDownList>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-12">
                    <asp:Button ID="Button1" runat="server" Text="Agregar" Width="100px" OnClick="Button1_Click" CssClass="btn btn-danger mr-2" />
                    <asp:Button ID="Button2" runat="server" Text="Modificar" Width="100px" OnClick="Button2_Click" CssClass="btn btn-danger mr-2" />
                    <asp:Button ID="Button3" runat="server" Text="Eliminar" Width="100px" OnClick="Button3_Click" CssClass="btn btn-danger" />
                     <asp:HyperLink ID="hlVolverMenu" runat="server" CssClass="btn btn-outline-light" Height="37px" NavigateUrl="~/Menu.aspx" Text="Volver al Menú"></asp:HyperLink>

                </div>
            </div>
            <div class="container mt-4">
    <div class="row">
        <div class="col-12">
            <asp:Table ID="Table1" runat="server" CssClass="table"></asp:Table>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-12 text-center">
            <img src="iconos/miedo.jpg" style="width: 75%;" alt="Directores">
        </div>
    </div>
</div>

         
        <asp:SqlDataSource ID="InsertarSql" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" DeleteCommand="DELETE FROM [Peliculas] WHERE [id] = @id" InsertCommand="INSERT INTO [Peliculas] ([nombre], [idDirector]) VALUES (@nombre, @idDirector)" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [Peliculas]" UpdateCommand="UPDATE [Peliculas] SET [nombre] = @nombre, [idDirector] = @idDirector WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="nombre" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="DropDownList1" Name="idDirector" PropertyName="SelectedValue" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="idDirector" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="Select" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT [id], [apellido] FROM [Directores]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SelectTabla" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT * FROM [Peliculas]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="UpdateSql" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" DeleteCommand="DELETE FROM [Peliculas] WHERE [id] = @id" InsertCommand="INSERT INTO [Peliculas] ([nombre], [idDirector]) VALUES (@nombre, @idDirector)" SelectCommand="SELECT * FROM [Peliculas]" UpdateCommand="UPDATE [Peliculas] SET [nombre] = @nombre, [idDirector] = @idDirector WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="idDirector" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="nombre" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="DropDownList1" Name="idDirector" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="EliminarSql" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" DeleteCommand="DELETE FROM [Peliculas] WHERE [id] = @id" InsertCommand="INSERT INTO [Peliculas] ([nombre], [idDirector]) VALUES (@nombre, @idDirector)" SelectCommand="SELECT * FROM [Peliculas]" UpdateCommand="UPDATE [Peliculas] SET [nombre] = @nombre, [idDirector] = @idDirector WHERE [id] = @id">
            <DeleteParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="idDirector" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="idDirector" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
         
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT idDirector FROM Peliculas WHERE id = @idPelicula">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="idPelicula" PropertyName="SelectedValue" />
                    </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SelectedSql" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT * FROM [Directores] WHERE ([apellido] = @apellido)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="apellido" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
         
                <asp:Label ID="Label3" runat="server" Text="."></asp:Label>
         
    </form>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
