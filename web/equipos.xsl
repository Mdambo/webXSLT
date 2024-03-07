<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat"/>
    
    <xsl:variable name="nombreEntrenador" select="//equipo/entrenador/nombre"/>

    <xsl:template match="/">
        <html lang="es">
            
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Página principal" />
                <title>titulo de la web</title>
            </head>
            
            <body>
                <header>
                    <img src= "../img/logotipo.png" alt= "Reservas" />
                    <a href="tienda.xml">Tienda</a>
                    <a href="equipos.xml">Equipos</a>
                    <a href="partidos.xml">Partidos</a>
                </header>
                
                <main>
                    <h1><a href="{//equipo[entrenador/nombre = $nombreEntrenador]/entrenador/url}">
                            <xsl:value-of select="//equipo[entrenador/nombre = $nombreEntrenador]/entrenador/nombre"/></a></h1>
                    
                    <article class="equipos">
                        <h4><xsl:value-of select="//equipo[entrenador/nombre = $nombreEntrenador]/nombre"/></h4>
                        <xsl:apply-templates select="//equipo[entrenador/nombre = $nombreEntrenador]/jugadores/jugador[@titular='si']
                        [not(@camiseta = preceding::jugador/@camiseta)]"/>
                    </article>
                </main>
                
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="//equipo[entrenador/nombre = $nombreEntrenador]/jugadores/jugador[@titular='si']">
        <p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>
    </xsl:template>
</xsl:stylesheet>
