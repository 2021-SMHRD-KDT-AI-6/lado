package kr.smhrd.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class CartDAO {
private static SqlSessionFactory sqlSessionFactory;
	
	// �ʱ�ȭ ����(Ŭ������ ����Ǹ� ������ ����Ǵ� �޼ҵ�) : DB����
		static {
			try {
				String resource = "kr/smhrd/mybatis/config.xml";
				InputStream inputStream=Resources.getResourceAsStream(resource);
				sqlSessionFactory=new SqlSessionFactoryBuilder().build(inputStream);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		public void cartInsert(cartVO vo) {
			SqlSession session=sqlSessionFactory.openSession();
			System.out.println("dao�� �Ѿ����");
			session.insert("cartInsert", vo);
			session.commit(); //�Ϸ�(����)
			session.close();  //�ݳ�(Ŀ�ؼ��� �ݳ��ؼ� ��Ȱ���ϱ� ����)
		}
		
		public  List<cartViewVO> cartView(int user_num){
			SqlSession session=sqlSessionFactory.openSession();
			List<cartViewVO> list=session.selectList("cartView", user_num);
			session.close();
			return list;
		}
}