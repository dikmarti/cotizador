package cotizador.model.domain;

import java.io.Serializable;

import javax.persistence.*;

@NamedQueries({
	@NamedQuery(name = "Modulo.findById", query = "SELECT s FROM Modulo s WHERE s.id = :id"),
	@NamedQuery(name = "Modulo.findModules", query = "SELECT s FROM Modulo s WHERE s.tipoModulo = :tipoModulo"),
	@NamedQuery(name = "Modulo.findAll", query = "SELECT s FROM Modulo s")	
})

@Entity
@Table(name="modulo")
public class Modulo implements Serializable{

	private static final long serialVersionUID = 5044378297377997916L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	// Tipo de modulo admin(0) o de negocio(1)
	@Column(name="tipo_modulo")
	private int tipoModulo;
	
	@Column
	private String nombre;
	
	@Column
	private String descripcion;
	
	@Column
	private int orden;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTipoModulo() {
		return tipoModulo;
	}

	public void setTipoModulo(int tipoModulo) {
		this.tipoModulo = tipoModulo;
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

	public int getOrden() {
		return orden;
	}

	public void setOrden(int orden) {
		this.orden = orden;
	}
		
}
