package model;

public class Cliente {
    private int idCliente;
    private int idNegocio;
    private String nombreCliente;
    private String categoriaLealtad; // 'favorable', 'variado', 'no-favorable'
    private double nivelSatisfaccion;
    private double gastoPromedio;
    private int frecuencia;

    // Genera aquí tus constructores, getters y setters...

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdNegocio() {
        return idNegocio;
    }

    public void setIdNegocio(int idNegocio) {
        this.idNegocio = idNegocio;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getCategoriaLealtad() {
        return categoriaLealtad;
    }

    public void setCategoriaLealtad(String categoriaLealtad) {
        this.categoriaLealtad = categoriaLealtad;
    }

    public double getNivelSatisfaccion() {
        return nivelSatisfaccion;
    }

    public void setNivelSatisfaccion(double nivelSatisfaccion) {
        this.nivelSatisfaccion = nivelSatisfaccion;
    }

    public double getGastoPromedio() {
        return gastoPromedio;
    }

    public void setGastoPromedio(double gastoPromedio) {
        this.gastoPromedio = gastoPromedio;
    }

    public int getFrecuencia() {
        return frecuencia;
    }

    public void setFrecuencia(int frecuencia) {
        this.frecuencia = frecuencia;
    }
    
}