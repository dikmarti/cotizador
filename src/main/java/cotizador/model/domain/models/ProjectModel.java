package cotizador.model.domain.models;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect(setterVisibility = JsonAutoDetect.Visibility.ANY,
		getterVisibility = JsonAutoDetect.Visibility.ANY, 
		isGetterVisibility = JsonAutoDetect.Visibility.ANY,
		fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class ProjectModel {
	
	private int id;
	private String idCrmMCO;
	private String nombreCliente;
	private String ruc;
	private String nombre;
	private String localidad;
	private String montoInversion;
	private String montoPresupuesto;
	private String nivelConstruccion;
	private String areaConstruccion;
	private String soporte;
	private String garantia;
	private String tipoProyecto;
	private String categoriaConstruccion;
	private String porcentajeHolgura;
	private String tipoPrecio;
	private String fechaCreacion;
	private String fechaModificacion;
	
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
	public String getMontoInversion() {
		return montoInversion;
	}
	public void setMontoInversion(String montoInversion) {
		this.montoInversion = montoInversion;
	}
	public String getMontoPresupuesto() {
		return montoPresupuesto;
	}
	public void setMontoPresupuesto(String montoPresupuesto) {
		this.montoPresupuesto = montoPresupuesto;
	}
	public String getNivelConstruccion() {
		return nivelConstruccion;
	}
	public void setNivelConstruccion(String nivelConstruccion) {
		this.nivelConstruccion = nivelConstruccion;
	}
	public String getAreaConstruccion() {
		return areaConstruccion;
	}
	public void setAreaConstruccion(String areaConstruccion) {
		this.areaConstruccion = areaConstruccion;
	}

	public String getSoporte() {
		return soporte;
	}
	public void setSoporte(String soporte) {
		this.soporte = soporte;
	}
	public String getGarantia() {
		return garantia;
	}
	public void setGarantia(String garantia) {
		this.garantia = garantia;
	}
	public String getTipoProyecto() {
		return tipoProyecto;
	}
	public void setTipoProyecto(String tipoProyecto) {
		this.tipoProyecto = tipoProyecto;
	}
	public String getCategoriaConstruccion() {
		return categoriaConstruccion;
	}
	public void setCategoriaConstruccion(String categoriaConstruccion) {
		this.categoriaConstruccion = categoriaConstruccion;
	}
	public String getPorcentajeHolgura() {
		return porcentajeHolgura;
	}
	public void setPorcentajeHolgura(String porcentajeHolgura) {
		this.porcentajeHolgura = porcentajeHolgura;
	}
	public String getTipoPrecio() {
		return tipoPrecio;
	}
	public void setTipoPrecio(String tipoPrecio) {
		this.tipoPrecio = tipoPrecio;
	}
	public String getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(String fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public String getFechaModificacion() {
		return fechaModificacion;
	}
	public void setFechaModificacion(String fechaModificacion) {
		this.fechaModificacion = fechaModificacion;
	}
	@Override
	public String toString() {
		return "ProjectModel [id=" + id + ", idCrmMCO=" + idCrmMCO + ", nombreCliente=" + nombreCliente + ", ruc=" + ruc
				+ ", nombre=" + nombre + ", localidad=" + localidad + ", montoInversion=" + montoInversion
				+ ", montoPresupuesto=" + montoPresupuesto + ", nivelConstruccion=" + nivelConstruccion
				+ ", areaConstruccion=" + areaConstruccion + ", soporte=" + soporte + ", garantia=" + garantia
				+ ", tipoProyecto=" + tipoProyecto + ", categoriaConstruccion=" + categoriaConstruccion
				+ ", porcentajeHolgura=" + porcentajeHolgura + ", tipoPrecio=" + tipoPrecio + ", fechaCreacion="
				+ fechaCreacion + ", fechaModificacion=" + fechaModificacion + "]";
	}
}
