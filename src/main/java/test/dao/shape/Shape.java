package test.dao.shape;

import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;

@SqlResultSetMapping(
		  name="ShapeById",
		  columns={@ColumnResult(name="id"),
				   @ColumnResult(name="surface"),
				   @ColumnResult(name="type"),
				   @ColumnResult(name="base"),
				   @ColumnResult(name="height"),
				   @ColumnResult(name="diameter")	
		  		  }
)

@NamedNativeQuery(
		  name = "Shapes",
		  query = "SELECT * FROM shape WHERE id = ?",
		  resultSetMapping = "ShapeById"
)

@NamedQueries({
	@NamedQuery(name = "Shape.findById", query = "SELECT s FROM Shape s WHERE s.id = :id"),
	@NamedQuery(name = "Shape.findAll", query = "SELECT s FROM Shape s")
})

@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@Table(name="shape")
public class Shape implements IShapeData{

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int id;
	
	@Column
	public int surface;
	
	@Column
	public String type;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getSurface() {
		return surface;
	}

	public void setSurface(int surface) {
		this.surface = surface;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public Integer getBase() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer getHeight() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer getDiameter() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String toString() {
		return "Shape [id=" + id + ", surface=" + surface + ", type=" + type + "]";
	}	
}
