package cotizador.model.domain;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@NamedQueries({
	@NamedQuery(name = "Bloque.findById", query = "SELECT n FROM Nivel n WHERE n.bloque.id = :id"),
	@NamedQuery(name = "Bloque.findByIdProject", query = "SELECT n FROM Nivel n WHERE n.proyecto.id = :id"),
	@NamedQuery(name = "Bloque.findAll", query = "SELECT n FROM Bloque n")	
})

public class Bloque {
	
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
	
}
