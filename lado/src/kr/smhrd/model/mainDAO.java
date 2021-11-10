package kr.smhrd.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class mainDAO {
	private static SqlSessionFactory sqlSessionFactory;
	
	// �ʱ�ȭ ��(Ŭ������ ����Ǹ� ������ ����Ǵ� �޼ҵ�) : DB����
		static {
			try {
				String resource = "kr/smhrd/mybatis/config.xml";
				InputStream inputStream=Resources.getResourceAsStream(resource);
				sqlSessionFactory=new SqlSessionFactoryBuilder().build(inputStream);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		public  List<itemVO> itemList(){
			SqlSession session=sqlSessionFactory.openSession();
			List<itemVO> list=session.selectList("itemList");
			session.close();
			return list;
		}
		
		public  List<itemVO> itemSearch(String item_search){
			System.out.println("���ǽ���");
			SqlSession session=sqlSessionFactory.openSession();
			List<itemVO> itemSearch_list=session.selectList("itemSearch", item_search);
			session.close();
			return itemSearch_list;
		}
		
		public itemVO itemContent_item(int item_num) {
			SqlSession session=sqlSessionFactory.openSession();
			itemVO vo= session.selectOne("itemContent_item", item_num);
			session.close();  
			return vo;
		}
		
		public ingredientVO itemContent_ingre(int item_num) {
			SqlSession session=sqlSessionFactory.openSession();
			ingredientVO vo1= session.selectOne("itemContent_ingre", item_num);
			session.close();  
			return vo1;
		}
		
		
		
		public UserVO login_user(UserVO vo) {
			SqlSession session=sqlSessionFactory.openSession();
			vo=session.selectOne("login_user",vo);
			session.close();
			return vo;
		}
		
		
		public sellerVO login_seller(sellerVO vo2) {
			SqlSession session = sqlSessionFactory.openSession();
			vo2 = session.selectOne("login_seller", vo2);
			session.close();
			return vo2;
		}

		
		public UserVO id_check(UserVO vo2) {
			SqlSession session = sqlSessionFactory.openSession();
		UserVO vo3 = session.selectOne("id_check", vo2);
			session.close();
			return vo3;
		}
		
		public void sellerInsert(sellerVO vo) {
			SqlSession session=sqlSessionFactory.openSession();
			session.insert("sellerInsert", vo);
			session.commit(); //�Ϸ�(����)
			session.close();  //�ݳ�(Ŀ�ؼ��� �ݳ��ؼ� ��Ȱ���ϱ� ����)
		}
		
		
		public void userInsert(UserVO vo) {
			SqlSession session=sqlSessionFactory.openSession();
			session.insert("userInsert", vo);
			session.commit(); //�Ϸ�(����)
			session.close();  //�ݳ�(Ŀ�ؼ��� �ݳ��ؼ� ��Ȱ���ϱ� ����)
		}
		
	
		public sellerVO sellerid_check(sellerVO vo) {
			SqlSession session = sqlSessionFactory.openSession();
		sellerVO vo1 = session.selectOne("sellerid_check", vo);
			session.close();
			return vo1;
		}
		
		
		
}
