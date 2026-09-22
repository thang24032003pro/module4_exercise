package com.codegym.controller;

import com.codegym.model.Song;
import com.codegym.model.SongForm;
import com.codegym.service.SongService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@Controller
public class SongController {

    private static final List<String> ALLOWED_EXTENSIONS = Arrays.asList(".mp3", ".wav", ".ogg", ".m4p");

    @Autowired
    private SongService songService;

    @ModelAttribute("genreList")
    public List<String> getGenreList() {
        return Arrays.asList("Pop", "Rock", "Ballad", "EDM", "R&B", "Rap/Hip-hop", "Jazz", "Classical", "Country", "Folk");
    }

    @GetMapping({"", "/", "/songs"})
    public String showSongList(Model model) {
        model.addAttribute("songs", songService.findAll());
        return "list";
    }

    @GetMapping("/songs/create")
    public String showCreateForm(Model model) {
        model.addAttribute("songForm", new SongForm());
        return "create";
    }

    @PostMapping("/songs/save")
    public String saveSong(@ModelAttribute("songForm") SongForm songForm,
                           HttpServletRequest request,
                           Model model,
                           RedirectAttributes redirectAttributes) {

        if (songForm.getName() == null || songForm.getName().trim().isEmpty()) {
            model.addAttribute("nameError", "Tên bài hát không được để trống!");
            return "create";
        }

        if (songForm.getArtist() == null || songForm.getArtist().trim().isEmpty()) {
            model.addAttribute("artistError", "Nghệ sĩ thể hiện không được để trống!");
            return "create";
        }

        if (songForm.getGenres() == null || songForm.getGenres().isEmpty()) {
            model.addAttribute("genreError", "Vui lòng chọn ít nhất một thể loại nhạc!");
            return "create";
        }

        MultipartFile multipartFile = songForm.getSongFile();
        if (multipartFile == null || multipartFile.isEmpty()) {
            model.addAttribute("fileError", "Vui lòng chọn file bài hát để tải lên!");
            return "create";
        }

        String originalFilename = multipartFile.getOriginalFilename();
        String fileExtension = "";
        if (originalFilename != null && originalFilename.lastIndexOf(".") != -1) {
            fileExtension = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();
        }

        if (!ALLOWED_EXTENSIONS.contains(fileExtension)) {
            model.addAttribute("fileError", "Định dạng file không hợp lệ! Ứng dụng chỉ chấp nhận các định dạng file: .mp3, .wav, .ogg, .m4p");
            return "create";
        }

        try {
            String uploadPath = request.getServletContext().getRealPath("/upload/");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            String savedFileName = System.currentTimeMillis() + "_" + originalFilename;
            File dest = new File(uploadDir, savedFileName);
            multipartFile.transferTo(dest);

            Song song = new Song();
            song.setName(songForm.getName().trim());
            song.setArtist(songForm.getArtist().trim());
            song.setGenres(songForm.getGenres());
            song.setFilePath(savedFileName);

            songService.save(song);
            redirectAttributes.addFlashAttribute("message", "Upload bài hát \"" + song.getName() + "\" thành công!");
            return "redirect:/songs";

        } catch (IOException e) {
            model.addAttribute("fileError", "Lỗi xảy ra khi lưu file: " + e.getMessage());
            return "create";
        }
    }
}
