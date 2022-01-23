/**********************************/
/* Table Name: 빵 추천 커뮤니티 게시판 */
/**********************************/
CREATE TABLE brpost(
		post_no INT NOT NULL PRIMARY KEY,
		post_name VARCHAR(100) NOT NULL,
		post_id VARCHAR(100) NOT NULL,
		post_crtime DATE DEFAULT sysdate,
		post_mdtime DATE DEFAULT sysdate
);

/**********************************/
/* Table Name: 빵 추천 커뮤니티 게시글 */
/**********************************/
CREATE TABLE brcontent(
		content_no INT NOT NULL PRIMARY KEY,
		content_name VARCHAR(100) NOT NULL,
		content_id VARCHAR(100),
		content_crtime DATE DEFAULT sysdate,
		view INTEGER NOT NULL,
		content_mdtime DATE DEFAULT sysdate,
		notice VARCHAR(10) NOT NULL,
		content VARCHAR(1000),
		post_no INT,
  FOREIGN KEY (post_no) REFERENCES brpost (post_no)
);

/**********************************/
/* Table Name: 댓글 */
/**********************************/
CREATE TABLE brcomment(
		comment_no INT NOT NULL PRIMARY KEY,
		comment_content VARCHAR(1000),
		comment_crid VARCHAR(100) NOT NULL,
		comment_crtime DATE DEFAULT sysdate,
		comment_mdtime DATE DEFAULT sysdate,
		content_no INT,
  FOREIGN KEY (content_no) REFERENCES brcontent (content_no)
);

/**********************************/
/* Table Name: 첨부파일 */
/**********************************/
CREATE TABLE brfile(
		file_no INT NOT NULL PRIMARY KEY,
		file_name VARCHAR(100),
		routename VARCHAR(100),
		volume VARCHAR(100),
		content_no INT,
  FOREIGN KEY (content_no) REFERENCES brcontent (content_no)
);

