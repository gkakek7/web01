package kr.or.ddit.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;

/**
 * Factory Object[Method] Pattern
 *  : 객체의 생성을 전담하는 객체를 별도로 운영하는 구조.
 *
 */
public class ConnectionFactory {
	private static String url;
	private static String user;
	private static String password;
	private static DataSource dataSource;
	static {
		ResourceBundle dbInfo=ResourceBundle.getBundle("kr.or.ddit.db.dbInfo");
		url=dbInfo.getString("url");
		user=dbInfo.getString("user");
		password=dbInfo.getString("password");
		
		BasicDataSource bds = new BasicDataSource();
		dataSource = bds;
		bds.setDriverClassName(dbInfo.getString("dirverClassName"));
		bds.setUrl(url);
		bds.setUsername(user);
		bds.setPassword(password);
		bds.setInitialSize(Integer.parseInt(dbInfo.getString("initialSize")));	//풀 갯수 설정
		bds.setMaxWaitMillis(Long.parseLong(dbInfo.getString("maxWait")));	//더이상 풀에 없으면 2초 기다림
		bds.setMaxTotal(Integer.parseInt(dbInfo.getString("maxTotal")));  //풀에 있는 CONNECTION이 없을때 MAX값을 확인후 여유가 있다면 추가 생성
		bds.setMaxIdle(Integer.parseInt(dbInfo.getString("maxIdle")));  //쉬고 있을 수 있는 total connection
//		try {
//			Class.forName(dbInfo.getString("dirverClassName"));//드라이버 스택 영역에 로딩
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException(e);
//		}
	}
	public static Connection getConnection() throws SQLException {
//		Connection conn=DriverManager.getConnection(url, user, password); //3-Way-HandShake
		Connection conn=dataSource.getConnection();
		return conn;
	}
}
