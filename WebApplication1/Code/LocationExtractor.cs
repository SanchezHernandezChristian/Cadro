using System;
using System.IO;
using System.Drawing;
using System.Diagnostics;
using System.Collections.Generic;
using ERP.Core.Log4Net;
using BusinessEntities;

namespace WebApplication1.Code
{
    public class LocationExtractor
    {
        public void ExtractData(string folder)
        {
            try
            {
                foreach (var file in Directory.GetFiles(folder))
                {
                    if (file.ToLower().EndsWith(".jpg") || file.ToLower().EndsWith(".jpeg"))
                    {
                        ExtractLocation(file);
                    }
                }
                foreach (var directory in Directory.GetDirectories(folder))
                {
                    ExtractData(directory);
                }

            }
            catch (UnauthorizedAccessException) { /*Ignore*/}   // Stuff we do not have access to
            catch (DirectoryNotFoundException) { /*Ignore*/}    // Symbolic links that are invalid
        }

        public static Coordenada ExtractLocation(string file)
        {
            Coordenada co = new Coordenada();
            //if (file.ToLower().EndsWith("jpg") || file.ToLower().EndsWith("jpeg"))
            //{
            Image image = null;
            try
            {
                try
                {
                    FileStream fs = new FileStream(file, FileMode.Open, FileAccess.Read);                  
                    image = Image.FromStream(fs);
                 
                }
                catch (Exception ex)
                {
                    co.Mensaje = string.Format("Error al abrir la imagen {0} puede estar dañada, {1}", file, ex.Message);
                    co.IsCoordenadas = false;
                }
                // Check to see if we have gps data
                if (Array.IndexOf<int>(image.PropertyIdList, 1) != -1 &&
                    Array.IndexOf<int>(image.PropertyIdList, 2) != -1 &&
                    Array.IndexOf<int>(image.PropertyIdList, 3) != -1 &&
                    Array.IndexOf<int>(image.PropertyIdList, 4) != -1)
                {

                    string gpsLatitudeRef = BitConverter.ToChar(image.GetPropertyItem(1).Value, 0).ToString();
                    co.Latitud = DecodeRational64u(image.GetPropertyItem(2), gpsLatitudeRef);
                    string gpsLongitudeRef = BitConverter.ToChar(image.GetPropertyItem(3).Value, 0).ToString();
                    co.Longitud = DecodeRational64u(image.GetPropertyItem(4), gpsLongitudeRef);
                    co.IsCoordenadas = true;
                    //Console.WriteLine("{0}\t{1} {2}, {3} {4}", file, gpsLatitudeRef, latitude, gpsLongitudeRef, longitude);
                }
                else
                {
                    co.Mensaje = string.Format("Es necesario que la fotográfia este georeferenciadas.");
                    co.IsCoordenadas = false;
                }
            }
            catch (Exception ex)
            {
                co.Mensaje = string.Format("Error processign {0} {1}", file, ex.Message);
                co.IsCoordenadas = false;
                Log4NetCommon.WriteException(ex);
            }
            finally
            {
                if (image != null) image.Dispose();
            }
            return co;
        }
        private static decimal DecodeRational64u(System.Drawing.Imaging.PropertyItem propertyItem, string point)
        {
            decimal coo = 0;
            try
            {
                var multiplier = (point.Contains("S") || point.Contains("W")) ? -1 : 1;
                uint dN = BitConverter.ToUInt32(propertyItem.Value, 0);
                uint dD = BitConverter.ToUInt32(propertyItem.Value, 4);
                uint mN = BitConverter.ToUInt32(propertyItem.Value, 8);
                uint mD = BitConverter.ToUInt32(propertyItem.Value, 12);
                uint sN = BitConverter.ToUInt32(propertyItem.Value, 16);
                uint sD = BitConverter.ToUInt32(propertyItem.Value, 20);
                uint dN2 = BitConverter.ToUInt32(propertyItem.Value, 1);
                decimal deg;
                decimal min;
                decimal sec;
                // Found some examples where you could get a zero denominator and no one likes to devide by zero
                if (dD > 0) { deg = (decimal)dN / dD; } else { deg = dN; }
                if (mD > 0) { min = (decimal)mN / mD; } else { min = mN; }
                if (sD > 0) { sec = (decimal)sN / sD; } else { sec = sN; }

                decimal minD = min / 60;
                decimal secD = sec / 3600;
                coo = (deg + minD + secD) * multiplier;
            }
            catch (Exception ex)
            {
                Log4NetCommon.WriteException(ex);
            }

            return coo;
        }
    }
}