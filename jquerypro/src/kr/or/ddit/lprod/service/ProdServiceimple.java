package kr.or.ddit.lprod.service;

import java.util.List;

import kr.or.ddit.lprod.dao.IProdDao;
import kr.or.ddit.lprod.dao.ProdDaoimpl;
import kr.or.ddit.lprod.vo.ProdVO;
/*
 	Dao 객체가 필요하다 - Dao클래스 메소드 호출 - Dao클래스로부터 얻어온다 - 생성자에서 실행
 	자신의 객체를 만들어서 리턴 하는 메소드 
 */
public class ProdServiceimple implements IProdService {
	
	private IProdDao dao;
	private static IProdService service;
	
	private ProdServiceimple() {
		 dao = ProdDaoimpl.getDao();
	}
	
	public static IProdService getService() {
		if(service == null) service = new ProdServiceimple();
		
		return service;
	}
	
	@Override
	public List<ProdVO> selectByLguList(String lprod_gu) {
		List<ProdVO> list = null;
		list = dao.selectByLguList(lprod_gu);
		return list;
	}

	@Override
	public ProdVO selectByIdDetail(String prod_id) {
		
		return dao.selectByIdDetail(prod_id);
	}

}
