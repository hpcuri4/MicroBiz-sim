package model;

import java.math.BigDecimal;

public class Simulacion {
    private int idSimulacion;
    private int idNegocio;
    private int turnoActual;
    private BigDecimal ingresos;
    private BigDecimal costosOperativos;
    private BigDecimal gananciasNetas;
    private int clientesGanados;
    private BigDecimal reputacion;

    // Constructor vacío
    public Simulacion() {}

    // Getters y Setters
    public int getIdSimulacion() { return idSimulacion; }
    public void setIdSimulacion(int idSimulacion) { this.idSimulacion = idSimulacion; }

    public int getIdNegocio() { return idNegocio; }
    public void setIdNegocio(int idNegocio) { this.idNegocio = idNegocio; }

    public int getTurnoActual() { return turnoActual; }
    public void setTurnoActual(int turnoActual) { this.turnoActual = turnoActual; }

    public BigDecimal getIngresos() { return ingresos; }
    public void setIngresos(BigDecimal ingresos) { this.ingresos = ingresos; }

    public BigDecimal getCostosOperativos() { return costosOperativos; }
    public void setCostosOperativos(BigDecimal costosOperativos) { this.costosOperativos = costosOperativos; }

    public BigDecimal getGananciasNetas() { return gananciasNetas; }
    public void setGananciasNetas(BigDecimal gananciasNetas) { this.gananciasNetas = gananciasNetas; }

    public int getClientesGanados() { return clientesGanados; }
    public void setClientesGanados(int clientesGanados) { this.clientesGanados = clientesGanados; }

    public BigDecimal getReputacion() { return reputacion; }
    public void setReputacion(BigDecimal reputacion) { this.reputacion = reputacion; }
}
