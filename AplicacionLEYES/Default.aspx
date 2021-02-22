<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AplicacionLEYES._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>LEYES 2003 COLOMBIA</h1>
        <p class="lead">Este programa permite egregar leyes con sus respectivos datos.</p>
        <p><a href="#" class="btn btn-primary btn-lg">Crear &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Como comenzar</h2>
            <p>
                Debera crear un lay, este tiene como base <br />
                - Nombre (unico)<br />
                - Fecha<br />
                - Titulo (palabra clave)<br />
                - Descripcion *<br />
                - Lista de decretos (articulos)    <br />        

            </p>
            <p>
                <a class="btn btn-default" href="#"> Listar &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Observaciones</h2>
            <p>
               Se podran colocar las opservaciones que desea comentar por ley, No es conveniente modificar ya que no tenemos autenticacion para saber quien realizo el comentario
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Comentarios &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>OPCIONES</h2>
            <p>
               Se podran gestionar cada una de las secciones que conforman la ley
                <br />
                opciones:
                <br />
              - Agregar Titulo<br />

              - Agregar Articulo<br />
              - Agregar Observacion<br />
              - Agregar Articulo<br />
                <br /><br />
              - Actualizar Titulo<br />
              - Actualizar Articulo<br />
              - Actualizar Observacion<br />
              - Actualizar Articulo  <br />

            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Gestion &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
