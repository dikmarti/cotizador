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
	private String idProductoMCB;
			
	@Column
	private String nombre;
	
	@Column(name="porcentaje_resguardo")
	private double porcentajeResguardo;
	
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

	public String getIdProductoMCB() {
		return idProductoMCB;
	}

	public void setIdProductoMCB(String idProductoMCB) {
		this.idProductoMCB = idProductoMCB;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public double getPorcentajeResguardo() {
		return porcentajeResguardo;
	}

	public void setPorcentajeResguardo(double porcentajeResguardo) {
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
	
	@Override
	public String toString() {
		return "Producto [id=" + id + ", idProductoMCB=" + idProductoMCB 
				+ ", nombre=" + nombre + ", porcentajeResguardo=" + porcentajeResguardo
				+ ", observacion=" + observacion + ", unidadMedida=" + unidadMedida + ", sistema=" + sistema
				+ "]";
	}

}
