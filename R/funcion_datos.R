#' Funcion Para Leer O Descargar Datos De Una Estacion Meteorologica
#'
#' Esta funcion permite leer los datos si el archivo ya se encuentra cargado o cargarlo primero y luego leerlo si este no se encuentra.
#' @param id_estacion ID de la estacion meteorologica. Valores validos: metadatos, NH0472, NH0910, NH0046, NH0098, NH0437
#' @param ruta_archivo Ruta local donde se encuentra o se descargara el archivo CSV con los datos de la estacion.
#'
#' @returns Un data frame con los datos de la estacion meteorologica.
#' @export
#'
#' @examples
#' # leer_datos_estacion("NH0472", "NH0472.csv")
leer_datos_estacion <- function(id_estacion, ruta_archivo) {

  # Estaciones disponibles
  enlaces <- list(
    "metadatos" = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/metadatos_completos.csv",
    "NH0472" = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0472.csv",
    "NH0910" = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0910.csv",
    "NH0046" = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0046.csv",
    "NH0098" = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0098.csv",
    "NH0437" = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0437.csv"
  )

  # Verificar ID valido
  if (!id_estacion %in% names(enlaces)) {
    cli::cli_abort("El ID de estacion '{id_estacion}' no es valido. Usa alguno de los siguientes: metadatos, NH0472, NH0910, NH0046, NH0098, NH0437")
  }

  link_archivo <- enlaces[[id_estacion]]

  # Leer o descargar segun corresponda
  if (file.exists(ruta_archivo)) {
    cli::cli_inform("El archivo ya esta descargado, se procede a leerlo...")
  } else {
    cli::cli_inform("El archivo no esta descargado, se procede a descargarlo...")
    dir.create(dirname(ruta_archivo), showWarnings = FALSE, recursive = TRUE)
    utils::download.file(link_archivo, destfile = ruta_archivo)
  }

  # Leer el archivo
  datos_estacion <- readr::read_csv(ruta_archivo, show_col_types = FALSE)

  cli::cli_inform("Lectura completada correctamente para la estacion {id_estacion}.")

  return(datos_estacion)
}
