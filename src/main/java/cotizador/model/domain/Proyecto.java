package cotizador.model.domain;

import java.util.Date;

import javax.persistence.*;

@NamedQueries({
	@NamedQuery(name = "Proyecto.findById", query = "SELECT p FROM Proyecto p WHERE p.id = :id"),
	@NamedQuery(name = "Proyecto.findAll", query = "SELECT p FROM Proyecto p")	
})

@Entity
@Table(name="proyecto")
public class Proyecto {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column
	private String idCrmMCO;
	
	@Column(name="nombre_cliente")
	private String nombreCliente;
	
	@Column
	private String ruc;
	
	@Column
	private String nombreProyecto;
	
	@Column
	private String direccion;
	
	@Column
	private String localidad;

	@Column
	private String nombreContacto;
	
	@Column
	private String cargoContacto;

	@Column
	private String correoContacto;
	
	@Column
	private String telefonoContacto;
	
	@Column(name="tipo_precio")
	private int tipoPrecio;
	
	@Column(name="fecha_creacion")
	private Date fechaCreacion;
	
	@Column(name="fecha_modificacion")
	private Date fechaModificacion;
	
	@Column(name="fecha_fin")
	private Date fechaFin;
	
	@Column
	private boolean generarMetrado;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIdCrmMCO() {
		return idCrmMCO;
	}

	public void setIdCrmMCO(String idCrmMCO) {
		this.idCrmMCO = idCrmMCO;
	}

	public String getNombreCliente() {
		return nombreCliente;
	}

	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}

	public String getRuc() {
		return ruc;
	}

	public void setRuc(String ruc) {
		this.ruc = ruc;
	}

	public String getLocalidad() {
		return localidad;
	}

	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}

	public int getTipoPrecio() {
		return tipoPrecio;
	}

	public void setTipoPrecio(int tipoPrecio) {
		this.tipoPrecio = tipoPrecio;
	}

	public Date getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public Date getFechaModificacion() {
		return fechaModificacion;
	}

	public void setFechaModificacion(Date fechaModificacion) {
		this.fechaModificacion = fechaModificacion;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getNombreContacto() {
		return nombreContacto;
	}

	public void setNombreContacto(String nombreContacto) {
		this.nombreContacto = nombreContacto;
	}

	public String getCargoContacto() {
		return cargoContacto;
	}

	public void setCargoContacto(String cargoContacto) {
		this.cargoContacto = cargoContacto;
	}

	public String getCorreoContacto() {
		return correoContacto;
	}

	public void setCorreoContacto(String correoContacto) {
		this.correoContacto = correoContacto;
	}

	public String getTelefonoContacto() {
		return telefonoContacto;
	}

	public void setTelefonoContacto(String telefonoContacto) {
		this.telefonoContacto = telefonoContacto;
	}

	public boolean isGenerarMetrado() {
		return generarMetrado;
	}

	public void setGenerarMetrado(boolean generarMetrado) {
		this.generarMetrado = generarMetrado;
	}

	public Date getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}

	public String getNombreProyecto() {
		return nombreProyecto;
	}

	public void setNombreProyecto(String nombreProyecto) {
		this.nombreProyecto = nombreProyecto;
	}

}
