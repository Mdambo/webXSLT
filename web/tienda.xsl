<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat"/>
    
    <xsl:template match="/">
        <html lang="es">
            
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
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
                <main class="principal">
                    <xsl:apply-templates select="//tienda/articulo"/>
                </main>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="//tienda/articulo">
        <article>
            <section>
                <img class="articulo" src="{@foto}" alt="{@marca}" />
            </section>
            <section>
                <p><strong>Precio: </strong><xsl:value-of select="precio"/></p>
            </section>
            
            <!-- Comentarios -->
            <section>
                <h3>
                    <xsl:text>Comentarios: </xsl:text>
                    <xsl:value-of select="count(comentarios)"/>
                </h3>
                <xsl:apply-templates select="comentarios"/>
            </section>
        </article>
    </xsl:template>
    
    <xsl:template match="comentarios">
        <ul>
            <li>
                <xsl:value-of select="@fecha"/>: 
                <xsl:value-of select="."/>
            </li>
        </ul>
    </xsl:template>
</xsl:stylesheet>
