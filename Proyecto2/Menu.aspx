<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Menu de Gestión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('iconos/Pelis.jpg');
            background-color: #f4f4f4;
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .menu-container {
            background-color: rgb(255, 255, 255);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .menu-container h1 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #e50914;
        }

        .menu-container a {
            display: block;
            margin: 10px 0;
            padding: 10px 20px;
            color: #fff;
            background-color: #e50914; 
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s, box-shadow 0.3s; 
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); 
            border-color:black;
        }

        .menu-container a:hover {
            background-color: #000000; 
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2); 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="menu-container container">
            <h1>Menu de Gestión</h1>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Directores.aspx" CssClass="btn btn-primary btn-lg">Gestión Directores</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Peliculas.aspx" CssClass="btn btn-primary btn-lg">Gestión Películas</asp:HyperLink>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Grilla.aspx" CssClass="btn btn-primary btn-lg">Grilla Películas</asp:HyperLink>
        </div>
    </form>
</body>
</html>




