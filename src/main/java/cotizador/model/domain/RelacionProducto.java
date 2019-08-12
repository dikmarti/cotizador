package cotizador.model.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@NamedQueries({
	@NamedQuery(name = "RelacionProducto.findByProduct", query = "SELECT p FROM RelacionProducto p WHERE p.productoRelacion.id = :id"),
	@NamedQuery(name = "RelacionProducto.findById", query = "SELECT p FROM RelacionProducto p WHERE p.id = :id"),
	@NamedQuery(name = "RelacionProducto.findByProducts", query = "SELECT p FROM RelacionProducto p WHERE p.producto.id = :idProduct AND p.productoRelacion.id = :idProductRelation")	
})

@Entity
@Table(name="relacion_producto")
public class RelacionProducto {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@ManyToOne
	@PrimaryKeyJoinColumn(name="sistema_id", referencedColumnName="id")
	private Sistema sistema;
	
	@ManyToOne
	@PrimaryKeyJoinColumn(name="producto_id", referencedColumnName="id")
	private Producto producto;
	
	@ManyToOne
	@PrimaryKeyJoinColumn(name="producto_relacion_id", referencedColumnName="id")
	private Producto productoRelacion;
	
	@Column(name="factor")
	private String factor;
	
	@Column(name="operacion")
	private int operacion;
	// 0 div, 1 mult
	
	@Column
	private Double cantidadRelacion;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Sistema getSistema() {
		return sistema;
	}

	public void setSistema(Sistema sistema) {
		this.sistema = sistema;
	}

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	public Producto getProductoRelacion() {
		return productoRelacion;
	}

	public void setProductoRelacion(Producto productoRelacion) {
		this.productoRelacion = productoRelacion;
	}

	public String getFactor() {
		return factor;
	}

	public void setFactor(String factor) {
		this.factor = factor;
	}

	public int getOperacion() {
		return operacion;
	}

	public void setOperacion(int operacion) {
		this.operacion = operacion;
	}

	public Double getCantidadRelacion() {
		return cantidadRelacion;
	}

	public void setCantidadRelacion(Double cantidadRelacion) {
		this.cantidadRelacion = cantidadRelacion;
	}

	@Override
	public String toString() {
		return "RelacionProducto [id=" + id + ", sistema=" + sistema + ", producto=" + producto + ", productoRelacion="
				+ productoRelacion + ", factor=" + factor + ", operacion=" + operacion + "]";
	}

}
