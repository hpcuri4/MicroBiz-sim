<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>MicroBiz - Crédito</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="Credito.css">
    </head>
    <body style="height: 100vh; overflow: hidden; margin: 0; padding: 0;">
        <div class="contenedor-principal" style="height: 100vh; display: flex; flex-direction: column; overflow: hidden;">

            <div class="barra-superior" style="height: 75px; flex-shrink: 0;">
                <div class="logo">
                    <i class="fa-solid fa-cubes-stacked"></i> MicroBiz
                </div>
                
                <div class="menu-navegacion">
                    <div class="opcion">
                        <a href="index.html"><i class="fa-solid fa-house"></i><span>Principal</span></a>
                    </div>
                    <div class="opcion">
                        <a href="negocio.jsp"><i class="fa-solid fa-briefcase"></i><span>Negocio</span></a>
                    </div>
                    <div class="opcion">
                        <a href="negocios_favoritos.jsp"><i class="fa-solid fa-heart"></i><span>Negocios Favoritos</span></a>
                    </div>
                    <div class="opcion activa">
                        <a href="credito.jsp"><i class="fa-solid fa-credit-card"></i><span>Crédito</span></a>
                    </div>
                    <div class="opcion">
                        <a href="simulacion.jsp"><i class="fa-solid fa-chart-line"></i><span>Simulación</span></a>
                    </div>
                    <div class="opcion">
                        <a href="MejorayTecnologia.jsp"><i class="fa-solid fa-computer"></i><span>Mejoras y tecnologia</span></a>
                    </div>
                    <div class="opcion">
                        <a href="Cliente.jsp"><i class="fa-solid fa-users"></i><span>Clientes</span></a>
                    </div>
                    <div class="opcion">
                        <a href="alianzas.jsp"><i class="fa-solid fa-handshake"></i><span>Alianzas Comerciales</span></a>
                    </div>
                    <div class="opcion">
                        <a href="configuracion.jsp"><i class="fa-solid fa-gear"></i><span>Configuración</span></a>
                    </div>
                    <div class="opcion">
                        <a href="PAyuda.jsp"><i class="fa-solid fa-circle-question"></i><span>Ayuda y Guía</span></a>
                    </div>
                    <div class="opcion">
                        <a href="Feedback.jsp"><i class="fa-solid fa-comments"></i><span>Feedback</span></a>
                    </div>
                </div>
            </div>
            

            <div class="contenido-pagina credito-pagina" style="flex: 1; display: flex; flex-direction: column; justify-content: space-between; padding: 20px 40px; box-sizing: border-box; overflow: hidden;">

                <section class="credito-encabezado" style="margin-bottom: 10px; flex-shrink: 0;">
                    <div>
                        <span class="etiqueta-seccion" style="font-size: 11px; text-transform: uppercase; letter-spacing: 0.5px; color: #475569; font-weight: 700;">Financiamiento del negocio</span>
                        <h1 style="font-size: 32px; color: #111133; font-weight: 800; margin: 2px 0 4px 0; letter-spacing: -1px;">Crédito</h1>
                        <p style="font-size: 13.5px; color: #334155; max-width: 800px; line-height: 1.4; margin: 0;">
                            Solicita préstamos cuando tu negocio se quede sin dinero, revisa tus deudas activas y decide pagarlas.
                        </p>
                    </div>
                </section>

                <section class="credito-resumen" style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 15px; margin-bottom: 15px; flex-shrink: 0;">
                    <div class="credito-metrica alerta">
                        <i class="fa-solid fa-wallet"></i>
                        <div>
                            <span>Saldo actual</span>
                            <strong>-$2,400</strong>
                        </div>
                    </div>
                    <div class="credito-metrica">
                        <i class="fa-solid fa-hand-holding-dollar"></i>
                        <div>
                            <span>Deuda total</span>
                            <strong>$8,500</strong>
                        </div>
                    </div>
                    <div class="credito-metrica">
                        <i class="fa-solid fa-file-signature"></i>
                        <div>
                            <span>Préstamos pedidos</span>
                            <strong>3</strong>
                        </div>
                    </div>
                    <div class="credito-metrica">
                        <i class="fa-solid fa-percent"></i>
                        <div>
                            <span>Interés promedio</span>
                            <strong>12%</strong>
                        </div>
                    </div>
                </section>

                <section class="credito-grid" style="display: grid; grid-template-columns: 1fr 1.2fr; gap: 20px; flex: 1; min-height: 0; margin-bottom: 15px;">

                    <div class="panel-credito" style="display: flex; flex-direction: column; justify-content: space-between; padding: 20px; height: 100%; box-sizing: border-box;">
                        <h2 style="margin-bottom: 10px; margin-top: 0;">Solicitar préstamo</h2>

                        <div class="credito-aviso" style="margin-bottom: 12px; padding: 10px;">
                            <i class="fa-solid fa-circle-exclamation"></i>
                            <p style="margin: 0; font-size: 12px;">
                                Tu saldo está en números negativos. Puedes pedir un préstamo para continuar operando.
                            </p>
                        </div>

                        <form class="formulario-credito" style="display: flex; flex-direction: column; gap: 10px; flex: 1; justify-content: center;">
                            <label style="margin: 0;">
                                Monto solicitado
                                <input type="number" placeholder="Ej. 5000" style="margin-top: 3px; padding: 8px 12px;">
                            </label>

                            <label style="margin: 0;">
                                Plazo de pago
                                <select style="margin-top: 3px; padding: 8px 12px;">
                                    <option>3 turnos</option>
                                    <option>6 turnos</option>
                                    <option>9 turnos</option>
                                </select>
                            </label>

                            <label style="margin: 0;">
                                Motivo del préstamo
                                <select style="margin-top: 3px; padding: 8px 12px;">
                                    <option>Comprar inventario</option>
                                    <option>Pagar deuda urgente</option>
                                    <option>Invertir en publicidad</option>
                                    <option>Cubrir saldo negativo</option>
                                </select>
                            </label>

                            <button type="button" class="btn-credito-principal" style="margin-top: 8px; padding: 10px;">
                                <i class="fa-solid fa-plus"></i> Crear préstamo
                            </button>
                        </form>
                    </div>

                    <div class="panel-credito" style="padding: 20px; height: 100%; box-sizing: border-box; display: flex; flex-direction: column;">
                        <h2 style="margin-bottom: 12px; margin-top: 0; flex-shrink: 0;">Préstamos activos</h2>
                        
                        <div style="flex: 1; overflow-y: auto; display: flex; flex-direction: column; gap: 10px; padding-right: 4px;">
                            <article class="prestamo-card" style="margin: 0; padding: 12px;">
                                <div class="prestamo-info">
                                    <i class="fa-solid fa-building-columns"></i>
                                    <div>
                                        <h3>Préstamo de emergencia</h3>
                                        <p>Restan $3,200 de $5,000</p>
                                        <span>Interés: 10% · Vence en 2 turnos</span>
                                    </div>
                                </div>
                                <div class="prestamo-acciones">
                                    <button type="button">Pagar parte</button>
                                    <button type="button">Pagar todo</button>
                                </div>
                            </article>

                            <article class="prestamo-card" style="margin: 0; padding: 12px;">
                                <div class="prestamo-info">
                                    <i class="fa-solid fa-boxes-stacked"></i>
                                    <div>
                                        <h3>Compra de inventario</h3>
                                        <p>Restan $4,100 de $6,000</p>
                                        <span>Interés: 14% · Vence en 4 turnos</span>
                                    </div>
                                </div>
                                <div class="prestamo-acciones">
                                    <button type="button">Pagar parte</button>
                                    <button type="button">Pagar todo</button>
                                </div>
                            </article>

                            <article class="prestamo-card" style="margin: 0; padding: 12px;">
                                <div class="prestamo-info">
                                    <i class="fa-solid fa-bullhorn"></i>
                                    <div>
                                        <h3>Campaña publicitaria</h3>
                                        <p>Restan $1,200 de $2,000</p>
                                        <span>Interés: 12% · Vence en 1 turno</span>
                                    </div>
                                </div>
                                <div class="prestamo-acciones">
                                    <button type="button">Pagar parte</button>
                                    <button type="button">Pagar todo</button>
                                </div>
                            </article>
                        </div>
                    </div>

                </section>

            </div>

            <div class="pie-pagina" style="height: 65px; flex-shrink: 0; display: flex; align-items: center;">
                <div class="contenido-pie">
                    <div class="pie-izquierdo">
                        <strong>Sobre nosotros</strong><br>
                        Correo electrónico: <span class="correo-pie">microbizsim@gmail.com</span>
                    </div>
                    <div class="pie-derecho">
                        © 2026 FutureMind México. Todos los derechos reservados.
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>