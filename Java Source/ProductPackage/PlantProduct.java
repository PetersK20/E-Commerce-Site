package ProductPackage;



public class PlantProduct {
	private String plantId,plantName,plantType,color,imgLink,description,imgLink2,imgLink3;
	private double heightNow,fullHeight,price,discountPrice,rating,stock,popularity;
	public PlantProduct(String plantId, String plantName, String plantType, String color, double heightNow,
			double fullHeight,String imgLink,String imgLink2,String imgLink3,double price, double discountPrice,
			double rating, String description,double popularity,double stock) {
		this.plantId = plantId;
		this.plantName = plantName;
		this.plantType = plantType;
		this.color = color;
		this.imgLink=imgLink;
		this.imgLink2=imgLink2;
		this.imgLink3=imgLink3;
		this.heightNow = heightNow;
		this.fullHeight = fullHeight;
		this.price = price;
		this.discountPrice = discountPrice;
		this.rating = rating;
		this.description = description;
		this.popularity=popularity;
		this.stock=stock;
	}
	public String getPlantId() {
		return plantId;
	}
	public void setPlantId(String plantId) {
		this.plantId = plantId;
	}
	public String getPlantName() {
		return plantName;
	}
	public void setPlantName(String plantName) {
		this.plantName = plantName;
	}
	public String getPlantType() {
		return plantType;
	}
	public void setPlantType(String plantType) {
		this.plantType = plantType;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public double getHeightNow() {
		return heightNow;
	}
	public void setHeightNow(double heightNow) {
		this.heightNow = heightNow;
	}
	public double getFullHeight() {
		return fullHeight;
	}
	public void setFullHeight(double fullHeight) {
		this.fullHeight = fullHeight;
	}
	public String getImgLink() {
		return imgLink;
	}
	public void setImgLink(String imgLink) {
		this.imgLink = imgLink;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(double discountPrice) {
		this.discountPrice = discountPrice;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImgLink2() {
		return imgLink2;
	}
	public void setImgLink2(String imgLink2) {
		this.imgLink2 = imgLink2;
	}
	public String getImgLink3() {
		return imgLink3;
	}
	public void setImgLink3(String imgLink3) {
		this.imgLink3 = imgLink3;
	}
	public Double getStock() {
		return stock;
	}
	public void setStock(double stock) {
		this.stock = stock;
	}
	public Double getPopularity() {
		return popularity;
	}
	public void setPopularity(double popularity) {
		this.popularity = popularity;
	}
}
