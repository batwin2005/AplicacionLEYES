using CapaNegocios;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AplicacionLEYES
{
    public partial class CrearLey : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            //Console.WriteLine("Entro");

            //CapaDatos.Acceso con = new CapaDatos.Acceso();
            N_Busqueda bus = new N_Busqueda();
            Busqueda b = new Busqueda();
            b.Nombre = nombreley.Text;
            b.Titulo = titulo.Text;
            b.Decreto = descripcionarticulo.Text;
            b.Fecha = fecha.Text;
            b.Idley = idley.Items[0].Value;
            b.Descripcion = descripcion.Text;

            bus.Grabar(b);
            bus.GrabarComentario(b);

            Response.Redirect("https://localhost:44322/CrearLey"); 



        }
    }
}