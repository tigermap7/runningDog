package com.kh.runningdog.contents.model.vo;

public class Issue {
	String order;
	String partnerName;
	String partnerImg;
	String title;
	String date;
	int readcount;
	String thumbnail;
	String link;
	String content;
	int page;

	public Issue() {
		
	}

	public Issue(String order, String partnerName, String partnerImg, String title, String date, int readcount,
			String thumbnail, String link, String content, int page) {
		super();
		this.order = order;
		this.partnerName = partnerName;
		this.partnerImg = partnerImg;
		this.title = title;
		this.date = date;
		this.readcount = readcount;
		this.thumbnail = thumbnail;
		this.link = link;
		this.content = content;
		this.page = page;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getPartnerName() {
		return partnerName;
	}

	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}

	public String getPartnerImg() {
		return partnerImg;
	}

	public void setPartnerImg(String partnerImg) {
		this.partnerImg = partnerImg;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	@Override
	public String toString() {
		return "Issue [order=" + order + ", partnerName=" + partnerName + ", partnerImg=" + partnerImg + ", title="
				+ title + ", date=" + date + ", readcount=" + readcount + ", thumbnail=" + thumbnail + ", link=" + link
				+ ", content=" + content + ", page=" + page + "]";
	}


}


