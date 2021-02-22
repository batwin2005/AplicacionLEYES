using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
  public  class Mp_Busqueda
    {
        private Acceso ac = new Acceso();
        public int Insertar(Busqueda busq)
        {
            List<SqlParameter> paramete = new List<SqlParameter>();

            paramete.Add(ac.crearPArametro("@nombre", busq.Nombre));
            paramete.Add(ac.crearPArametro("@fecha", busq.Fecha));
            paramete.Add(ac.crearPArametro("@titulo", busq.Titulo));
            paramete.Add(ac.crearPArametro("@descripcion", busq.Descripcion));
            paramete.Add(ac.crearPArametro("@decreto", busq.Decreto));
            return ac.Escribir("inserciones_leyes", paramete);

        }

        public int InsertarComentario(Busqueda busq)
        {
            List<SqlParameter> paramete = new List<SqlParameter>();

            paramete.Add(ac.crearPArametro("@idley", busq.Idley));
            paramete.Add(ac.crearPArametro("@observacion", busq.Comentario));
            return ac.Escribir("inserciones_leyes", paramete);



        }

    }



}
