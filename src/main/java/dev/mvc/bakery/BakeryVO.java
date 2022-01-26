package dev.mvc.bakery;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 * CREATE TABLE bakery(
bakeryno                       NUMBER(10)  NOT NULL  PRIMARY KEY,
bakery                         VARCHAR2(100)  NOT NULL,
telephone                      NUMBER(13)  NULL ,
address                        VARCHAR2(100)  NULL ,
station                        VARCHAR2(30)  NULL ,
tag                            VARCHAR2(100)  NULL ,
rating                         DOUBLE PRECISION  NULL ,
signature                      VARCHAR2(90)  NULL ,
breadgrpno                     NUMBER(30)  NULL ,
 */

@Getter @Setter @ToString
public class BakeryVO {
  /** 빵집 번호 */
  private int bakeryno;
  /** 빵집 이름 */
  private String bakery = "";
  /** 빵집 전화번호 */
  private String telephone;
  /** 빵집 주소 */
  private String address;
  /** 빵집 역 */
  private String station;
  /** 빵집 평점 */
  private double rating;
  /** 빵집 시그니쳐 메뉴 */
  private String signature;
  /** 빵 그룹 번호 */
  private int breadgrpno;
}
