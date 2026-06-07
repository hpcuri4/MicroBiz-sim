package model;

public class Favorito {
    private int idFavorito;
    private int idUsuario;
    private int idNegocio;
    private String ComicPrioridad; // Almacena "Alta" o "Baja"
    
    // Campos espejo de la tabla Negocio para pintar las tarjetas
    private String nombreNegocio;
    private String tipoNegocio;
    private double capitalInicialInvertido;
    private String nivelRiesgo;

    public Favorito() {}

    // Getters y Setters
    public int getIdFavorito() { return idFavorito; }
    public void setIdFavorito(int idFavorito) { this.idFavorito = idFavorito; }

    public int getIdUsuario() { return idUsuario; }
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }

    public int getIdNegocio() { return idNegocio; }
    public void setIdNegocio(int idNegocio) { this.idNegocio = idNegocio; }

    public String getComicPrioridad() { return ComicPrioridad; }
    public void setComicPrioridad(String ComicPrioridad) { this.ComicPrioridad = ComicPrioridad; }

    public String getNombreNegocio() { return nombreNegocio; }
    public void setNombreNegocio(String nombreNegocio) { this.nombreNegocio = nombreNegocio; }

    public String getTipoNegocio() { return tipoNegocio; }
    public void setTipoNegocio(String tipoNegocio) { this.tipoNegocio = tipoNegocio; }

    public double getCapitalInicialInvertido() { return capitalInicialInvertido; }
    public void setCapitalInicialInvertido(double capitalInicialInvertido) { this.capitalInicialInvertido = capitalInicialInvertido; }

    public String getNivelRiesgo() { return nivelRiesgo; }
    public void setNivelRiesgo(String nivelRiesgo) { this.nivelRiesgo = nivelRiesgo; }
}