#' Tabla resumen de temperatura por estación
#'
#' Esta función genera una tabla resumen con estadísticas de temperatura para cada estación. Incluye el promedio, desvío estándar, máximo y mínimo de temperatura
#' @param estacion Data frame o tibble con los datos de las estaciones. Debe contener las columnas: id, temperatura_abrigo_150cm, temperatura_abrigo_150cm_maxima, temperatura_abrigo_150cm_minima.
#'
#' @returns Un data frame con las siguientes columnas: id, promedio_temperatura, desvio_estandar, temp_max, temp_min.
#' @export
#'
#' @examples
#' tabla_resumen_temperatura(estacion_NH0910)
tabla_resumen_temperatura <- function(estacion) {
  .data <- rlang::.data

  if (!is.data.frame(estacion)) {
    stop("El argumento estacion debe ser un data.frame o tibble con los datos de las estaciones.")
  }
  # Resumen
  resumen <- estacion |>
    dplyr::group_by(.data$id) |>
    dplyr::summarise(
      promedio_temperatura = mean(.data$temperatura_abrigo_150cm, na.rm = TRUE),
      desvio_estandar = stats::sd(.data$temperatura_abrigo_150cm, na.rm = TRUE),
      temp_max = max(.data$temperatura_abrigo_150cm_maxima, na.rm = TRUE),
      temp_min = min(.data$temperatura_abrigo_150cm_minima, na.rm = TRUE)
    )

  return(resumen)
}
