using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace WebApp.Code
{
    public static class Utils
    {
       static string key = "alskdjfhg12345*";
        public static int ObtenerMesxNombre(string nombre) {
            int result = 0;
            switch (nombre.ToLower()) {
                case "ene.": result = 1; break;
                case "feb.": result = 2; break;
                case "mar.": result = 3; break;
                case "abr.": result = 4; break;
                case "may.": result = 5; break;
                case "jun.": result = 6; break;
                case "jul.": result = 7; break;
                case "ago.": result = 8; break;
                case "sep.": result = 9; break;
                case "oct.": result = 10; break;
                case "nov.": result = 11; break;
                case "dic.": result = 12; break;
                case "ene": result = 1; break;
                case "feb": result = 2; break;
                case "mar": result = 3; break;
                case "abr": result = 4; break;
                case "may": result = 5; break;
                case "jun": result = 6; break;
                case "jul": result = 7; break;
                case "ago": result = 8; break;
                case "sep": result = 9; break;
                case "oct": result = 10; break;
                case "nov": result = 11; break;
                case "dic": result = 12; break;
            }
            return result;
        }
        /// <summary>
        /// Encripta un texto
        /// </summary>
        /// <param name="texto"></param>
        /// <returns></returns>
        public static string Encriptar(string texto)
        {
            //arreglo de bytes donde guardaremos la llave
            byte[] keyArray;
            //arreglo de bytes donde guardaremos el texto
            //que vamos a encriptar
            byte[] Arreglo_a_Cifrar =
            UTF8Encoding.UTF8.GetBytes(texto);

            //se utilizan las clases de encriptación
            //provistas por el Framework
            //Algoritmo MD5
            MD5CryptoServiceProvider hashmd5 =
            new MD5CryptoServiceProvider();
            //se guarda la llave para que se le realice
            //hashing
            keyArray = hashmd5.ComputeHash(
            UTF8Encoding.UTF8.GetBytes(key));

            hashmd5.Clear();

            //Algoritmo 3DAS
            TripleDESCryptoServiceProvider tdes =
            new TripleDESCryptoServiceProvider();

            tdes.Key = keyArray;
            tdes.Mode = CipherMode.ECB;
            tdes.Padding = PaddingMode.PKCS7;

            //se empieza con la transformación de la cadena
            ICryptoTransform cTransform =
            tdes.CreateEncryptor();

            //arreglo de bytes donde se guarda la
            //cadena cifrada
            byte[] ArrayResultado =
            cTransform.TransformFinalBlock(Arreglo_a_Cifrar,
            0, Arreglo_a_Cifrar.Length);

            tdes.Clear();

            //se regresa el resultado en forma de una cadena
            return Convert.ToBase64String(ArrayResultado,
            0, ArrayResultado.Length);
        }

        /// <summary>
        /// Desencripta un texto
        /// </summary>
        /// <param name="textoEncriptado"></param>
        /// <returns></returns>
        public static string Desencriptar(string textoEncriptado)
        {
            textoEncriptado = textoEncriptado.Replace(" ", "+");
            byte[] keyArray;
            //convierte el texto en una secuencia de bytes
            byte[] Array_a_Descifrar =
            Convert.FromBase64String(textoEncriptado);

            //se llama a las clases que tienen los algoritmos
            //de encriptación se le aplica hashing
            //algoritmo MD5
            MD5CryptoServiceProvider hashmd5 =
            new MD5CryptoServiceProvider();

            keyArray = hashmd5.ComputeHash(
            UTF8Encoding.UTF8.GetBytes(key));

            hashmd5.Clear();

            TripleDESCryptoServiceProvider tdes =
            new TripleDESCryptoServiceProvider();

            tdes.Key = keyArray;
            tdes.Mode = CipherMode.ECB;
            tdes.Padding = PaddingMode.PKCS7;

            ICryptoTransform cTransform =
            tdes.CreateDecryptor();

            byte[] resultArray =
            cTransform.TransformFinalBlock(Array_a_Descifrar,
            0, Array_a_Descifrar.Length);

            tdes.Clear();
            //se regresa en forma de cadena
            return UTF8Encoding.UTF8.GetString(resultArray);
        }

        /// <summary>
        /// Obtiene el valor en hasth sha256 de un sstring
        /// </summary>
        /// <param name="value">valor a encriptar</param>
        /// <returns>valor encriptado</returns>
        public static String sha256_hash(String value)
        {
            StringBuilder Sb = new StringBuilder();

            using (SHA256 hash = SHA256Managed.Create())
            {
                Encoding enc = Encoding.UTF8;
                Byte[] result = hash.ComputeHash(enc.GetBytes(value));

                foreach (Byte b in result)
                    Sb.Append(b.ToString("x2"));
            }
            return Sb.ToString();
        }
    }
}