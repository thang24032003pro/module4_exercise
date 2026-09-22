package com.codegym.service;

import com.codegym.model.Song;
import java.util.List;

public interface SongService {
    List<Song> findAll();
    void save(Song song);
    Song findById(int id);
    void remove(int id);
}
