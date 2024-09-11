package solutionwiki.model;

public class SolutionBean {
	private int solutionId;
	private String userName;
    private String content;
    private int likes;

    // Getter and setter methods
	public int getSolutionId() { return solutionId; }
	public void setSolutionId(int solutionId) { this.solutionId = solutionId; }
    public String getUserName() { return userName; }
    public void setUserName(String userId) { this.userName = userId; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public int getLikes() { return likes; }
    public void setLikes(int likes) { this.likes = likes; }
}
