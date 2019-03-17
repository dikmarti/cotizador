package cotizador.model.domain;

import javax.persistence.*;
@NamedQueries({
	@NamedQuery(name = "Sistema.findById", query = "SELECT s FROM Sistema s WHERE s.id = :id"),
	@NamedQuery(name = "Sistema.findAll", query = "SELECT s FROM Sistema s")	
})

@Entity
@Table(name="sistema")
public class Sistema {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column
	private String nombre;

	@Column
	private String descripcion;
		
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	@Override
	public String toString() {
		return "Sistema [id=" + id + ", nombre=" + nombre + ", descripcion=" + descripcion + "]";
	}
	
}
