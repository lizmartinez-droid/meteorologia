#' Grafico de temperatura mensual
#'
#'' Esta función genera un gráfico de líneas que muestra la temperatura promedio mensual para cada estación en el conjunto de datos proporcionado.
#' @param estaciones Data frame o tibble con los datos de las estaciones. Debe contener las columnas: id, fecha, temperatura_abrigo_150cm.
#' @param colores Vector de colores para las líneas del gráfico. Si no se proporcionan suficientes colores, se generarán colores aleatorios.
#' @param titulo Título del gráfico. Por defecto es "Temperatura mensual".
#'
#' @returns Un gráfico de líneas que representa la temperatura mensual por id.
#' @export
#'
#' @examples
#' grafico_temperatura_mensual(estacion_NH0910, colores = c("red", "blue"), titulo = "Temperatura mensual NH0910")
grafico_temperatura_mensual <- function(estaciones,
                                        colores,
                                        titulo = "Temperatura mensual") {

  if (!is.data.frame(estaciones)) {
    stop("El argumento estaciones debe ser un data frame o tibble con datos de estaciones.")
  }

  resumen_mensual <- estaciones |>
    dplyr::group_by(id, mes = lubridate::month(fecha)) |>
    dplyr::summarise(
      temp_promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE), .groups = "drop"
    )

  cantidad <- dplyr::n_distinct(resumen_mensual$id)
  estaciones_unicas <- unique(resumen_mensual$id)


  if (length(colores) < cantidad) {
    colores <- sample(grDevices::colors(), cantidad)
  }

  names(colores) <- estaciones_unicas

  grafico <- ggplot2::ggplot(
    resumen_mensual,
    ggplot2::aes(
      x = mes,
      y = temp_promedio,
      color = id,
      group = id
    )
  ) +
    ggplot2::geom_line() +
    ggplot2::labs(
      title = titulo,
      x = "Mes",
      y = "Temperatura promedio abrigo 150 cm",
      color = "Estacion"
    ) +
    ggplot2::scale_color_manual(values = colores)
  return(grafico)
}
