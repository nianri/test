package com.yh.service.impl;

import java.util.List;
import javax.annotation.Resource;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import com.yh.dao.DicExpressMapper;
import com.yh.model.DicExpress;
import com.yh.service.DicExpressService;

@Service("dicExpressService")
public class DicExpressServiceImpl  implements DicExpressService {

	@Resource
	private DicExpressMapper dicExpressMapper;
	
		@Override
		public List<DicExpress> getDicExpressList(DicExpress dicExpress) {
				return dicExpressMapper.getDicExpressList(dicExpress);
		}
		
}
