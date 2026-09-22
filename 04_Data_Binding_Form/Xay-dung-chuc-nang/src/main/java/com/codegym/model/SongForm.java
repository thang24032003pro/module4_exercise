package com.codegym.model;

import org.springframework.web.multipart.MultipartFile;
import java.util.ArrayList;
import java.util.List;

public class SongForm {
    private int id;
    private String name;
    private String artist;
    private List<String> genres = new ArrayList<>();
    private MultipartFile songFile;

    public SongForm() {
    }

    public SongForm(int id, String name, String artist, List<String> genres, MultipartFile songFile) {
        this.id = id;
        this.name = name;
        this.artist = artist;
        this.genres = genres;
        this.songFile = songFile;
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

    public MultipartFile getSongFile() {
        return songFile;
    }

    public void setSongFile(MultipartFile songFile) {
        this.songFile = songFile;
    }
}
