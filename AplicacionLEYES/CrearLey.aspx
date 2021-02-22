<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrearLey.aspx.cs" Inherits="AplicacionLEYES.CrearLey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Pricipal</title>
    <script src="../Js/Geolocalizacion.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <style>
        .table table tbody tr td a,
        .table table tbody tr td span {
            position: relative;
            float: left;
            padding: 6px 12px;
            margin-left: -1px;
            line-height: 1.42857143;
            color: #337ab7;
            text-decoration: none;
            background-color: #fff;
            border: 1px solid #ddd;
        }

        .grid-header a {
            color: dimgray;
            font-weight: bold;
        }

        .table table > tbody > tr > td > span {
            z-index: 3;
            color: #fff;
            cursor: default;
            background-color: #337ab7;
            border-color: #337ab7;
        }

        .table table > tbody > tr > td:first-child > a,
        .table table > tbody > tr > td:first-child > span {
            margin-left: 0;
            border-top-left-radius: 4px;
            border-bottom-left-radius: 4px;
        }

        .table table > tbody > tr > td:last-child > a,
        .table table > tbody > tr > td:last-child > span {
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px;
        }

        .table table > tbody > tr > td > a:hover,
        .table table > tbody > tr > td > span:hover,
        .table table > tbody > tr > td > a:focus,
        .table table > tbody > tr > td > span:focus {
            z-index: 2;
            color: #23527c;
            background-color: #eee;
            border-color: #ddd;
        }
    </style>

</head>
<body>

    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h2 >CREACION DE LEYES</h2>
            <p class="lead">Aqui podras agregar las leyes en la base de datos.</p>
        </div>
    </div>
      <hr />
    <div class="container">
        <form class="row g-3" runat="server" id="formlario">
            <div class="col-md-6">
                <label for="nombreley" class="form-label">Nombre de la ley</label>
                <asp:TextBox runat="server" type="text" class="form-control" ID="nombreley" />
            </div>
            <div class="col-md-6">
                <label for="fecha" class="form-label">Fecha</label>
                <asp:TextBox runat="server" type="date" class="form-control" ID="fecha" />
            </div>
            <div class="col-12">
                <label for="Titulo" class="form-label">Titulo</label>
                <asp:TextBox runat="server" type="text" class="form-control" ID="titulo" placeholder="titulo" />
            </div>

              <h2>ARTICULO</h2>
           <div class="col-12"> <label for="idley" class="form-label">ID DE LA LEY</label>
            <asp:DropDownList ID="idley" runat="server" DataSourceID="SqlDataSource3"
                DataTextField="Num" DataValueField="Num" AppendDataBoundItems="true">
            </asp:DropDownList>
            </div>
            <div class="col-12"> <label for="descripcionarticulo" class="form-label">NOMBRE DEL ARTICULO</label>
            <asp:TextBox runat="server" type="text" class="form-control" ID="descripcionarticulo" placeholder="titulo" />
            </div>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:bdleyConnectionString %>" SelectCommand="sacar_Numero_de_Leyes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <br />


            <div class="col-12">
                <label for="descripcion" class="form-label">Descripcion</label>
                <asp:TextBox runat="server" class="form-control" id="descripcion" placeholder="descripcion" TextMode="multiline" Rows="5"></asp:TextBox>
            </div>



            <div class="col-12">
                <asp:Button OnClick="btnAgregar_Click" Text="Agregar"
                    runat="server" ID="boton_Agregar"></asp:Button>
            </div>

            <br />
          


         



            <hr />
            <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <h2 >LISTADO GENERAL DE LEYES</h2>
                    <p class="lead">Aqui podras visualizar las leyes que haz guardado.</p>
                </div>
            </div>
            <asp:GridView runat="server" ID="GridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" UseAccessibleHeader="true" CssClass="table table-condensed table-hover" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="nombre" HeaderText="NOMBRE" SortExpression="nombre" />
                    <asp:BoundField DataField="fecha" HeaderText="FECHA" SortExpression="fecha" />
                    <asp:BoundField DataField="titulo" HeaderText="TIULO" SortExpression="titulo" />
                    <asp:BoundField DataField="descripcion" HeaderText="DESCRIPCION" SortExpression="descripcion" />
                    <asp:BoundField DataField="decreto" HeaderText="DECRETO" SortExpression="decreto" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>

            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bdleyConnectionString %>" SelectCommand="SELECT [id], [nombre], [fecha], [titulo], [descripcion], [decreto] FROM [tbl_ley]"></asp:SqlDataSource>
            <br />

             <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <h2 >COMENTARIOS AGREGADOS POR LEY</h2>
                    <p class="lead">Aqui podras visualizar comentarios por la numero de ley que le dio la observacion.</p>
                </div>
            </div>
             <asp:GridView runat="server" ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-condensed table-hover" DataSourceID="SqlDataSource4">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="#" ReadOnly="True" SortExpression="id" InsertVisible="False" />
                    <asp:BoundField DataField="idley" HeaderText="ID LEY" SortExpression="idley" />
                    
                    <asp:BoundField DataField="observacion" HeaderText="OBSERVACION" SortExpression="observacion" />
                    
                </Columns>
            </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:bdleyConnectionString %>" SelectCommand="SELECT * FROM [tbl_observacion]"></asp:SqlDataSource>



            <br />


            <hr />
             <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <h2 >SECCION DE COMENTARIOS</h2>
                    <p class="lead">Aqui podras agregar comentarios a la ley que desea.</p>
                </div>
            </div>
            <asp:TextBox runat="server" type="text" class="form-control" ID="comentarios" placeholder="comentarios" />
            <br />
            <br />
           <p></p>
            <hr />

            

        </form>
    </div>
</body>
</html>
