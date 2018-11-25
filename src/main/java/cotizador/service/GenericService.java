package cotizador.service;

import java.util.List;

import javax.inject.Inject;

import cotizador.model.repository.GenericRepository;

public class GenericService {

	@Inject
	GenericRepository genericRepository;
	
	public List<Object> getAllObject(String query, String parameter, Object parameterValue){
		return genericRepository.getAllObject(query, parameter, parameterValue);
	}
	
	
}
