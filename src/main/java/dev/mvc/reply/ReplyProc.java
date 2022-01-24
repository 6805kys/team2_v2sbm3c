package dev.mvc.reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.reply.ReplyProc")
public class ReplyProc implements ReplyProcInter {
  @Autowired
  private ReplyDAOInter replyDAO; 
  
  @Override
  public int create(ReplyVO replyVO) {
    int count = replyDAO.create(replyVO);
    return count;
  }

  @Override
  public List<ReplyVO> list() {
    List<ReplyVO> list = replyDAO.list();
    return list;
  }
  
  @Override
  public List<ReplyMemberVO> list_member_join() {
    List<ReplyMemberVO> list = replyDAO.list_member_join();
    
    // 특수 문자 변경
    for (ReplyMemberVO replyMemberVO:list) {
      String reply_content = replyMemberVO.getReply_content();
      reply_content = Tool.convertChar(reply_content);
      replyMemberVO.setReply_content(reply_content);
    }
    
    return list;
  }
 

  @Override
  public List<ReplyVO> list_by_content_no(int content_no) {
    List<ReplyVO> list = replyDAO.list_by_content_no(content_no);
    String reply_content = "";
    
    // 특수 문자 변경
    for (ReplyVO replyVO:list) {
        reply_content = replyVO.getReply_content();
        reply_content = Tool.convertChar(reply_content);
      replyVO.setReply_content(reply_content);
    }
    return list;
  }

  @Override
  public List<ReplyMemberVO> list_by_content_no_join(int content_no) {
    List<ReplyMemberVO> list = replyDAO.list_by_content_no_join(content_no);
    String reply_content = "";
    
    // 특수 문자 변경
    for (ReplyMemberVO replyMemberVO:list) {
        reply_content = replyMemberVO.getReply_content();
        reply_content = Tool.convertChar(reply_content);
      replyMemberVO.setReply_content(reply_content);
    }
    return list;
  }

  @Override
  public int checkPasswd(Map<String, Object> map) {
    int count = replyDAO.checkPasswd(map);
    return count;
  }

  @Override
  public int delete(int replyno) {
    int count = replyDAO.delete(replyno);
    return count;
  }
   
}


