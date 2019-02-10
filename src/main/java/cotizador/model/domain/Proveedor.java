package cotizador.model.domain;

import javax.persistence.*;

@NamedQueries({
	@NamedQuery(name = "Proveedor.findById", query = "SELECT s FROM Proveedor s WHERE s.id = :id"),
	@NamedQuery(name = "Proveedor.findAll", query = "SELECT s FROM Proveedor s")	
})

@Entity
@Table(name="proveedor")
public class Proveedor {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column
	private String codigo;
	
	@Column
	private String nombre;
	
	@Column
	private String  direccion;

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

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
		
}
