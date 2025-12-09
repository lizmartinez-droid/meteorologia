# Cómo contribuir a meteorologia

Este documento describe cómo proponer un cambio al paquete meteorologia.
Para una discusión más detallada sobre cómo contribuir a este y otros paquetes del tidyverse, por favor consultá la [guía de contribución al desarrollo](https://rstd.io/tidy-contrib) y nuestros [principios de revisión de código](https://code-review.tidyverse.org/).

## Corrección de errores tipográficos

Podés corregir errores de tipeo, ortografía o gramática en la documentación directamente usando la interfaz web de GitHub, siempre y cuando los cambios se realicen en el archivo _fuente_.  
Esto generalmente significa que vas a tener que editar los [comentarios roxygen2](https://roxygen2.r-lib.org/articles/roxygen2.html) en un archivo `.R`, y no un archivo `.Rd`.  
Podés encontrar el archivo `.R` que genera el `.Rd` leyendo el comentario de la primera línea.

## Cambios más grandes

Si querés hacer un cambio más grande, es una buena idea primero abrir un *issue* y asegurarte de que alguien del equipo esté de acuerdo en que es necesario.  
Si encontraste un bug, por favor abrí un *issue* que muestre el problema con un  
[reprex](https://www.tidyverse.org/help/#reprex) mínimo (esto también te va a ayudar a escribir un test unitario, si es necesario).  
Consultá nuestra guía sobre [cómo crear un buen issue](https://code-review.tidyverse.org/issues/) para más recomendaciones.

### Proceso de Pull Request

*   Hacé un *fork* del paquete y clonalo en tu computadora. Si nunca hiciste esto antes, recomendamos usar:  
    `usethis::create_from_github("lizmartinez-droid/meteorologia", fork = TRUE)`.

*   Instalá todas las dependencias de desarrollo con `devtools::install_dev_deps()` y luego asegurate de que el paquete pase correctamente `R CMD check` ejecutando `devtools::check()`.  
    Si `R CMD check` no pasa sin errores, es recomendable pedir ayuda antes de continuar.

*   Creá una rama (*branch*) de Git para tu Pull Request (PR). Recomendamos usar  
    `usethis::pr_init("breve-descripcion-del-cambio")`.

*   Realizá tus cambios, guardalos con *commit* en Git, y luego creá el PR ejecutando `usethis::pr_push()` y siguiendo las indicaciones en el navegador.  
    El título de tu PR debe describir brevemente el cambio.  
    El cuerpo del PR debe contener `Fixes #numero-del-issue`.

*   Para cambios que impacten al usuario, agregá un punto en la parte superior de `NEWS.md` (es decir, justo debajo del primer encabezado). Seguí el estilo descripto en:  
    <https://style.tidyverse.org/news.html>

### Estilo de código

*   El código nuevo debe seguir la [guía de estilo del tidyverse](https://style.tidyverse.org).  
    Podés usar [Air](https://posit-dev.github.io/air/) para aplicar este estilo, pero por favor no reformatees código que no tenga relación con tu PR.

*   Usamos [roxygen2](https://cran.r-project.org/package=roxygen2), con [sintaxis Markdown](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd-formatting.html), para la documentación.

*   Usamos [testthat](https://cran.r-project.org/package=testthat) para los tests unitarios.  
    Las contribuciones que incluyen casos de prueba son más fáciles de aceptar.

## Código de Conducta

Por favor tené en cuenta que el proyecto meteorologia se publica junto con un  
[Código de Conducta para Contribuyentes](CODE_OF_CONDUCT.md).  
Al contribuir a este proyecto, aceptás cumplir con sus términos.
