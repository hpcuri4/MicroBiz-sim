package model;

import java.math.BigDecimal;

public class EventoTurno {
    private int idEventoInstancia;
    private int idSimulacion;
    private String tituloEvento;
    private String descripcion;
    private String tipoEvento;
    private BigDecimal impactoFinanciero;
    private int impactoClientesMin;
    private int impactoClientesMax;
    private String estadoEvento;

    // Constructor vacío
    public EventoTurno() {}

    // Getters y Setters
    public int getIdEventoInstancia() { return idEventoInstancia; }
    public void setIdEventoInstancia(int idEventoInstancia) { this.idEventoInstancia = idEventoInstancia; }

    public int getIdSimulacion() { return idSimulacion; }
    public void setIdSimulacion(int idSimulacion) { this.idSimulacion = idSimulacion; }

    public String getTituloEvento() { return tituloEvento; }
    public void setTituloEvento(String tituloEvento) { this.tituloEvento = tituloEvento; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public String getTipoEvento() { return tipoEvento; }
    public void setTipoEvento(String tipoEvento) { this.tipoEvento = tipoEvento; }

    public BigDecimal getImpactoFinanciero() { return impactoFinanciero; }
    public void setImpactoFinanciero(BigDecimal impactoFinanciero) { this.impactoFinanciero = impactoFinanciero; }

    public int getImpactoClientesMin() { return impactoClientesMin; }
    public void setImpactoClientesMin(int impactoClientesMin) { this.impactoClientesMin = impactoClientesMin; }

    public int getImpactoClientesMax() { return impactoClientesMax; }
    public void setImpactoClientesMax(int impactoClientesMax) { this.impactoClientesMax = impactoClientesMax; }

    public String getEstadoEvento() { return estadoEvento; }
    public void setEstadoEvento(String estadoEvento) { this.estadoEvento = estadoEvento; }
}