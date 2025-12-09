# Funcion Para Leer O Descargar Datos De Una Estacion Meteorologica

Esta funcion permite leer los datos si el archivo ya se encuentra
cargado o cargarlo primero y luego leerlo si este no se encuentra.

## Usage

``` r
leer_datos_estacion(id_estacion, ruta_archivo)
```

## Arguments

- id_estacion:

  ID de la estacion meteorologica. Valores validos: metadatos, NH0472,
  NH0910, NH0046, NH0098, NH0437

- ruta_archivo:

  Ruta local donde se encuentra o se descargara el archivo CSV con los
  datos de la estacion.

## Value

Un data frame con los datos de la estacion meteorologica.

## Examples

``` r
# leer_datos_estacion("NH0472", "NH0472.csv")
```
