using CapaDatos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocios
{
  public  class N_Busqueda
    {
        Mp_Busqueda map = new Mp_Busqueda();
       public  static int Resultado;
        public int Grabar(Busqueda busq)
        {
            int result = 0;
            
             result = map.Insertar(busq);
             Resultado =result;
            
            return result;
        }
        public int GrabarComentario(Busqueda busq)
        {
            int result = 0;

            result = map.InsertarComentario(busq);
            Resultado = result;

            return result;
        }
    }
}
