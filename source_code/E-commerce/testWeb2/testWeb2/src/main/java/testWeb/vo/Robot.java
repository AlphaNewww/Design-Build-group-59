
package testWeb.vo;

import java.util.List;

public class Robot
{

    public Robot()
    {
    }


    private int id;
    private String name;
    private String imgpath;
    private String model;
    private String color;
    private String size;
    private double avgtime;
    private double score;
    private String path;
    private double speed;
    private List photos;

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getImgpath()
    {
        return imgpath;
    }

    public void setImgpath(String imgpath)
    {
        this.imgpath = imgpath;
    }

    public String getModel()
    {
        return model;
    }

    public void setModel(String model)
    {
        this.model = model;
    }

    public String getColor()
    {
        return color;
    }

    public void setColor(String color)
    {
        this.color = color;
    }

    public String getSize()
    {
        return size;
    }

    public void setSize(String size)
    {
        this.size = size;
    }

    public double getAvgtime()
    {
        return avgtime;
    }

    public void setAvgtime(double avgtime)
    {
        this.avgtime = avgtime;
    }

    public double getScore()
    {
        return score;
    }

    public void setScore(double score)
    {
        this.score = score;
    }

    public String getPath()
    {
        return path;
    }

    public void setPath(String path)
    {
        this.path = path;
    }

    public double getSpeed()
    {
        return speed;
    }

    public void setSpeed(double speed)
    {
        this.speed = speed;
    }

    public List getPhotos()
    {
        return photos;
    }

    public void setPhotos(List photos)
    {
        this.photos = photos;
    }

}
