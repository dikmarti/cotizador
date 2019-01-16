package cotizador.model.domain;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name="precio")
public class Precio {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@ManyToOne
	@PrimaryKeyJoinColumn(name="id_producto", referencedColumnName="id")
	private Producto producto;
	
	@ManyToOne
	@PrimaryKeyJoinColumn(name="id_proveedor", referencedColumnName="id")
	private Proveedor proveedor;
	
	@Column
	private Double precio;
	
	@Column
	private Double precioMaximo;
	
	@Column
	private Double precioMinimoo;
	
	@Column
	private Double precioPromedio;
	
	@Column(name="fecha_inicio")
	private Date fechaInicio;
	
	@Column(name="fecha_fin")
	private Date fechaFin;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	public Proveedor getProveedor() {
		return proveedor;
	}

	public void setProveedor(Proveedor proveedor) {
		this.proveedor = proveedor;
	}

	public Double getPrecioMaximo() {
		return precioMaximo;
	}

	public void setPrecioMaximo(Double precioMaximo) {
		this.precioMaximo = precioMaximo;
	}

	public Double getPrecioMinimoo() {
		return precioMinimoo;
	}

	public void setPrecioMinimoo(Double precioMinimoo) {
		this.precioMinimoo = precioMinimoo;
	}

	public Double getPrecioPromedio() {
		return precioPromedio;
	}

	public void setPrecioPromedio(Double precioPromedio) {
		this.precioPromedio = precioPromedio;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public Date getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public Date getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}
}
