package kr.or.marketsally.util;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlMapClientFactory {
	private static SqlMapClient smc;
	
	static {
		try {
			//1. iBatis의 환경설정파일(sqlMapConfig.xml)을 읽어와 실행한다.
			//1-1. 문자 인코딩 케릭터셋 설정
			Charset charset = Charset.forName("UTF-8");
			Resources.setCharset(charset);
			//1-2. 환경 설정 파일을 읽어온다.
			Reader rd = Resources.getResourceAsReader("kr/or/marketsally/config/sqlMapConfig.xml");
			//1-3. 위에서 읽어온 Reader객체를 이용하여 실제 환경 설정을 완성한 후
			// 		작성된 SQL문을 호출해서 처리할 객체를 생성한다.
			smc = SqlMapClientBuilder.buildSqlMapClient(rd);

			rd.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static SqlMapClient getSqlMapClient() {
		return smc;
	}
}
