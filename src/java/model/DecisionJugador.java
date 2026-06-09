package model;

import java.math.BigDecimal;

public class DecisionJugador {
    private int idDecision;
    private int idSimulacion;
    private String textoOpcion;
    private BigDecimal costoDecision;
    private BigDecimal modificadorReputacion;
    private BigDecimal modificadorCostos;
    private boolean ejecutada;

    public DecisionJugador() {}

    // Getters y Setters
    public int getIdDecision() { return idDecision; }
    public void setIdDecision(int idDecision) { this.idDecision = idDecision; }

    public int getIdSimulacion() { return idSimulacion; }
    public void setIdSimulacion(int idSimulacion) { this.idSimulacion = idSimulacion; }

    public String getTextoOpcion() { return textoOpcion; }
    public void setTextoOpcion(String textoOpcion) { this.textoOpcion = textoOpcion; }

    public BigDecimal getCostoDecision() { return costoDecision; }
    public void setCostoDecision(BigDecimal costoDecision) { this.costoDecision = costoDecision; }

    public BigDecimal getModificadorReputacion() { return modificadorReputacion; }
    public void setModificadorReputacion(BigDecimal modificadorReputacion) { this.modificadorReputacion = modificadorReputacion; }

    public BigDecimal getModificadorCostos() { return modificadorCostos; }
    public void setModificadorCostos(BigDecimal modificadorCostos) { this.modificadorCostos = modificadorCostos; }

    public boolean isEjecutada() { return ejecutada; }
    public void setEjecutada(boolean ejecutada) { this.ejecutada = ejecutada; }
}