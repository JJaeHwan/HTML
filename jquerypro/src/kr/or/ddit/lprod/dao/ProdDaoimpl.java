package kr.or.ddit.lprod.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.lprod.vo.ProdVO;
/*
 	sqlMapClient객체 얻어오기 - 생성자에서 실행
 	자신의 객체를 생성해서 리턴하는 메소드
 */
public class ProdDaoimpl implements IProdDao {
	
	private SqlMapClient client;
	private static IProdDao dao;
	private ProdDaoimpl() {
		
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IProdDao getDao() {
		if(dao == null) dao = new ProdDaoimpl();
		return dao;
	}
	
	@Override
	public List<ProdVO> selectByLguList(String lprod_gu) {
		List<ProdVO> list = null;
		
		try {
			list = client.queryForList("prod.selectByLguList", lprod_gu);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public ProdVO selectByIdDetail(String prod_id) {
		ProdVO vo = null;
		
		try {
			vo = (ProdVO) client.queryForObject("prod.selectByIdDetail",prod_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

}
