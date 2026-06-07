package model;

import java.math.BigDecimal;

public class negocio {
    private int idNegocio;
    private int idUsuario;
    private String nombreNegocio;
    private String tipoNegocio;
    private BigDecimal capitalInicialInvertido;
    private BigDecimal balanceActual;
    private BigDecimal gananciaEsperada;
    private String region;
    private String nivelRiesgo;
    private int tiempoActivoDias;

    // Constructor vacío
    public negocio() {
    }

    // Constructor completo (Útil para listar)
    public negocio(int idNegocio, int idUsuario, String nombreNegocio, String tipoNegocio, 
                   BigDecimal capitalInicialInvertido, BigDecimal balanceActual, 
                   BigDecimal gananciaEsperada, String region, String nivelRiesgo, int tiempoActivoDias) {
        this.idNegocio = idNegocio;
        this.idUsuario = idUsuario;
        this.nombreNegocio = nombreNegocio;
        this.tipoNegocio = tipoNegocio;
        this.capitalInicialInvertido = capitalInicialInvertido;
        this.balanceActual = balanceActual;
        this.gananciaEsperada = gananciaEsperada;
        this.region = region;
        this.nivelRiesgo = nivelRiesgo;
        this.tiempoActivoDias = tiempoActivoDias;
    }

    // Constructor sin ID (Útil para insertar un nuevo negocio)
    public negocio(int idUsuario, String nombreNegocio, String tipoNegocio, 
                   BigDecimal capitalInicialInvertido, BigDecimal balanceActual, 
                   BigDecimal gananciaEsperada, String region, String nivelRiesgo) {
        this.idUsuario = idUsuario;
        this.nombreNegocio = nombreNegocio;
        this.tipoNegocio = tipoNegocio;
        this.capitalInicialInvertido = capitalInicialInvertido;
        this.balanceActual = balanceActual;
        this.gananciaEsperada = gananciaEsperada;
        this.region = region;
        this.nivelRiesgo = nivelRiesgo;
        this.tiempoActivoDias = 0; // Por defecto inicia en 0 días
    }

    // Getters y Setters
    public int getIdNegocio() { return idNegocio; }
    public void setIdNegocio(int idNegocio) { this.idNegocio = idNegocio; }

    public int getIdUsuario() { return idUsuario; }
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }

    public String getNombreNegocio() { return nombreNegocio; }
    public void setNombreNegocio(String nombreNegocio) { this.nombreNegocio = nombreNegocio; }

    public String getTipoNegocio() { return tipoNegocio; }
    public void setTipoNegocio(String tipoNegocio) { this.tipoNegocio = tipoNegocio; }

    public BigDecimal getCapitalInicialInvertido() { return capitalInicialInvertido; }
    public void setCapitalInicialInvertido(BigDecimal capitalInicialInvertido) { this.capitalInicialInvertido = capitalInicialInvertido; }

    public BigDecimal getBalanceActual() { return balanceActual; }
    public void setBalanceActual(BigDecimal balanceActual) { this.balanceActual = balanceActual; }

    public BigDecimal getGananciaEsperada() { return gananciaEsperada; }
    public void setGananciaEsperada(BigDecimal gananciaEsperada) { this.gananciaEsperada = gananciaEsperada; }

    public String getRegion() { return region; }
    public void setRegion(String region) { this.region = region; }

    public String getNivelRiesgo() { return nivelRiesgo; }
    public void setNivelRiesgo(String nivelRiesgo) { this.nivelRiesgo = nivelRiesgo; }

    public int getTiempoActivoDias() { return tiempoActivoDias; }
    public void setTiempoActivoDias(int tiempoActivoDias) { this.tiempoActivoDias = tiempoActivoDias; }
}