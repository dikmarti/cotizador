package cotizador.model.domain;

import javax.persistence.*;

@NamedQueries({
	@NamedQuery(name = "Producto.findById", query = "SELECT s FROM Producto s WHERE s.id = :id"),
	@NamedQuery(name = "Producto.findBySystem", query = "SELECT s FROM Producto s WHERE s.sistema.id = :sistema"),
	@NamedQuery(name = "Producto.findAll", query = "SELECT s FROM Producto s")	
})
@Entity
@Table(name="producto")
public class Producto {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column
	private int idProductoMCO;
	
	@Column(name="num_parte_fabricante")
	private int numParteFabricante;
			
	@Column
	private String nombre;
	
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

	public int getIdProductoMCO() {
		return idProductoMCO;
	}

	public void setIdProductoMCO(int idProductoMCO) {
		this.idProductoMCO = idProductoMCO;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
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
		
	public int getNumParteFabricante() {
		return numParteFabricante;
	}

	public void setNumParteFabricante(int numParteFabricante) {
		this.numParteFabricante = numParteFabricante;
	}

	@Override
	public String toString() {
		return "Producto [id=" + id + ", idProductoMCO=" + idProductoMCO 
				+ ", nombre=" + nombre + ", descripcion="
				+ descripcion + ", porcentajeResguardo=" + porcentajeResguardo + ", observacion=" + observacion
				+ ", unidadMedida=" + unidadMedida + ", sistema=" + sistema + "]";
	}
	
}
