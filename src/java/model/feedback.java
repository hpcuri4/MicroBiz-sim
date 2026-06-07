package model;

import java.util.Date;

public class feedback {
    private int idFeedback;
    private int idUsuario; // Mantenemos tu estándar
    private String comentario;
    private Date fechaEnvio;

    public feedback() {
    }

    public feedback(int idUsuario, String comentario) {
        this.idUsuario = idUsuario;
        this.comentario = comentario;
    }

    public int getIdFeedback() {
        return idFeedback;
    }

    public void setIdFeedback(int idFeedback) {
        this.idFeedback = idFeedback;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public Date getFechaEnvio() {
        return fechaEnvio;
    }

    public void setFechaEnvio(Date fechaEnvio) {
        this.fechaEnvio = fechaEnvio;
    }
}