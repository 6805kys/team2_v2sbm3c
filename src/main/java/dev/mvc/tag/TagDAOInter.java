package dev.mvc.tag;
import java.util.List;



public interface TagDAOInter {
  /**
   * 조회, 수정폼
   * @param cateno 카테고리 번호, PK
   * @return
   */
  public List<TagVO> list_by_bakeryno(int bakeryno);  
}
