package fr.epsi.model;

import fr.epsi.entity.Idea;

public class BuzzIdeaModel implements Comparable<BuzzIdeaModel>{
	private Idea idea;
	private Long vote;
	
	
	public BuzzIdeaModel(Idea idea, Long vote) {
		this.setIdea(idea);
		this.setVote(vote);
	}
	
	public Idea getIdea() {
		return idea;
	}
	public void setIdea(Idea idea) {
		this.idea = idea;
	}
	public Long getVote() {
		return vote;
	}
	public void setVote(Long vote) {
		this.vote = vote;
	}

	public int compareTo(BuzzIdeaModel bIM) {
		
		return this.getVote().compareTo(bIM.getVote());
	}
	
}
