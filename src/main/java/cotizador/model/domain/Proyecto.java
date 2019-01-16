package cotizador.model.domain;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name="proyecto")
public class Proyecto {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column
	private int idCrmMCO;
	
	@Column
	private String ruc;
	
	@Column
	private String descripcion;
	
	@ManyToOne
	@PrimaryKeyJoinColumn(name="id_cliente", referencedColumnName="id")
	private Cliente cliente;
	
	@Column(name="unidad_ejecutora")
	private String unidadEjecutora;
	
	@Column(name="monto_inversion")
	private Double montoInversion;
	
	@Column(name="monto_partida")
	private Double montoPartida;
	
	@Column
	private String nivel;
		
	@Column(name="area_construccion")
	private float areaConstruccion;
	
	@Column
	private boolean soporte;
	
	@Column(name="garantia_cableado")
	private boolean garantiaCableado;
	
	@Column(name="garantia_equipos")
	private boolean garantiaEquipos;
	
	@Column
	private String localidad;
	
	@Column(name="fecha_creacion")
	private Date fechaCreacion;
	
	@Column(name="fecha_modificacion")
	private Date fechaModificacion;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdCrmMCO() {
		return idCrmMCO;
	}

	public void setIdCrmMCO(int idCrmMCO) {
		this.idCrmMCO = idCrmMCO;
	}

	public String getRuc() {
		return ruc;
	}

	public void setRuc(String ruc) {
		this.ruc = ruc;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public String getUnidadEjecutora() {
		return unidadEjecutora;
	}

	public void setUnidadEjecutora(String unidadEjecutora) {
		this.unidadEjecutora = unidadEjecutora;
	}

	public Double getMontoInversion() {
		return montoInversion;
	}

	public void setMontoInversion(Double montoInversion) {
		this.montoInversion = montoInversion;
	}

	public Double getMontoPartida() {
		return montoPartida;
	}

	public void setMontoPartida(Double montoPartida) {
		this.montoPartida = montoPartida;
	}

	public String getNivel() {
		return nivel;
	}

	public void setNivel(String nivel) {
		this.nivel = nivel;
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

	public boolean isGarantiaCableado() {
		return garantiaCableado;
	}

	public void setGarantiaCableado(boolean garantiaCableado) {
		this.garantiaCableado = garantiaCableado;
	}

	public boolean isGarantiaEquipos() {
		return garantiaEquipos;
	}

	public void setGarantiaEquipos(boolean garantiaEquipos) {
		this.garantiaEquipos = garantiaEquipos;
	}

	public String getLocalidad() {
		return localidad;
	}

	public void setLocalidad(String localidad) {
		this.localidad = localidad;
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
	
}
