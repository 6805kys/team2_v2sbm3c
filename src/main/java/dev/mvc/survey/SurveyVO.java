package dev.mvc.survey;

public class SurveyVO {
    private int ratingno;
    private int memberno;
    private int breadno;
    private int rating;
    
    public SurveyVO() {
        
    }

    public SurveyVO(int ratingno, int memberno, int breadno, int rating) {
        this.ratingno = ratingno;
        this.memberno = memberno;
        this.breadno = breadno;
        this.rating = rating;
    }

    public int getRatingno() {
        return ratingno;
    }

    public void setRatingno(int ratingno) {
        this.ratingno = ratingno;
    }
    
    public int getMemberno() {
        return memberno;
    }

    public void setMemberno(int memberno) {
        this.memberno = memberno;
    }
    
    public int getBreadno() {
        return breadno;
    }
    
    public void setBreadno(int breadno) {
        this.breadno = breadno;
    }
    
    public int getRating() {
        return rating;
    }
    
    public void setRating(int rating) {
        this.rating = rating;
    }
}


