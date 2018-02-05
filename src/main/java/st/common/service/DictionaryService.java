package st.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import st.common.mapper.DictionaryMapper;
import st.core.mapper.BaseMapper;
import st.core.service.BaseService;

@Service("dictionaryService")
public class DictionaryService<T> extends BaseService<T> {

	@Autowired
	private DictionaryMapper<T> dictionaryMapper;
	
	@Override
	public BaseMapper<T> getMapper() {
		// TODO Auto-generated method stub
		return dictionaryMapper;
	}

}
