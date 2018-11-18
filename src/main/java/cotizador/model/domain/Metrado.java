package cotizador.model.domain;

import javax.persistence.*;

@Entity
public class Metrado {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private String id;
	
	@ManyToOne
	@PrimaryKeyJoinColumn(name="id_nivel", referencedColumnName="id")
	private Nivel nivel;
	
	@ManyToOne
	@PrimaryKeyJoinColumn(name="id_precio", referencedColumnName="id")
	private Precio precio;
	
	@Column(name="cantidad_producto")
	private Double cantidadProducto;
	
	@Column(name="monto_total")
	private Double montoTotal;

	public String getId() {
		return id;
	}

	public void setId(String id) {
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

	public Double getCantidadProducto() {
		return cantidadProducto;
	}

	public void setCantidadProducto(Double cantidadProducto) {
		this.cantidadProducto = cantidadProducto;
	}

	public Double getMontoTotal() {
		return montoTotal;
	}

	public void setMontoTotal(Double montoTotal) {
		this.montoTotal = montoTotal;
	}	
}
