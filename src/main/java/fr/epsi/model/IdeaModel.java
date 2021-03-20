package fr.epsi.model;

import fr.epsi.entity.Idea;

public class IdeaModel implements Comparable<IdeaModel>{
	private Idea idea;
	private Double percent;
	private Long voteTotal;
	
	
	public IdeaModel(Idea idea, Double percent, Long voteTotal){
		this.idea = idea;
		this.percent = percent;
		this.voteTotal = voteTotal;
	}
	
	public Idea getIdea() {
		return idea;
	}
	public void setIdea(Idea idea) {
		this.idea = idea;
	}
	public Double getPercent() {
		return percent;
	}
	public void setPercent(Double percent) {
		this.percent = percent;
	}

	public Long getVoteTotal() {
		return voteTotal;
	}

	public void setVoteTotal(Long voteTotal) {
		this.voteTotal = voteTotal;
	}


    public int compareTo(IdeaModel im) {
		//on compare d'adord les pourcentage
        int i = this.getPercent().compareTo(im.getPercent());
        
        //si les pourcentages sont égaux 
        if (i == 0) {
        	//on compare nombre de vote total
            i = this.getVoteTotal().compareTo(im.getVoteTotal());
            
             //si les vote sont égaux 
            if (i == 0) {
            	
            	//on compare les dates
                i = this.getIdea().getSubscribe().compareTo(im.getIdea().getSubscribe());
            }
        }
        return i;
    }

}
