package cotizador.model.domain;

import java.util.Date;

import javax.persistence.*;

@NamedQueries({
	@NamedQuery(name = "Precio.findById", query = "SELECT s FROM Precio s WHERE s.id = :id"),
	@NamedQuery(name = "Precio.findAll", query = "SELECT s FROM Precio s"),
	@NamedQuery(name = "Precio.findByProduct", query = "SELECT s FROM Precio s WHERE s.producto.id = :id AND s.fechaFin IS NULL")	
})

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
	private Double precioMaximo;
	
	@Column
	private Double precio1;
	
	@Column
	private Double precio2;
	
	@Column
	private Double precio3;
	
	@Column
	private Double precio4;
	
	@Column
	private Double precio5;
	
	@Column
	private Double precio6;
	
	@Column
	private Double precio7;
	
	@Column
	private Double precio8;
	
	@Column
	private Double precio9;
	
	@Column
	private Double precio10;
	
	@Column
	private Double precioMinimo;
	
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

	public Double getPrecioMinimo() {
		return precioMinimo;
	}

	public void setPrecioMinimoo(Double precioMinimo) {
		this.precioMinimo = precioMinimo;
	}

	public Double getPrecioPromedio() {
		return precioPromedio;
	}

	public void setPrecioPromedio(Double precioPromedio) {
		this.precioPromedio = precioPromedio;
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

	public Double getPrecio1() {
		return precio1;
	}

	public void setPrecio1(Double precio1) {
		this.precio1 = precio1;
	}

	public Double getPrecio2() {
		return precio2;
	}

	public void setPrecio2(Double precio2) {
		this.precio2 = precio2;
	}

	public Double getPrecio3() {
		return precio3;
	}

	public void setPrecio3(Double precio3) {
		this.precio3 = precio3;
	}

	public Double getPrecio4() {
		return precio4;
	}

	public void setPrecio4(Double precio4) {
		this.precio4 = precio4;
	}

	public Double getPrecio5() {
		return precio5;
	}

	public void setPrecio5(Double precio5) {
		this.precio5 = precio5;
	}

	public Double getPrecio6() {
		return precio6;
	}

	public void setPrecio6(Double precio6) {
		this.precio6 = precio6;
	}

	public Double getPrecio7() {
		return precio7;
	}

	public void setPrecio7(Double precio7) {
		this.precio7 = precio7;
	}

	public Double getPrecio8() {
		return precio8;
	}

	public void setPrecio8(Double precio8) {
		this.precio8 = precio8;
	}

	public Double getPrecio9() {
		return precio9;
	}

	public void setPrecio9(Double precio9) {
		this.precio9 = precio9;
	}

	public Double getPrecio10() {
		return precio10;
	}

	public void setPrecio10(Double precio10) {
		this.precio10 = precio10;
	}
		
}
