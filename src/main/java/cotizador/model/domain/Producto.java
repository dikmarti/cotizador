package cotizador.model.domain;

import javax.persistence.*;

@Entity
@Table(name="producto")
public class Producto {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column
	private String codigo;
	
	@Column
	private String nombre;
	
	@Column
	private String nombreCorto;
	
	@Column
	private String descripcion;
	
	@Column(name="porcentaje_resguardo")
	private int porcentajeResguardo;
	
	@Column
	private String observacion;
	
	@Column(name="unidad_medida")
	private int unidadMedida;
	
	@ManyToOne
	@PrimaryKeyJoinColumn(name="id_sistema", referencedColumnName="id")
	private Sistema sistema;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getNombreCorto() {
		return nombreCorto;
	}

	public void setNombreCorto(String nombreCorto) {
		this.nombreCorto = nombreCorto;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getPorcentajeResguardo() {
		return porcentajeResguardo;
	}

	public void setPorcentajeResguardo(int porcentajeResguardo) {
		this.porcentajeResguardo = porcentajeResguardo;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

	public int getUnidadMedida() {
		return unidadMedida;
	}

	public void setUnidadMedida(int unidadMedida) {
		this.unidadMedida = unidadMedida;
	}

	public Sistema getSistema() {
		return sistema;
	}

	public void setSistema(Sistema sistema) {
		this.sistema = sistema;
	}
	
}
