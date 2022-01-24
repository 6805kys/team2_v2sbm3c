package dev.mvc.tag;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.tag.TagProc")
public class TagProc implements TagProcInter{
  
  @Autowired
  private TagDAOInter tagDAO;
  
  public TagProc() {
    System.out.println("--> TagProc created.");
  }

  @Override
  public List<TagVO> list_by_bakeryno(int bakeryno) {
    List<TagVO> list = this.tagDAO.list_by_bakeryno(bakeryno);
    return list;
  }


  
  

}
