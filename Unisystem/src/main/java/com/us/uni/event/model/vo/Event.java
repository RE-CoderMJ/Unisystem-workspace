package com.us.uni.event.model.vo;

  
public class Event {

	 private int eventNo;
	 private int euserNo;
	 private String eventTitle;
	 private String eventContent;
	 private String startDate;
	 private String endDate;
	 private String alldayYN;
	 private String deleteYN;
	
	 public Event() {}

	public Event(int eventNo, int euserNo, String eventTitle, String eventContent, String startDate, String endDate,
			String alldayYN, String deleteYN) {
		super();
		this.eventNo = eventNo;
		this.euserNo = euserNo;
		this.eventTitle = eventTitle;
		this.eventContent = eventContent;
		this.startDate = startDate;
		this.endDate = endDate;
		this.alldayYN = alldayYN;
		this.deleteYN = deleteYN;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public int getEuserNo() {
		return euserNo;
	}

	public void setEuserNo(int euserNo) {
		this.euserNo = euserNo;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getAlldayYN() {
		return alldayYN;
	}

	public void setAlldayYN(String alldayYN) {
		this.alldayYN = alldayYN;
	}

	public String getDeleteYN() {
		return deleteYN;
	}

	public void setDeleteYN(String deleteYN) {
		this.deleteYN = deleteYN;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Event [eventNo=");
		builder.append(eventNo);
		builder.append(", euserNo=");
		builder.append(euserNo);
		builder.append(", eventTitle=");
		builder.append(eventTitle);
		builder.append(", eventContent=");
		builder.append(eventContent);
		builder.append(", startDate=");
		builder.append(startDate);
		builder.append(", endDate=");
		builder.append(endDate);
		builder.append(", alldayYN=");
		builder.append(alldayYN);
		builder.append(", deleteYN=");
		builder.append(deleteYN);
		builder.append("]");
		return builder.toString();
	}

	
	

	 
	 
}
