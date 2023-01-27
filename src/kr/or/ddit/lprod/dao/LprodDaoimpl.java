package kr.or.ddit.lprod.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.lprod.vo.LprodVO;
/*
 
 	데이터 접근객체
 	sqlMapClient 객체가 필요 - 생성자에서 객체를 얻어온다.
 	자신의 객체를 생성하여 리턴하는 메소드
 	
 */
public class LprodDaoimpl implements ILprodDao {
	
	private SqlMapClient client;
	private static ILprodDao dao;
	
	private LprodDaoimpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static ILprodDao getDao() {
		if(dao == null) dao = new LprodDaoimpl();
		return dao;
	}
	
	@Override
	public List<LprodVO> selectLprod() {
		List<LprodVO> list = null;
		
		try {
			list = client.queryForList("lprod.selectLprod");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
