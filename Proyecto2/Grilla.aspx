<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Grilla.aspx.cs" Inherits="Grilla" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Peliculas y Directores</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style type="text/css">
        body {
            background-color: black;
            color: white;
        }
        #Grilla {
            height: 195px;
        }
        #form1 {
            height: 389px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h3 class="mb-4">Peliculas & Directores</h3>
            <div class="row mb-3">
                <div class="col-md-6">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select" Height="38px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="id">
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <asp:Button ID="Button1" runat="server" Text="Filtrar" CssClass="btn btn-danger" OnClick="Button1_Click" />
                </div>
                <div class="col-md-3">
                    <asp:Button ID="Button3" runat="server" Text="Desfiltrar" CssClass="btn btn-secondary" OnClick="Button2_Click" />
                </div>
            </div>
            <div class="container mt-4">
    <div class="row">
        <div class="col-12">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" EmptyDataText="No hay ningún registro" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                <Columns>
                    <asp:BoundField DataField="nombre" HeaderText="Películas" SortExpression="nombre" />
                    <asp:BoundField DataField="idDirector" HeaderText="ID Director" SortExpression="idDirector" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-12 text-center">
            <img src="iconos/Wason.jpg" style="width: 70%;" alt="Directores">
        </div>
    </div>
</div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT * FROM [Peliculas]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT * FROM [Directores]"></asp:SqlDataSource>
        </div>
        <div class="container mt-3">
           <asp:HyperLink ID="hlVolverMenu" runat="server" Text="Volver al Menú" NavigateUrl="~/Menu.aspx" CssClass="btn btn-outline-light"></asp:HyperLink>

        </div>
    </form>
</body>
</html>

