package com.codegym.model;

import java.util.ArrayList;
import java.util.List;

public class Song {
    private int id;
    private String name;
    private String artist;
    private List<String> genres = new ArrayList<>();
    private String filePath;

    public Song() {
    }

    public Song(int id, String name, String artist, List<String> genres, String filePath) {
        this.id = id;
        this.name = name;
        this.artist = artist;
        this.genres = genres;
        this.filePath = filePath;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public List<String> getGenres() {
        return genres;
    }

    public void setGenres(List<String> genres) {
        this.genres = genres;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getGenresDisplay() {
        if (genres == null || genres.isEmpty()) {
            return "N/A";
        }
        return String.join(", ", genres);
    }
}
