package dev.mvc.tag;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 * CREATE TABLE tag(
    tagno NUMERIC(10) NOT NULL PRIMARY KEY,
    tag VARCHAR2(30) NOT NULL,
    bakeryno NUMERIC(10),
 */

@Getter @Setter @ToString
public class TagVO {
  /** 빵집 번호 */
  private int bakeryno;
  /** 태그 번호 */
  private int tagno;
  /** 빵집 내용 */
  private String tag;
}
