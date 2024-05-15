<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Directores.aspx.cs" Inherits="Directores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title> Directores</title>
</head>
<body style="background-color:black">

    <form id="form1" runat="server">
       <p> 
      

           &nbsp;</p>
        <h3 class="text-light fw-bold">Agregar Directores</h3>

      
        <p>
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Apellido" OnTextChanged="TextBox1_TextChanged" ToolTip="Ingrese apellido" style="margin-left:4px;" Width="250px" CssClass="mb-3"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Nombre" ToolTip="ingrese Nombre" style="margin-left: 10px;" Width="250px" CssClass="mb-3" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" Text="Modificar" CssClass="btn btn-danger" OnClick="Button2_Click" Width="80px" Height="40px" style="margin-left:px;" />
            <asp:Button ID="Button1" runat="server" Text="Agregar" CssClass="btn btn-danger"  OnClick="Button1_Click" style="margin-right:2px;" Width="80px" Height="40px" />
            <asp:HyperLink ID="hlVolverMenu" runat="server" CssClass="btn btn-outline-light" Height="37px" NavigateUrl="~/Menu.aspx" Text="Volver al Menú"></asp:HyperLink>
        </p>
        <asp:DropDownList ID="DropDownList1" CssClass="form-select" runat="server" AutoPostBack="True" DataSourceID="EliminarSql" DataTextField="apellido" DataValueField="id" Height="40px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="300px" style="margin-left:5px;">
        </asp:DropDownList>
      <asp:Button ID="Button3" runat="server" Text="Eliminar" OnClick="Button3_Click" style="margin-left:10px; margin-top:10px;" CssClass="btn btn-danger" />

       
       <asp:Table ID="Table1" CssClass="table" runat="server" Height="13px" style="margin-top: 50px;" >
        </asp:Table>
         <div style="background-color:black; height: calc(100vh - 50px - 13px); position: relative;">
            <img src="iconos/Directores.jpg" style="position: absolute; bottom: 0; left: 160px; right:0px; width: 75%;" alt="Directores">
        </div>
            <asp:Label ID="Label2" runat="server" ForeColor="Red" style="margin-right:815px" Text="."></asp:Label>
        <asp:SqlDataSource ID="InsertarSql" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" DeleteCommand="DELETE FROM [Directores] WHERE [id] = @id" InsertCommand="INSERT INTO [Directores] ([apellido], [nombre]) VALUES (@apellido, @nombre)" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [Directores]" UpdateCommand="UPDATE [Directores] SET [apellido] = @apellido, [nombre] = @nombre WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="apellido" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox2" Name="nombre" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="apellido" Type="String" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SelectSql" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT * FROM [Directores]" OnSelecting="SelectSql_Selecting"></asp:SqlDataSource>
        <asp:SqlDataSource ID="EliminarSql" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" DeleteCommand="DELETE FROM Directores WHERE (id = @id)" InsertCommand="INSERT INTO [Directores] ([apellido], [nombre]) VALUES (@apellido, @nombre)" SelectCommand="SELECT * FROM [Directores]" UpdateCommand="UPDATE [Directores] SET [apellido] = @apellido, [nombre] = @nombre WHERE [id] = @id">
            <DeleteParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="apellido" Type="String" />
                <asp:Parameter Name="nombre" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="apellido" Type="String" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SelectedSql" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" OnSelecting="SelectedSql_Selecting" SelectCommand="SELECT * FROM [Directores] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="UpdateSql" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" DeleteCommand="DELETE FROM [Directores] WHERE [id] = @id" InsertCommand="INSERT INTO [Directores] ([apellido], [nombre]) VALUES (@apellido, @nombre)" SelectCommand="SELECT * FROM [Directores] WHERE ([apellido] = @apellido)" UpdateCommand="UPDATE [Directores] SET [apellido] = @apellido, [nombre] = @nombre WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="apellido" Type="String" />
                <asp:Parameter Name="nombre" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="apellido" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="apellido" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox2" Name="nombre" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>