package cotizador.model.domain;

import javax.persistence.*;

@NamedQueries({
	@NamedQuery(name = "Proveedor.findById", query = "SELECT s FROM Proveedor s WHERE s.id = :id"),
	@NamedQuery(name = "Proveedor.findByName", query = "SELECT s FROM Proveedor s WHERE s.nombre = :nombre"),
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
	private String ruc;
	
	@Column
	private String codigo;
	
	@Column
	private String nombre;
	
	@Column
	private String  direccion;
	
	@Column(name = "nombre_contacto1")
	private String nombreContacto1;
	
	@Column(name = "correo_contacto1")
	private String correoContacto1;
	
	@Column(name = "telefono_contacto1")
	private String telefonoContacto1;
	
	@Column(name = "nombre_contacto2")
	private String nombreContacto2;
	
	@Column(name = "correo_contacto2")
	private String correoContacto2;
	
	@Column(name = "telefono_contacto2")
	private String telefonoContacto2;
	
	@Column(name = "nombre_contacto3")
	private String nombreContacto3;
	
	@Column(name = "correo_contacto3")
	private String correoContacto3;
	
	@Column(name = "telefono_contacto3")
	private String telefonoContacto3;

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

	public String getRuc() {
		return ruc;
	}

	public void setRuc(String ruc) {
		this.ruc = ruc;
	}

	public String getNombreContacto1() {
		return nombreContacto1;
	}

	public void setNombreContacto1(String nombreContacto1) {
		this.nombreContacto1 = nombreContacto1;
	}

	public String getCorreoContacto1() {
		return correoContacto1;
	}

	public void setCorreoContacto1(String correoContacto1) {
		this.correoContacto1 = correoContacto1;
	}

	public String getTelefonoContacto1() {
		return telefonoContacto1;
	}

	public void setTelefonoContacto1(String telefonoContacto1) {
		this.telefonoContacto1 = telefonoContacto1;
	}

	public String getNombreContacto2() {
		return nombreContacto2;
	}

	public void setNombreContacto2(String nombreContacto2) {
		this.nombreContacto2 = nombreContacto2;
	}

	public String getCorreoContacto2() {
		return correoContacto2;
	}

	public void setCorreoContacto2(String correoContacto2) {
		this.correoContacto2 = correoContacto2;
	}

	public String getTelefonoContacto2() {
		return telefonoContacto2;
	}

	public void setTelefonoContacto2(String telefonoContacto2) {
		this.telefonoContacto2 = telefonoContacto2;
	}

	public String getNombreContacto3() {
		return nombreContacto3;
	}

	public void setNombreContacto3(String nombreContacto3) {
		this.nombreContacto3 = nombreContacto3;
	}

	public String getCorreoContacto3() {
		return correoContacto3;
	}

	public void setCorreoContacto3(String correoContacto3) {
		this.correoContacto3 = correoContacto3;
	}

	public String getTelefonoContacto3() {
		return telefonoContacto3;
	}

	public void setTelefonoContacto3(String telefonoContacto3) {
		this.telefonoContacto3 = telefonoContacto3;
	}
		
}
