package model;

import java.math.BigDecimal;

public class Credito {
    private int idCredito;
    private int idNegocio; // Vinculado a la empresa
    private String nombrePrestamo;
    private BigDecimal montoSolicitado;
    private BigDecimal montoRestante;
    private BigDecimal tasaInteres;
    private int plazoTurnos;
    private int turnosRestantes;
    private String estadoCredito; // "ACTIVO", "PAGADO", "VENCIDO"

    // Constructor vacío
    public Credito() {
    }

    // Constructor completo
    public Credito(int idCredito, int idNegocio, String nombrePrestamo, BigDecimal montoSolicitado, 
                   BigDecimal montoRestante, BigDecimal tasaInteres, int plazoTurnos, 
                   int turnosRestantes, String estadoCredito) {
        this.idCredito = idCredito;
        this.idNegocio = idNegocio;
        this.nombrePrestamo = nombrePrestamo;
        this.montoSolicitado = montoSolicitado;
        this.montoRestante = montoRestante;
        this.tasaInteres = tasaInteres;
        this.plazoTurnos = plazoTurnos;
        this.turnosRestantes = turnosRestantes;
        this.estadoCredito = estadoCredito;
    }

    // Getters y Setters
    public int getIdCredito() { return idCredito; }
    public void setIdCredito(int idCredito) { this.idCredito = idCredito; }

    public int getIdNegocio() { return idNegocio; }
    public void setIdNegocio(int idNegocio) { this.idNegocio = idNegocio; }

    public String getNombrePrestamo() { return nombrePrestamo; }
    public void setNombrePrestamo(String nombrePrestamo) { this.nombrePrestamo = nombrePrestamo; }

    public BigDecimal getMontoSolicitado() { return montoSolicitado; }
    public void setMontoSolicitado(BigDecimal montoSolicitado) { this.montoSolicitado = montoSolicitado; }

    public BigDecimal getMontoRestante() { return montoRestante; }
    public void setMontoRestante(BigDecimal montoRestante) { this.montoRestante = montoRestante; }

    public BigDecimal getTasaInteres() { return tasaInteres; }
    public void setTasaInteres(BigDecimal tasaInteres) { this.tasaInteres = tasaInteres; }

    public int getPlazoTurnos() { return plazoTurnos; }
    public void setPlazoTurnos(int plazoTurnos) { this.plazoTurnos = plazoTurnos; }

    public int getTurnosRestantes() { return turnosRestantes; }
    public void setTurnosRestantes(int turnosRestantes) { this.turnosRestantes = turnosRestantes; }

    public String getEstadoCredito() { return estadoCredito; }
    public void setEstadoCredito(String estadoCredito) { this.estadoCredito = estadoCredito; }
}