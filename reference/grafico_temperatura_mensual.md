# Grafico de temperatura mensual

' Esta función genera un gráfico de líneas que muestra la temperatura
promedio mensual para cada estación en el conjunto de datos
proporcionado.

## Usage

``` r
grafico_temperatura_mensual(
  estaciones,
  colores,
  titulo = "Temperatura mensual"
)
```

## Arguments

- estaciones:

  Data frame o tibble con los datos de las estaciones. Debe contener las
  columnas: id, fecha, temperatura_abrigo_150cm.

- colores:

  Vector de colores para las líneas del gráfico. Si no se proporcionan
  suficientes colores, se generarán colores aleatorios.

- titulo:

  Título del gráfico. Por defecto es "Temperatura mensual".

## Value

Un gráfico de líneas que representa la temperatura mensual por id.

## Examples

``` r
grafico_temperatura_mensual(estacion_NH0910, colores = c("red", "blue"),
titulo = "Temperatura mensual NH0910")
```
