package model;

public class Alianza {
    private int idAlianza;
    private int idNegocio;
    private String nombreAlianza;
    private String tipoContrato;
    private int metaClientes;
    private int clientesActuales;
    private String condicionImpacto;
    private String estadoAlianza;

    // Constructores, Getters y Setters
    public Alianza() {}
    
    // Getters y Setters...
    
    // ... (restos de los getters y setters para los demás campos)

    public int getIdAlianza() {
        return idAlianza;
    }

    public void setIdAlianza(int idAlianza) {
        this.idAlianza = idAlianza;
    }

    public int getIdNegocio() {
        return idNegocio;
    }

    public void setIdNegocio(int idNegocio) {
        this.idNegocio = idNegocio;
    }

    public String getNombreAlianza() {
        return nombreAlianza;
    }

    public void setNombreAlianza(String nombreAlianza) {
        this.nombreAlianza = nombreAlianza;
    }

    public String getTipoContrato() {
        return tipoContrato;
    }

    public void setTipoContrato(String tipoContrato) {
        this.tipoContrato = tipoContrato;
    }

    public int getMetaClientes() {
        return metaClientes;
    }

    public void setMetaClientes(int metaClientes) {
        this.metaClientes = metaClientes;
    }

    public int getClientesActuales() {
        return clientesActuales;
    }

    public void setClientesActuales(int clientesActuales) {
        this.clientesActuales = clientesActuales;
    }

    public String getCondicionImpacto() {
        return condicionImpacto;
    }

    public void setCondicionImpacto(String condicionImpacto) {
        this.condicionImpacto = condicionImpacto;
    }

    public String getEstadoAlianza() {
        return estadoAlianza;
    }

    public void setEstadoAlianza(String estadoAlianza) {
        this.estadoAlianza = estadoAlianza;
    }
}
