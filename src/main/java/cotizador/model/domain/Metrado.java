package cotizador.model.domain;

import javax.persistence.*;

@NamedQueries({
	@NamedQuery(name = "Metrado.findById", query = "SELECT m FROM Metrado m WHERE m.id = :id"),
	@NamedQuery(name = "Metrado.findByNivel", query = "SELECT m FROM Metrado m WHERE m.nivel.id = :idNivel order by m.precio.producto.sistema asc")	
})

@Entity
@Table(name="metrado")
public class Metrado {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@ManyToOne
	@PrimaryKeyJoinColumn(name="id_nivel", referencedColumnName="id")
	private Nivel nivel;
	
	@ManyToOne
	@PrimaryKeyJoinColumn(name="id_precio", referencedColumnName="id")
	private Precio precio;
	
	@Column(name="cantidad_producto")
	private Integer cantidadProducto;
	
	@Column(name="precio_producto")
	private Double precioProducto;
	
	@Column(name="monto_total")
	private Double montoTotal;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Nivel getNivel() {
		return nivel;
	}

	public void setNivel(Nivel nivel) {
		this.nivel = nivel;
	}

	public Precio getPrecio() {
		return precio;
	}

	public void setPrecio(Precio precio) {
		this.precio = precio;
	}

	public Integer getCantidadProducto() {
		return cantidadProducto;
	}

	public void setCantidadProducto(Integer cantidadProducto) {
		this.cantidadProducto = cantidadProducto;
	}

	public Double getMontoTotal() {
		return montoTotal;
	}

	public void setMontoTotal(Double montoTotal) {
		this.montoTotal = montoTotal;
	}

	public Double getPrecioProducto() {
		return precioProducto;
	}

	public void setPrecioProducto(Double precioProducto) {
		this.precioProducto = precioProducto;
	}	
}
