package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Address;
import gd.fintech.lms.vo.Connect;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.ManagerForm;

@Mapper
public interface ManagerLoginMapper {
	String selectAccountToManagerLogin(Account account);
	
	// 회원가입 할 때 추가해야하는 테이블 2개
	int insertAccountToSignup(ManagerForm managerForm);
	int insertManagerQueueToSignup(ManagerForm managerForm);
	
	// 회원가입 중복검사
	int selectAccountToSignupByOverlapId(String accountId);
	int selectManagerToSignupByOverLapEmail(String managerEmail);
	
	// 회원가입 주소검색
	//List<Address> selectAddressToSearch(String doro, int currentPage, int limitPage);
	List<Address> selectAddressToSearch(String doro);
	int selectAddressToSearchCount(String doro);
	
	// 로그인 시 이미지 가져오기
	String selectManagerImage(String teacherId);
	
	// 중복 로그인 방지
	int selectConnectByOverlapLogin(Connect connect);
	
	// 아이디 패스워드 찾기
	int updateAccountToPw(String accountId, String accountPw);
	Manager selectManagerToNameAndEmail(Manager manager);
	int selectManagerToNameAndEmailByCheck(Manager manager);
	
	// 휴면상태일 경우 휴면해제 인증 폼으로 이동하기 위한 조건
	String selectAccountStateCk(String accountId);
	
	// 인증메일을 보낼 운영자 메일 가져오기
	String selectManagerEmail(String managerId);
	
	// 휴면계정 인증 성공시 업데이드
	int updateChangeActivity(String managerId);
}
