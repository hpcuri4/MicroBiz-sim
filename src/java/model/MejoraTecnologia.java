package model;

import java.math.BigDecimal;

public class MejoraTecnologia {
    private int idMejora;
    private int idNegocio;
    private String nombreMejora;
    private String areaDespliegue;
    private String impactoOperacion;
    private int nivelOptimizacion;
    private BigDecimal costoActualizacion;
    private String estadoMejora;

    // Constructor vacío
    public MejoraTecnologia() {
    }

    // Constructor completo
    public MejoraTecnologia(int idMejora, int idNegocio, String nombreMejora, String areaDespliegue, String impactoOperacion, int nivelOptimizacion, BigDecimal costoActualizacion, String estadoMejora) {
        this.idMejora = idMejora;
        this.idNegocio = idNegocio;
        this.nombreMejora = nombreMejora;
        this.areaDespliegue = areaDespliegue;
        this.impactoOperacion = impactoOperacion;
        this.nivelOptimizacion = nivelOptimizacion;
        this.costoActualizacion = costoActualizacion;
        this.estadoMejora = estadoMejora;
    }

    // Getters y Setters
    public int getIdMejora() {
        return idMejora;
    }

    public void setIdMejora(int idMejora) {
        this.idMejora = idMejora;
    }

    public int getIdNegocio() {
        return idNegocio;
    }

    public void setIdNegocio(int idNegocio) {
        this.idNegocio = idNegocio;
    }

    public String getNombreMejora() {
        return nombreMejora;
    }

    public void setNombreMejora(String nombreMejora) {
        this.nombreMejora = nombreMejora;
    }

    public String getAreaDespliegue() {
        return areaDespliegue;
    }

    public void setAreaDespliegue(String areaDespliegue) {
        this.areaDespliegue = areaDespliegue;
    }

    public String getImpactoOperacion() {
        return impactoOperacion;
    }

    public void setImpactoOperacion(String impactoOperacion) {
        this.impactoOperacion = impactoOperacion;
    }

    public int getNivelOptimizacion() {
        return nivelOptimizacion;
    }

    public void setNivelOptimizacion(int nivelOptimizacion) {
        this.nivelOptimizacion = nivelOptimizacion;
    }

    public BigDecimal getCostoActualizacion() {
        return costoActualizacion;
    }

    public void setCostoActualizacion(BigDecimal costoActualizacion) {
        this.costoActualizacion = costoActualizacion;
    }

    public String getEstadoMejora() {
        return estadoMejora;
    }

    public void setEstadoMejora(String estadoMejora) {
        this.estadoMejora = estadoMejora;
    }
}