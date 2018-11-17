package test.dao.shape.type;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import test.dao.shape.Shape;

@Entity
public class Circle extends Shape{

	@Column
	private int diameter;
	
	@Override
	public Integer getSurface() {
		// TODO Auto-generated method stub
		return surface;
	}

	@Override
	public Integer getBase() {
		return null;
	}

	@Override
	public Integer getHeight() {
		return null;
	}

	@Override
	public Integer getDiameter() {
		return diameter;
	}

	@Override
	public String getType() {	
		return ShapeType.CIRCLE.getValue();
	}
	
	public void setDiameter(int diameter) {
		this.diameter = diameter;
	}

	@Override
	public String toString() {
		return "Circle [diameter=" + getDiameter() + ", id=" + id + ", surface=" + surface + ", type=" + type + "]";
	}

}
