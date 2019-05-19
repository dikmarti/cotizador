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
	private String nombre;
	
	@Column
	private String localidad;
	
	@Column(name="monto_inversion")
	private Double montoInversion;
	
	@Column(name="monto_presupuesto")
	private Double montoPresupuesto;
	
	@Column(name="nivel_construccion")
	private String nivelConstruccion;
		
	@Column(name="area_construccion")
	private float areaConstruccion;
	
	@Column
	private boolean soporte;
	
	@Column
	private String mcoCare;
	
	@Column
	private String garantiaCableado;
	
	@Column
	private boolean garantia;
	
	@Column(name="tipo_proyecto")
	private String tipoProyecto;
	
	@Column(name="tipo_precio")
	private int tipoPrecio;
	
	@Column(name="fecha_creacion")
	private Date fechaCreacion;
	
	@Column(name="fecha_modificacion")
	private Date fechaModificacion;
	
	@Column(name="fecha_fin")
	private Date fechaFin;

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

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getLocalidad() {
		return localidad;
	}

	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}

	public Double getMontoInversion() {
		return montoInversion;
	}

	public void setMontoInversion(Double montoInversion) {
		this.montoInversion = montoInversion;
	}

	public Double getMontoPresupuesto() {
		return montoPresupuesto;
	}

	public void setMontoPresupuesto(Double montoPresupuesto) {
		this.montoPresupuesto = montoPresupuesto;
	}

	public String getNivelConstruccion() {
		return nivelConstruccion;
	}

	public void setNivelConstruccion(String nivelConstruccion) {
		this.nivelConstruccion = nivelConstruccion;
	}

	public float getAreaConstruccion() {
		return areaConstruccion;
	}

	public void setAreaConstruccion(float areaConstruccion) {
		this.areaConstruccion = areaConstruccion;
	}

	public boolean isSoporte() {
		return soporte;
	}

	public void setSoporte(boolean soporte) {
		this.soporte = soporte;
	}

	public String isMcoCare() {
		return mcoCare;
	}

	public void setMcoCare(String mcoCare) {
		this.mcoCare = mcoCare;
	}

	public String isGarantiaCableado() {
		return garantiaCableado;
	}

	public void setGarantiaCableado(String garantiaCableado) {
		this.garantiaCableado = garantiaCableado;
	}

	public boolean isGarantia() {
		return garantia;
	}

	public void setGarantia(boolean garantia) {
		this.garantia = garantia;
	}

	public String getTipoProyecto() {
		return tipoProyecto;
	}

	public void setTipoProyecto(String tipoProyecto) {
		this.tipoProyecto = tipoProyecto;
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

	public Date getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}

}
