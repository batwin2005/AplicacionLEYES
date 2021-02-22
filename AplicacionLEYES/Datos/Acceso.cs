using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;
using System.Collections;


namespace CapaDatos
{
   internal  class Acceso
    {
        private SqlConnection conexion;
   
     

        private void Abrir()
        {
            //String con = "Data Source = DESKTOP - 99QJ5LH\SQLEXPRESS; Initial Catalog = Prueba; Integrated Security = True";
            //conexion = new SqlConnection(@"Data Source=OPC-L-SPASTOR\\Sandra Pastor; Initial Catalog=DBPruebaOptima;Integrated Security=True");
            conexion = new SqlConnection("Data Source=localhost; Initial Catalog= bdley; Integrated Security=True");

            conexion.Open();
        }
        private void Cerrar()
        {
            conexion.Close();
            conexion = null;
            GC.Collect();
        }

        private SqlCommand CrearComando(string nombre, List<SqlParameter> parametr = null)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = conexion;
            com.CommandText = nombre;
            com.CommandType = CommandType.StoredProcedure;
            if (parametr != null)
            {
                if (parametr.Count > 0)
                {
                    com.Parameters.AddRange(parametr.ToArray());

                }
            }
            return com;

        }

        public DataTable Leer(string nombre, List<SqlParameter> parametros = null)
        {
            Abrir();
            DataTable table = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter();
            adp.SelectCommand = CrearComando(nombre, parametros);

            adp.Fill(table);
            adp = null;

            Cerrar();
            return table;


        }
        public int Escribir(string nombre, List<SqlParameter> parametros)
        {
            int filasAfectadas = 0;
            Abrir();
            SqlCommand comand = CrearComando(nombre, parametros);
            try
            {
                EscribirParametros();
                filasAfectadas = comand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                
                filasAfectadas = 1;
            }
            Cerrar();
            return filasAfectadas;

        }

        public SqlParameter crearPArametro(string nombre, string valor)
        {
            SqlParameter parametr = new SqlParameter();
            parametr.ParameterName = nombre;
            parametr.Value = valor;
            parametr.DbType = DbType.String;
            return parametr;
        }
        public SqlParameter crearPArametroStr(string nombre, string valor)
        {
            SqlParameter parametr = new SqlParameter();
            parametr.ParameterName = nombre;
            parametr.Value = valor;
            parametr.DbType = DbType.String;
            return parametr;
        }
    }

}

   
