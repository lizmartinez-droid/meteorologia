# Tabla resumen de temperatura por estación

Esta función genera una tabla resumen con estadísticas de temperatura
para cada estación. Incluye el promedio, desvío estándar, máximo y
mínimo de temperatura

## Usage

``` r
tabla_resumen_temperatura(estacion)
```

## Arguments

- estacion:

  Data frame o tibble con los datos de las estaciones. Debe contener las
  columnas: id, temperatura_abrigo_150cm,
  temperatura_abrigo_150cm_maxima, temperatura_abrigo_150cm_minima.

## Value

Un data frame con las siguientes columnas: id, promedio_temperatura,
desvio_estandar, temp_max, temp_min.

## Examples

``` r
tabla_resumen_temperatura(estacion_NH0910)
#> # A tibble: 1 × 5
#>   id     promedio_temperatura desvio_estandar temp_max temp_min
#>   <chr>                 <dbl>           <dbl>    <dbl>    <dbl>
#> 1 NH0910                 17.7            6.12       43     -8.5
```
