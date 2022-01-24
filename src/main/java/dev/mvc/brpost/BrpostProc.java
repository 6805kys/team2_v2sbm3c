package dev.mvc.brpost;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;


 
// Autowired 기능에의해 자동 할당될 때 사용되는 이름
@Component("dev.mvc.brpost.BrpostProc")
public class BrpostProc implements BrpostProcInter {
  // DI: 객체가 필요한 곳에 객체를 자동으로 생성하여 할당
  // Autowired: DI 사용 선언
  // Spring이 자동으로 WatchbrandgrpDAOInter를 구현하여 DAO class 생성후 객체를 만들어 할당
  @Autowired 
  private BrpostDAOInter brpostDAO;
  // private WatchbrandgrpDAOInter watchbrandgrpDAO = new WatchbrandgrpDAO();
  
  public BrpostProc() {
      System.out.println("-> BrpostProc created.");
  }
  
  @Override
  public int create(BrpostVO brpostVO) {
    int cnt = brpostDAO.create(brpostVO);
    
    return cnt;
    
  }
  @Override
  public List<BrpostVO> list_post_no_asc() {
    List<BrpostVO> list = this.brpostDAO.list_post_no_asc();
    return list;
  }
  
  @Override
  public BrpostVO read(int post_no) {
    BrpostVO brpostVO = this.brpostDAO.read(post_no);
    
    return brpostVO;
  }
  
  @Override
  public int update(BrpostVO brpostVO) {
    int cnt = 0;
    cnt = this.brpostDAO.update(brpostVO);
    
    return cnt;
  }
  
  @Override
  public int delete(int post_no) {
    int cnt = 0;
    cnt = this.brpostDAO.delete(post_no);
    
    return cnt;
  }

}