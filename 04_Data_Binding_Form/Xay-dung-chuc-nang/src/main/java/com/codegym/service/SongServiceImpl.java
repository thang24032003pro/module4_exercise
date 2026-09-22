package com.codegym.service;

import com.codegym.model.Song;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class SongServiceImpl implements SongService {

    private final List<Song> songs = new ArrayList<>();
    private int autoId = 1;

    public SongServiceImpl() {
        songs.add(new Song(autoId++, "See Tình", "Hoàng Thùy Linh", Arrays.asList("Pop", "Dance"), "see-tinh.mp3"));
        songs.add(new Song(autoId++, "Nơi Này Có Anh", "Sơn Tùng M-TP", Arrays.asList("Pop", "R&B"), "noi-nay-co-anh.mp3"));
        songs.add(new Song(autoId++, "Cắt Đôi Nỗi Sầu", "Tăng Duy Tân", Arrays.asList("EDM", "Pop"), "cat-doi-noi-sau.mp3"));
    }

    @Override
    public List<Song> findAll() {
        return songs;
    }

    @Override
    public void save(Song song) {
        if (song.getId() == 0) {
            song.setId(autoId++);
            songs.add(song);
        } else {
            for (int i = 0; i < songs.size(); i++) {
                if (songs.get(i).getId() == song.getId()) {
                    songs.set(i, song);
                    return;
                }
            }
            songs.add(song);
        }
    }

    @Override
    public Song findById(int id) {
        for (Song s : songs) {
            if (s.getId() == id) {
                return s;
            }
        }
        return null;
    }

    @Override
    public void remove(int id) {
        songs.removeIf(s -> s.getId() == id);
    }
}
