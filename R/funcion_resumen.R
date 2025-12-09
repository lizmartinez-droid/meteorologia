tabla_resumen_temperatura <- function(estacion) {
  if (!is.data.frame(estacion)) {
    stop("El argumento estacion debe ser un data.frame o tibble con los datos de las estaciones.")
  }
  # Resumen
  resumen <- estacion |>
    dplyr::group_by(id) |>
    dplyr::summarise(
      promedio_temperatura = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      desvio_estandar = stats::sd(temperatura_abrigo_150cm, na.rm = TRUE),
      temp_max = max(temperatura_abrigo_150cm_maxima, na.rm = TRUE),
      temp_min = min(temperatura_abrigo_150cm_minima, na.rm = TRUE)
    )

  return(resumen)
}
