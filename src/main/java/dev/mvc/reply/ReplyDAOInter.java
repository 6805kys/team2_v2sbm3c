package dev.mvc.reply;

import java.util.List;
import java.util.Map;

public interface ReplyDAOInter {
  public int create(ReplyVO replyVO);
  
  public List<ReplyVO> list();
  
  public List<ReplyVO> list_by_content_no(int content_no);
  
  public List<ReplyMemberVO> list_member_join();
  
  public List<ReplyMemberVO> list_by_content_no_join(int content_no);
  
  public int checkPasswd(Map<String, Object> map);

  public int delete(int replyno);
  


}

